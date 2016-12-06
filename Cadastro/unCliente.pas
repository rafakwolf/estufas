unit unCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadraoCadastro, ActnList,  DB, Menus, Buttons,
  ExtCtrls, FMTBcd, DBClient, PLClientDataSet, Provider, PLDataSetProvider,
  SqlExpr, PLSQLDataSet, StdCtrls, Mask, DBCtrls, PLDBEdit, System.Actions;

type
  TfrmCliente = class(TfrmPadraoCadastro)
    sqldPadrao: TPLSQLDataSet;
    dspPadrao: TPLDataSetProvider;
    cdsPadrao: TPLClientDataSet;
    sqldPadraoCODCLIENTE: TIntegerField;
    sqldPadraoRAZAOSOCIAL: TStringField;
    sqldPadraoNOMEFANTASIA: TStringField;
    sqldPadraoCNPJ: TStringField;
    sqldPadraoTELEFONE: TStringField;
    sqldPadraoFAX: TStringField;
    sqldPadraoEMAIL: TStringField;
    sqldPadraoENDERECO: TStringField;
    sqldPadraoBAIRRO: TStringField;
    sqldPadraoCIDADE: TStringField;
    sqldPadraoESTADO: TStringField;
    sqldPadraoNUMERO: TIntegerField;
    sqldPadraoCEP: TStringField;
    cdsPadraoCODCLIENTE: TIntegerField;
    cdsPadraoRAZAOSOCIAL: TStringField;
    cdsPadraoNOMEFANTASIA: TStringField;
    cdsPadraoCNPJ: TStringField;
    cdsPadraoTELEFONE: TStringField;
    cdsPadraoFAX: TStringField;
    cdsPadraoEMAIL: TStringField;
    cdsPadraoENDERECO: TStringField;
    cdsPadraoBAIRRO: TStringField;
    cdsPadraoCIDADE: TStringField;
    cdsPadraoESTADO: TStringField;
    cdsPadraoNUMERO: TIntegerField;
    cdsPadraoCEP: TStringField;
    dbeRazaoSocial: TPLDBEdit;
    dbeNomeFantasia: TPLDBEdit;
    dbeCnpj: TPLDBEdit;
    dbeTelefone: TPLDBEdit;
    dbeFax: TPLDBEdit;
    dbeEmail: TPLDBEdit;
    dbeEndereco: TPLDBEdit;
    dbeBairro: TPLDBEdit;
    dbeCidade: TPLDBEdit;
    dbeUF: TPLDBEdit;
    dbeNumero: TPLDBEdit;
    dbeCEP: TPLDBEdit;
    dbeIE: TPLDBEdit;
    sqldPadraoIE: TStringField;
    cdsPadraoIE: TStringField;
  private
  public
  end;

var
  frmCliente: TfrmCliente;

implementation

{$R *.dfm}

initialization
  RegisterClass(TfrmCliente);
finalization
  UnRegisterClass(TfrmCliente);
   
end.
