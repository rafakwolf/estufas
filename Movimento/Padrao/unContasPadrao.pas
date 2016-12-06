unit unContasPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFormBasico, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids,
  FMTBcd, DBClient, PLClientDataSet, Provider, PLDataSetProvider,
  DB, SqlExpr, PLSQLDataSet, ComCtrls, PLDBEditDateTimePicker, SqlTimSt,
  DateUtils, funcoes, PLDBGrid;

type
  TTPagarReceber = (prPagar,prReceber);
  TfrmContasPadrao = class(TfrmFormBasico)
    pnlBotoes: TPanel;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnPesquisar: TBitBtn;
    btnFechar: TBitBtn;
    pnlFiltros: TPanel;
    grpFiltroData: TGroupBox;
    rgFiltro: TRadioGroup;
    sqldSelecao: TPLSQLDataSet;
    dspSelecao: TPLDataSetProvider;
    cdsSelecao: TPLClientDataSet;
    dsSelecao: TDataSource;
    dtpDataIni: TPLDBEditDateTimePicker;
    dtpDataFim: TPLDBEditDateTimePicker;
    sqldSelecaoDATAINI: TDateField;
    sqldSelecaoDATAFIM: TDateField;
    cdsSelecaoDATAINI: TDateField;
    cdsSelecaoDATAFIM: TDateField;
    dsPadrao: TDataSource;
    pldbgContas: TPLDBGrid;
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
  private
  protected
  public
  end;

var
  frmContasPadrao: TfrmContasPadrao;

implementation



{$R *.dfm}

procedure TfrmContasPadrao.btnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmContasPadrao.FormCreate(Sender: TObject);
begin
  ClientHeight := 400;
  ClientWidth  := 750;
  inherited;
  cdsSelecao.Open;
  cdsSelecao.Edit;
  cdsSelecaoDATAINI.AsDateTime := StartOfTheMonth(Date);
  cdsSelecaoDATAFIM.AsDateTime := EndOfTheMonth(Date);

  dsPadrao.DataSet.Open;
end;

procedure TfrmContasPadrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsSelecao.Cancel;
  cdsSelecao.Close;
  dsPadrao.DataSet.Open;
  inherited;
end;

procedure TfrmContasPadrao.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if dsPadrao.DataSet.RecordCount = 0 then
    Exit;
    
  if MsgSN('Deseja realmente excluir este registro?') then
  begin
    TClientDataSet(dsPadrao).Delete;
    TClientDataSet(dsPadrao).ApplyUpdates(0);
  end;
end;

end.
