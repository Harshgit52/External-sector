# External-sector
Data driven intelligence on India's external sector : Forex, FDI Equity, merchandise Trade and Trade balance

Overview

This project builds a unified SQL + Excel dataset to analyze India’s external sector. It integrates monthly and yearly data on:

Forex Reserves (FCA, Gold, SDR, RTP)

FDI Equity Inflows (sector‑wise and country‑wise)

Exports & Imports (monthly totals and yearly commodity‑wise breakdowns)

The goal is to provide data‑driven intelligence on India’s external economy, highlighting trade balances, FDI trends, and reserve dynamics.

Data Sources

RBI Database on Indian Economy (DBIE) – Forex reserves, balance of payments

DPIIT Fact Sheets – Sector‑wise and country‑wise FDI inflows

MoSPI / DGCI&S – Export and import statistics (commodity‑wise)

Methodology
Built master SQL tables combining monthly forex, trade, and FDI data.

Applied window functions (SUM, LAG, OVER) to calculate shares, growth rates, and balances.


Derived indicators:

Trade Balance (Exports − Imports)

Sectoral FDI shares

Commodity‑wise import/export composition
Average growth rates across 3 years
