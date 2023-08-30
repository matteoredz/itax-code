# frozen_string_literal: true

require "test_helper"

module ItaxCode
  class ValidatorTest < ActiveSupport::TestCase
    test "public interface" do
      instance_methods = Validator.instance_methods - Object.instance_methods
      class_methods    = Validator.methods - Object.methods

      assert_equal %i[valid?], instance_methods
      assert_equal %i[standard_length?], class_methods
    end

    test "#valid? is truthy when data matches with the provided tax code" do
      assert_predicate Validator.new("RSSMRA80A01F205X", data), :valid?
    end

    test "#valid? is truthy with matching partial and backfilled data" do
      data_combos.each do |data_combo|
        assert_predicate Validator.new("RSSMRA80A01F205X", data_combo), :valid?
      end
    end

    test "#valid? is truthy when the tax code is valid and no data is provided" do
      assert_predicate Validator.new("RSSMRA80A01F205X"), :valid?
    end

    test "#valid? is falsy when data don't matches with the provided tax code" do
      assert_not Validator.new("RSSMRA11A01F205F", data).valid?
    end

    test "#valid? is falsy when the parser cannot decode the given tax code" do
      assert_not Validator.new("WRONG").valid?
    end

    test "#standard_length? is truthy when the tax code length is 16" do
      assert Validator.standard_length?("RSSMRA00A01F205F")
    end

    test "#standard_length? is falsy when the tax code hasn't 16 chars" do
      assert_not Validator.standard_length?("WRONG")
    end

    private

      def data
        {
          surname: "Rossi",
          name: "Mario",
          gender: "M",
          birthdate: "1980-01-01",
          birthplace: "Milano"
        }
      end

      # Creates all the possible combinations from the 'data' hash.
      def data_combos
        (1..data.keys.size).flat_map do |size|
          data.keys.combination(size).map do |keys|
            keys.map { |key| [key, data[key]] }.to_h
          end
        end
      end
  end
end
