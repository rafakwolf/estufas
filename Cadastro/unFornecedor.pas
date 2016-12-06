unit unFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadraoCadastro, ActnList,  DB, Menus, Buttons,
  ExtCtrls, FMTBcd, DBClient, PLClientDataSet, Provider, PLDataSetProvider,
  SqlExpr, PLSQLDataSet, StdCtrls, Mask, DBCtrls, PLDBEdit, System.Actions;

type
  TfrmFornecedor = class(TfrmPadraoCadastro)
    sqldPadrao: TPLSQLDataSet;
    dspPadrao: TPLDataSetProvider;
    cdsPadrao: TPLClientDataSet;
    sqldPadraoCODFORNECEDOR: TIntegerField;
    sqldPadraoRAZAOSOCIAL: TStringField;
    sqldPadraoNOMEFANTASIA: TStringField;
    sqldPadraoCNPJ: TStringField;
    sqldPadraoCPF: TStringField;
    sqldPadraoENDERECO: TStringField;
    sqldPadraoCIDADE: TStringField;
    sqldPadraoBAIRRO: TStringField;
    sqldPadraoESTADO: TStringField;
    sqldPadraoNUMERO: TIntegerField;
    sqldPadraoCEP: TStringField;
    sqldPadraoTELEFONE: TStringField;
    sqldPadraoFAX: TStringField;
    sqldPadraoEMAIL: TStringField;
    cdsPadraoCODFORNECEDOR: TIntegerField;
    cdsPadraoRAZAOSOCIAL: TStringField;
    cdsPadraoNOMEFANTASIA: TStringField;
    cdsPadraoCNPJ: TStringField;
    cdsPadraoCPF: TStringField;
    cdsPadraoENDERECO: TStringField;
    cdsPadraoCIDADE: TStringField;
    cdsPadraoBAIRRO: TStringField;
    cdsPadraoESTADO: TStringField;
    cdsPadraoNUMERO: TIntegerField;
    cdsPadraoCEP: TStringField;
    cdsPadraoTELEFONE: TStringField;
    cdsPadraoFAX: TStringField;
    cdsPadraoEMAIL: TStringField;
    dbeRazaoSocial: TPLDBEdit;
    dbeNomeFantasia: TPLDBEdit;
    dbeCnpj: TPLDBEdit;
    dbeCpf: TPLDBEdit;
    dbeEndereco: TPLDBEdit;
    dbeCidade: TPLDBEdit;
    dbeBairro: TPLDBEdit;
    dbeUF: TPLDBEdit;
    dbeNumero: TPLDBEdit;
    dbeCep: TPLDBEdit;
    dbeTelefone: TPLDBEdit;
    dbeFax: TPLDBEdit;
    dbeEmail: TPLDBEdit;
  private
  public
  end;

var
  frmFornecedor: TfrmFornecedor;

implementation

{$R *.dfm}

initialization
  RegisterClass(TfrmFornecedor);
finalization
  UnRegisterClass(TfrmFornecedor);
   
end.
