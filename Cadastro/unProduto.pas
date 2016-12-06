unit unProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadraoCadastro, ActnList,  DB, Menus, Buttons,
  ExtCtrls, FMTBcd, DBClient, PLClientDataSet, Provider, PLDataSetProvider,
  SqlExpr, PLSQLDataSet, StdCtrls, Mask, DBCtrls, PLDBEdit, System.Actions;

type
  TfrmProduto = class(TfrmPadraoCadastro)
    sqldPadrao: TPLSQLDataSet;
    dspPadrao: TPLDataSetProvider;
    cdsPadrao: TPLClientDataSet;
    sqldPadraoCODPRODUTO: TIntegerField;
    sqldPadraoNOME: TStringField;
    sqldPadraoCODUNIDADE: TIntegerField;
    sqldPadraoVALORUNITARIO: TFMTBCDField;
    sqldPadraoUNIDADE: TStringField;
    cdsPadraoCODPRODUTO: TIntegerField;
    cdsPadraoNOME: TStringField;
    cdsPadraoCODUNIDADE: TIntegerField;
    cdsPadraoVALORUNITARIO: TFMTBCDField;
    cdsPadraoUNIDADE: TStringField;
    dbeProduto: TPLDBEdit;
    dbeUnidade: TPLDBEdit;
    dbeValor: TPLDBEdit;
    procedure dbeUnidadeClickButton(Sender: TObject);
    procedure cdsPadraoCODUNIDADEValidate(Sender: TField);
  private
  public
  end;

var
  frmProduto: TfrmProduto;

implementation

uses
  unPesquisa, Funcoes;

{$R *.dfm}

procedure TfrmProduto.dbeUnidadeClickButton(Sender: TObject);
var
  vReturn: Variant;
begin
  inherited;
  if TfrmPesquisa.Execute('VIEWUNIDADES','_CÓDIGO',vReturn) then
    cdsPadraoCODUNIDADE.AsInteger := vReturn;
end;

procedure TfrmProduto.cdsPadraoCODUNIDADEValidate(Sender: TField);
var
  NomeUn: string;
begin
  inherited;
  NomeUn := GetFieldByID(sqldPadrao.SQLConnection, 'UNIDADES', 'DESCRICAO', 'CODUNIDADES',
    Sender.AsInteger);

  if (NomeUn <> '') then
    cdsPadraoUNIDADE.AsString := NomeUn;
end;

initialization
  RegisterClass(TfrmProduto);
finalization
  UnRegisterClass(TfrmProduto);
   
end.
