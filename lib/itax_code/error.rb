# frozen_string_literal: true

module ItaxCode
  Error = Class.new(StandardError)

  class Encoder
    Error = Class.new(StandardError)

    MissingDataError = Class.new(Error)
  end

  class Parser
    Error = Class.new(StandardError)

    InvalidControlInternalNumberError = Class.new(Error)
    InvalidTaxCodeError = Class.new(Error)
    NoTaxCodeError = Class.new(Error)
  end
end
