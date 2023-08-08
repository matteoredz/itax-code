# frozen_string_literal: true

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
                     birthdate: "1980-01-01",
                     birthplace: "Milano"
                   ).encode
    end

    test "#encode when birthplace is the Belfiore code" do
      assert_equal "RSSMRA80A01F205X",
                   Encoder.new(
                     surname: "Rossi",
                     name: "Mario",
                     gender: "M",
                     birthdate: "1980-01-01",
                     birthplace: "F205"
                   ).encode
    end

    test "#encode when name has more than 3 consonants" do
      assert_equal "RSSGPR80A01F205D",
                   Encoder.new(
                     surname: "Rossi",
                     name: "Ginepro",
                     gender: "M",
                     birthdate: "1980-01-01",
                     birthplace: "Milano"
                   ).encode
    end

    test "#encode for foreign countries" do
      assert_equal "BRRDRN70M41Z602D",
                   Encoder.new(
                     surname: "Berardi",
                     name: "Adriana",
                     gender: "F",
                     birthdate: "1970-08-01",
                     birthplace: "Brasile"
                   ).encode
    end

    test "#encode raises MissingDataError on missing data" do
      assert_raises Encoder::MissingDataError do
        Encoder.new.encode
      end
    end

    test "#encode raises MissingDataError on missing birthplace" do
      assert_raises Encoder::MissingDataError do
        Encoder.new(
          surname: "Rossi",
          name: "Mario",
          gender: "M",
          birthdate: "1980-01-01",
          birthplace: "some-fancy-birthplace"
        ).encode
      end
    end

    test "#encode raises ArgumentError on malformed birthdate" do
      assert_raises ArgumentError do
        Encoder.new(
          surname: "Rossi",
          name: "Mario",
          gender: "M",
          birthdate: "invalid-date",
          birthplace: "Milano"
        ).encode
      end
    end
  end
end
