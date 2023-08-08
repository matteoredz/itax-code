# frozen_string_literal: true

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
            CCCFBA85D03L2M9A
            CCCFBA85D03LN19E
            CCCFBA85D0PL219L
            CCCFBA85DL3L219A
            CCCFBA8RD03L219B
            CCCFBAU5D03L219M
            CCCFBA85D03L2MVP
            CCCFBA85D03LN1VT
            CCCFBA85D0PL21VA
            CCCFBA85DL3L21VP
            CCCFBA8RD03L21VQ
            CCCFBAU5D03L21VB
            CCCFBA85D03LNM9P
            CCCFBA85D0PL2M9W
            CCCFBA85DL3L2M9L
            CCCFBA8RD03L2M9M
            CCCFBAU5D03L2M9X
            CCCFBA85D0PLN19A
            CCCFBA85DL3LN19P
            CCCFBA8RD03LN19Q
            CCCFBAU5D03LN19B
            CCCFBA85DLPL219W
            CCCFBA8RD0PL219X
            CCCFBAU5D0PL219I
            CCCFBA8RDL3L219M
            CCCFBAU5DL3L219X
            CCCFBAURD03L219Y
            CCCFBA85D03LNMVE
            CCCFBA85D0PL2MVL
            CCCFBA85DL3L2MVA
            CCCFBA8RD03L2MVB
            CCCFBAU5D03L2MVM
            CCCFBA85D0PLN1VP
            CCCFBA85DL3LN1VE
            CCCFBA8RD03LN1VF
            CCCFBAU5D03LN1VQ
            CCCFBA85DLPL21VL
            CCCFBA8RD0PL21VM
            CCCFBAU5D0PL21VX
            CCCFBA8RDL3L21VB
            CCCFBAU5DL3L21VM
            CCCFBAURD03L21VN
            CCCFBA85D0PLNM9L
            CCCFBA85DL3LNM9A
            CCCFBA8RD03LNM9B
            CCCFBAU5D03LNM9M
            CCCFBA85DLPL2M9H
            CCCFBA8RD0PL2M9I
            CCCFBAU5D0PL2M9T
            CCCFBA8RDL3L2M9X
            CCCFBAU5DL3L2M9I
            CCCFBAURD03L2M9J
            CCCFBA85DLPLN19L
            CCCFBA8RD0PLN19M
            CCCFBAU5D0PLN19X
            CCCFBA8RDL3LN19B
            CCCFBAU5DL3LN19M
            CCCFBAURD03LN19N
            CCCFBA8RDLPL219I
            CCCFBAU5DLPL219T
            CCCFBAURD0PL219U
            CCCFBAURDL3L219J
            CCCFBA85D0PLNMVA
            CCCFBA85DL3LNMVP
            CCCFBA8RD03LNMVQ
            CCCFBAU5D03LNMVB
            CCCFBA85DLPL2MVW
            CCCFBA8RD0PL2MVX
            CCCFBAU5D0PL2MVI
            CCCFBA8RDL3L2MVM
            CCCFBAU5DL3L2MVX
            CCCFBAURD03L2MVY
            CCCFBA85DLPLN1VA
            CCCFBA8RD0PLN1VB
            CCCFBAU5D0PLN1VM
            CCCFBA8RDL3LN1VQ
            CCCFBAU5DL3LN1VB
            CCCFBAURD03LN1VC
            CCCFBA8RDLPL21VX
            CCCFBAU5DLPL21VI
            CCCFBAURD0PL21VJ
            CCCFBAURDL3L21VY
            CCCFBA85DLPLNM9W
            CCCFBA8RD0PLNM9X
            CCCFBAU5D0PLNM9I
            CCCFBA8RDL3LNM9M
            CCCFBAU5DL3LNM9X
            CCCFBAURD03LNM9Y
            CCCFBA8RDLPL2M9T
            CCCFBAU5DLPL2M9E
            CCCFBAURD0PL2M9F
            CCCFBAURDL3L2M9U
            CCCFBA8RDLPLN19X
            CCCFBAU5DLPLN19I
            CCCFBAURD0PLN19J
            CCCFBAURDL3LN19Y
            CCCFBAURDLPL219F
            CCCFBA85DLPLNMVL
            CCCFBA8RD0PLNMVM
            CCCFBAU5D0PLNMVX
            CCCFBA8RDL3LNMVB
            CCCFBAU5DL3LNMVM
            CCCFBAURD03LNMVN
            CCCFBA8RDLPL2MVI
            CCCFBAU5DLPL2MVT
            CCCFBAURD0PL2MVU
            CCCFBAURDL3L2MVJ
            CCCFBA8RDLPLN1VM
            CCCFBAU5DLPLN1VX
            CCCFBAURD0PLN1VY
            CCCFBAURDL3LN1VN
            CCCFBAURDLPL21VU
            CCCFBA8RDLPLNM9I
            CCCFBAU5DLPLNM9T
            CCCFBAURD0PLNM9U
            CCCFBAURDL3LNM9J
            CCCFBAURDLPL2M9Q
            CCCFBAURDLPLN19U
            CCCFBA8RDLPLNMVX
            CCCFBAU5DLPLNMVI
            CCCFBAURD0PLNMVJ
            CCCFBAURDL3LNMVY
            CCCFBAURDLPL2MVF
            CCCFBAURDLPLN1VJ
            CCCFBAURDLPLNM9F
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
            RSSMRA80A41F2L5M
            RSSMRA80A41FN05Q
            RSSMRA80A4MF205T
            RSSMRA80AQ1F205N
            RSSMRA8LA41F205M
            RSSMRAU0A41F205Y
            RSSMRA80A41F2LRH
            RSSMRA80A41FN0RL
            RSSMRA80A4MF20RO
            RSSMRA80AQ1F20RI
            RSSMRA8LA41F20RH
            RSSMRAU0A41F20RT
            RSSMRA80A41FNL5B
            RSSMRA80A4MF2L5E
            RSSMRA80AQ1F2L5Y
            RSSMRA8LA41F2L5X
            RSSMRAU0A41F2L5J
            RSSMRA80A4MFN05I
            RSSMRA80AQ1FN05C
            RSSMRA8LA41FN05B
            RSSMRAU0A41FN05N
            RSSMRA80AQMF205F
            RSSMRA8LA4MF205E
            RSSMRAU0A4MF205Q
            RSSMRA8LAQ1F205Y
            RSSMRAU0AQ1F205K
            RSSMRAULA41F205J
            RSSMRA80A41FNLRW
            RSSMRA80A4MF2LRZ
            RSSMRA80AQ1F2LRT
            RSSMRA8LA41F2LRS
            RSSMRAU0A41F2LRE
            RSSMRA80A4MFN0RD
            RSSMRA80AQ1FN0RX
            RSSMRA8LA41FN0RW
            RSSMRAU0A41FN0RI
            RSSMRA80AQMF20RA
            RSSMRA8LA4MF20RZ
            RSSMRAU0A4MF20RL
            RSSMRA8LAQ1F20RT
            RSSMRAU0AQ1F20RF
            RSSMRAULA41F20RE
            RSSMRA80A4MFNL5T
            RSSMRA80AQ1FNL5N
            RSSMRA8LA41FNL5M
            RSSMRAU0A41FNL5Y
            RSSMRA80AQMF2L5Q
            RSSMRA8LA4MF2L5P
            RSSMRAU0A4MF2L5B
            RSSMRA8LAQ1F2L5J
            RSSMRAU0AQ1F2L5V
            RSSMRAULA41F2L5U
            RSSMRA80AQMFN05U
            RSSMRA8LA4MFN05T
            RSSMRAU0A4MFN05F
            RSSMRA8LAQ1FN05N
            RSSMRAU0AQ1FN05Z
            RSSMRAULA41FN05Y
            RSSMRA8LAQMF205Q
            RSSMRAU0AQMF205C
            RSSMRAULA4MF205B
            RSSMRAULAQ1F205V
            RSSMRA80A4MFNLRO
            RSSMRA80AQ1FNLRI
            RSSMRA8LA41FNLRH
            RSSMRAU0A41FNLRT
            RSSMRA80AQMF2LRL
            RSSMRA8LA4MF2LRK
            RSSMRAU0A4MF2LRW
            RSSMRA8LAQ1F2LRE
            RSSMRAU0AQ1F2LRQ
            RSSMRAULA41F2LRP
            RSSMRA80AQMFN0RP
            RSSMRA8LA4MFN0RO
            RSSMRAU0A4MFN0RA
            RSSMRA8LAQ1FN0RI
            RSSMRAU0AQ1FN0RU
            RSSMRAULA41FN0RT
            RSSMRA8LAQMF20RL
            RSSMRAU0AQMF20RX
            RSSMRAULA4MF20RW
            RSSMRAULAQ1F20RQ
            RSSMRA80AQMFNL5F
            RSSMRA8LA4MFNL5E
            RSSMRAU0A4MFNL5Q
            RSSMRA8LAQ1FNL5Y
            RSSMRAU0AQ1FNL5K
            RSSMRAULA41FNL5J
            RSSMRA8LAQMF2L5B
            RSSMRAU0AQMF2L5N
            RSSMRAULA4MF2L5M
            RSSMRAULAQ1F2L5G
            RSSMRA8LAQMFN05F
            RSSMRAU0AQMFN05R
            RSSMRAULA4MFN05Q
            RSSMRAULAQ1FN05K
            RSSMRAULAQMF205N
            RSSMRA80AQMFNLRA
            RSSMRA8LA4MFNLRZ
            RSSMRAU0A4MFNLRL
            RSSMRA8LAQ1FNLRT
            RSSMRAU0AQ1FNLRF
            RSSMRAULA41FNLRE
            RSSMRA8LAQMF2LRW
            RSSMRAU0AQMF2LRI
            RSSMRAULA4MF2LRH
            RSSMRAULAQ1F2LRB
            RSSMRA8LAQMFN0RA
            RSSMRAU0AQMFN0RM
            RSSMRAULA4MFN0RL
            RSSMRAULAQ1FN0RF
            RSSMRAULAQMF20RI
            RSSMRA8LAQMFNL5Q
            RSSMRAU0AQMFNL5C
            RSSMRAULA4MFNL5B
            RSSMRAULAQ1FNL5V
            RSSMRAULAQMF2L5Y
            RSSMRAULAQMFN05C
            RSSMRA8LAQMFNLRL
            RSSMRAU0AQMFNLRX
            RSSMRAULA4MFNLRW
            RSSMRAULAQ1FNLRQ
            RSSMRAULAQMF2LRT
            RSSMRAULAQMFN0RX
            RSSMRAULAQMFNL5N
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
            BRRDRN70M41Z6L2O
            BRRDRN70M41ZS02A
            BRRDRN70M4MZ602V
            BRRDRN70MQ1Z602P
            BRRDRN7LM41Z602O
            BRRDRNT0M41Z602A
            BRRDRN70M41Z6LND
            BRRDRN70M41ZS0NP
            BRRDRN70M4MZ60NK
            BRRDRN70MQ1Z60NE
            BRRDRN7LM41Z60ND
            BRRDRNT0M41Z60NP
            BRRDRN70M41ZSL2L
            BRRDRN70M4MZ6L2G
            BRRDRN70MQ1Z6L2A
            BRRDRN7LM41Z6L2Z
            BRRDRNT0M41Z6L2L
            BRRDRN70M4MZS02S
            BRRDRN70MQ1ZS02M
            BRRDRN7LM41ZS02L
            BRRDRNT0M41ZS02X
            BRRDRN70MQMZ602H
            BRRDRN7LM4MZ602G
            BRRDRNT0M4MZ602S
            BRRDRN7LMQ1Z602A
            BRRDRNT0MQ1Z602M
            BRRDRNTLM41Z602L
            BRRDRN70M41ZSLNA
            BRRDRN70M4MZ6LNV
            BRRDRN70MQ1Z6LNP
            BRRDRN7LM41Z6LNO
            BRRDRNT0M41Z6LNA
            BRRDRN70M4MZS0NH
            BRRDRN70MQ1ZS0NB
            BRRDRN7LM41ZS0NA
            BRRDRNT0M41ZS0NM
            BRRDRN70MQMZ60NW
            BRRDRN7LM4MZ60NV
            BRRDRNT0M4MZ60NH
            BRRDRN7LMQ1Z60NP
            BRRDRNT0MQ1Z60NB
            BRRDRNTLM41Z60NA
            BRRDRN70M4MZSL2D
            BRRDRN70MQ1ZSL2X
            BRRDRN7LM41ZSL2W
            BRRDRNT0M41ZSL2I
            BRRDRN70MQMZ6L2S
            BRRDRN7LM4MZ6L2R
            BRRDRNT0M4MZ6L2D
            BRRDRN7LMQ1Z6L2L
            BRRDRNT0MQ1Z6L2X
            BRRDRNTLM41Z6L2W
            BRRDRN70MQMZS02E
            BRRDRN7LM4MZS02D
            BRRDRNT0M4MZS02P
            BRRDRN7LMQ1ZS02X
            BRRDRNT0MQ1ZS02J
            BRRDRNTLM41ZS02I
            BRRDRN7LMQMZ602S
            BRRDRNT0MQMZ602E
            BRRDRNTLM4MZ602D
            BRRDRNTLMQ1Z602X
            BRRDRN70M4MZSLNS
            BRRDRN70MQ1ZSLNM
            BRRDRN7LM41ZSLNL
            BRRDRNT0M41ZSLNX
            BRRDRN70MQMZ6LNH
            BRRDRN7LM4MZ6LNG
            BRRDRNT0M4MZ6LNS
            BRRDRN7LMQ1Z6LNA
            BRRDRNT0MQ1Z6LNM
            BRRDRNTLM41Z6LNL
            BRRDRN70MQMZS0NT
            BRRDRN7LM4MZS0NS
            BRRDRNT0M4MZS0NE
            BRRDRN7LMQ1ZS0NM
            BRRDRNT0MQ1ZS0NY
            BRRDRNTLM41ZS0NX
            BRRDRN7LMQMZ60NH
            BRRDRNT0MQMZ60NT
            BRRDRNTLM4MZ60NS
            BRRDRNTLMQ1Z60NM
            BRRDRN70MQMZSL2P
            BRRDRN7LM4MZSL2O
            BRRDRNT0M4MZSL2A
            BRRDRN7LMQ1ZSL2I
            BRRDRNT0MQ1ZSL2U
            BRRDRNTLM41ZSL2T
            BRRDRN7LMQMZ6L2D
            BRRDRNT0MQMZ6L2P
            BRRDRNTLM4MZ6L2O
            BRRDRNTLMQ1Z6L2I
            BRRDRN7LMQMZS02P
            BRRDRNT0MQMZS02B
            BRRDRNTLM4MZS02A
            BRRDRNTLMQ1ZS02U
            BRRDRNTLMQMZ602P
            BRRDRN70MQMZSLNE
            BRRDRN7LM4MZSLND
            BRRDRNT0M4MZSLNP
            BRRDRN7LMQ1ZSLNX
            BRRDRNT0MQ1ZSLNJ
            BRRDRNTLM41ZSLNI
            BRRDRN7LMQMZ6LNS
            BRRDRNT0MQMZ6LNE
            BRRDRNTLM4MZ6LND
            BRRDRNTLMQ1Z6LNX
            BRRDRN7LMQMZS0NE
            BRRDRNT0MQMZS0NQ
            BRRDRNTLM4MZS0NP
            BRRDRNTLMQ1ZS0NJ
            BRRDRNTLMQMZ60NE
            BRRDRN7LMQMZSL2A
            BRRDRNT0MQMZSL2M
            BRRDRNTLM4MZSL2L
            BRRDRNTLMQ1ZSL2F
            BRRDRNTLMQMZ6L2A
            BRRDRNTLMQMZS02M
            BRRDRN7LMQMZSLNP
            BRRDRNT0MQMZSLNB
            BRRDRNTLM4MZSLNA
            BRRDRNTLMQ1ZSLNU
            BRRDRNTLMQMZ6LNP
            BRRDRNTLMQMZS0NB
            BRRDRNTLMQMZSL2X
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
