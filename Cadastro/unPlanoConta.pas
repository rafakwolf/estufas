unit unPlanoConta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadraoCadastro, ActnList,  DB, Menus, Buttons,
  ExtCtrls, FMTBcd, DBClient, PLClientDataSet, Provider, PLDataSetProvider,
  SqlExpr, PLSQLDataSet, StdCtrls, Mask, DBCtrls, PLDBEdit, System.Actions;

type
  TfrmPlanoConta = class(TfrmPadraoCadastro)
    sqldPadrao: TPLSQLDataSet;
    dspPadrao: TPLDataSetProvider;
    cdsPadrao: TPLClientDataSet;
    sqldPadraoCODPLANOCONTAS: TIntegerField;
    sqldPadraoDESCRICAO: TStringField;
    cdsPadraoCODPLANOCONTAS: TIntegerField;
    cdsPadraoDESCRICAO: TStringField;
    dbeNomePlano: TPLDBEdit;
  private
  public
  end;

var
  frmPlanoConta: TfrmPlanoConta;

implementation

{$R *.dfm}

initialization
  RegisterClass(TfrmPlanoConta);
finalization
  UnRegisterClass(TfrmPlanoConta);
  
end.
