# frozen_string_literal: true

require "test_helper"

class ItaxCodeTest < Minitest::Test
  test "#encode" do
    result = klass.encode(
      surname: "Rossi",
      name: "Mario",
      gender: "M",
      birthdate: Date.new(1980, 1, 10),
      birthplace: "Milano"
    )

    assert_equal "RSSMRA80A10F205Z", result
  end

  test "#decode" do
    assert_instance_of Hash, klass.decode("RSSMRA80A41F205B")
  end

  test "#valid? is truthy when the tax code can be decoded" do
    assert klass.valid?("RSSMRA80A10F205Z")
  end

  test "#valid? is falsy when the parser cannot decode the given tax code" do
    refute klass.valid?("WRONG")
  end

  test "encode/decode round-trip for male" do
    result = klass.decode(klass.encode(surname: "Rossi", name: "Mario", gender: "M",
                                       birthdate: "1980-01-01", birthplace: "Milano"))

    assert_equal "M",          result[:gender]
    assert_equal "1980-01-01", result[:birthdate]
    assert_equal "F205",       result[:birthplace][:code]
  end

  test "encode/decode round-trip for female (day offset)" do
    result = klass.decode(klass.encode(surname: "Rossi", name: "Mario", gender: "F",
                                       birthdate: "1980-01-01", birthplace: "Milano"))

    assert_equal "F",          result[:gender]
    assert_equal "1980-01-01", result[:birthdate]
    assert_equal "F205",       result[:birthplace][:code]
  end

  test "encode/decode round-trip for foreign birthplace" do
    result = klass.decode(klass.encode(surname: "Berardi", name: "Adriana", gender: "F",
                                       birthdate: "1970-08-01", birthplace: "Brasile"))

    assert_equal "F",          result[:gender]
    assert_equal "1970-08-01", result[:birthdate]
    assert_equal "Z602",       result[:birthplace][:code]
  end

  private

    def klass
      ItaxCode
    end
end
