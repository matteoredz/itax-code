# frozen_string_literal: true

require "test_helper"

module ItaxCode
  class UtilsTest < Minitest::Test
    test "#blank?(obj) is truthy when the argument is empty" do
      empty_object = []

      assert klass.blank?(empty_object)
    end

    test "#blank?(obj) is falsy when the argument isn't empty" do
      non_empty_object = [1, 2, 3]

      refute klass.blank?(non_empty_object)
    end

    test "#blank?(obj) is truthy when the argument is nil and don't respont to empty?" do
      nil_object = nil

      assert klass.blank?(nil_object)
    end

    test "#blank?(obj) is falsy when the argument is not nil and don't respont to empty?" do
      some_object = 1

      refute klass.blank?(some_object)
    end

    test "#slugged(string)" do
      diacritic_names = {
        " Ārquim Urkęr--" => "arquim-urker",
        "-Roimčus Lÿty -" => "roimcus-lyty",
        "--M@rio Ro$$i -" => "m-rio-ro-i"
      }

      diacritic_names.each do |input, output|
        assert_equal output, klass.slugged(input)
      end
    end

    private

      def klass
        Utils
      end
  end
end
