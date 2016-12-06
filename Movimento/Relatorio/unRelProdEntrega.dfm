inherited frmRelProdEntrega: TfrmRelProdEntrega
  Left = 328
  Top = 196
  Caption = 'Produtos para Entrega'
  ClientHeight = 300
  ClientWidth = 486
  ExplicitWidth = 502
  ExplicitHeight = 338
  PixelsPerInch = 96
  TextHeight = 13
  object dtpDataPedido: TPLDBEditDateTimePicker [0]
    Left = 48
    Top = 32
    Width = 265
    Height = 21
    Date = 40328.841946319440000000
    Time = 40328.841946319440000000
    TabOrder = 1
    DataField = 'DATAPEDIDO'
    DataSource = dsSelecao
    ReadOnly = False
    DefaultEditMask = '!99/99/9999;1;_'
    AutoApplyEditMask = True
    EditLabel.Left = 19
    EditLabel.Top = 36
    EditLabel.Width = 26
    EditLabel.Height = 13
    EditLabel.Alignment = taRightJustify
    EditLabel.Caption = 'Data:'
    EditLabel.FocusControl = dtpDataPedido
    Required = False
  end
  inherited pnlBotoes: TPanel
    Top = 246
    Width = 486
    ExplicitTop = 246
    ExplicitWidth = 486
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 192
    Top = 144
  end
  object sqldPadrao: TPLSQLDataSet
    CommandText = 
      'select'#13#10'  ip.CODPRODUTO,'#13#10'  prod.NOME as PRODUTO,'#13#10'  sum(ip.QTDE' +
      ') as QUANTIDADE,'#13#10'  un.DESCRICAO as UNIDADE'#13#10'from itempedido ip'#13 +
      #10'join pedido p on (p.CODPEDIDO = ip.CODPEDIDO)'#13#10'join produto pro' +
      'd on (prod.CODPRODUTO = ip.CODPRODUTO)'#13#10'left join UNIDADES un on' +
      ' (un.CODUNIDADES = prod.CODUNIDADE)'#13#10'where'#13#10'  p.DATAPEDIDO = :DA' +
      'TAPEDIDO'#13#10'group by'#13#10'  ip.CODPRODUTO,'#13#10'  prod.NOME,'#13#10'  un.DESCRIC' +
      'AO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATAPEDIDO'
        ParamType = ptInput
      end>
    Left = 96
    Top = 144
    object sqldPadraoCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object sqldPadraoPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 80
    end
    object sqldPadraoQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Precision = 15
      Size = 2
    end
    object sqldPadraoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 80
    end
  end
  object dspPadrao: TPLDataSetProvider
    DataSet = sqldPadrao
    Left = 128
    Top = 144
  end
  object cdsPadrao: TPLClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'DATAPEDIDO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPadrao'
    Left = 160
    Top = 144
    object cdsPadraoCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object cdsPadraoPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 80
    end
    object cdsPadraoQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Precision = 15
      Size = 2
    end
    object cdsPadraoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 80
    end
  end
  object sqldSelecao: TPLSQLDataSet
    CommandText = 'select '#13#10'  cast(null as DATE) DATAPEDIDO'#13#10'from RDB$DATABASE'
    MaxBlobSize = -1
    Params = <>
    Left = 120
    Top = 80
    object sqldSelecaoDATAPEDIDO: TDateField
      FieldName = 'DATAPEDIDO'
    end
  end
  object dspSelecao: TPLDataSetProvider
    DataSet = sqldSelecao
    Left = 152
    Top = 80
  end
  object cdsSelecao: TPLClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelecao'
    Left = 184
    Top = 80
    object cdsSelecaoDATAPEDIDO: TDateField
      FieldName = 'DATAPEDIDO'
      DisplayFormat = 'dddddd'
    end
  end
  object dsSelecao: TDataSource
    DataSet = cdsSelecao
    Left = 216
    Top = 80
  end
end
