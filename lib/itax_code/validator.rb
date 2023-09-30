# frozen_string_literal: true

module ItaxCode
  # Handles the validation logic.
  class Validator
    LENGTH = 16

    # @param [String] tax_code The pre-computed tax code
    def initialize(tax_code)
      @tax_code = tax_code
    end

    class << self
      # Checks the tax code standard length against user and business fiscal code standards.
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
      !decoded_tax_code.nil?
    end

    private

      attr_reader :tax_code

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
  end
end
