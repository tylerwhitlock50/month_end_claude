# Reconciliation Instructions — Income Statement Preliminary Analysis

## Purpose

Perform a preliminary review of the Income Statement before finalizing the month-end close. This analysis serves to:
- Validate income and expense account balances against the Trial Balance
- Identify missing entries, future-period amounts, and unusual items
- Flag significant month-over-month variances for management review
- Produce a summary report in `/reports` for reviewer sign-off

## Source Documents
- **Income Statement (monthly):** Most recent IS file in `/inputs` (e.g., `IncomeStatement-*.csv`)
- **Income Statement Detail:** GL-level detail file in `/inputs` (e.g., `IncomeStatementDetail-*.csv`)
- **Trial Balance:** Most recent TB file in `/trial_balance`

## Procedure

### Step 1 — Parse the Income Statement

1. Open the IS summary file. Note the date range — FY vs. current period matters.
2. For each line item account (skip Total/Gross/Net rows), extract:
   - Monthly amounts (Jan through current month)
   - Any future-period amounts (months beyond the close period)
   - IS report total
3. If the report covers the full fiscal year, be aware that recurring entries (rent, interest, etc.) may already be booked for future months.

### Step 2 — Compare IS Totals to Trial Balance

For every IS line item:
1. Look up the corresponding TB account balance
2. Calculate variance = |IS Total| - |TB Balance|
3. Flag any variance > $0.50

**Expected behavior:**
- Revenue and contra-revenue accounts (40xxx, 41xxx) should match exactly for YTD
- If IS covers a broader period than TB, variances will exist and should be explained by future-period entries
- Parent accounts (e.g., 60600 Marketing) may show $0 on the IS if all activity is in sub-accounts — this is structural, not a variance

### Step 3 — Identify Future-Period Entries

1. Check columns beyond the close month for non-zero amounts
2. Sum all future-period amounts per account
3. Verify that IS-to-TB variances are fully explained by future-period totals
4. Any remaining unexplained variance after removing future-period amounts requires investigation

### Step 4 — Flag Unusual Items

Review March (current month) detail for:
- **Negative expenses:** Expense accounts with credits > $500 — these may be returns, reversals, or reclassifications
- **Large one-time entries:** Individual transactions exceeding $5,000 that are not recurring
- **Journal entries in expense accounts:** Manual JEs in operating accounts (look for "Journal" type transactions) — these are often reclassifications or corrections

### Step 5 — Month-over-Month Variance Analysis

For each account with 2+ months of data:
1. Calculate the Q1 average (absolute value)
2. Flag any month where the amount exceeds 2.5x the average
3. Flag any account where the current month dropped to near-zero after significant prior months (potential missing accrual)

Focus on:
- SG&A accounts (60xxx) — look for missing vendor invoices
- Legal, consulting, and marketing — these are lumpy but should be questioned if March is zero
- Manufacturing overhead (53xxx) — look for seasonal patterns vs. omissions

### Step 6 — Large Transaction Review

From the GL detail file:
1. Identify the top 10 transactions by dollar amount in the current month
2. Note any single transaction exceeding $10,000
3. Cross-reference large revenue items to ensure AR/billing is correct
4. Flag large interest payments and confirm they match loan schedules

### Step 7 — Build Summary Report

Create a Word document in `/reports` titled `Preliminary_Analysis_{Month}{Year}.docx` containing:

1. **Executive Summary** — Key findings, net income, overall assessment
2. **IS vs TB Variances** — Table with account, IS total, TB total, variance, explanation
3. **Future Period Entries** — Table showing what months have amounts and totals
4. **Unusual Items** — Negative expenses, large one-offs, suspicious JEs
5. **Month-over-Month Swings** — Accounts with significant fluctuations
6. **Large Transactions** — Top 10 by amount with vendor/customer detail
7. **Q1 P&L Summary** — High-level income/expense by month for validation
8. **Questions for Review** — Open items for management
9. **Reviewer Sign-Off** — CONCUR/UPDATE conclusion line

### Step 8 — Conclusion

- **CONCUR** if the IS is reasonable for the close period, variances are explained, and no material missing entries are identified
- **UPDATE** if adjustments are needed, missing accruals are suspected, or unexplained variances remain
- Document any open questions in `todo.md`

## Key Notes

- The IS report from QBO may include future-period recurring entries — always check the date range
- Revenue for this company is ~$2-3M annually; use $20-30K as a materiality threshold
- Interest expense is significant (~$80-100K/month) due to equipment financing — this is expected
- Depreciation is ~$134K/month — driven by heavy manufacturing equipment; this is expected and non-cash
- Skyshare is a known recurring non-cash entry (JE reclassification to fixed assets)
- Rental income ($45,376.65/month) is from the Proteor sublease — recurring and expected
- Digital marketing spend has been volatile — confirm with management if large swings are intentional

## Related Accounts

This analysis covers all 4xxxx (revenue), 5xxxx (COGS/manufacturing), 6xxxx (SG&A), and 7xxxx (other income/expense) accounts. Individual account reconciliation instructions exist for balance sheet accounts only — the IS analysis provides the evidence layer for income and expense accounts.
