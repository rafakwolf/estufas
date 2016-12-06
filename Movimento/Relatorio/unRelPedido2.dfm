inherited frmRelPedido2: TfrmRelPedido2
  Left = 242
  Top = 161
  Caption = 'frmRelPedido2'
  ClientHeight = 200
  ClientWidth = 349
  ExplicitWidth = 365
  ExplicitHeight = 238
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Top = 146
    Width = 349
    ExplicitTop = 146
    ExplicitWidth = 349
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPedido
    Left = 128
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
    Left = 32
    Top = 24
  end
  object dspPedido: TPLDataSetProvider
    DataSet = sqldPedido
    Left = 64
    Top = 24
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
    Left = 96
    Top = 24
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
    Left = 32
    Top = 56
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
    Left = 64
    Top = 56
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
    Left = 96
    Top = 56
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
    Left = 128
    Top = 56
  end
end
