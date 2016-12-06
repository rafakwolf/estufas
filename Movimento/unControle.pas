unit unControle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadraoCadastro, ActnList,  DB, Menus, Buttons,
  ExtCtrls, FMTBcd, DBClient, PLClientDataSet, Provider, PLDataSetProvider,
  SqlExpr, PLSQLDataSet, StdCtrls, Mask, DBCtrls, PLDBEdit, ComCtrls,
  PLDBEditDateTimePicker, Grids, DBGrids,  System.Actions, PLDBGrid;

type
  TfrmControle = class(TfrmPadraoCadastro)
    sqldPadrao: TPLSQLDataSet;
    dspPadrao: TPLDataSetProvider;
    cdsPadrao: TPLClientDataSet;
    sqldPadraoCODCONTROLE: TIntegerField;
    sqldPadraoDATA: TDateField;
    sqldPadraoCODESTUFA: TIntegerField;
    sqldPadraoNOME: TStringField;
    sqldPadraoITENS: TIntegerField;
    cdsPadraoCODCONTROLE: TIntegerField;
    cdsPadraoDATA: TDateField;
    cdsPadraoCODESTUFA: TIntegerField;
    cdsPadraoNOME: TStringField;
    cdsPadraoITENS: TIntegerField;
    dtpDataControle: TPLDBEditDateTimePicker;
    dbeEstufa: TPLDBEdit;
    dbeNroItens: TPLDBEdit;
    sqldItens: TPLSQLDataSet;
    dspItens: TPLDataSetProvider;
    cdsItens: TPLClientDataSet;
    sqldItensCODITEMCONTROLE: TIntegerField;
    sqldItensDATA: TDateField;
    sqldItensCODPRODUTO: TIntegerField;
    sqldItensNOMEPRODUTO: TStringField;
    sqldItensCOMPLEMENTO: TStringField;
    sqldItensCODCONTROLE: TIntegerField;
    cdsItensCODITEMCONTROLE: TIntegerField;
    cdsItensDATA: TDateField;
    cdsItensCODPRODUTO: TIntegerField;
    cdsItensNOMEPRODUTO: TStringField;
    cdsItensCOMPLEMENTO: TStringField;
    cdsItensCODCONTROLE: TIntegerField;
    dsItens: TDataSource;
    pmGrid: TPopupMenu;
    miDeleteItem: TMenuItem;
    pldbgItens: TPLDBGrid;
    procedure cdsPadraoCODESTUFAValidate(Sender: TField);
    procedure dbeEstufaClickButton(Sender: TObject);
    procedure rdbgItensEditButtonClick(Sender: TObject);
    procedure cdsItensCODPRODUTOValidate(Sender: TField);
    procedure cdsItensAfterPost(DataSet: TDataSet);
    procedure miDeleteItemClick(Sender: TObject);
    procedure cdsItensAfterDelete(DataSet: TDataSet);
    procedure PLFormConfigBeforePost(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
  end;

var
  frmControle: TfrmControle;

implementation

uses Funcoes, unPesquisa;

{$R *.dfm}

procedure TfrmControle.cdsPadraoCODESTUFAValidate(Sender: TField);
var
  NomeEstufa: string;
begin
  inherited;
  NomeEstufa := GetFieldByID(sqldPadrao.SQLConnection, 'ESTUFAS', 'NOME', 'CODESTUFAS',
    Sender.AsInteger);

  if (NomeEstufa <> '') then
    cdsPadraoNOME.AsString := NomeEstufa;
end;

procedure TfrmControle.dbeEstufaClickButton(Sender: TObject);
var
  res: Variant;
begin
  inherited;
  if InEditModes then
  begin
    if TfrmPesquisa.Execute('viewestufas','_CÓDIGO',res) then
    begin
      cdsPadraoCODESTUFA.AsInteger := res;
    end;
  end;
end;

procedure TfrmControle.rdbgItensEditButtonClick(Sender: TObject);
var
  res: Variant;
begin
  inherited;
  if InEditModes then
  begin
    if TfrmPesquisa.Execute('viewPRODUTO','_CÓDIGO',res) then
    begin
      cdsItensCODPRODUTO.AsInteger := res;
    end;
  end;
end;

procedure TfrmControle.cdsItensCODPRODUTOValidate(Sender: TField);
var
  NomeProduto: string;
begin
  inherited;
  NomeProduto := GetFieldByID(sqldPadrao.SQLConnection, 'PRODUTO', 'NOME', 'CODPRODUTO',
    Sender.AsInteger);

  if (NomeProduto <> '') then
    cdsItensNOMEPRODUTO.AsString := NomeProduto;
end;

procedure TfrmControle.cdsItensAfterPost(DataSet: TDataSet);
begin
  inherited;
  if cdsPadrao.State in [dsEdit, dsInsert] then
    cdsPadraoITENS.AsInteger := cdsItens.RecordCount;
end;

procedure TfrmControle.miDeleteItemClick(Sender: TObject);
begin
  inherited;
  if InEditModes then
    if MsgSN('Deseja realmente excluir este item?','Exclusão de ítem') then
      cdsItens.Delete;
end;

procedure TfrmControle.cdsItensAfterDelete(DataSet: TDataSet);
begin
  inherited;
  if cdsPadrao.State in [dsEdit, dsInsert] then
    cdsPadraoITENS.AsInteger := cdsItens.RecordCount;
end;

procedure TfrmControle.PLFormConfigBeforePost(Sender: TObject);
begin
  inherited;
  if (cdsItens.RecordCount = 0) and UpdatesPending then
  begin
    MsgAviso('Não é possível efetuar um registro de controle sem ítens.');
    Abort;
  end;
end;

procedure TfrmControle.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmControle := nil;
end;

initialization
  RegisterClass(TfrmControle);
finalization
  UnRegisterClass(TfrmControle);

end.


