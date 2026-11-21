# Bakery Retail Store Operations Analysis

> **Simulated data**, inspired by food-to-go retail. Not real company data.

## Business problem
Where is a multi-store bakery chain losing margin: labour that doesn't match demand, waste, or missed sales targets?

## Data
- 8 stores, 183 days (1 April to 30 September 2026)
- `daily_performance.csv`: 4,392 rows (store x day x daypart)
- `product_waste.csv`: 5,856 rows (store x day x category)
- `stores.csv`: 8 rows (store details and targets)
- Assumptions: blended labour rate of £13.00 per hour; targets of 27% labour and 4% waste.

## Tools
Excel (PivotTables, SUMIFS, formulas), SQL (SQLite)

## Key findings
1. **Labour:** S03 (36.85%), S06 (37.39%) and S04 (32.61%) run above the 27% target. Network: 30.48%.
2. **Dayparts:** morning (40.37%) and afternoon (36.86%) labour is far above lunch (20.59%).
3. **Waste:** S05 is at 5.52% of sales against a 4% target. Tuesday and Wednesday afternoons reach about 20%. S05 wastes 12.70% of units baked against 5.19% at S01.
4. **Sales:** S04 fell to about 15% below target in August and September, after 3 to 6% below earlier.
5. **Store type:** Retail Park stores run labour at 37.09% against 27.35% for High Street stores.

## Recommendations
- Review rotas at S03 and S06, especially quiet slots.
- Cut S05 afternoon bake quantities, especially on Tuesday and Wednesday.
- Investigate the cause of S04's drop from August (footfall, local events, competitors, opening hours).

## Method
1. Built PivotTables in Excel and wrote findings with evidence.
2. Recreated the key results in SQL and checked they match the Excel pivots.


## Files
| File | Purpose |
|---|---|
| `daily_performance.csv`, `product_waste.csv`, `stores.csv` | The three simulated datasets |
| `analysis.sql` | Five queries, each with a comment |
| `store_ops_analysis_final.xlsx` | Pivots and findings sheet |

## Limitations
Data is simulated, so findings illustrate the method and are not claims about any real business. The savings are not estimated here.
