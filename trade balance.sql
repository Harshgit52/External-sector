CREATE TABLE Final_trade AS (
SELECT 
    ex.S_no AS S_no,
    ex.Commodity AS Commodity,

    -- FY23_24
    ex.FY23_24 AS Exports_23_24,
    ROUND((ex.FY23_24 / SUM(ex.FY23_24) OVER()) * 100, 4) AS percent_total_exports_23_24,
    im.FY23_24 AS Imports_23_24,
    ROUND((im.FY23_24 / SUM(im.FY23_24) OVER()) * 100, 4) AS percent_total_imports_23_24,
    (ex.FY23_24 - im.FY23_24) AS Net_bal_23_24,

    -- FY24_25
    ex.FY24_25 AS Exports_24_25,
    ROUND((ex.FY24_25 / SUM(ex.FY24_25) OVER()) * 100, 4) AS percent_total_exports_24_25,
    im.FY24_25 AS Imports_24_25,
    ROUND((im.FY24_25 / SUM(im.FY24_25) OVER()) * 100, 4) AS percent_total_imports_24_25,
    (ex.FY24_25 - im.FY24_25) AS Net_bal_24_25,

    -- FY25_26
    ex.FY25_26 AS Exports_25_26,
    ROUND((ex.FY25_26 / SUM(ex.FY25_26) OVER()) * 100, 4) AS percent_total_exports_25_26,
    im.FY25_26 AS Imports_25_26,
    ROUND((im.FY25_26 / SUM(im.FY25_26) OVER()) * 100, 4) AS percent_total_imports_25_26,
    (ex.FY25_26 - im.FY25_26) AS Net_bal_25_26,

    -- Totals across 3 years
    (ex.FY23_24 + ex.FY24_25 + ex.FY25_26) AS Total_Exports,
    (im.FY23_24 + im.FY24_25 + im.FY25_26) AS Total_Imports,
    ((ex.FY23_24 + ex.FY24_25 + ex.FY25_26) - (im.FY23_24 + im.FY24_25 + im.FY25_26)) AS Net_bal_3_years,

    -- Growth rates
    ROUND(((ex.FY24_25 - ex.FY23_24) / ex.FY23_24) * 100, 2) AS export_growth_23_24_to_24_25,
    ROUND(((ex.FY25_26 - ex.FY24_25) / ex.FY24_25) * 100, 2) AS export_growth_24_25_to_25_26,
    ROUND((
        (((ex.FY24_25 - ex.FY23_24) / ex.FY23_24) * 100) +
        (((ex.FY25_26 - ex.FY24_25) / ex.FY24_25) * 100)
    ) / 2, 2) AS avg_export_growth_rate,

    ROUND(((im.FY24_25 - im.FY23_24) / im.FY23_24) * 100, 2) AS import_growth_23_24_to_24_25,
    ROUND(((im.FY25_26 - im.FY24_25) / im.FY24_25) * 100, 2) AS import_growth_24_25_to_25_26,
    ROUND((
        (((im.FY24_25 - im.FY23_24) / im.FY23_24) * 100) +
        (((im.FY25_26 - im.FY24_25) / im.FY24_25) * 100)
    ) / 2, 2) AS avg_import_growth_rate

FROM exports AS ex
LEFT JOIN imports AS im 
    ON im.S_no = ex.S_no
);