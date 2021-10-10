require "test_helper"

module ItaxCode
  class EncoderTest < ActiveSupport::TestCase
    test "public interface" do
      instance_methods = Encoder.instance_methods - Object.instance_methods
      assert_equal %i[encode], instance_methods
    end

    test "#encode" do
      assert_equal "RSSMRA80A01F205X",
                   Encoder.new(
                     surname: "Rossi",
                     name: "Mario",
                     gender: "M",
                     birthdate: "1980-1-1",
                     birthplace: "Milano"
                   ).encode
    end

    test "#encode when name has more than 3 consonants" do
      assert_equal "RSSGPR80A01F205D",
                   Encoder.new(
                     surname: "Rossi",
                     name: "Ginepro",
                     gender: "M",
                     birthdate: "1980-1-1",
                     birthplace: "Milano"
                   ).encode
    end

    test "#encode for foreign countries" do
      assert_equal "BRRDRN70M41Z602D",
                   Encoder.new(
                     surname: "Berardi",
                     name: "Adriana",
                     gender: "F",
                     birthdate: "1970-8-1",
                     birthplace: "Brasile"
                   ).encode
    end

    test "#encode raises MissingDataError" do
      assert_raises "Encoder::MissingDataError" do
        Encoder.new(birthdate: "1980-1-1").encode
      end
    end

    test "#encode raises Date::Error on malformed birthdate" do
      assert_raises "Date::Error" do
        Encoder.new.encode
      end
    end
  end
end
