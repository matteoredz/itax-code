# ItaxCode

`ItaxCode` is a Ruby Gem to encode and decode Italian tax code (Codice Fiscale).

It handles common operations on Italian tax code like, for instance, encoding, decoding and validation.
It also handles [omocodia](https://it.wikipedia.org/wiki/Omocodia) complexity.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "itax_code"
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install itax_code

## Usage

### Encode

```ruby
ItaxCode.encode(
  surname: "Rossi",
  name: "Mario",
  gender: "M", # M|F
  birthdate: "1980-01-01", # String|Time|Date|DateTime
  birthplace: "Milano" # Name(Milano)|code(F205)
)
```

### Decode

```ruby
ItaxCode.decode("RSSMRA80A01F205X")

# Output
#
# {
#   code: "RSSMRA80A01F205X",
#   gender: "M",
#   birthdate: "1980-01-01",
#   birthplace: {
#     code: "F205",
#     province: "MI",
#     name: "MILANO"
#   },
#   omocodes: %w[
#     RSSMRA80A01F205X
#     RSSMRA80A01F20RS
#     RSSMRA80A01F2L5I
#     RSSMRA80A01FN05M
#     RSSMRA80A0MF205P
#     RSSMRA80AL1F205I
#     RSSMRA8LA01F205I
#     RSSMRAU0A01F205U
#     RSSMRA80A01F2LRD
#     RSSMRA80A01FN0RH
#     RSSMRA80A0MF20RK
#     RSSMRA80AL1F20RD
#     RSSMRA8LA01F20RD
#     RSSMRAU0A01F20RP
#     RSSMRA80A01FNL5X
#     RSSMRA80A0MF2L5A
#     RSSMRA80AL1F2L5T
#     RSSMRA8LA01F2L5T
#     RSSMRAU0A01F2L5F
#     RSSMRA80A0MFN05E
#     RSSMRA80AL1FN05X
#     RSSMRA8LA01FN05X
#     RSSMRAU0A01FN05J
#     RSSMRA80ALMF205A
#     RSSMRA8LA0MF205A
#     RSSMRAU0A0MF205M
#     RSSMRA8LAL1F205T
#     RSSMRAU0AL1F205F
#     RSSMRAULA01F205F
#     RSSMRA80A01FNLRS
#     RSSMRA80A0MF2LRV
#     RSSMRA80AL1F2LRO
#     RSSMRA8LA01F2LRO
#     RSSMRAU0A01F2LRA
#     RSSMRA80A0MFN0RZ
#     RSSMRA80AL1FN0RS
#     RSSMRA8LA01FN0RS
#     RSSMRAU0A01FN0RE
#     RSSMRA80ALMF20RV
#     RSSMRA8LA0MF20RV
#     RSSMRAU0A0MF20RH
#     RSSMRA8LAL1F20RO
#     RSSMRAU0AL1F20RA
#     RSSMRAULA01F20RA
#     RSSMRA80A0MFNL5P
#     RSSMRA80AL1FNL5I
#     RSSMRA8LA01FNL5I
#     RSSMRAU0A01FNL5U
#     RSSMRA80ALMF2L5L
#     RSSMRA8LA0MF2L5L
#     RSSMRAU0A0MF2L5X
#     RSSMRA8LAL1F2L5E
#     RSSMRAU0AL1F2L5Q
#     RSSMRAULA01F2L5Q
#     RSSMRA80ALMFN05P
#     RSSMRA8LA0MFN05P
#     RSSMRAU0A0MFN05B
#     RSSMRA8LAL1FN05I
#     RSSMRAU0AL1FN05U
#     RSSMRAULA01FN05U
#     RSSMRA8LALMF205L
#     RSSMRAU0ALMF205X
#     RSSMRAULA0MF205X
#     RSSMRAULAL1F205Q
#     RSSMRA80A0MFNLRK
#     RSSMRA80AL1FNLRD
#     RSSMRA8LA01FNLRD
#     RSSMRAU0A01FNLRP
#     RSSMRA80ALMF2LRG
#     RSSMRA8LA0MF2LRG
#     RSSMRAU0A0MF2LRS
#     RSSMRA8LAL1F2LRZ
#     RSSMRAU0AL1F2LRL
#     RSSMRAULA01F2LRL
#     RSSMRA80ALMFN0RK
#     RSSMRA8LA0MFN0RK
#     RSSMRAU0A0MFN0RW
#     RSSMRA8LAL1FN0RD
#     RSSMRAU0AL1FN0RP
#     RSSMRAULA01FN0RP
#     RSSMRA8LALMF20RG
#     RSSMRAU0ALMF20RS
#     RSSMRAULA0MF20RS
#     RSSMRAULAL1F20RL
#     RSSMRA80ALMFNL5A
#     RSSMRA8LA0MFNL5A
#     RSSMRAU0A0MFNL5M
#     RSSMRA8LAL1FNL5T
#     RSSMRAU0AL1FNL5F
#     RSSMRAULA01FNL5F
#     RSSMRA8LALMF2L5W
#     RSSMRAU0ALMF2L5I
#     RSSMRAULA0MF2L5I
#     RSSMRAULAL1F2L5B
#     RSSMRA8LALMFN05A
#     RSSMRAU0ALMFN05M
#     RSSMRAULA0MFN05M
#     RSSMRAULAL1FN05F
#     RSSMRAULALMF205I
#     RSSMRA80ALMFNLRV
#     RSSMRA8LA0MFNLRV
#     RSSMRAU0A0MFNLRH
#     RSSMRA8LAL1FNLRO
#     RSSMRAU0AL1FNLRA
#     RSSMRAULA01FNLRA
#     RSSMRA8LALMF2LRR
#     RSSMRAU0ALMF2LRD
#     RSSMRAULA0MF2LRD
#     RSSMRAULAL1F2LRW
#     RSSMRA8LALMFN0RV
#     RSSMRAU0ALMFN0RH
#     RSSMRAULA0MFN0RH
#     RSSMRAULAL1FN0RA
#     RSSMRAULALMF20RD
#     RSSMRA8LALMFNL5L
#     RSSMRAU0ALMFNL5X
#     RSSMRAULA0MFNL5X
#     RSSMRAULAL1FNL5Q
#     RSSMRAULALMF2L5T
#     RSSMRAULALMFN05X
#     RSSMRA8LALMFNLRG
#     RSSMRAU0ALMFNLRS
#     RSSMRAULA0MFNLRS
#     RSSMRAULAL1FNLRL
#     RSSMRAULALMF2LRO
#     RSSMRAULALMFN0RS
#     RSSMRAULALMFNL5I
#     RSSMRAULALMFNLRD
#   ],
#   raw: {
#     surname: "RSS",
#     name: "MRA",
#     birthdate: "80A01",
#     birthdate_year: "80",
#     birthdate_month: "A",
#     birthdate_day: "01",
#     birthplace: "F205",
#     cin: "X"
#   }
# }
```

### Validate

```ruby
ItaxCode.valid?(
  "RSSMRA80A01F205X",
  {
    surname: "Rossi",
    name: "Mario",
    gender: "M",
    birthdate: "1980-01-01",
    birthplace: "Milano"
  }
)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake test` to run the tests.
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`,
which will create a git tag for the version, push git commits and tags,
and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/matteoredz/itax_code.
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected
to adhere to the [code of conduct](https://github.com/matteoredz/itax_code/blob/master/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the ItaxCode project's codebases, issue trackers,
chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/matteoredz/itax_code/blob/master/CODE_OF_CONDUCT.md).

## Credits

I took insipiration from [python-codicefiscale](https://github.com/fabiocaccamo/python-codicefiscale)
repository, coded by [Fabio Caccamo](https://github.com/fabiocaccamo).
