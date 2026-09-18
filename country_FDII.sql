CREATE TABLE fdi_of_country AS (
WITH nato AS( SELECT 
    Country, FY23_24, FY24_25, 
    ROUND(((FY24_25-FY23_24)/FY23_24)*100,2) AS percent_cahnge_from_FY23_24,
    FY25_26,ROUND(((FY25_26-FY24_25)/FY24_25)*100,2) AS percent_cahnge_from_FY24_25
FROM nations_fdi),

nato_b AS (
    SELECT * , 
    ROUND(((percent_cahnge_from_FY23_24+percent_cahnge_from_FY24_25)+(percent_cahnge_from_FY23_24*percent_cahnge_from_FY24_25/100)),2) AS Net_change_in_3_yrs,
    (FY23_24 + FY24_25 + FY25_26) AS Total_FDI
    FROM nato
    ORDER BY Total_FDI DESC
    )

SELECT * FROM nato_b
);

