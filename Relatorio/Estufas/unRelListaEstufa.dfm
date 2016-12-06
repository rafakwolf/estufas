inherited frmRelListaEstufa: TfrmRelListaEstufa
  Caption = 'frmRelListaEstufa'
  ClientHeight = 295
  OldCreateOrder = True
  ExplicitHeight = 333
  PixelsPerInch = 96
  TextHeight = 13
  object rlrptPadrao: TRLReport [0]
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object rlbndRodape: TRLBand
      Left = 38
      Top = 72
      Width = 718
      Height = 24
    end
    object rlbndTituloColuna: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 18
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object rlblbNome: TRLLabel
        Left = 5
        Top = 1
        Width = 40
        Height = 16
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlblbData: TRLLabel
        Left = 304
        Top = 1
        Width = 40
        Height = 16
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlblbLargura: TRLLabel
        Left = 440
        Top = 0
        Width = 64
        Height = 16
        Caption = 'Largura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlblbComprim: TRLLabel
        Left = 592
        Top = 0
        Width = 96
        Height = 16
        Caption = 'Comprimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rlbndDetalhe: TRLBand
      Left = 38
      Top = 56
      Width = 718
      Height = 16
      object rldbtNome: TRLDBText
        Left = 5
        Top = 1
        Width = 35
        Height = 14
        DataField = 'NOME'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbtData: TRLDBText
        Left = 304
        Top = 1
        Width = 35
        Height = 14
        DataField = 'DATA'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbtLarg: TRLDBText
        Left = 440
        Top = 1
        Width = 56
        Height = 14
        DataField = 'LARGURA'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbtComp: TRLDBText
        Left = 592
        Top = 1
        Width = 84
        Height = 14
        DataField = 'COMPRIMENTO'
        DataSource = dsPadrao
        Text = ''
      end
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 144
    Top = 232
  end
  object sqldPadrao: TPLSQLDataSet
    CommandText = 
      'select E.CODESTUFAS, '#13#10'       E.NOME, '#13#10'       E.DATA, '#13#10'       ' +
      'E.TOTALPRODUCAO, '#13#10'       E.OBSERVACAO, '#13#10'       E.LARGURA, '#13#10'  ' +
      '     E.COMPRIMENTO'#13#10'from ESTUFAS E'
    MaxBlobSize = -1
    Params = <>
    Left = 48
    Top = 232
    object sqldPadraoCODESTUFAS: TIntegerField
      FieldName = 'CODESTUFAS'
      Required = True
    end
    object sqldPadraoNOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object sqldPadraoDATA: TDateField
      FieldName = 'DATA'
    end
    object sqldPadraoTOTALPRODUCAO: TFMTBCDField
      FieldName = 'TOTALPRODUCAO'
      Precision = 15
      Size = 2
    end
    object sqldPadraoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 255
    end
    object sqldPadraoLARGURA: TFMTBCDField
      FieldName = 'LARGURA'
      Precision = 15
      Size = 2
    end
    object sqldPadraoCOMPRIMENTO: TFMTBCDField
      FieldName = 'COMPRIMENTO'
      Precision = 15
      Size = 2
    end
  end
  object dspPadrao: TPLDataSetProvider
    DataSet = sqldPadrao
    Left = 80
    Top = 232
  end
  object cdsPadrao: TPLClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 112
    Top = 232
    object cdsPadraoCODESTUFAS: TIntegerField
      FieldName = 'CODESTUFAS'
      Required = True
    end
    object cdsPadraoNOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object cdsPadraoDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsPadraoTOTALPRODUCAO: TFMTBCDField
      FieldName = 'TOTALPRODUCAO'
      Precision = 15
      Size = 2
    end
    object cdsPadraoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 255
    end
    object cdsPadraoLARGURA: TFMTBCDField
      FieldName = 'LARGURA'
      Precision = 15
      Size = 2
    end
    object cdsPadraoCOMPRIMENTO: TFMTBCDField
      FieldName = 'COMPRIMENTO'
      Precision = 15
      Size = 2
    end
  end
end
