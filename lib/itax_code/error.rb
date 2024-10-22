# frozen_string_literal: true

module ItaxCode
  Error = Class.new(StandardError)

  class Encoder
    Error = Class.new(Error)

    InvalidBirthdateError = Class.new(Error)
    MissingDataError = Class.new(Error)
  end

  class Parser
    Error = Class.new(Error)

    InvalidControlInternalNumberError = Class.new(Error)
    InvalidTaxCodeError = Class.new(Error)
    NoTaxCodeError = Class.new(Error)
    DateTaxCodeError = Class.new(Error)
  end
end
