
WITH tab1 AS (
SELECT 
    Year, Month, Exports,
    LAG (Exports) OVER (ORDER BY Year, Month) AS Previous_exports,
    Imports, LAG(Imports) OVER (ORDER BY Year, Month) AS Previous_imports,
    Trade_Balance
FROM tradecom),

tab2 AS (
    SELECT YEAR, MONTH, Exports,
    Previous_exports,
    ROUND(((Exports- Previous_exports)/Previous_exports)*100,2) AS Change_percent_exp,
    ROUND (AVG(Exports) OVER (PARTITION BY YEAR),2) AS Yearly_Avg,
    Imports, Previous_imports,
    ROUND(((Imports-Previous_imports)/Previous_imports)*100,2) AS Change_percent_imp,
    ROUND (AVG(Imports) OVER (PARTITION BY YEAR),2) AS Yearly_Avg_imp,
    Trade_Balance
    FROM tab1)
SELECT * FROM tab2

