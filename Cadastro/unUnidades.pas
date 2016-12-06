unit unUnidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadraoCadastro, ActnList,  DB, Menus, Buttons,
  ExtCtrls, FMTBcd, DBClient, PLClientDataSet, Provider, PLDataSetProvider,
  SqlExpr, PLSQLDataSet, StdCtrls, Mask, DBCtrls, PLDBEdit, System.Actions;

type
  TfrmUnidades = class(TfrmPadraoCadastro)
    sqldPadrao: TPLSQLDataSet;
    dspPadrao: TPLDataSetProvider;
    cdsPadrao: TPLClientDataSet;
    cdsPadraoDESCRICAO: TStringField;
    dbeDescricaoUnidade: TPLDBEdit;
    sqldPadraoCODUNIDADES: TIntegerField;
    sqldPadraoDESCRICAO: TStringField;
    cdsPadraoCODUNIDADES: TIntegerField;
  private
  public
  end;

var
  frmUnidades: TfrmUnidades;

implementation

{$R *.dfm}

initialization
  RegisterClass(TfrmUnidades);
finalization
  UnRegisterClass(TfrmUnidades);

end.
