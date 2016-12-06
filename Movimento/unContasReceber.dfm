inherited frmContasReceber: TfrmContasReceber
  Caption = 'frmContasReceber'
  ExplicitWidth = 756
  ExplicitHeight = 428
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    inherited btnNovo: TBitBtn
      OnClick = btnNovoClick
    end
    inherited btnAlterar: TBitBtn
      OnClick = btnAlterarClick
    end
    inherited btnPesquisar: TBitBtn
      OnClick = btnPesquisarClick
    end
  end
  inherited pnlFiltros: TPanel
    inherited rgFiltro: TRadioGroup
      Width = 402
      Caption = 'Exibir contas'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Contas Recebidas'
        'Contas a Receber'
        'Todas')
      OnClick = rgFiltroClick
      ExplicitWidth = 402
    end
  end
  inherited sqldSelecao: TPLSQLDataSet
    Left = 56
    Top = 152
  end
  inherited cdsSelecao: TPLClientDataSet
    Left = 232
    Top = 144
    inherited cdsSelecaoDATAINI: TDateField
      OnChange = cdsSelecaoDATAINIChange
    end
    inherited cdsSelecaoDATAFIM: TDateField
      OnChange = cdsSelecaoDATAINIChange
    end
  end
  inherited dsSelecao: TDataSource
    Left = 304
    Top = 144
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 320
    Top = 208
  end
  object sqldPadrao: TPLSQLDataSet
    CommandText = 
      'select CR.CODCONTASRECEBER, '#13#10'       CR.CODCLIENTE, '#13#10'       CR.' +
      'DATA, '#13#10'       CR.VENCIMENTO, '#13#10'       CR.HISTORICO, '#13#10'       CR' +
      '.DOCUMENTO, '#13#10'       CR.VALOR, '#13#10'       CR.SELECIONAR, '#13#10'       ' +
      'CR.JURO, '#13#10'       CR.DESCTO, '#13#10'       CR.RECDA, '#13#10'       CR.DATA' +
      'RECDA, '#13#10'       CR.ORIGEM, '#13#10'       CR.CODPLANOCONTAS, '#13#10'       ' +
      'CR.CODORIGEM, '#13#10'       CR.VALORRECDO,'#13#10'       c.RAZAOSOCIAL as C' +
      'LIENTE,'#13#10'       pc.DESCRICAO as PLANOCONTAS'#13#10'from CONTASRECEBER ' +
      'CR'#13#10'left join CLIENTE c on (c.CODCLIENTE = cr.CODCLIENTE)'#13#10'left ' +
      'join PLANOCONTAS pc on (pc.CODPLANOCONTAS = cr.CODPLANOCONTAS)'#13#10 +
      'where cr.DATA between :DATAINI and :DATAFIM'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    Left = 104
    Top = 208
    object sqldPadraoCODCONTASRECEBER: TIntegerField
      FieldName = 'CODCONTASRECEBER'
      Required = True
    end
    object sqldPadraoCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object sqldPadraoDATA: TDateField
      FieldName = 'DATA'
    end
    object sqldPadraoVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object sqldPadraoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 80
    end
    object sqldPadraoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 25
    end
    object sqldPadraoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
    object sqldPadraoSELECIONAR: TStringField
      FieldName = 'SELECIONAR'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoJURO: TFMTBCDField
      FieldName = 'JURO'
      Precision = 15
      Size = 2
    end
    object sqldPadraoDESCTO: TFMTBCDField
      FieldName = 'DESCTO'
      Precision = 15
      Size = 2
    end
    object sqldPadraoRECDA: TStringField
      FieldName = 'RECDA'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoDATARECDA: TDateField
      FieldName = 'DATARECDA'
    end
    object sqldPadraoORIGEM: TIntegerField
      FieldName = 'ORIGEM'
    end
    object sqldPadraoCODPLANOCONTAS: TIntegerField
      FieldName = 'CODPLANOCONTAS'
    end
    object sqldPadraoCODORIGEM: TIntegerField
      FieldName = 'CODORIGEM'
    end
    object sqldPadraoVALORRECDO: TFMTBCDField
      FieldName = 'VALORRECDO'
      Precision = 15
      Size = 2
    end
    object sqldPadraoCLIENTE: TStringField
      FieldName = 'CLIENTE'
      ProviderFlags = []
      Size = 80
    end
    object sqldPadraoPLANOCONTAS: TStringField
      FieldName = 'PLANOCONTAS'
      ProviderFlags = []
      Size = 80
    end
  end
  object dspPadrao: TPLDataSetProvider
    DataSet = sqldPadrao
    Left = 200
    Top = 216
  end
  object cdsPadrao: TPLClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    ProviderName = 'dspPadrao'
    Left = 256
    Top = 208
    object cdsPadraoCODCONTASRECEBER: TIntegerField
      FieldName = 'CODCONTASRECEBER'
      Required = True
    end
    object cdsPadraoCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object cdsPadraoDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsPadraoVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object cdsPadraoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 80
    end
    object cdsPadraoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 25
    end
    object cdsPadraoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
    object cdsPadraoSELECIONAR: TStringField
      FieldName = 'SELECIONAR'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoJURO: TFMTBCDField
      FieldName = 'JURO'
      Precision = 15
      Size = 2
    end
    object cdsPadraoDESCTO: TFMTBCDField
      FieldName = 'DESCTO'
      Precision = 15
      Size = 2
    end
    object cdsPadraoRECDA: TStringField
      FieldName = 'RECDA'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoDATARECDA: TDateField
      FieldName = 'DATARECDA'
    end
    object cdsPadraoORIGEM: TIntegerField
      FieldName = 'ORIGEM'
    end
    object cdsPadraoCODPLANOCONTAS: TIntegerField
      FieldName = 'CODPLANOCONTAS'
    end
    object cdsPadraoCODORIGEM: TIntegerField
      FieldName = 'CODORIGEM'
    end
    object cdsPadraoVALORRECDO: TFMTBCDField
      FieldName = 'VALORRECDO'
      Precision = 15
      Size = 2
    end
    object cdsPadraoCLIENTE: TStringField
      FieldName = 'CLIENTE'
      ProviderFlags = []
      Size = 80
    end
    object cdsPadraoPLANOCONTAS: TStringField
      FieldName = 'PLANOCONTAS'
      ProviderFlags = []
      Size = 80
    end
  end
end
