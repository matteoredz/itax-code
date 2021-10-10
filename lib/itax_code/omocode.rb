module ItaxCode
  class Omocode
    attr_reader :tax_code, :utils

    # Creates a new instance for a given tax_code.
    #
    # @param [String] tax_code
    # @param [Utils]  utils
    def initialize(tax_code, utils = Utils.new)
      @tax_code = tax_code
      @utils    = utils
    end

    # Computes the omocodes from a given tax_code.
    #
    # @return [Array]
    def list
      codes = []
      chars = tax_code[0..14].chars

      utils.omocodia_subs_indexes.reverse_each do |i|
        chars[i] = utils.omocodia_decode(chars[i])
      end

      codes << code_from(chars)

      utils.omocodia_subs_indexes.reverse_each do |i|
        chars[i] = utils.omocodia_encode(chars[i])
        codes << code_from(chars)
      end

      codes
    end

    private

      def code_from(chars)
        code = chars.join
        code + utils.encode_cin(code)
      end
  end
end
