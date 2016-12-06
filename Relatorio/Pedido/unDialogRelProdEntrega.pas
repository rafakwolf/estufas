unit unDialogRelProdEntrega;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogRelPadrao, Buttons, ExtCtrls, FMTBcd, DB, DBClient,
  PLClientDataSet, Provider, PLDataSetProvider, SqlExpr, PLSQLDataSet,
  ComCtrls, PLDBEditDateTimePicker;

type
  TfrmDialogRelProdEntrega = class(TfrmRelDialogPadrao)
    sqldSelecao: TPLSQLDataSet;
    dspSelecao: TPLDataSetProvider;
    cdsSelecao: TPLClientDataSet;
    dsSelecao: TDataSource;
    sqldSelecaoDATAPEDIDO: TDateField;
    cdsSelecaoDATAPEDIDO: TDateField;
    dtpDataPedido: TPLDBEditDateTimePicker;
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmDialogRelProdEntrega: TfrmDialogRelProdEntrega;

implementation

uses dmDados, unRelProdEntrega;

{$R *.dfm}

procedure TfrmDialogRelProdEntrega.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  TfrmRelProdEntrega.ShowReport(cdsSelecaoDATAPEDIDO.AsDateTime);
end;

procedure TfrmDialogRelProdEntrega.FormCreate(Sender: TObject);
begin
  inherited;
  cdsSelecao.Open;
  cdsSelecao.Edit;
  cdsSelecaoDATAPEDIDO.AsDateTime := Date;
end;

end.
