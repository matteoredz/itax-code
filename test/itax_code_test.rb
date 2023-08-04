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
    assert_equal Hash, klass.decode("RSSMRA80A41F205B").class
  end

  test "#valid? with data" do
    assert klass.valid?(
      "RSSMRA80A10F205Z",
      {
        surname: "Rossi",
        name: "Mario",
        gender: "M",
        birthdate: Date.new(1980, 1, 10),
        birthplace: "Milano"
      }
    )
  end

  test "#valid? empty data" do
    assert klass.valid?("RSSMRA80A10F205Z")
  end

  test "#valid? incomplete_data" do
    assert klass.valid?("RSSMRA80A10F205Z",
      { surname: "Rossi", name: "Mario" },
      true
    )
  end

  private

    def klass
      ItaxCode
    end
end
