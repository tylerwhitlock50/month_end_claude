# Month-End Close Process Template

A structured framework for running a month-end accounting close using Claude as an AI co-pilot. This repo contains the **process documentation only** — all actual financial data stays local and is excluded via `.gitignore`.

## Folder Structure

```
├── documents/
│   ├── examples/       # Sanitized example instructions (committed)
│   └── *.md            # (gitignored) Your account-specific instructions
├── inputs/             # (gitignored) ERP exports — CSVs, XMLs, trial balances
├── evidence/           # (gitignored) Completed reconciliation workbooks
├── reports/            # (gitignored) Final review decks and presentations
├── scripts/            # (gitignored) Python automation for reconciliations
├── trial balance/      # (gitignored) Trial balance exports
├── reconciliation_instructions.md   # Master guide to the close process
└── todo.md             # (gitignored) Personal task tracker
```

## How It Works

1. **Check out the examples** in `documents/examples/` to see how reconciliation instructions are structured.
2. **Create your own instructions** in `documents/` — copy an example file, rename it to match your GL account, and customize the steps for your ERP.
3. **Export your data** from your ERP into `inputs/` and `trial balance/`.
4. **Use Claude** to help run the reconciliations, build evidence workbooks, and flag variances. The scripts in `scripts/` can be adapted to automate common cleanup tasks.
5. **Save evidence** to `evidence/` and final reports to `reports/`.

## Adapting This to Your Organization

The instruction files in `documents/` are written to be generic. To customize them:

- **Account numbers**: Update the GL account codes to match your chart of accounts.
- **ERP exports**: Swap in your own report names and column headers.
- **Thresholds**: Adjust materiality thresholds and variance tolerances to fit your org.
- **Scripts**: The Python scripts reference specific CSV column names — update these to match your export format.

## What Gets Committed vs. What Stays Local

| Committed (shared)                        | Gitignored (local only)               |
|-------------------------------------------|----------------------------------------|
| `documents/examples/` — sample instructions | `documents/*.md` — your instructions |
| `reconciliation_instructions.md`          | `inputs/` — raw ERP data              |
| `.gitignore`                              | `evidence/` — completed workbooks     |
| `README.md`                               | `reports/` — final presentations       |
|                                           | `scripts/` — automation with balances  |
|                                           | `trial balance/` — TB exports          |
|                                           | `todo.md` — personal task tracking     |

## Security Notes

Before sharing or committing anything, verify that your files do **not** contain:

- Company names, vendor names, or customer names
- Employee names or personal information
- Actual financial balances hardcoded in scripts
- Facility locations or asset serial numbers
- Internal system reference codes or report IDs

## License

Feel free to use and adapt this template for your own month-end close process.
