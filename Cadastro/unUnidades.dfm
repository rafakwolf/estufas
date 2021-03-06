inherited frmUnidades: TfrmUnidades
  Caption = 'Unidades'
  ClientHeight = 135
  ClientWidth = 450
  ExplicitWidth = 466
  ExplicitHeight = 193
  PixelsPerInch = 96
  TextHeight = 13
  object dbeDescricaoUnidade: TPLDBEdit [0]
    Left = 120
    Top = 24
    Width = 265
    Height = 21
    Ctl3D = True
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    TabOrder = 1
    EditLabel.Left = 30
    EditLabel.Top = 28
    EditLabel.Width = 87
    EditLabel.Height = 13
    EditLabel.Alignment = taRightJustify
    EditLabel.Caption = 'Nome da unidade:'
    EditLabel.FocusControl = dbeDescricaoUnidade
    Button.Left = 386
    Button.Top = 23
    Button.Width = 0
    Button.Height = 0
    Button.Cursor = crArrow
    Button.Hint = 'Pesquisa <F2>'
    Button.Caption = '...'
    Button.Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000120B0000120B00000000000000000000FFFFFF4F6B82
      3E5E84FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF8282827A7A7AFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF489DDD
      1A7FEA41638AFFFFFFFFFFFFFFFFFF0D8FC90D8FC90D8FC90D8FC90D8FC90D8F
      C90D8FC9FFFFFFFFFFFFFFFFFFA4A4A48E8E8E7E7E7EFFFFFFFFFFFFFFFFFF78
      7878787878787878787878787878787878787878FFFFFFFFFFFFFFFFFFFFFFFF
      37A9FF1C7BE34C6387FFFFFF0D8FC96DDAFC76D3F75DC7EF42BAE72FB1E328AB
      E226A9E00D8FC9FFFFFFFFFFFFFFFFFFA8A8A88D8D8D828282FFFFFF787878C2
      C2C2C4C4C4B5B5B5A5A5A5999999949494929292787878FFFFFFFFFFFFFFFFFF
      FFFFFF38A7FF1F79D54D627F3B8EB09FB6BBABB7BD86BAD055C4EB3ABBEA30B1
      E32BADE20D8FC9FFFFFFFFFFFFFFFFFFFFFFFFA8A8A88A8A8A7F7F7F8B8B8BBE
      BEBEC4C4C4BCBCBCB0B0B0A1A1A1999999969696787878FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF57B0F4A18C81D9C7A1FFFACBFFFBCBEBD8C08FAFBF45C5F03BBD
      EB35B6E90D8FC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB4B4B4A7A7A7CBCBCBEB
      EBEBEBEBEBDFDFDFB9B9B9AAAAAAA2A2A29E9E9E787878FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF7491A6EFC997FFF2B6FFFFD1FFFFE0FFFFFFE1D4CE779FAB48C9
      F242C2EE0D8FC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA3A3A3CFCFCFE2E2E2ED
      EDEDF3F3F3FFFFFFE0E0E0A6A6A6ACACACA7A7A7787878FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFC99787F6CA8BF6D097FFFFD3FFFFEAFFFFF4F8F6D1C5AF9C58CF
      F251CFF40D8FC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B9B9CDCDCDD2D2D2EE
      EEEEF7F7F7FBFBFBEBEBEBC1C1C1B4B4B4B1B1B1787878FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFCA9A8CFACF8FEDB475FBEFBCFFFFD9FFFFD8FBFACCC7B29F63D7
      F65ED9FA0D8FC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCBCBCD0D0D0BFBFBFE3
      E3E3F0F0F0F0F0F0EAEAEAC3C3C3BABABABABABA787878FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF7A8890EADAB4FBE3BDEFC086F4D49DFFF6BDF3E2B58FB0B467E1
      FE6CE2FE0D8FC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9CD9D9D9E4E4E4C8
      C8C8D4D4D4E5E5E5DDDDDDB4B4B4BFBFBFC2C2C2787878FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFAC9292F0E1D1FBD99CF7CA89F2CE9AAFB2B06FE0FA69E3
      FE72E7FF0D8FC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3B3B3E8E8E8D6
      D6D6CCCCCCD2D2D2C1C1C1C2C2C2C0C0C0C5C5C5787878FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF4B88A0BCC1B5D1C7BBC1C5CBA3E7FE74E5FF69E2
      FE72E7FF0D8FC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D8D8DCA
      CACAD3D3D3D3D3D3DADADAC6C6C6C0C0C0C5C5C5787878FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF0D8FC99FF6FFD3F8FFD0F7FFADEFFF78E6FF6DE5
      FF74E9FF0D8FC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF787878D9
      D9D9EEEEEEEDEDEDDFDFDFC8C8C8C3C3C3C6C6C6787878FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF0D8FC99DEFFFADE3F69ADAF27BD5F258D0F258D4
      F46DE3FB0D8FC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF787878D8
      D8D8DBDBDBD2D2D2C4C4C4B4B4B4B5B5B5C1C1C1787878FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF0D8FC955C0E65DBFE362C4E65EC4E752C1E63EBA
      E23ABBE30D8FC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF787878AE
      AEAEB1B1B1B4B4B4B3B3B3ACACACA0A0A09F9F9F787878FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF0D8FC978CEEAA7EEFC99EFFF89EEFF7DEBFF75E9
      FF57D3EF0D8FC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF787878C0
      C0C0DBDBDBD6D6D6CFCFCFCACACAC6C6C6B2B2B2787878FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D8FC90D8FC90D8FC90D8FC90D8FC90D8F
      C90D8FC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF78
      7878787878787878787878787878787878787878FFFFFFFFFFFF}
    Button.NumGlyphs = 2
    Button.ParentShowHint = False
    Button.ShowHint = True
    Button.Visible = False
    Button.AutoSize = True
    ReadOnlyChangesColor = False
  end
  inherited pnlActions: TPanel
    Top = 81
    Width = 450
    ExplicitTop = 81
    ExplicitWidth = 450
  end
  inherited mmCadastro: TMainMenu
    Left = 160
    Top = 9
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 352
    Top = 9
  end
  inherited alNavigateActions: TActionList
    Left = 224
    Top = 8
  end
  object sqldPadrao: TPLSQLDataSet
    CommandText = 
      'select UN.CODUNIDADES, '#13#10'       UN.DESCRICAO'#13#10'from UNIDADES UN'#13#10 +
      'where UN.CODUNIDADES = :CODUNIDADES'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODUNIDADES'
        ParamType = ptInput
      end>
    SQLConnection = Dm.Connection
    Left = 256
    Top = 8
    object sqldPadraoCODUNIDADES: TIntegerField
      FieldName = 'CODUNIDADES'
      Required = True
    end
    object sqldPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
  object dspPadrao: TPLDataSetProvider
    DataSet = sqldPadrao
    Left = 288
    Top = 8
  end
  object cdsPadrao: TPLClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODUNIDADES'
        ParamType = ptInput
      end>
    ProviderName = 'dspPadrao'
    GeneratorOption.Generator = 'GENIDUNIDADES'
    GeneratorOption.FieldName = 'CODUNIDADES'
    Left = 320
    Top = 8
    object cdsPadraoCODUNIDADES: TIntegerField
      FieldName = 'CODUNIDADES'
      Required = True
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
end
