require "active_support/all"

require "itax_code/version"
require "itax_code/utils"
require "itax_code/encoder"
require "itax_code/parser"
require "itax_code/validator"

module ItaxCode
  class << self
    # Encodes user tax code.
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

    # Decodes tax code in its components.
    #
    # @param [String] tax_code The user tax code
    #
    # @return [Hash]
    def decode(tax_code)
      Parser.new(tax_code).decode
    end

    # Checks the given tax code validity against new one
    # encoded from user informations.
    #
    # @param [String]  tax_code The user tax code
    # @param [Hash]    data     The user attributes
    # @param [Boolean] incomplete_data
    #
    # @option data [String]       :surname
    # @option data [String]       :name
    # @option data [String]       :gender
    # @option data [String, Date] :birthdate
    # @option data [String]       :birthplace
    #
    # @return [Boolean]
    def valid?(tax_code, data = {}, incomplete_data = false)
      if incomplete_data || data.empty?
        decoded = decode(tax_code)
        data = {
          surname: data.dig(:surname) || decoded.dig(:raw)&.dig(:surname),
          name: data.dig(:name) || decoded.dig(:raw)&.dig(:name),
          gender: data.dig(:gender) || decoded.dig(:gender),
          birthdate: data.dig(:birthdate) || decoded.dig(:birthdate),
          birthplace: data.dig(:birthplace) || decoded.dig(:birthplace)&.dig(:code)
        }
      end

      Validator.new(data).valid?(tax_code)
    end
  end

  class Error < StandardError; end
end
