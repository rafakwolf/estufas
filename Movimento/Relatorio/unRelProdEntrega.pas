unit unRelProdEntrega;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unRelPadraoPortrait, DB,
  StdCtrls, Buttons, ExtCtrls, FMTBcd, DBClient,
  PLClientDataSet, Provider, PLDataSetProvider, SqlExpr, PLSQLDataSet,
  ComCtrls, PLDBEditDateTimePicker;

type
  TfrmRelProdEntrega = class(TfrmRelPadraoPortrait)
    sqldPadrao: TPLSQLDataSet;
    sqldPadraoCODPRODUTO: TIntegerField;
    sqldPadraoPRODUTO: TStringField;
    sqldPadraoQUANTIDADE: TFMTBCDField;
    sqldPadraoUNIDADE: TStringField;
    dspPadrao: TPLDataSetProvider;
    cdsPadrao: TPLClientDataSet;
    cdsPadraoCODPRODUTO: TIntegerField;
    cdsPadraoPRODUTO: TStringField;
    cdsPadraoQUANTIDADE: TFMTBCDField;
    cdsPadraoUNIDADE: TStringField;
    dtpDataPedido: TPLDBEditDateTimePicker;
    sqldSelecao: TPLSQLDataSet;
    sqldSelecaoDATAPEDIDO: TDateField;
    dspSelecao: TPLDataSetProvider;
    cdsSelecao: TPLClientDataSet;
    cdsSelecaoDATAPEDIDO: TDateField;
    dsSelecao: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
  private
    procedure FiltraRelatorio;
  public
  end;

var
  frmRelProdEntrega: TfrmRelProdEntrega;

implementation

{$R *.dfm}

procedure TfrmRelProdEntrega.FiltraRelatorio;
begin
  cdsPadrao.Close;
  cdsPadrao.Params.ParamByName('DATAPEDIDO').AsDate := cdsSelecaoDATAPEDIDO.AsDateTime;
  cdsPadrao.Open;

end;

procedure TfrmRelProdEntrega.FormCreate(Sender: TObject);
begin
  inherited;
  cdsSelecao.Open;
  cdsSelecao.Edit;
  cdsSelecaoDATAPEDIDO.AsDateTime := Date;
end;

procedure TfrmRelProdEntrega.btnImprimirClick(Sender: TObject);
begin
  FiltraRelatorio;
  inherited;
end;

procedure TfrmRelProdEntrega.btnVisualizarClick(Sender: TObject);
begin
  FiltraRelatorio;
  inherited;
end;

end.
