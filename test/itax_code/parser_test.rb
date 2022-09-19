require "test_helper"

module ItaxCode
  class ParserTest < ActiveSupport::TestCase
    test "public interface" do
      instance_methods = Parser.instance_methods - Object.instance_methods
      assert_equal %i[decode], instance_methods
    end

    test "#decode" do
      assert_equal decoded, Parser.new("CCCFBA85D03L219P").decode
    end

    test "#decode when F gender" do
      assert_equal decoded_f, Parser.new("RSSMRA80A41F205B").decode
    end

    test "#decode returns invalid code on invalid birthplace" do
      assert_equal decoded_foreign,
                   Parser.new("BRRDRN70M41Z602D").decode
    end

    private

      def decoded
        {
          code: "CCCFBA85D03L219P",
          gender: "M",
          birthdate: "1985-04-03",
          birthplace: {
            code: "L219",
            province: "TO",
            name: "TORINO",
            created_on: "1889-08-12",
            deleted_on: "9999-12-31"
          },
          omocodes: %w[
            CCCFBA85D03L219P
            CCCFBA85D03L21VE
            CCCFBA85D03L2MVP
            CCCFBA85D03LNMVE
            CCCFBA85D0PLNMVA
            CCCFBA85DLPLNMVL
            CCCFBA8RDLPLNMVX
            CCCFBAURDLPLNMVU
          ],
          raw: {
            surname: "CCC",
            name: "FBA",
            birthdate: "85D03",
            birthdate_year: "85",
            birthdate_month: "D",
            birthdate_day: "03",
            birthplace: "L219",
            cin: "P"
          }
        }
      end

      def decoded_f
        {
          code: "RSSMRA80A41F205B",
          gender: "F",
          birthdate: "1980-01-01",
          birthplace: {
            code: "F205",
            province: "MI",
            name: "MILANO",
            created_on: "1962-12-30",
            deleted_on: "1997-07-25"
          },
          omocodes: %w[
            RSSMRA80A41F205B
            RSSMRA80A41F20RW
            RSSMRA80A41F2LRH
            RSSMRA80A41FNLRW
            RSSMRA80A4MFNLRO
            RSSMRA80AQMFNLRA
            RSSMRA8LAQMFNLRL
            RSSMRAULAQMFNLRI
          ],
          raw: {
            surname: "RSS",
            name: "MRA",
            birthdate: "80A41",
            birthdate_year: "80",
            birthdate_month: "A",
            birthdate_day: "41",
            birthplace: "F205",
            cin: "B"
          }
        }
      end

      def decoded_foreign
        {
          code: "BRRDRN70M41Z602D",
          gender: "F",
          birthdate: "1970-08-01",
          birthplace: {
            code: "Z602",
            province: "EE",
            name: "BRASILE"
          },
          omocodes: %w[
            BRRDRN70M41Z602D
            BRRDRN70M41Z60NS
            BRRDRN70M41Z6LND
            BRRDRN70M41ZSLNA
            BRRDRN70M4MZSLNS
            BRRDRN70MQMZSLNE
            BRRDRN7LMQMZSLNP
            BRRDRNTLMQMZSLNM
          ],
          raw: {
            surname: "BRR",
            name: "DRN",
            birthdate: "70M41",
            birthdate_year: "70",
            birthdate_month: "M",
            birthdate_day: "41",
            birthplace: "Z602",
            cin: "D"
          }
        }
      end
  end
end
