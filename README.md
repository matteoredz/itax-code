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
  gender: "M",           # "M" or "F"
  birthdate: "1980-1-1", # String, Time, Date or DateTime
  birthplace: "Milano"
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
#   birthdate: "1980-1-1",
#   birthplace: {
#     code: "F205",
#     province: "MI",
#     name: "MILANO"
#   },
#   omocodes: %w[
#     RSSMRA80A01F205X
#     RSSMRA80A01F20RS
#     RSSMRA80A01F2LRD
#     RSSMRA80A01FNLRS
#     RSSMRA80A0MFNLRK
#     RSSMRA80ALMFNLRV
#     RSSMRA8LALMFNLRG
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
    birthdate: "1980-1-1",
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
