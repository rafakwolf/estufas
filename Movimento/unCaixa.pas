unit unCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFormBasico, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids,
  FMTBcd, DB, DBClient, PLClientDataSet, Provider,
  PLDataSetProvider, SqlExpr, PLSQLDataSet, PLDBGrid;

type
  TfrmCaixa = class(TfrmFormBasico)
    pnlBotoes: TPanel;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnPesquisar: TBitBtn;
    btnFechar: TBitBtn;
    pnlFiltros: TPanel;
    sqldPadrao: TPLSQLDataSet;
    dspPadrao: TPLDataSetProvider;
    cdsPadrao: TPLClientDataSet;
    dsPadrao: TDataSource;
    sqldPadraoCODCAIXA: TIntegerField;
    sqldPadraoCODPLANOCONTAS: TIntegerField;
    sqldPadraoCONTA: TStringField;
    sqldPadraoDATA: TDateField;
    sqldPadraoDESCRICAO: TStringField;
    sqldPadraoDOCUMENTO: TStringField;
    sqldPadraoTIPO: TStringField;
    sqldPadraoVALOR: TFMTBCDField;
    sqldPadraoEXCLUIR: TStringField;
    sqldPadraoORIGEM: TIntegerField;
    sqldPadraoCODORIGEM: TIntegerField;
    cdsPadraoCODCAIXA: TIntegerField;
    cdsPadraoCODPLANOCONTAS: TIntegerField;
    cdsPadraoCONTA: TStringField;
    cdsPadraoDATA: TDateField;
    cdsPadraoDESCRICAO: TStringField;
    cdsPadraoDOCUMENTO: TStringField;
    cdsPadraoTIPO: TStringField;
    cdsPadraoVALOR: TFMTBCDField;
    cdsPadraoEXCLUIR: TStringField;
    cdsPadraoORIGEM: TIntegerField;
    cdsPadraoCODORIGEM: TIntegerField;
    pldbgDados: TPLDBGrid;
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
  end;

var
  frmCaixa: TfrmCaixa;

implementation

uses unLancCaixa;

{$R *.dfm}

procedure TfrmCaixa.btnNovoClick(Sender: TObject);
begin
  inherited;
  frmLancCaixa := TfrmLancCaixa.Create(Self);
  frmLancCaixa.CodCaixa := 0;
  frmLancCaixa.ShowModal;
  frmLancCaixa.Release;
end;

procedure TfrmCaixa.btnAlterarClick(Sender: TObject);
begin
  inherited;
  frmLancCaixa := TfrmLancCaixa.Create(Self);
  frmLancCaixa.CodCaixa := cdsPadraoCODCAIXA.AsInteger;
  frmLancCaixa.ShowModal;
  frmLancCaixa.Release;
end;

procedure TfrmCaixa.btnExcluirClick(Sender: TObject);
begin
  inherited;
  cdsPadrao.Delete;
  cdsPadrao.ApplyUpdates(0);
end;

procedure TfrmCaixa.btnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCaixa.FormCreate(Sender: TObject);
begin
  inherited;
  cdsPadrao.Open;
end;

procedure TfrmCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cdsPadrao.Close;
  inherited;
end;

initialization
  RegisterClass(TfrmCaixa);
finalization
  UnRegisterClass(TfrmCaixa);
   
end.
