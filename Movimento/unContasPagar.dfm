inherited frmContasPagar: TfrmContasPagar
  Caption = 'frmContasPagar'
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
        'Contas Pagas'
        'Contas a Pagar'
        'Todas')
      OnClick = rgFiltroClick
      ExplicitWidth = 402
    end
  end
  inherited sqldSelecao: TPLSQLDataSet
    Left = 392
    Top = 96
  end
  inherited dspSelecao: TPLDataSetProvider
    Left = 512
    Top = 88
  end
  inherited cdsSelecao: TPLClientDataSet
    Left = 592
    Top = 136
    inherited cdsSelecaoDATAINI: TDateField
      OnChange = cdsSelecaoDATAINIChange
    end
    inherited cdsSelecaoDATAFIM: TDateField
      OnChange = cdsSelecaoDATAINIChange
    end
  end
  inherited dsSelecao: TDataSource
    Left = 640
    Top = 96
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 680
    Top = 168
  end
  object sqldPadrao: TPLSQLDataSet
    CommandText = 
      'select CP.CODCONTASPAGAR, '#13#10'       CP.CODFORNECEDOR, '#13#10'       CP' +
      '.DATA, '#13#10'       CP.VENCIMENTO, '#13#10'       CP.DESCRICAO, '#13#10'       C' +
      'P.DOCUMENTO, '#13#10'       CP.VALOR, '#13#10'       CP.SELECIONAR, '#13#10'      ' +
      ' CP.JURO, '#13#10'       CP.DESCTO, '#13#10'       CP.PAGA, '#13#10'       CP.DATA' +
      'PAGTO, '#13#10'       CP.ORIGEM, '#13#10'       CP.CODPLANOCONTAS, '#13#10'       ' +
      'CP.CODORIGEM,'#13#10'       CP.VALORPAGO,'#13#10'       f.RAZAOSOCIAL as FOR' +
      'NECEDOR,'#13#10'       pc.DESCRICAO as PLANCCONTAS'#13#10'from CONTASPAGAR C' +
      'P'#13#10'left join FORNECEDOR f on (f.CODFORNECEDOR = cp.CODFORNECEDOR' +
      ')'#13#10'left join PLANOCONTAS pc on (pc.CODPLANOCONTAS = cp.CODPLANOC' +
      'ONTAS)'#13#10'where CP.DATA between :DATAINI and :DATAFIM'
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
    Left = 408
    Top = 184
    object sqldPadraoCODCONTASPAGAR: TIntegerField
      FieldName = 'CODCONTASPAGAR'
      Required = True
    end
    object sqldPadraoCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
    end
    object sqldPadraoDATA: TDateField
      FieldName = 'DATA'
    end
    object sqldPadraoVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object sqldPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
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
    object sqldPadraoPAGA: TStringField
      FieldName = 'PAGA'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoDATAPAGTO: TDateField
      FieldName = 'DATAPAGTO'
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
    object sqldPadraoVALORPAGO: TFMTBCDField
      FieldName = 'VALORPAGO'
      Precision = 15
      Size = 2
    end
    object sqldPadraoFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      ProviderFlags = []
      Size = 80
    end
    object sqldPadraoPLANCCONTAS: TStringField
      FieldName = 'PLANCCONTAS'
      ProviderFlags = []
      Size = 80
    end
  end
  object dspPadrao: TPLDataSetProvider
    DataSet = sqldPadrao
    Left = 520
    Top = 144
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
    Left = 576
    Top = 216
    object cdsPadraoCODCONTASPAGAR: TIntegerField
      FieldName = 'CODCONTASPAGAR'
      Required = True
    end
    object cdsPadraoCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
    end
    object cdsPadraoDATA: TDateField
      FieldName = 'DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object cdsPadraoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 25
    end
    object cdsPadraoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
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
      DisplayFormat = '#,##0.00'
      Precision = 15
      Size = 2
    end
    object cdsPadraoDESCTO: TFMTBCDField
      FieldName = 'DESCTO'
      DisplayFormat = '#,##0.00'
      Precision = 15
      Size = 2
    end
    object cdsPadraoPAGA: TStringField
      FieldName = 'PAGA'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoDATAPAGTO: TDateField
      FieldName = 'DATAPAGTO'
      DisplayFormat = 'dd/mm/yyyy'
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
    object cdsPadraoVALORPAGO: TFMTBCDField
      FieldName = 'VALORPAGO'
      DisplayFormat = '#,##0.00'
      Precision = 15
      Size = 2
    end
    object cdsPadraoFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      ProviderFlags = []
      Size = 80
    end
    object cdsPadraoPLANCCONTAS: TStringField
      FieldName = 'PLANCCONTAS'
      ProviderFlags = []
      Size = 80
    end
  end
end
