inherited frmRelEstufa: TfrmRelEstufa
  Caption = 'frmRelEstufa'
  ClientHeight = 306
  ClientWidth = 501
  ExplicitWidth = 517
  ExplicitHeight = 344
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Top = 252
    Width = 501
    ExplicitTop = 252
    ExplicitWidth = 501
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 248
    Top = 104
  end
  object sqldPadrao: TPLSQLDataSet
    CommandText = 
      'select E.CODESTUFAS, '#13#10'       E.NOME, '#13#10'       E.DATA, '#13#10'       ' +
      'E.TOTALPRODUCAO, '#13#10'       E.OBSERVACAO, '#13#10'       E.LARGURA, '#13#10'  ' +
      '     E.COMPRIMENTO'#13#10'from ESTUFAS E'
    MaxBlobSize = -1
    Params = <>
    Left = 152
    Top = 104
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
    Left = 184
    Top = 104
  end
  object cdsPadrao: TPLClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 216
    Top = 104
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
