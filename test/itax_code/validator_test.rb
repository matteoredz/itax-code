require "test_helper"

module ItaxCode
  class ValidatorTest < ActiveSupport::TestCase
    test "public interface" do
      instance_methods = Validator.instance_methods - Object.instance_methods
      class_methods    = Validator.methods - Object.methods
      assert_equal %i[valid?], instance_methods
      assert_equal %i[standard_length?], class_methods
    end

    test "#valid?" do
      assert Validator.new(user_data).valid?("RSSMRA80A01F205X")
      assert_not Validator.new(user_data).valid?("RSSMRA11A01F205F")
    end

    test "#standard_length?" do
      assert Validator.standard_length?("RSSMRA00A01F205F")
      assert_not Validator.standard_length?("WRONG")
    end

    private

      def user_data
        {
          surname: "Rossi",
          name: "Mario",
          gender: "M",
          birthdate: "1980-01-01",
          birthplace: "Milano"
        }
      end
  end
end
