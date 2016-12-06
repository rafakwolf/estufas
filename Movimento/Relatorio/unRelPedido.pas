unit unRelPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unRelatorios, DB, RLReport, FMTBcd, DBClient, PLClientDataSet,
  Provider, PLDataSetProvider, SqlExpr, PLSQLDataSet, RLPreviewForm,
  RLPrintDialog;

type
  TfrmRelPedido = class(TfrmRelatorios)
    sqldPedido: TPLSQLDataSet;
    dspPedido: TPLDataSetProvider;
    cdsPedido: TPLClientDataSet;
    sqldItens: TPLSQLDataSet;
    dspItens: TPLDataSetProvider;
    cdsItens: TPLClientDataSet;
    dsItens: TDataSource;
    rlbndColunas: TRLBand;
    rlbndDados: TRLBand;
    rlblbDataPedido: TRLLabel;
    rlblbCliente: TRLLabel;
    rlblbEndereco: TRLLabel;
    rlblbBairro: TRLLabel;
    rlblbNumero: TRLLabel;
    rldbtDatapedido: TRLDBText;
    rldbtCliente: TRLDBText;
    rldbtEndereco: TRLDBText;
    rldbtBairro: TRLDBText;
    rldbtNumero: TRLDBText;
    rldrwLinhaColunas: TRLDraw;
    rlblbProdutoNome: TRLLabel;
    rlblbQtde: TRLLabel;
    rlblbUnidade: TRLLabel;
    rlblbValorUnidade: TRLLabel;
    rlblbCidade: TRLLabel;
    rldbtCidade: TRLDBText;
    rlsbProdutos: TRLSubDetail;
    rldbtValorunidade: TRLDBText;
    rldbtUnidade: TRLDBText;
    rldbtQtde: TRLDBText;
    rldbtProduto: TRLDBText;
    cdsPedidoCODPEDIDO: TIntegerField;
    cdsPedidoCODCLIENTE: TIntegerField;
    cdsPedidoDATAPEDIDO: TDateField;
    cdsPedidoITENS: TIntegerField;
    cdsPedidoTOTALDESCONTO: TFMTBCDField;
    cdsPedidoTOTAL: TFMTBCDField;
    cdsPedidoCLIENTE: TStringField;
    cdsPedidoCNPJ: TStringField;
    cdsPedidoTELEFONE: TStringField;
    cdsPedidoENDERECO: TStringField;
    cdsPedidoBAIRRO: TStringField;
    cdsPedidoCIDADE: TStringField;
    cdsPedidoNUMERO: TIntegerField;
    cdsPedidoCEP: TStringField;
    cdsItensCODITEMPEDIDO: TIntegerField;
    cdsItensCODPEDIDO: TIntegerField;
    cdsItensCODPRODUTO: TIntegerField;
    cdsItensVALOR: TFMTBCDField;
    cdsItensDESCONTO: TFMTBCDField;
    cdsItensQTDE: TFMTBCDField;
    cdsItensPRODUTO: TStringField;
    cdsItensVALORUNITARIO: TFMTBCDField;
    cdsItensUNIDADE: TStringField;
    rlblbTelefone: TRLLabel;
    rldbtTelefone: TRLDBText;
    sqldItensCODITEMPEDIDO: TIntegerField;
    sqldItensCODPEDIDO: TIntegerField;
    sqldItensCODPRODUTO: TIntegerField;
    sqldItensVALOR: TFMTBCDField;
    sqldItensDESCONTO: TFMTBCDField;
    sqldItensQTDE: TFMTBCDField;
    sqldItensPRODUTO: TStringField;
    sqldItensVALORUNITARIO: TFMTBCDField;
    sqldItensUNIDADE: TStringField;
    sqldItensSUBTOTAL: TFMTBCDField;
    cdsItensSUBTOTAL: TFMTBCDField;
    rlblbSubTotal: TRLLabel;
    rldbtSubTotal: TRLDBText;
    rlsbTrocas: TRLSubDetail;
    rlbndDadosTrocas: TRLBand;
    rldbtProdutoTroca: TRLDBText;
    rlbndTituloTroca: TRLBand;
    rlbndTotaisPedido: TRLBand;
    rlblbTotaldeTrocas: TRLLabel;
    rldrwLinhaTotalTroca: TRLDraw;
    rlblb1: TRLLabel;
    rlblb3: TRLLabel;
    rlblb4: TRLLabel;
    rlblbTotal: TRLLabel;
    rldbtTotal: TRLDBText;
    RLLabel1: TRLLabel;
    rldbtDesconto: TRLDBText;
    rlblbTotais: TRLLabel;
    rldrwLinhaTotais: TRLDraw;
    rlblbToatlGeral: TRLLabel;
    rldrw1: TRLDraw;
    procedure cdsPedidoAfterOpen(DataSet: TDataSet);
    procedure rldbtTotalMeasureHeight(Sender: TObject);
  private
  public
    class procedure ShowReport(CodPedido: Integer);
  end;

var
  frmRelPedido: TfrmRelPedido;

implementation



{$R *.dfm}

class procedure TfrmRelPedido.ShowReport(CodPedido: Integer);
begin
  frmRelPedido := TfrmRelPedido.Create(nil);
  with frmRelPedido do
  try
    dsPadrao.DataSet.Close;
    TClientDataSet(dsPadrao.DataSet).Params[0].AsInteger := CodPedido;
    dsPadrao.DataSet.Open;

    // Imprirmir aqui
  finally
    dsPadrao.DataSet.Close;
    FreeAndNil(frmRelPedido);
  end;
end;

procedure TfrmRelPedido.cdsPedidoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  cdsItens.Open;
end;

procedure TfrmRelPedido.rldbtTotalMeasureHeight(Sender: TObject);
begin
  inherited;
  rlblbTotal.Left := rldbtTotal.Left - rlblbTotal.Width - 3; 
end;

end.
