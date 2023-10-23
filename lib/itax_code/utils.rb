# frozen_string_literal: true

require "csv"
require "itax_code/transliterator"

module ItaxCode
  class Utils
    def blank?(obj)
      obj.respond_to?(:empty?) ? !!obj.empty? : !obj
    end

    def present?(obj)
      !blank?(obj)
    end

    def slugged(string, separator = "-")
      transliterate(string.downcase.strip)
        .gsub(/[^\w-]+/, separator) # white spaces to '-' char
        .gsub(/-{2,}/, separator) # consecutive '-' chars to single '-' char
        .gsub(/^-+|-+$/, "") # remove leading and trailing '-' chars
    end

    def transliterate(string)
      return string if string.ascii_only?

      transliterator = Transliterator.new
      transliterator.transliterate(string.unicode_normalize(:nfc))
    end

    def tax_code_sections_regex
      /^([A-Z]{3})([A-Z]{3})
        (([A-Z\d]{2})([ABCDEHLMPRST]{1})([A-Z\d]{2}))
        ([A-Z]{1}[A-Z\d]{3})
        ([A-Z]{1})$/x
    end

    def months
      %w[A B C D E H L M P R S T]
    end

    def consonants
      %w[b c d f g h j k l m n p q r s t v w x y z]
    end

    def vowels
      %w[a e i o u]
    end

    def cin
      {
        "0" => [0, 1],
        "1" => [1, 0],
        "2" => [2, 5],
        "3" => [3, 7],
        "4" => [4, 9],
        "5" => [5, 13],
        "6" => [6, 15],
        "7" => [7, 17],
        "8" => [8, 19],
        "9" => [9, 21],
        "A" => [0, 1],
        "B" => [1, 0],
        "C" => [2, 5],
        "D" => [3, 7],
        "E" => [4, 9],
        "F" => [5, 13],
        "G" => [6, 15],
        "H" => [7, 17],
        "I" => [8, 19],
        "J" => [9, 21],
        "K" => [10, 2],
        "L" => [11, 4],
        "M" => [12, 18],
        "N" => [13, 20],
        "O" => [14, 11],
        "P" => [15, 3],
        "Q" => [16, 6],
        "R" => [17, 8],
        "S" => [18, 12],
        "T" => [19, 14],
        "U" => [20, 16],
        "V" => [21, 10],
        "W" => [22, 22],
        "X" => [23, 25],
        "Y" => [24, 24],
        "Z" => [25, 23]
      }
    end

    def cin_remainders
      ("A".."Z").to_a
    end

    def omocodia
      {
        "0": "L", "1": "M", "2": "N", "3": "P", "4": "Q",
        "5": "R", "6": "S", "7": "T", "8": "U", "9": "V"
      }
    end

    def omocodia_digits
      omocodia.keys.join
    end

    def omocodia_letters
      omocodia.values.join
    end

    def omocodia_indexes
      [6, 7, 9, 10, 12, 13, 14].reverse
    end

    def omocodia_indexes_combos
      (1..omocodia_indexes.size).flat_map do |index|
        omocodia_indexes.combination(index).to_a
      end
    end

    def omocodia_encode(val)
      val.tr omocodia_digits, omocodia_letters
    end

    def omocodia_decode(val)
      val.tr omocodia_letters, omocodia_digits
    end

    def extract_consonants(str)
      str.select { |c| consonants.include? c }.join
    end

    def extract_vowels(str)
      str.select { |c| vowels.include? c }.join
    end

    def encode_cin(code)
      cin_tot = 0

      code[0..14].each_char.with_index do |char, i|
        cin_tot += cin[char][((i + 1) % 2).to_i]
      end

      cin_remainders[cin_tot % 26]
    end

    def cities
      CSV.foreach("#{__dir__}/data/cities.csv", headers: true)
    end

    def countries
      CSV.foreach("#{__dir__}/data/countries.csv", headers: true)
    end
  end
end
