inherited frmDialogRelProdEntrega: TfrmDialogRelProdEntrega
  Top = 184
  Width = 267
  Height = 159
  Caption = 'Relat'#243'rio de Entrega'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Top = 67
    Width = 251
    inherited btnVisualizar: TSpeedButton
      OnClick = btnVisualizarClick
    end
  end
  object dtpDataPedido: TPLDBEditDateTimePicker
    Left = 40
    Top = 24
    Width = 186
    Height = 21
    Date = 40328.841946319440000000
    Time = 40328.841946319440000000
    TabOrder = 1
    DataField = 'DATAPEDIDO'
    DataSource = dsSelecao
    ReadOnly = False
    DefaultEditMask = '!99/99/9999;1;_'
    AutoApplyEditMask = True
    EditLabel.Left = 11
    EditLabel.Top = 28
    EditLabel.Width = 26
    EditLabel.Height = 13
    EditLabel.Alignment = taRightJustify
    EditLabel.Caption = 'Data:'
    EditLabel.FocusControl = dtpDataPedido
    Required = False
  end
  object sqldSelecao: TPLSQLDataSet
    CommandText = 'select '#13#10'  cast(null as DATE) DATAPEDIDO'#13#10'from RDB$DATABASE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.Connection
    Left = 64
    Top = 32
    object sqldSelecaoDATAPEDIDO: TDateField
      FieldName = 'DATAPEDIDO'
    end
  end
  object dspSelecao: TPLDataSetProvider
    DataSet = sqldSelecao
    Left = 96
    Top = 32
  end
  object cdsSelecao: TPLClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelecao'
    Left = 128
    Top = 32
    object cdsSelecaoDATAPEDIDO: TDateField
      FieldName = 'DATAPEDIDO'
    end
  end
  object dsSelecao: TDataSource
    DataSet = cdsSelecao
    Left = 160
    Top = 32
  end
end
