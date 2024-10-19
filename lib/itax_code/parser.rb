# frozen_string_literal: true

require "itax_code/omocode"

module ItaxCode
  # Handles the parsing logic.
  #
  # @example
  #
  #   ItaxCode::Parser.new("RSSMRA70A01L726S").decode
  #
  # @return [Hash] The parsed tax code
  class Parser
    LENGTH = 16

    # @param [String] tax_code
    # @param [Utils]  utils
    def initialize(tax_code, utils = Utils)
      @tax_code = tax_code&.upcase
      @utils    = utils

      raise NoTaxCodeError if @utils.blank?(@tax_code)
      raise InvalidTaxCodeError if @tax_code.length != LENGTH
      raise InvalidControlInternalNumberError if raw[:cin] != @utils.encode_cin(@tax_code)
    end

    # Decodes the tax code into its components.
    #
    # @return [Hash]
    def decode
      {
        code: tax_code,
        gender: gender,
        birthdate: birthdate,
        birthplace: birthplace,
        omocodes: Omocode.new(tax_code).omocodes,
        raw: raw
      }
    end

    private

      attr_accessor :tax_code, :utils

      def raw
        @raw ||= {
          surname: raw_matches[0],
          name: raw_matches[1],
          birthdate: raw_matches[2],
          birthdate_year: raw_matches[3],
          birthdate_month: raw_matches[4],
          birthdate_day: raw_matches[5],
          birthplace: raw_matches[6],
          cin: raw_matches[7]
        }
      end

      def raw_matches
        @raw_matches ||= tax_code.scan(utils.tax_code_sections_regex).flatten
      end

      def gender
        val = utils.omocodia_decode(raw[:birthdate_day]).to_i
        val > 40 ? "F" : "M"
      end

      # This method tries to calculate the year based on a raw data. This means that the returned
      # value could be wrong. E.g. a person born on 1920 would have birthdate_year = 20 meaning
      # that both 1920 and 2020 could be valid born years.
      def year
        current_year = Date.today.year
        val = (current_year.to_s[0..1] + utils.omocodia_decode(raw[:birthdate_year])).to_i
        val > current_year ? val - 100 : val
      end

      def month
        utils.months.find_index(raw[:birthdate_month]) + 1
      end

      def day
        val = utils.omocodia_decode(raw[:birthdate_day]).to_i
        val > 40 ? val - 40 : val
      end

      def birthdate
        begin
          @birthdate ||= Date.parse("#{year}-#{month}-#{day}").to_s
        rescue Date::Error
          raise DateTaxCodeError
        end
      end

      def birthplace(src = utils.cities, stop: false)
        place = src.find { |item| item["code"] == birthplace_code && in_dates?(item) }

        if place.nil?
          birthplace(utils.countries, stop: true) unless stop
        else
          place.to_h.transform_keys(&:to_sym)
        end
      end

      def birthplace_code
        raw[:birthplace][0] + utils.omocodia_decode(raw[:birthplace][1..-1])
      end

      def in_dates?(item)
        created_on = Date.parse item.fetch("created_on", "0000-01-01")
        deleted_on = Date.parse item.fetch("deleted_on", "9999-12-31")
        Date.parse(birthdate).between? created_on, deleted_on
      end
  end
end
