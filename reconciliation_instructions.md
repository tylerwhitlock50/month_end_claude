# Month-End Reconciliation Instructions

## Purpose

You are assisting with the month-end reconciliation process.

Your job is to:

- Review raw files in `/inputs`
- Compare them to the latest Trial Balance in `/trial_balance`
- Reconcile balances
- Add standardized tags
- Save clean, readable outputs to `/evidence`

A human reviewer will validate your work, so clarity and accuracy matter more than formatting polish.

---

## Folder Structure

### `/inputs`
Raw files to be reconciled (bank recs, AR aging, AP detail, etc.)

### `/trial_balance`
Source of truth for balances  
→ Always use the most recent file in this folder

### `/evidence`
Final reconciled files with tags added  
→ This is your primary output location

### `/reports`
Optional summaries, explanations, or analysis (Word, slides, etc.)

---

## Core Responsibilities

### 1. Use Trial Balance as Source of Truth

- Always identify and use the latest Trial Balance file
- Do NOT override or estimate TB values
- All reconciliations must tie back to TB amounts

---

### 2. Perform Reconciliation

For each input file:

- Identify the relevant account(s)
- Calculate or confirm the ending balance
- Compare to the Trial Balance

Determine:

- ✅ Matches  
- ⚠️ Variance (must be clearly noted)

---

### 3. Apply Standard Tags

You must tag reconciled balances using the exact format:

```
#TB:{account_number}:{amount}
```

**Example:**
```
#TB:12030:15234.55
```

#### Tag Placement Rules

- Tag must be placed in the cell immediately to the right of the balance
- Do NOT overwrite original values
- Do NOT place tags in random locations

---

## File Output Requirements

Save all outputs to `/evidence`

Files must be:

- Clean and readable
- Same structure as input where possible

### Supported Formats

- `.csv`
- `.xlsx`

### Do NOT:

- Change file type unnecessarily
- Remove important columns
- Reformat excessively

---

## Handling Differences

If values do NOT match the Trial Balance:

Clearly show:

- Calculated balance
- Trial Balance amount
- Difference

Add a note such as:

```
VARIANCE: $1,245.32 (Unreconciled)
```

- Still include the TB tag (based on TB amount)

---

## Reasonableness Checks

Some accounts require a reasonableness assessment beyond just tying to the Trial Balance. When applicable, add a separate "Reasonableness" tab or section to the evidence file.

Reasonableness checks are documented in their own per-account instruction files in `/documents`. See:
- `instruction_11099.md` — Allowance for Doubtful Accounts
- `instruction_12090.md` — Inventory Allowance

### General Reasonableness Guidance

For all accounts where reasonableness checks apply:
- Always state the metric, the threshold, and the conclusion
- Use the format: CONCUR (no change needed) or UPDATE (adjustment recommended with amount)
- Keep the analysis simple and scannable — this is a gut-check, not an audit
- Include a reviewer sign-off line

---

## Rules & Constraints

### Accuracy First

- Do NOT invent numbers
- Do NOT guess missing data
- If unsure → flag clearly

---

### Ask When Needed

If:

- Account mapping is unclear
- Multiple possible matches exist
- File structure is confusing

→ Ask for clarification instead of proceeding incorrectly

---

## Reports (Optional)

If requested, create outputs in `/reports` such as:

- Summary of reconciliations completed
- Accounts with variances
- Observations or risks

Keep reports:

- Short
- Structured
- Business-readable

---

## Output Philosophy

Your output should be:

- Easy to scan
- Easy to verify
- Clearly tied to the Trial Balance

This is NOT a formatting task — it is a reconciliation and validation task.

---

## Success Criteria

A reconciliation is complete when:

- Balance ties to Trial Balance OR variance is clearly explained
- Tag is correctly applied
- File is saved to `/evidence`
- A human can quickly understand what was done

---

# Task Tracking (`todo.md`)

You must use a `todo.md` file in the root directory to track:

- Progress
- Open items
- Missing evidence

---

## When to Update

Update `todo.md` whenever:

- A reconciliation cannot be completed
- Additional evidence is required
- There is an unresolved variance
- An assumption would otherwise be required  
  → (Do NOT assume — log it instead)

---

## Format

Use the following structure:

```
# Reconciliation TODO

## Open Items

- [ ] Account: {account_number}  
  Issue: {brief description}  
  Needed: {specific file, report, or clarification required}  
  Source File: {/inputs/file_name}

## In Progress

- [ ] Account: {account_number}  
  Status: {what is currently being worked on}

## Completed

- [x] Account: {account_number}  
  Resolution: {how it was resolved}
```

---

## Rules

- Keep entries short and specific
- Do NOT remove items — move them to **Completed** when resolved
- Always reference:
  - Account number
  - Source file
- If multiple issues exist for one account, list them separately

---

## Example

```
# Reconciliation TODO

## Open Items

- [ ] Account: 12030  
  Issue: AR aging total does not match trial balance  
  Needed: Updated AR report as of month-end  
  Source File: /inputs/ar_aging_march.xlsx

## In Progress

- [ ] Account: 10100  
  Status: Matching bank transactions to GL activity

## Completed

- [x] Account: 20010  
  Resolution: AP subledger matched to TB after removing duplicate entry
```

# Follow ups documentation
For each account you should create an instruction_{{account number}}.md file that explains how each account should be reconciled so that we can follow it next month. Use the new folder /documents to keep these.