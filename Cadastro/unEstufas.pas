unit unEstufas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadraoCadastro, ActnList,  DB, Menus, Buttons,
  ExtCtrls, FMTBcd, DBClient, PLClientDataSet, Provider, PLDataSetProvider,
  SqlExpr, PLSQLDataSet, StdCtrls, DBCtrls, ComCtrls,
  PLDBEditDateTimePicker, Mask, PLDBEdit, System.Actions;

type
  TfrmEstufas = class(TfrmPadraoCadastro)
    sqldPadrao: TPLSQLDataSet;
    dspPadrao: TPLDataSetProvider;
    cdsPadrao: TPLClientDataSet;
    sqldPadraoCODESTUFAS: TIntegerField;
    sqldPadraoNOME: TStringField;
    sqldPadraoDATA: TDateField;
    sqldPadraoTOTALPRODUCAO: TFMTBCDField;
    sqldPadraoOBSERVACAO: TStringField;
    sqldPadraoLARGURA: TFMTBCDField;
    sqldPadraoCOMPRIMENTO: TFMTBCDField;
    cdsPadraoCODESTUFAS: TIntegerField;
    cdsPadraoNOME: TStringField;
    cdsPadraoDATA: TDateField;
    cdsPadraoTOTALPRODUCAO: TFMTBCDField;
    cdsPadraoOBSERVACAO: TStringField;
    cdsPadraoLARGURA: TFMTBCDField;
    cdsPadraoCOMPRIMENTO: TFMTBCDField;
    dbeNomeEstufa: TPLDBEdit;
    dtpDataCadastro: TPLDBEditDateTimePicker;
    dbeTotalProducao: TPLDBEdit;
    dbeLargura: TPLDBEdit;
    dbeComprimento: TPLDBEdit;
    dbmOBS: TDBMemo;
    lblOBS: TLabel;
  private
  public
  end;

var
  frmEstufas: TfrmEstufas;

implementation

{$R *.dfm}

initialization
  RegisterClass(TfrmEstufas);
finalization
  UnRegisterClass(TfrmEstufas);

end.
