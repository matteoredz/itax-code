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
      day, gender = decode_day_and_gender
      birthplace  = decode_birthplace

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

      def decode_day_and_gender
        day = utils.omocodia_decode(raw[:birthdate_day]).to_i

        if day > 40
          day -= 40
          [day, "F"]
        else
          [day, "M"]
        end
      end

      def decode_birthplace(src = utils.cities, exit: false)
        place = src.find do |item|
          item["code"] == city_code && !item["name"].include?("soppresso")
        end

        if place.nil?
          exit ? return : decode_birthplace(utils.countries, exit: true)
        else
          place["name"] = place["name"].gsub(" (soppresso)", "")
          place.to_h.deep_symbolize_keys
        end
      end

      def city_code
        raw[:birthplace][0] + utils.omocodia_decode(raw[:birthplace][1..-1])
      end
  end
end
