unit unContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unContasPadrao, StdCtrls, Buttons, ExtCtrls, FMTBcd, DB,
  ComCtrls, PLDBEditDateTimePicker, DBClient, PLClientDataSet, Provider,
  PLDataSetProvider, SqlExpr, PLSQLDataSet, Grids, DBGrids, PLDBGrid;

type
  TfrmContasPagar = class(TfrmContasPadrao)
    sqldPadrao: TPLSQLDataSet;
    dspPadrao: TPLDataSetProvider;
    cdsPadrao: TPLClientDataSet;
    sqldPadraoCODCONTASPAGAR: TIntegerField;
    sqldPadraoCODFORNECEDOR: TIntegerField;
    sqldPadraoDATA: TDateField;
    sqldPadraoVENCIMENTO: TDateField;
    sqldPadraoDESCRICAO: TStringField;
    sqldPadraoDOCUMENTO: TStringField;
    sqldPadraoVALOR: TFMTBCDField;
    sqldPadraoSELECIONAR: TStringField;
    sqldPadraoJURO: TFMTBCDField;
    sqldPadraoDESCTO: TFMTBCDField;
    sqldPadraoPAGA: TStringField;
    sqldPadraoDATAPAGTO: TDateField;
    sqldPadraoORIGEM: TIntegerField;
    sqldPadraoCODPLANOCONTAS: TIntegerField;
    sqldPadraoCODORIGEM: TIntegerField;
    sqldPadraoFORNECEDOR: TStringField;
    sqldPadraoPLANCCONTAS: TStringField;
    cdsPadraoCODCONTASPAGAR: TIntegerField;
    cdsPadraoCODFORNECEDOR: TIntegerField;
    cdsPadraoDATA: TDateField;
    cdsPadraoVENCIMENTO: TDateField;
    cdsPadraoDESCRICAO: TStringField;
    cdsPadraoDOCUMENTO: TStringField;
    cdsPadraoVALOR: TFMTBCDField;
    cdsPadraoSELECIONAR: TStringField;
    cdsPadraoJURO: TFMTBCDField;
    cdsPadraoDESCTO: TFMTBCDField;
    cdsPadraoPAGA: TStringField;
    cdsPadraoDATAPAGTO: TDateField;
    cdsPadraoORIGEM: TIntegerField;
    cdsPadraoCODPLANOCONTAS: TIntegerField;
    cdsPadraoCODORIGEM: TIntegerField;
    cdsPadraoFORNECEDOR: TStringField;
    cdsPadraoPLANCCONTAS: TStringField;
    sqldPadraoVALORPAGO: TFMTBCDField;
    cdsPadraoVALORPAGO: TFMTBCDField;
    procedure FormCreate(Sender: TObject);
    procedure cdsSelecaoDATAINIChange(Sender: TField);
    procedure rgFiltroClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    procedure FilterData;
  public
  end;

var
  frmContasPagar: TfrmContasPagar;

implementation

uses
  unContasPagarMan, unPesquisa;

{$R *.dfm}

procedure TfrmContasPagar.FilterData;
begin
  cdsPadrao.Close;
  cdsPadrao.Params.ParamByName('DATAINI').AsDate := cdsSelecaoDATAINI.AsDateTime;
  cdsPadrao.Params.ParamByName('DATAFIM').AsDate := cdsSelecaoDATAFIM.AsDateTime;
  cdsPadrao.Open;
end;

procedure TfrmContasPagar.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  for i := 0 to pldbgContas.Columns.Count-1 do
  begin
    if i > 10 then
      pldbgContas.Columns[i].Visible := False;
  end;

  rgFiltroClick(rgFiltro);
end;

procedure TfrmContasPagar.cdsSelecaoDATAINIChange(Sender: TField);
begin
  inherited;
  FilterData;
end;

procedure TfrmContasPagar.rgFiltroClick(Sender: TObject);
begin
  inherited;
  cdsPadrao.Filtered := False;

  case rgFiltro.ItemIndex of
    0: // pagas
    begin
      cdsPadrao.Filter := 'DATAPAGTO is not null';
    end;
    1: // não pagas
    begin
      cdsPadrao.Filter := 'DATAPAGTO is null';
    end;
    2: // tudo
    begin
      cdsPadrao.Filter := '';
    end;
  end;

  cdsPadrao.Filtered := True;
end;

procedure TfrmContasPagar.btnNovoClick(Sender: TObject);
begin
  inherited;
  frmContasPagarMan := TfrmContasPagarMan.Create(self);
  try
    frmContasPagarMan.Caption := 'Inserir Conta a Pagar';
    frmContasPagarMan.Id := 0;
    frmContasPagarMan.ShowModal;
  finally
    FreeAndNil(frmContasPagarMan);
    FilterData;
  end;
end;

procedure TfrmContasPagar.btnAlterarClick(Sender: TObject);
begin
  inherited;
  frmContasPagarMan := TfrmContasPagarMan.Create(self);
  try
    frmContasPagarMan.Caption := 'Editar Conta a Pagar';
    frmContasPagarMan.Id := cdsPadraoCODCONTASPAGAR.AsInteger;
    frmContasPagarMan.ShowModal;
  finally
    FreeAndNil(frmContasPagarMan);
    FilterData;
  end;
end;

procedure TfrmContasPagar.btnPesquisarClick(Sender: TObject);
var
  CodForn: Variant;
begin
  inherited;
  if TfrmPesquisa.Execute('VIEWFORNECEDOR','_CÓDIGO',CodForn) and (not VarIsNull(CodForn)) then
  begin
    cdsPadrao.Filtered := False;
    if cdsPadrao.Filter <> '' then
      cdsPadrao.Filter := cdsPadrao.Filter + 'CODFORNECEDOR = '+CodForn
    else
      cdsPadrao.Filter := 'CODFORNECEDOR = '+VarToStr( CodForn );
    cdsPadrao.Filtered := True;
  end;
end;

initialization
  RegisterClass(TfrmContasPagar);
finalization
  UnRegisterClass(TfrmContasPagar);

end.
