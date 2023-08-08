# frozen_string_literal: true

module ItaxCode
  # Handles the validation logic.
  #
  # @param [Hash] data The user input data
  class Validator
    LENGTH = 16

    def initialize(data = {})
      @encoded = Encoder.new(data).encode
    end

    class << self
      # Checks the tax code standard length against user
      # and business fical code standards.
      #
      # @param [String] code The tax code
      #
      # @return [true, false]
      def standard_length?(code)
        code.length == LENGTH
      end
    end

    # Checks pre computed tax code validity against newly encoded tax code.
    #
    # @param [String] tax_code The pre computed tax code
    #
    # @return [true, false]
    def valid?(tax_code)
      encoded[0..10] == tax_code[0..10]
    end

    private

      attr_accessor :encoded
  end
end
