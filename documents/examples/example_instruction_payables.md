# Reconciliation Instructions — Payables (Trade)

## Source Documents
- **Subledger:** A/P Aging Summary report from accounting system (CSV export)
- **Trial Balance:** Most recent TB file in `/trial_balance`

## Reconciliation Steps

1. Open the AP Aging Summary file from `/inputs`.
2. Locate the **Total** row at the bottom of the aging report.
3. Compare this total directly to the TB balance for your payables account (credit balance).
4. Apply tag: `#TB:{account}:{amount}` in the cell to the right of the balance.
5. If a variance exists, document and flag.

## Key Notes
- AP aging total should tie directly to the TB — there is no allowance offset like with AR.
- Watch for timing differences if bills are entered after the aging report is pulled but before period close.
- The report may show vendor subtotals and then a final total — always use the **final Total** row.

## Expected Behavior
- Should tie exactly when the aging is run as of the same date as the TB.

## Customization
- Replace `{account}` with your GL account number for trade payables.
- If your ERP uses multiple AP accounts (e.g., trade vs. accrued), create a separate instruction file for each.
