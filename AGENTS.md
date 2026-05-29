# itax-code — LLMs Codebase Reference

**Ruby gem** (v2.0.7) for encoding, decoding, and validating the Italian Tax Code (Codice Fiscale).
Repo: https://github.com/matteoredz/itax-code | Ruby >= 2.5.0 | License: MIT
Key feature: full **Omocodia** support — 128 alternative valid encodings per person.

---

## Tax Code Structure (16 characters)

```
R  S  S  M  R  A  8  0  A  0  1  F  2  0  5  X
[0][1][2][3][4][5][6][7][8][9][A][B][C][D][E][F]
|--SRN--|--NAME-|--YY--|MO|-DD-||--PLACE--|CIN|
```

| Segment | Positions | Encoding |
|---------|-----------|----------|
| Surname | 0–2 | Consonants first, then vowels, pad with `X` |
| Name | 3–5 | Same as surname, **but** if >3 consonants, skip the 2nd |
| Year | 6–7 | Last 2 digits of birth year |
| Month | 8 | Letter: A=Jan B=Feb C=Mar D=Apr E=May H=Jun L=Jul M=Aug P=Sep R=Oct S=Nov T=Dec |
| Day | 9–10 | DD for males; DD+40 for females (e.g., born 5th → `45`) |
| Birthplace | 11–14 | 4-char Belfiore code (Italian cities) or Z-code (foreign countries) |
| CIN | 15 | Checksum character (weighted odd/even table lookup) |

**Omocodia positions** (indices): `[6, 7, 9, 10, 12, 13, 14]`
Digit→letter substitution: `0→L 1→M 2→N 3→P 4→Q 5→R 6→S 7→T 8→U 9→V`

---

## Architecture

```
ItaxCode (public API module)
├── .encode(data)   →  Encoder  →  String (16-char tax code)
├── .decode(code)   →  Parser   →  Hash
└── .valid?(code)   →  Parser   →  Boolean (true / false, never raises)

Supporting classes:
├── Omocode         →  generates all 128 valid omocode variants
├── Utils           →  CIN calculation, CSV loaders, consonant/vowel extraction, month table
├── Transliterator  →  200+ accented chars → ASCII (Ò→O, etc.)
└── Error           →  custom exception hierarchy
```

### Key files

| Path | Purpose |
|------|---------|
| `lib/itax_code.rb` | Public API entry point |
| `lib/itax_code/encoder.rb` | Tax code generation |
| `lib/itax_code/parser.rb` | Decoding + CIN validation |
| `lib/itax_code/omocode.rb` | 128-variant omocode generation |
| `lib/itax_code/utils.rb` | CIN algorithm, CSV loaders, helpers |
| `lib/itax_code/transliterator.rb` | Unicode→ASCII character map |
| `lib/itax_code/error.rb` | Exception hierarchy |
| `lib/itax_code/data/cities.csv` | ~8,000 Italian municipalities (code, province, name, created_on, deleted_on) — loaded lazily via `CSV.foreach`, never eagerly or globally cached |
| `lib/itax_code/data/countries.csv` | 276 foreign countries (code, province, name) — same loading constraints as cities.csv |

---

## Public API

```ruby
# Encode — generate a tax code from personal data
ItaxCode.encode(
  surname:    String,           # required
  name:       String,           # required
  gender:     "M" | "F",        # required
  birthdate:  String|Date|Time, # required — String parsed via Date.parse
  birthplace: String            # required — city name OR 4-char Belfiore code
) #=> String  (e.g. "RSSMRA80A01F205X")

# Decode — parse a tax code into components
ItaxCode.decode(tax_code) #=> Hash:
# {
#   code:       String,          # the input code, upcased
#   gender:     "M" | "F",
#   birthdate:  String,          # "YYYY-MM-DD"
#   birthplace: {                # nil if not found in either CSV
#     code:       String,        # e.g. "F205"
#     province:   String,        # e.g. "MI"
#     name:       String,        # e.g. "MILANO"
#     created_on: String,        # ISO date (cities only)
#     deleted_on: String         # ISO date (cities only, if deleted)
#   },
#   omocodes:   Array<String>,   # all 128 valid omocode variants
#   raw: {
#     surname:          String,  # chars 0-2
#     name:             String,  # chars 3-5
#     birthdate:        String,  # chars 6-10
#     birthdate_year:   String,  # chars 6-7
#     birthdate_month:  String,  # char 8
#     birthdate_day:    String,  # chars 9-10
#     birthplace:       String,  # chars 11-14
#     cin:              String   # char 15
#   }
# }

# Validate — returns true/false, never raises
ItaxCode.valid?(tax_code) #=> Boolean
```

