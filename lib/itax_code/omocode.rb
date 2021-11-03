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
      chars = tax_code[0..14].chars
      (omocodes(:decode, chars) + omocodes(:encode, chars)).uniq
    end

    private

      def omocodes(action, chars)
        utils.omocodia_subs_indexes.reverse.map do |i|
          chars[i] = utils.public_send("omocodia_#{action}".to_sym, chars[i])
          omocode(chars)
        end
      end

      def omocode(chars)
        code = chars.join
        code + utils.encode_cin(code)
      end
  end
end
