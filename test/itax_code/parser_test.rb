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

    private

      def decoded
        {
          code: "CCCFBA85D03L219P",
          gender: "M",
          birthdate: "1985-4-3",
          birthplace: {
            code: "L219",
            province: "TO",
            name: "TORINO"
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
          birthdate: "1980-1-1",
          birthplace: {
            code: "F205",
            province: "MI",
            name: "MILANO"
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
  end
end
