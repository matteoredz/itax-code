# frozen_string_literal: true

require "test_helper"

class ItaxCodeTest < ActiveSupport::TestCase
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
    assert_not klass.valid?("WRONG")
  end

  private

    def klass
      ItaxCode
    end
end
