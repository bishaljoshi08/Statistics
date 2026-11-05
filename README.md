# Statistics with R — Coursework

Solutions and exercise sheets for the **Statistics with R** course.
Assignment group: Ankit Khatiwada, Bishal Joshi, Sonika Acharya.

## Repository contents

| File                 | Covers |
| -------------------- | ------ |
| `Class_sheet_1.r`    | Working directory & help; normal distribution plots with `seq`, `dnorm`, `plot`, `abline`; `beaver2` temperature analysis; z-scores and tail probabilities with `pnorm` |
| `Class_sheet_2.r`    | Class sheet 2 exercises |
| `Homework_sheet_1.r` | Random normal sampling & histograms; `languageR::lexdec` exploration; data frames, factors, and boxplots |

## Running the scripts

```r
source("Class_sheet_1.r")
source("Class_sheet_2.r")
source("Homework_sheet_1.r")
```

Or non-interactively:

```bash
Rscript Class_sheet_1.r
Rscript Class_sheet_2.r
Rscript Homework_sheet_1.r
```

Notes:
- `Homework_sheet_1.r` needs `languageR`: `install.packages("languageR")`.
- `Class_sheet_1.r` calls `setwd()` with an absolute path — update or remove it for your machine.

> Generated with LLM assistance.
