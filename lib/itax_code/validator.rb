# frozen_string_literal: true

module ItaxCode
  # Handles the validation logic.
  #
  # @param [Hash] data The user input data
  class Validator
    LENGTH        = 16
    REQUIRED_KEYS = %i[surname name gender birthdate birthplace].freeze

    # @param [String] tax_code The pre-computed tax code
    # @param [Hash]   data     The optional user attributes
    #
    def initialize(tax_code, data = {})
      @tax_code = tax_code
      @data     = data
    end

    class << self
      # Checks the tax code standard length against user
      # and business fiscal code standards.
      #
      # @param [String] tax_code The tax code
      #
      # @return [true, false]
      def standard_length?(tax_code)
        tax_code.length == LENGTH
      end
    end

    # Checks pre-computed tax code validity against newly encoded tax code.
    #
    # @return [true, false]
    def valid?
      encoded_tax_code == tax_code
    end

    private

      attr_reader :tax_code, :data

      # Encodes the tax code from the given 'data' hash, also backfilling missing information
      # by decoding the pre-computed tax code.
      #
      # @return [String, nil] The encoded tax code or nil if decoding the tax code fails
      def encoded_tax_code
        if partial_data?
          decoded_tax_code ? backfill_data! : return
        end

        Encoder.new(data).encode
      end

      # Decodes the given tax code to backfill possibly missing data in the 'data' hash.
      # If the decode fails, it means that the provided tax code is not valid.
      #
      # @return [Hash, nil] The decoded hash or nil if the tax code is not valid
      def decoded_tax_code
        @decoded_tax_code ||= begin
          Parser.new(tax_code).decode
        rescue Parser::Error
          nil
        end
      end

      def partial_data?
        REQUIRED_KEYS.any? { |required_key| data[required_key].blank? }
      end

      def backfill_data!
        data.tap do |hash|
          hash[:surname]    ||= decoded_tax_code[:raw][:surname]
          hash[:name]       ||= decoded_tax_code[:raw][:name]
          hash[:gender]     ||= decoded_tax_code[:gender]
          hash[:birthdate]  ||= decoded_tax_code[:birthdate]
          hash[:birthplace] ||= decoded_tax_code[:birthplace][:code]
        end
      end
  end
end
