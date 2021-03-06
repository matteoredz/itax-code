require "itax_code/version"
require "active_support/all"
require "itax_code/utils"
require "itax_code/encoder"
require "itax_code/parser"
require "itax_code/validator"

module ItaxCode
  class << self
    ##
    # This method encodes user tax code.
    #
    # @example
    #
    #   ItaxCode.encode({
    #     surname:    [String]
    #     name:       [String]
    #     gender:     [String]
    #     birthdate:  [Date, DateTime, Time]
    #     birthplace: [String]
    #   })
    #
    # @param [Hash] data The user data attributes
    #
    # @return [String]

    def encode(data)
      Encoder.new(data).encode
    end

    ##
    # This method decodes tax code in its components.
    #
    # @example
    #
    #   ItaxCode.decode("CCCFBA85D03L219P")
    #
    # @param [String] tax_code The user tax code
    #
    # @return [Hash]

    def decode(tax_code)
      Parser.new(tax_code).decode
    end

    ##
    # This method check given tax code validity
    # against new one encoded from user informations.
    #
    # @example
    #
    #  ItaxCode.valid?(tax_code [String], {
    #     surname:    [String]
    #     name:       [String]
    #     gender:     [String]
    #     birthdate:  [Date, DateTime, Time]
    #     birthplace: [String]
    #  })
    #
    # @return [true, false]

    def valid?(tax_code, data)
      Validator.new(data).valid?(tax_code)
    end
  end

  class Error < StandardError; end
end
