@AGENTS.md

---

## Claude Code Notes

### Running commands
```bash
bundle exec rake    # tests — run after any change
bundle exec rubocop # lint — run after any change
```

### Coverage requirement
100% line + branch coverage is enforced. Every new code path needs a test. Check `test/test_helper.rb` for the `minimum_coverage` configuration.

### Code style
- Frozen string literals on every file (`# frozen_string_literal: true`)
- Max line length: 100 chars (RuboCop enforced)
- Double-quoted strings
- `rubocop-minitest`, `rubocop-performance`, `rubocop-rake` plugins active

### Data files
`lib/itax_code/data/cities.csv` and `countries.csv` are loaded lazily via `Utils`. Do not load them eagerly or cache them globally — existing patterns use `CSV.foreach`.
