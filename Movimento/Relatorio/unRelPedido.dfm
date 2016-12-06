inherited frmRelPedido: TfrmRelPedido
  Left = 216
  Top = 130
  Caption = 'frmRelPedido'
  ClientHeight = 545
  OldCreateOrder = True
  ExplicitHeight = 583
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
    object rlbndCabecalho: TRLBand
      Left = 38
      Top = 148
      Width = 718
      Height = 16
      object rlimgLogo: TRLImage
        Left = 0
        Top = 0
        Width = 105
        Height = 105
        Stretch = True
      end
    end
    object rlbndTitulo: TRLBand
      Left = 38
      Top = 164
      Width = 718
      Height = 16
      object rlblbTitulo: TRLLabel
        Left = 0
        Top = 0
        Width = 59
        Height = 16
        Caption = 'Pedido'
      end
    end
    object rlbndRodape: TRLBand
      Left = 38
      Top = 180
      Width = 718
      Height = 16
    end
    object rlbndColunas: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 110
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object rlblbDataPedido: TRLLabel
        Left = 6
        Top = 8
        Width = 112
        Height = 14
        Caption = 'Data do Pedido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlblbCliente: TRLLabel
        Left = 6
        Top = 24
        Width = 63
        Height = 14
        Caption = 'Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlblbEndereco: TRLLabel
        Left = 6
        Top = 40
        Width = 70
        Height = 14
        Caption = 'Endere'#231'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlblbBairro: TRLLabel
        Left = 461
        Top = 56
        Width = 56
        Height = 14
        Caption = 'Bairro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlblbNumero: TRLLabel
        Left = 461
        Top = 40
        Width = 56
        Height = 14
        Caption = 'N'#250'mero:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rldbtDatapedido: TRLDBText
        Left = 120
        Top = 8
        Width = 77
        Height = 14
        DataField = 'DATAPEDIDO'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbtCliente: TRLDBText
        Left = 120
        Top = 24
        Width = 56
        Height = 14
        DataField = 'CLIENTE'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbtEndereco: TRLDBText
        Left = 120
        Top = 40
        Width = 337
        Height = 14
        AutoSize = False
        DataField = 'ENDERECO'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbtBairro: TRLDBText
        Left = 533
        Top = 56
        Width = 49
        Height = 14
        DataField = 'BAIRRO'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbtNumero: TRLDBText
        Left = 533
        Top = 40
        Width = 49
        Height = 14
        DataField = 'NUMERO'
        DataSource = dsPadrao
        Text = ''
      end
      object rldrwLinhaColunas: TRLDraw
        Left = 0
        Top = 72
        Width = 718
        Height = 16
        DrawKind = dkLine
        Pen.Style = psDot
      end
      object rlblbProdutoNome: TRLLabel
        Left = 6
        Top = 88
        Width = 56
        Height = 14
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object rlblbQtde: TRLLabel
        Left = 379
        Top = 88
        Width = 35
        Height = 14
        Caption = 'Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object rlblbUnidade: TRLLabel
        Left = 419
        Top = 88
        Width = 56
        Height = 14
        Caption = 'Unidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object rlblbValorUnidade: TRLLabel
        Left = 491
        Top = 88
        Width = 98
        Height = 14
        Caption = 'Valor Unidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object rlblbCidade: TRLLabel
        Left = 6
        Top = 56
        Width = 56
        Height = 14
        Caption = 'Cidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rldbtCidade: TRLDBText
        Left = 120
        Top = 56
        Width = 337
        Height = 14
        AutoSize = False
        DataField = 'CIDADE'
        DataSource = dsPadrao
        Text = ''
      end
      object rlblbTelefone: TRLLabel
        Left = 461
        Top = 24
        Width = 70
        Height = 14
        Caption = 'Telefone:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rldbtTelefone: TRLDBText
        Left = 533
        Top = 24
        Width = 63
        Height = 14
        DataField = 'TELEFONE'
        DataSource = dsPadrao
        Text = ''
      end
      object rlblbSubTotal: TRLLabel
        Left = 645
        Top = 88
        Width = 70
        Height = 14
        Caption = 'Sub-Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
    end
    object rlsbProdutos: TRLSubDetail
      Left = 38
      Top = 196
      Width = 718
      Height = 40
      DataSource = dsItens
      object rlbndDados: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 15
        object rldbtProduto: TRLDBText
          Left = 6
          Top = 0
          Width = 355
          Height = 14
          AutoSize = False
          DataField = 'PRODUTO'
          DataSource = dsItens
          Text = ''
        end
        object rldbtQtde: TRLDBText
          Left = 379
          Top = 0
          Width = 35
          Height = 14
          Alignment = taRightJustify
          DataField = 'QTDE'
          DataSource = dsItens
          Text = ''
        end
        object rldbtUnidade: TRLDBText
          Left = 418
          Top = 0
          Width = 56
          Height = 14
          DataField = 'UNIDADE'
          DataSource = dsItens
          Text = ''
        end
        object rldbtValorunidade: TRLDBText
          Left = 547
          Top = 0
          Width = 42
          Height = 14
          Alignment = taRightJustify
          DataField = 'VALOR'
          DataSource = dsItens
          Text = ''
        end
        object rldbtSubTotal: TRLDBText
          Left = 652
          Top = 0
          Width = 63
          Height = 14
          Alignment = taRightJustify
          DataField = 'SUBTOTAL'
          DataSource = dsItens
          Text = ''
        end
      end
    end
    object rlsbTrocas: TRLSubDetail
      Left = 38
      Top = 236
      Width = 718
      Height = 175
      DataSource = dsItens
      object rlbndDadosTrocas: TRLBand
        Left = 0
        Top = 55
        Width = 718
        Height = 23
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object rldbtProdutoTroca: TRLDBText
          Left = 6
          Top = 5
          Width = 355
          Height = 14
          AutoSize = False
          DataField = 'PRODUTO'
          DataSource = dsItens
          Text = ''
        end
      end
      object rlbndTituloTroca: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 55
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Color = clSilver
        ParentColor = False
        Transparent = False
        object rlblb1: TRLLabel
          Left = 364
          Top = 39
          Width = 35
          Height = 14
          Caption = 'Qtde'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
        end
        object rlblb3: TRLLabel
          Left = 477
          Top = 39
          Width = 98
          Height = 14
          Caption = 'Valor Unidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
        end
        object rlblb4: TRLLabel
          Left = 645
          Top = 39
          Width = 70
          Height = 14
          Caption = 'Sub-Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
        end
        object rlblbTotal: TRLLabel
          Left = 469
          Top = 3
          Width = 119
          Height = 14
          Caption = 'Total do pedido:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rldbtTotal: TRLDBText
          Left = 671
          Top = 3
          Width = 42
          Height = 14
          Alignment = taRightJustify
          DataField = 'TOTAL'
          DataSource = dsPadrao
          Text = ''
          OnMeasureHeight = rldbtTotalMeasureHeight
        end
        object RLLabel1: TRLLabel
          Left = 6
          Top = 39
          Width = 56
          Height = 14
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
        end
        object rldbtDesconto: TRLDBText
          Left = 615
          Top = 18
          Width = 98
          Height = 14
          Alignment = taRightJustify
          DataField = 'TOTALDESCONTO'
          DataSource = dsPadrao
          Text = ''
        end
        object rlblbTotais: TRLLabel
          Left = 448
          Top = 18
          Width = 140
          Height = 14
          Caption = 'Total de descontos:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rldrwLinhaTotais: TRLDraw
          Left = 0
          Top = 33
          Width = 718
          Height = 6
          DrawKind = dkLine
          Pen.Style = psDot
          Pen.Width = 2
          Transparent = False
        end
      end
      object rlbndTotaisPedido: TRLBand
        Left = 0
        Top = 78
        Width = 718
        Height = 73
        BandType = btSummary
        object rlblbTotaldeTrocas: TRLLabel
          Left = 488
          Top = 18
          Width = 119
          Height = 16
          Caption = 'Total de trocas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rldrwLinhaTotalTroca: TRLDraw
          Left = 610
          Top = 28
          Width = 105
          Height = 6
          DrawKind = dkLine
          Pen.Style = psDot
        end
        object rlblbToatlGeral: TRLLabel
          Left = 516
          Top = 52
          Width = 91
          Height = 16
          Caption = 'Total Geral:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rldrw1: TRLDraw
          Left = 610
          Top = 62
          Width = 105
          Height = 6
          DrawKind = dkLine
          Pen.Style = psDot
        end
      end
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPedido
  end
  object sqldPedido: TPLSQLDataSet
    CommandText = 
      'select'#13#10'  P.CODPEDIDO,'#13#10'  P.CODCLIENTE,'#13#10'  P.DATAPEDIDO,'#13#10'  P.IT' +
      'ENS,'#13#10'  P.TOTALDESCONTO,'#13#10'  P.TOTAL,'#13#10'  c.RAZAOSOCIAL as CLIENTE' +
      ','#13#10'  c.CNPJ,'#13#10'  c.TELEFONE,'#13#10'  c.ENDERECO,'#13#10'  c.BAIRRO,'#13#10'  c.CID' +
      'ADE,'#13#10'  c.NUMERO,'#13#10'  c.CEP'#13#10'from PEDIDO P'#13#10'left join CLIENTE c o' +
      'n (c.CODCLIENTE = p.CODCLIENTE)'#13#10'where P.CODPEDIDO = :CODPEDIDO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODPEDIDO'
        ParamType = ptInput
      end>
    Left = 96
    Top = 8
  end
  object dspPedido: TPLDataSetProvider
    DataSet = sqldPedido
    Left = 128
    Top = 8
  end
  object cdsPedido: TPLClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODPEDIDO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPedido'
    AfterOpen = cdsPedidoAfterOpen
    Left = 160
    Top = 8
    object cdsPedidoCODPEDIDO: TIntegerField
      FieldName = 'CODPEDIDO'
      Required = True
    end
    object cdsPedidoCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object cdsPedidoDATAPEDIDO: TDateField
      FieldName = 'DATAPEDIDO'
    end
    object cdsPedidoITENS: TIntegerField
      FieldName = 'ITENS'
    end
    object cdsPedidoTOTALDESCONTO: TFMTBCDField
      FieldName = 'TOTALDESCONTO'
      Precision = 15
      Size = 2
    end
    object cdsPedidoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
      Size = 2
    end
    object cdsPedidoCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 80
    end
    object cdsPedidoCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object cdsPedidoTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object cdsPedidoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 80
    end
    object cdsPedidoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 80
    end
    object cdsPedidoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 80
    end
    object cdsPedidoNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object cdsPedidoCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
  end
  object sqldItens: TPLSQLDataSet
    CommandText = 
      'select IP.CODITEMPEDIDO, '#13#10'       IP.CODPEDIDO, '#13#10'       IP.CODP' +
      'RODUTO, '#13#10'       IP.VALOR, '#13#10'       IP.DESCONTO, '#13#10'       IP.QTD' +
      'E,'#13#10'       p.NOME as PRODUTO,'#13#10'       p.VALORUNITARIO,'#13#10'       u' +
      'n.DESCRICAO as UNIDADE,'#13#10'       ip.subtotal'#13#10'from ITEMPEDIDO IP'#13 +
      #10'join PRODUTO p on (p.CODPRODUTO = ip.CODPRODUTO)'#13#10'left join UNI' +
      'DADES un on (un.CODUNIDADES = p.CODUNIDADE)'#13#10'where ip.CODPEDIDO ' +
      '= :CODPEDIDO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODPEDIDO'
        ParamType = ptInput
      end>
    Left = 264
    Top = 8
    object sqldItensCODITEMPEDIDO: TIntegerField
      FieldName = 'CODITEMPEDIDO'
      Required = True
    end
    object sqldItensCODPEDIDO: TIntegerField
      FieldName = 'CODPEDIDO'
    end
    object sqldItensCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object sqldItensVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
    object sqldItensDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 15
      Size = 2
    end
    object sqldItensQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Precision = 15
      Size = 2
    end
    object sqldItensPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 80
    end
    object sqldItensVALORUNITARIO: TFMTBCDField
      FieldName = 'VALORUNITARIO'
      Precision = 15
      Size = 2
    end
    object sqldItensUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 80
    end
    object sqldItensSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Precision = 15
      Size = 2
    end
  end
  object dspItens: TPLDataSetProvider
    DataSet = sqldItens
    Left = 296
    Top = 8
  end
  object cdsItens: TPLClientDataSet
    Aggregates = <>
    IndexFieldNames = 'CODPEDIDO'
    MasterFields = 'CODPEDIDO'
    MasterSource = dsPadrao
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'CODPEDIDO'
        ParamType = ptInput
      end>
    ProviderName = 'dspItens'
    Left = 328
    Top = 8
    object cdsItensCODITEMPEDIDO: TIntegerField
      FieldName = 'CODITEMPEDIDO'
      Required = True
    end
    object cdsItensCODPEDIDO: TIntegerField
      FieldName = 'CODPEDIDO'
    end
    object cdsItensCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object cdsItensVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
    object cdsItensDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 15
      Size = 2
    end
    object cdsItensQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Precision = 15
      Size = 2
    end
    object cdsItensPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 80
    end
    object cdsItensVALORUNITARIO: TFMTBCDField
      FieldName = 'VALORUNITARIO'
      Precision = 15
      Size = 2
    end
    object cdsItensUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 80
    end
    object cdsItensSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      DisplayFormat = '#,##0.00'
      Precision = 15
      Size = 2
    end
  end
  object dsItens: TDataSource
    DataSet = cdsItens
    Left = 360
    Top = 8
  end
  object rlpsConfig: TRLPreviewSetup
    Left = 16
    Top = 16
  end
end
