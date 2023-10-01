# frozen_string_literal: true

require "active_support/all"

require "itax_code/version"
require "itax_code/utils"
require "itax_code/encoder"
require "itax_code/parser"
require "itax_code/validator"

module ItaxCode
  Error = Class.new(StandardError)

  class << self
    # Encodes the user tax code.
    #
    # @param [Hash] data The user attributes
    #
    # @option data [String]       :surname
    # @option data [String]       :name
    # @option data [String]       :gender
    # @option data [String, Date] :birthdate
    # @option data [String]       :birthplace
    #
    # @return [String]
    def encode(data)
      Encoder.new(data).encode
    end

    # Decodes the tax code in its components.
    #
    # @param [String] tax_code The user tax code
    #
    # @return [Hash]
    def decode(tax_code)
      Parser.new(tax_code).decode
    end

    # Checks the given tax code validity.
    #
    # @param [String] tax_code The user tax code
    #
    # @return [Boolean]
    def valid?(tax_code)
      Validator.new(tax_code).valid?
    end
  end
end
