unit unRelPedido2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unRelPadraoPortrait, DB, StdCtrls, Buttons, ExtCtrls, FMTBcd, DBClient,
  PLClientDataSet, Provider, PLDataSetProvider, SqlExpr, PLSQLDataSet;

type
  TfrmRelPedido2 = class(TfrmRelPadraoPortrait)
    sqldPedido: TPLSQLDataSet;
    dspPedido: TPLDataSetProvider;
    cdsPedido: TPLClientDataSet;
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
    sqldItens: TPLSQLDataSet;
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
    dspItens: TPLDataSetProvider;
    cdsItens: TPLClientDataSet;
    cdsItensCODITEMPEDIDO: TIntegerField;
    cdsItensCODPEDIDO: TIntegerField;
    cdsItensCODPRODUTO: TIntegerField;
    cdsItensVALOR: TFMTBCDField;
    cdsItensDESCONTO: TFMTBCDField;
    cdsItensQTDE: TFMTBCDField;
    cdsItensPRODUTO: TStringField;
    cdsItensVALORUNITARIO: TFMTBCDField;
    cdsItensUNIDADE: TStringField;
    cdsItensSUBTOTAL: TFMTBCDField;
    dsItens: TDataSource;
  private
  public
  end;

var
  frmRelPedido2: TfrmRelPedido2;

implementation



{$R *.dfm}

end.
