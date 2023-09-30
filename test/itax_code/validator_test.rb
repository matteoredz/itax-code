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

    test "#valid? is truthy when the tax code can be decoded" do
      assert_predicate Validator.new("RSSMRA80A01F205X"), :valid?
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
  end
end
