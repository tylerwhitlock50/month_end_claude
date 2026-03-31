# Reconciliation Instructions — Receivables (Trade)

## Source Documents
- **Subledger:** A/R Aging Summary report from accounting system (CSV export)
- **Trial Balance:** Most recent TB file in `/trial_balance`

## Reconciliation Steps

1. Open the AR Aging Summary file from `/inputs`.
2. Locate the **Total** row in the aging report — this is the net AR balance including any allowance offsets.
3. Identify any line that represents the Allowance for Doubtful Accounts — this should be **excluded** from the gross receivables comparison.
4. Calculate gross receivables: Total from aging **minus** the allowance credit amount. This should equal the TB balance for your receivables account.
5. Compare the gross receivables amount to the corresponding TB account.
6. Apply tag: `#TB:{account}:{amount}` in the cell to the right of the balance.
7. If a variance exists, document the amount and flag for investigation.

## Key Notes
- The AR aging total is typically a **net** figure. Gross receivables and the allowance are netted together in most aging reports.
- Always confirm the aging report date matches the TB period end.

## Expected Behavior
- This account should tie exactly if the subledger is properly synced with the GL.

## Customization
- Replace `{account}` with your GL account number for trade receivables.
- If your system separates the allowance into its own report, you may not need step 3.