---

## Error Hierarchy

```
ItaxCode::Error (< StandardError)
├── ItaxCode::Encoder::Error
│   ├── MissingDataError        — a required encode field is nil/blank
│   └── InvalidBirthdateError   — birthdate string cannot be parsed by Date.parse
└── ItaxCode::Parser::Error
    ├── NoTaxCodeError          — input is nil or blank
    ├── InvalidTaxCodeError     — not 16 chars
    ├── InvalidControlInternalNumberError  — CIN checksum mismatch
    └── DateTaxCodeError        — decoded date is impossible (e.g. Feb 30)
```

`valid?` rescues `Parser::Error` (all parser errors) and returns `false`.

---

## Key Implementation Details & Edge Cases

| Topic | Detail |
|-------|--------|
| **Female day encoding** | Day stored as `day + 40`; decoded as `val > 40 ? val - 40 : val` |
| **Ambiguous birth year** | 2-digit year prefixed with current century; if result > current year, subtract 100 (e.g. `80` in 2026 → `1980`, not `2080`) |
| **City validity dates** | cities.csv has `created_on`/`deleted_on`; parser filters by whether the decoded birthdate falls within that range |
| **Foreign birthplaces** | Belfiore codes starting with `Z` (Z100+); encoder/parser fall back from cities.csv to countries.csv |
| **Birthplace lookup** | Encoder detects Belfiore code format via `/^\w{1}\d{3}$/`; otherwise matches by slugged name |
| **Omocodia decode** | Parser runs `utils.omocodia_decode` on year, day, and birthplace digits before interpreting them |
| **Transliteration** | Applied before consonant/vowel extraction so accented names (Ò, Ç, À…) are handled correctly |
| **CIN algorithm** | Separate odd/even position lookup tables; sum of all 15 positions mod 26 maps to A–Z |
| **Name consonant rule** | If name has >3 consonants, the 2nd consonant is dropped (e.g. MARCO → MRC, not MAR) |

---

## Development Commands

```bash
bundle exec rake          # run full test suite (default Rake task) — run after any change
bundle exec rubocop       # lint all files — run after any change
bin/console               # interactive Ruby console with gem loaded
bin/setup                 # install dependencies (bundle install)
bin/release               # automated release script
bundle exec rake cities   # update cities.csv data (rakelib/cities.rake)
```

---

## Code Style

- Frozen string literal comment on every file (`# frozen_string_literal: true`)
- Max line length: 100 chars (RuboCop enforced)
- Double-quoted strings
- Active RuboCop plugins: `rubocop-minitest`, `rubocop-performance`, `rubocop-rake`

---

## Testing Conventions

- **Framework:** Minitest (`test/**/*_test.rb`)
- **Coverage:** 100% line + branch enforced via SimpleCov (configured in `test/test_helper.rb`) — every new code path must have a test
- **Mocking:** Mocha
- **Time control:** `Timecop.freeze` for any date-sensitive test
- **Test helper macros:** `test/support/test_macro.rb`
- **CI matrix:** Ruby 2.5 through 3.4 + head (GitHub Actions)
- **Coverage reporting:** Qlty.sh (configured in CI)

---

## Maintenance

> **LLM instruction:** Whenever you modify code in this repository, check whether the change
> affects any section of this file (API signatures, error hierarchy, edge cases, architecture,
> data files, dev commands, testing conventions, etc.) and update the relevant section in the
> same commit.
