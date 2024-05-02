# frozen_string_literal: true

module ItaxCode
  # Handles the tax code generation logic.
  #
  # @example
  #   ItaxCode::Encoder.new(
  #     surname: "Rossi",
  #     name: "Mario",
  #     gender: "M",
  #     birthdate: "1980-01-01",
  #     birthplace: "Milano"
  #   ).encode
  #
  # @return [String] The encoded tax code
  class Encoder
    # @param [Hash]  data  The user attributes
    # @param [Utils] utils
    #
    # @option data [String]       :surname    The user first name
    # @option data [String]       :name       The user last name
    # @option data [String]       :gender     The user gender
    # @option data [String, Date] :birthdate  The user birthdate
    # @option data [String]       :birthplace The user birthplace
    def initialize(data = {}, utils = Utils)
      @utils = utils

      @surname    = data[:surname]
      @name       = data[:name]
      @gender     = data[:gender]&.upcase
      @birthdate  = data[:birthdate].to_s
      @birthplace = data[:birthplace]
      validate_data_presence!

      @birthdate = parse_birthdate!
    end

    # Computes the tax code from its components.
    #
    # @return [String] The calculated tax code
    def encode
      code  = encode_surname
      code += encode_name
      code += encode_birthdate
      code += encode_birthplace
      code += utils.encode_cin code
      code
    end

    private

      attr_accessor :surname, :name, :gender, :birthdate, :birthplace, :utils

      def encode_surname
        chars      = utils.slugged(surname).chars
        consonants = utils.extract_consonants chars
        vowels     = utils.extract_vowels chars
        "#{consonants[0..2]}#{vowels[0..2]}XXX"[0..2].upcase
      end

      def encode_name
        chars      = utils.slugged(name).chars
        consonants = utils.extract_consonants chars
        vowels     = utils.extract_vowels chars

        consonants = consonants.chars.values_at(0, 2..consonants.size).join if consonants.length > 3

        "#{consonants[0..2]}#{vowels[0..2]}XXX"[0..2].upcase
      end

      def encode_birthdate
        year  = birthdate.year.to_s[2..-1]
        month = utils.months[birthdate.month - 1]
        day   = format "%02d", (birthdate.day + (gender == "F" ? 40 : 0))
        "#{year}#{month}#{day}"
      end

      def encode_birthplace(src = utils.cities, stop: false)
        lookup_key = birthplace.match?(/^\w{1}\d{3}$/) ? "code" : "name"
        place_slug = utils.slugged(birthplace)
        place_item = src.find { |i| place_slug == utils.slugged(i[lookup_key]) }

        code = place_item&.[]("code")
        return code if utils.present?(code)
        raise MissingDataError, "no code found for #{birthplace}" if stop

        encode_birthplace(utils.countries, stop: true)
      end

      def validate_data_presence!
        instance_variables.each do |ivar|
          next if utils.present?(instance_variable_get(ivar))

          raise MissingDataError, "missing #{ivar} value"
        end
      end

      def parse_birthdate!
        Date.parse(birthdate)
      rescue StandardError
        raise InvalidBirthdateError, "#{birthdate} is not a valid date"
      end
  end
end
