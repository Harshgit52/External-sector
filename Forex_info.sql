CREATE TABLE  Forex_info AS (
WITH forex_data AS (
    SELECT *, 
    (Foreign_Currency_Assets + Gold + Reserve_Tranche_Position + SDRs) AS Total_forex
    , LAG(Foreign_Currency_Assets 
    + Gold + Reserve_Tranche_Position + SDRs) OVER(ORDER BY Year) AS previous_month_Forex
    FROM forex),

Adv_forex AS (   
    SELECT * , (Total_forex-previous_month_Forex) AS Deviation_in_FDI,
    ROUND((((Total_forex-previous_month_Forex)/Total_forex)*100),2) AS Percent_change 
    FROM forex_data),

Fdi_inflow AS ( SELECT * FROM fdiin)

SELECT 
    adv.* , Fdi_inflow.FDI_Equity_inflow, 
    ROUND(((Fdi_inflow.FDI_Equity_inflow/adv.Total_forex)*100),2) AS FDI_Equity_as_percent_of_totalForex
FROM Adv_forex AS adv 
LEFT JOIN Fdi_inflow ON Fdi_inflow.Year = adv.Year 
                    AND Fdi_inflow.Month = adv.Month
);