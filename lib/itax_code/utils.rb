require "csv"

module ItaxCode
  class Utils
    def regex
      /^([A-Z]{3})([A-Z]{3})
        (([A-Z\d]{2})([ABCDEHLMPRST]{1})([A-Z\d]{2}))
        ([A-Z]{1}[A-Z\d]{3})
        ([A-Z]{1})$/x
    end

    def slugged(str, separator = "-")
      str.gsub!(/\s*@\s*/, " at ")
      str.gsub!(/\s*&\s*/, " and ")
      str.parameterize(separator: separator)
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

    def cin_odds
      {
        "0": 1,  "1": 0,  "2": 5,  "3": 7,  "4": 9,  "5": 13,
        "6": 15, "7": 17, "8": 19, "9": 21, "A": 1,  "B": 0,
        "C": 5,  "D": 7,  "E": 9,  "F": 13, "G": 15, "H": 17,
        "I": 19, "J": 21, "K": 2,  "L": 4,  "M": 18, "N": 20,
        "O": 11, "P": 3,  "Q": 6,  "R": 8,  "S": 12, "T": 14,
        "U": 16, "V": 10, "W": 22, "X": 25, "Y": 24, "Z": 23
      }
    end

    def cin_evens
      {
        "0": 0,  "1": 1,  "2": 2,  "3": 3,  "4": 4,  "5": 5,
        "6": 6,  "7": 7,  "8": 8,  "9": 9,  "A": 0,  "B": 1,
        "C": 2,  "D": 3,  "E": 4,  "F": 5,  "G": 6,  "H": 7,
        "I": 8,  "J": 9,  "K": 10, "L": 11, "M": 12, "N": 13,
        "O": 14, "P": 15, "Q": 16, "R": 17, "S": 18, "T": 19,
        "U": 20, "V": 21, "W": 22, "X": 23, "Y": 24, "Z": 25
      }
    end

    def cin_remainders
      "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
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
      tot = 0

      code.chars.each_with_index do |char, index|
        tot += (index + 1).odd? ? cin_odds[char.to_sym] : cin_evens[char.to_sym]
      end

      cin_remainders[tot % 26]
    end

    def cities
      CSV.foreach("#{__dir__}/data/cities.csv", headers: true)
    end

    def countries
      CSV.foreach("#{__dir__}/data/countries.csv", headers: true)
    end
  end
end
