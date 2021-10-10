module ItaxCode
  # Handles the tax code generation logic.
  #
  # @param [String]       surname    The user first name
  # @param [String]       name       The user last name
  # @param [String]       gender     The user gender
  # @param [String, Date] birthdate  The user birthdate
  # @param [String]       birthplace The user birthplace
  #
  # @example
  #   ItaxCode::Encoder.new(
  #     surname: "Rossi",
  #     name: "Matteo",
  #     gender: "M",
  #     birthdate: "1990-08-23",
  #     birthplace: "Milano"
  #   ).encode
  #
  # @return [String] The encoded tax code
  class Encoder
    class MissingDataError < StandardError; end

    def initialize(data = {}, utils = Utils.new)
      @surname    = data[:surname]
      @name       = data[:name]
      @gender     = data[:gender]&.upcase
      @birthdate  = Date.parse(data[:birthdate].to_s)
      @birthplace = data[:birthplace]
      @utils      = utils

      instance_variables.each do |ivar|
        next if instance_variable_get(ivar).present?

        raise MissingDataError, "missing #{ivar} value"
      end
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

        if consonants.length > 3
          consonants =
            consonants.chars.values_at(0, 2..consonants.chars.size).join
        end

        "#{consonants[0..2]}#{vowels[0..2]}XXX"[0..2].upcase
      end

      def encode_birthdate
        year  = birthdate.year.to_s[2..-1]
        month = utils.months[birthdate.month - 1]
        day   = format "%02d", (birthdate.day + (gender == "F" ? 40 : 0))
        "#{year}#{month}#{day}"
      end

      def encode_birthplace(src = utils.cities, exit: false)
        place = src.find do |item|
          utils.slugged(birthplace) == utils.slugged(item["name"])
        end

        code = place.try(:[], "code")
        return code if code.present?

        exit || encode_birthplace(utils.countries, exit: true)
      end
  end
end
