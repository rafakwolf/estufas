unit unRelListaEstufa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unRelatorios, DB, RLReport, FMTBcd, DBClient, PLClientDataSet,
  Provider, PLDataSetProvider, SqlExpr, PLSQLDataSet, RLPreviewForm;

type
  TfrmRelListaEstufa = class(TfrmRelatorios)
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
    rlbndTituloColuna: TRLBand;
    rlbndDetalhe: TRLBand;
    rlblbNome: TRLLabel;
    rlblbData: TRLLabel;
    rldbtNome: TRLDBText;
    rldbtData: TRLDBText;
    rlblbLargura: TRLLabel;
    rlblbComprim: TRLLabel;
    rldbtLarg: TRLDBText;
    rldbtComp: TRLDBText;
  private
  public
    class procedure ShowReport(Titulo: string);
  end;

var
  frmRelListaEstufa: TfrmRelListaEstufa;

implementation



{$R *.dfm}

class procedure TfrmRelListaEstufa.ShowReport(Titulo: string);
begin
  frmRelListaEstufa := TfrmRelListaEstufa.Create(Application);
  with frmRelListaEstufa do
  try
    dsPadrao.DataSet.Open;

  finally
    dsPadrao.DataSet.Close;
    FreeAndNil(frmRelListaEstufa);
  end;
end;

end.
