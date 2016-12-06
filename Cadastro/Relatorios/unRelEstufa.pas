unit unRelEstufa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unRelPadraoPortrait, DB, StdCtrls, Buttons, ExtCtrls, FMTBcd, DBClient,
  PLClientDataSet, Provider, PLDataSetProvider, SqlExpr, PLSQLDataSet;

type
  TfrmRelEstufa = class(TfrmRelPadraoPortrait)
    sqldPadrao: TPLSQLDataSet;
    sqldPadraoCODESTUFAS: TIntegerField;
    sqldPadraoNOME: TStringField;
    sqldPadraoDATA: TDateField;
    sqldPadraoTOTALPRODUCAO: TFMTBCDField;
    sqldPadraoOBSERVACAO: TStringField;
    sqldPadraoLARGURA: TFMTBCDField;
    sqldPadraoCOMPRIMENTO: TFMTBCDField;
    dspPadrao: TPLDataSetProvider;
    cdsPadrao: TPLClientDataSet;
    cdsPadraoCODESTUFAS: TIntegerField;
    cdsPadraoNOME: TStringField;
    cdsPadraoDATA: TDateField;
    cdsPadraoTOTALPRODUCAO: TFMTBCDField;
    cdsPadraoOBSERVACAO: TStringField;
    cdsPadraoLARGURA: TFMTBCDField;
    cdsPadraoCOMPRIMENTO: TFMTBCDField;
    procedure pprPadraoBeforePrint(Sender: TObject);
  private
  public
  end;

var
  frmRelEstufa: TfrmRelEstufa;

implementation



{$R *.dfm}

procedure TfrmRelEstufa.pprPadraoBeforePrint(Sender: TObject);
begin
  inherited;
  cdsPadrao.Open;

end;

end.
