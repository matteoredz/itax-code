# frozen_string_literal: true

module ItaxCode
  class Omocode
    attr_reader :tax_code, :utils

    # Creates a new instance for a given tax_code.
    #
    # @param [String] tax_code
    # @param [Utils]  utils
    def initialize(tax_code, utils = Utils)
      @tax_code = tax_code
      @utils    = utils
    end

    # Computes the omocodes from a given tax_code by first identifying the original
    # tax_code and then appending all the omocodes.
    #
    # @return [Array]
    def omocodes
      [original_omocode] + utils.omocodia_indexes_combos.map do |combo|
        omocode(original_omocode, combo, ->(char) { utils.omocodia_encode(char) })
      end
    end

    # The original omocode is the one that have all the omocody indexes decoded
    # as number, and from which any of its omocodes are generated.
    #
    # @return [String]
    def original_omocode
      @original_omocode ||= omocode(
        tax_code, utils.omocodia_indexes, ->(char) { utils.omocodia_decode(char) }
      )
    end

    private

      def omocode(code, indexes, translation)
        chars = code[0..14].chars

        indexes.each do |index|
          chars[index] = translation.call(chars[index])
        end

        omocode = chars.join
        omocode + utils.encode_cin(omocode)
      end
  end
end
