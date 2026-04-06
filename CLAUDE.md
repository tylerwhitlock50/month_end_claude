# Month-End Reconciliation — March 2026

## What This Project Is

This is the month-end close reconciliation for Future Comp, LLC (consolidated). The goal is to tie every balance sheet account to the Trial Balance using subledger detail, flag variances, and produce clean evidence files for reviewer sign-off.

## How to Work in This Project

1. **Always read `reconciliation_instructions.md` first.** It defines the full workflow: how to reconcile, how to tag, where to save outputs, and how to handle variances.
2. **Use the Trial Balance as the source of truth.** The latest TB is in `/trial_balance`. Never override or estimate TB values.
3. **Check `/documents` for account-specific instructions.** Each reconciled account has an `instruction_{account_number}.md` file explaining the data sources, steps, and known quirks for that account. Read the relevant one before starting work on any account.
4. **Save all evidence to `/evidence`.** Evidence files must include TB tags (`#TB:{account}:{amount}`) placed in the cell immediately to the right of the reconciled balance.
5. **Update `todo.md` as you go.** Log open items, in-progress work, and completed reconciliations. Never remove items — move them to Completed when resolved.
6. **Create or update instruction docs in `/documents`** for any account you reconcile, so next month's process is documented.

## Folder Structure

| Folder | Purpose |
|---|---|
| `/inputs` | Raw subledger exports, aging reports, valuation reports, reserve files |
| `/trial_balance` | Trial Balance — always use the most recent file |
| `/evidence` | Final reconciled workbooks with TB tags (primary output) |
| `/documents` | Per-account instruction files and historical notes |
| `/scripts` | Reusable Python scripts for reconciliations that benefit from automation |
| `/reports` | Optional summaries, analysis docs, presentations |

## Scripts

Several reconciliations have been scripted for repeatability. These live in `/scripts` and can be re-run when updated source files are provided:

- `reconcile_inventory_reserves.py` — Reconciles 12090 and 12521 by extracting reserve detail, joining to inventory valuation, comparing to TB. Outputs JSON lookup + evidence file.
- `inventory_valuation_recon.py` — Reconciles 12010 and 12050 from the TGW Inventory Valuation Account Category report.
- `fam_recon.py` — Reconciles all 15xxx fixed asset and accumulated depreciation accounts from FAM export.
- `accrued_recon_cleanup.py` — Cleans and reconciles 22050 accrued purchases.
- `is_analysis.py` — Income statement preliminary analysis vs TB.

## Materiality Thresholds

- General: exact match expected unless otherwise noted
- Inventory reserves (12090, 12521): $15,000 threshold — differences below this are considered tied
- Immaterial variances (< $100 on any account): note and move on

## Key Account Notes

- **12050 (FG)**: Valuation report may not include CSS finished goods — gap likely relates to 12521. Also depends on costing being complete.
- **12090 (Inventory Allowance)**: Reserve detail available via Inventory Reserves workbook. Reasonableness check required each period (allowance as % of gross inventory, category breakdown, CONCUR/UPDATE conclusion).
- **12521 (CSS Inventory Value)**: Reserve detail in same workbook as 12090. 335 bicycle items, mix of full and partial reserves.
- **15075 (Skyshare)**: Known exclusion from FAM — tracked outside the system. Just confirm TB balance.
- **13xxx (Prepaids)**: Gaps between amortization schedules and TB are expected before memorized transactions post. Will close after month-end posting.

## Current Status

Track progress in `todo.md`. As of last update, one open item remains (12050 pending costing completion).
