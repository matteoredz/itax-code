require "itax_code/omocode"

module ItaxCode
  # Handles the parsing logic.
  #
  # @param [String] tax_code
  #
  # @example
  #
  #   ItaxCode::Parser.new("RSSMRA70A01L726S").decode
  #
  # @return [Hash]
  class Parser
    class NoTaxCodeError      < StandardError; end
    class InvalidTaxCodeError < StandardError; end

    def initialize(tax_code, utils = Utils.new)
      @tax_code = tax_code&.upcase
      @utils    = utils
      raise NoTaxCodeError if @tax_code.blank?
      raise InvalidTaxCodeError unless Validator.standard_length?(@tax_code)
    end

    # Decodes the tax code into its components.
    #
    # @return [Hash]
    def decode
      year        = decode_year
      month       = utils.months.find_index(raw[:birthdate_month]) + 1
      day, gender = day_and_gender

      {
        code: tax_code,
        gender: gender,
        birthdate: Date.parse([year, month, day].join("-")).to_s,
        birthplace: birthplace,
        omocodes: Omocode.new(tax_code).list,
        raw: raw
      }
    end

    private

      attr_accessor :tax_code, :utils

      def raw
        matches = tax_code.scan(utils.regex).flatten

        {
          surname: matches[0],
          name: matches[1],
          birthdate: matches[2],
          birthdate_year: matches[3],
          birthdate_month: matches[4],
          birthdate_day: matches[5],
          birthplace: matches[6],
          cin: matches[7]
        }
      end

      def decode_year
        year = utils.omocodia_decode raw[:birthdate_year]
        year = (Date.today.year.to_s[0..1] + year).to_i
        year -= 100 if year > Date.today.year
        year
      end

      def day_and_gender
        day = utils.omocodia_decode(raw[:birthdate_day]).to_i
        day > 40 ? [day - 40, "F"] : [day, "M"]
      end

      def birthplace(src = utils.cities, stop: false)
        place = src.find { |item| item["code"] == city_code }

        if place.nil?
          birthplace(utils.countries, stop: true) unless stop
        else
          place.to_h.deep_symbolize_keys
        end
      end

      def city_code
        raw[:birthplace][0] + utils.omocodia_decode(raw[:birthplace][1..-1])
      end
  end
end
