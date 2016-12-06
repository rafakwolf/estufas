unit unRelPedidoPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unRelPadraoPortrait, DB, StdCtrls, Buttons, ExtCtrls, FMTBcd, DBClient,
  PLClientDataSet, Provider, PLDataSetProvider, SqlExpr, PLSQLDataSet,
  Mask, DBCtrls, PLDBEdit, ComCtrls, PLDBEditDateTimePicker, DateUtils;

type
  TfrmRelPedidoPeriodo = class(TfrmRelPadraoPortrait)
    sqldPadrao: TPLSQLDataSet;
    dspPadrao: TPLDataSetProvider;
    cdsPadrao: TPLClientDataSet;
    dtpDataIni: TPLDBEditDateTimePicker;
    dtpDataFim: TPLDBEditDateTimePicker;
    dbeCliente: TPLDBEdit;
    sqldSelecao: TPLSQLDataSet;
    sqldSelecaoCODCLIENTE: TIntegerField;
    sqldSelecaoCLIENTE: TStringField;
    sqldSelecaoDATAINI: TDateField;
    sqldSelecaoDATAFIM: TDateField;
    dspSelecao: TPLDataSetProvider;
    cdsSelecao: TPLClientDataSet;
    cdsSelecaoCODCLIENTE: TIntegerField;
    cdsSelecaoCLIENTE: TStringField;
    cdsSelecaoDATAINI: TDateField;
    cdsSelecaoDATAFIM: TDateField;
    dsSelecao: TDataSource;
    sqldPadraoCODPRODUTO: TIntegerField;
    sqldPadraoPRODUTO: TStringField;
    sqldPadraoTOTALQTDE: TFMTBCDField;
    sqldPadraoUNIDADE: TStringField;
    cdsPadraoCODPRODUTO: TIntegerField;
    cdsPadraoPRODUTO: TStringField;
    cdsPadraoTOTALQTDE: TFMTBCDField;
    cdsPadraoUNIDADE: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure cdsSelecaoCODCLIENTEValidate(Sender: TField);
    procedure dbeClienteClickButton(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    procedure GetTotalPedidos;
    procedure GetCountPedidos;

    procedure FilterRelatorio;
  public
  end;

var
  frmRelPedidoPeriodo: TfrmRelPedidoPeriodo;

implementation

uses
  Funcoes, unPesquisa;

{$R *.dfm}

procedure TfrmRelPedidoPeriodo.GetCountPedidos;
begin
  with TPLSQLDataSet.Create(nil) do
  try
    SQLConnection := sqldPadrao.SQLConnection;
    CommandText :=
    'select count(1) from PEDIDO p where p.DATAPEDIDO between :DATAINI and :DATAFIM and p.CODCLIENTE = :CODCLIENTE';
    Params.ParamByName('DATAINI').AsDate := cdsSelecaoDATAINI.AsDateTime;
    Params.ParamByName('DATAFIM').AsDate := cdsSelecaoDATAFIM.AsDateTime;
    Params.ParamByName('CODCLIENTE').AsInteger := cdsSelecaoCODCLIENTE.AsInteger;
    Open;

  finally
    free;
  end;
end;

procedure TfrmRelPedidoPeriodo.GetTotalPedidos;
begin
  with TPLSQLDataSet.Create(nil) do
  try
    SQLConnection := sqldPadrao.SQLConnection;
    CommandText :=
    'select sum(p.TOTAL) from PEDIDO p where p.DATAPEDIDO between :DATAINI and :DATAFIM and p.CODCLIENTE = :CODCLIENTE';
    Params.ParamByName('DATAINI').AsDate := cdsSelecaoDATAINI.AsDateTime;
    Params.ParamByName('DATAFIM').AsDate := cdsSelecaoDATAFIM.AsDateTime;
    Params.ParamByName('CODCLIENTE').AsInteger := cdsSelecaoCODCLIENTE.AsInteger;
    Open;


  finally
    free;
  end;
end;

procedure TfrmRelPedidoPeriodo.FormCreate(Sender: TObject);
begin
  inherited;
  cdsSelecao.Open;
  cdsselecao.Edit;
  cdsSelecaoDATAINI.AsDateTime := StartOfTheMonth(date);
  cdsSelecaoDATAFIM.AsDateTime := EndOfTheMonth(Date);
end;

procedure TfrmRelPedidoPeriodo.cdsSelecaoCODCLIENTEValidate(
  Sender: TField);
var
  NomeCliente: string;
begin
  inherited;
  NomeCliente := GetFieldByID(sqldSelecao.SQLConnection, 'CLIENTE', 'RAZAOSOCIAL', 'CODCLIENTE',
    Sender.AsInteger);

  if (NomeCliente <> '') then
    cdsSelecaoCLIENTE.AsString := NomeCliente;
end;

procedure TfrmRelPedidoPeriodo.dbeClienteClickButton(Sender: TObject);
var
  vReturn: Variant;
begin
  inherited;
  if TfrmPesquisa.Execute('VIEWCLIENTE','_CÓDIGO',vReturn) then
  begin
    cdsSelecaoCODCLIENTE.AsInteger := vReturn;
    SetFocusIfCan(dbeCliente);
  end;
end;

procedure TfrmRelPedidoPeriodo.FilterRelatorio;
begin
  cdsPadrao.Close;
  cdsPadrao.Params.ParamByName('CODCLIENTE').AsInteger := cdsSelecaoCODCLIENTE.AsInteger;
  cdsPadrao.Params.ParamByName('DATAINI').AsDate := cdsSelecaoDATAINI.AsDateTime;
  cdsPadrao.Params.ParamByName('DATAFIM').AsDate := cdsSelecaoDATAFIM.AsDateTime;
  cdsPadrao.Open;

  GetTotalPedidos;
  GetCountPedidos;
end;

procedure TfrmRelPedidoPeriodo.btnVisualizarClick(Sender: TObject);
begin
  FilterRelatorio;
  inherited;
end;

procedure TfrmRelPedidoPeriodo.btnImprimirClick(Sender: TObject);
begin
  FilterRelatorio;
  inherited;
end;

end.
