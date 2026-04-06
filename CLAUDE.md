# Month-End Reconciliation — March 2026

## What This Project Is

This is the month-end close reconciliation for Acme Manufacturing Co. The goal is to tie every balance sheet account to the Trial Balance using subledger detail, flag variances, and produce clean evidence files for reviewer sign-off.

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
| `/inputs` | Raw subledger exports, aging reports, amortization schedules |
| `/trial_balance` | Trial Balance — always use the most recent file |
| `/evidence` | Final reconciled workbooks with TB tags (primary output) |
| `/documents` | Per-account instruction files and historical notes |
| `/scripts` | Reusable Python scripts for reconciliations that benefit from automation |
| `/reports` | Optional summaries, analysis docs, presentations |

## Scripts

- `scan_tags.py` — Scans all evidence files for `#TB` tags, extracts the tagged amount and nearest balance, compares to the Trial Balance. Run after completing reconciliations to verify all tags agree.

## Materiality Thresholds

- General: exact match expected unless otherwise noted
- Immaterial variances (< $100 on any account): note and move on

## Key Account Notes

- **1000 (Cash)**: Reconcile GL ending balance to TB, then perform bank-to-book reconciliation. Bank-only items (NSF, fees, interest) require adjusting JEs.
- **1100 (AR)**: AR aging total should tie to TB. Allowance (1200) is reconciled alongside but tagged separately.
- **1500/1510 (Fixed Assets)**: Gross cost should tie exactly. Accumulated depreciation may lag if monthly depreciation JEs haven't posted.
- **2000 (AP)**: AP aging total should tie directly to TB — no allowance offset.
- **2200/2300 (Debt)**: Reconcile to amortization schedule. Current/LT split should match next-12-months principal calculation.
- **5500 (Interest)**: Tie YTD interest expense to amortization schedule interest column.

## Current Status

Track progress in `todo.md`. Accounts with evidence files: 1000, 1100, 1200, 1500, 1510, 2000, 2200, 2300, 5500. Accounts still needing input files: 1300 (Inventory), 1400 (Prepaids), 1600/1610 (Intangibles), 2100 (Accrued Liabilities), and all income statement accounts.
