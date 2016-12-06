unit unContasReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unContasPadrao, StdCtrls, Buttons, ExtCtrls, FMTBcd, DB,
  ComCtrls, PLDBEditDateTimePicker, DBClient, PLClientDataSet, Provider,
  PLDataSetProvider, SqlExpr, PLSQLDataSet, Grids, DBGrids, PLDBGrid;

type
  TfrmContasReceber = class(TfrmContasPadrao)
    sqldPadrao: TPLSQLDataSet;
    dspPadrao: TPLDataSetProvider;
    cdsPadrao: TPLClientDataSet;
    sqldPadraoCODCONTASRECEBER: TIntegerField;
    sqldPadraoCODCLIENTE: TIntegerField;
    sqldPadraoDATA: TDateField;
    sqldPadraoVENCIMENTO: TDateField;
    sqldPadraoHISTORICO: TStringField;
    sqldPadraoDOCUMENTO: TStringField;
    sqldPadraoVALOR: TFMTBCDField;
    sqldPadraoSELECIONAR: TStringField;
    sqldPadraoJURO: TFMTBCDField;
    sqldPadraoDESCTO: TFMTBCDField;
    sqldPadraoRECDA: TStringField;
    sqldPadraoDATARECDA: TDateField;
    sqldPadraoORIGEM: TIntegerField;
    sqldPadraoCODPLANOCONTAS: TIntegerField;
    sqldPadraoCODORIGEM: TIntegerField;
    sqldPadraoVALORRECDO: TFMTBCDField;
    sqldPadraoCLIENTE: TStringField;
    sqldPadraoPLANOCONTAS: TStringField;
    cdsPadraoCODCONTASRECEBER: TIntegerField;
    cdsPadraoCODCLIENTE: TIntegerField;
    cdsPadraoDATA: TDateField;
    cdsPadraoVENCIMENTO: TDateField;
    cdsPadraoHISTORICO: TStringField;
    cdsPadraoDOCUMENTO: TStringField;
    cdsPadraoVALOR: TFMTBCDField;
    cdsPadraoSELECIONAR: TStringField;
    cdsPadraoJURO: TFMTBCDField;
    cdsPadraoDESCTO: TFMTBCDField;
    cdsPadraoRECDA: TStringField;
    cdsPadraoDATARECDA: TDateField;
    cdsPadraoORIGEM: TIntegerField;
    cdsPadraoCODPLANOCONTAS: TIntegerField;
    cdsPadraoCODORIGEM: TIntegerField;
    cdsPadraoVALORRECDO: TFMTBCDField;
    cdsPadraoCLIENTE: TStringField;
    cdsPadraoPLANOCONTAS: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure cdsSelecaoDATAINIChange(Sender: TField);
    procedure rgFiltroClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    procedure FilterData;
  public
  end;

var
  frmContasReceber: TfrmContasReceber;

implementation

uses
  unPesquisa, unContasReceberMan;

{$R *.dfm}

procedure TfrmContasReceber.FilterData;
begin
  cdsPadrao.Close;
  cdsPadrao.Params.ParamByName('DATAINI').AsDate := cdsSelecaoDATAINI.AsDateTime;
  cdsPadrao.Params.ParamByName('DATAFIM').AsDate := cdsSelecaoDATAFIM.AsDateTime;
  cdsPadrao.Open;
end;

procedure TfrmContasReceber.FormCreate(Sender: TObject);
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

procedure TfrmContasReceber.cdsSelecaoDATAINIChange(Sender: TField);
begin
  inherited;
  FilterData;
end;

procedure TfrmContasReceber.rgFiltroClick(Sender: TObject);
begin
  inherited;
  cdsPadrao.Filtered := False;

  case rgFiltro.ItemIndex of
    0: // pagas
    begin
      cdsPadrao.Filter := 'DATARECDA is not null';
    end;
    1: // não pagas
    begin
      cdsPadrao.Filter := 'DATARECDA is null';
    end;
    2: // tudo
    begin
      cdsPadrao.Filter := '';
    end;
  end;

  cdsPadrao.Filtered := True;
end;

procedure TfrmContasReceber.btnPesquisarClick(Sender: TObject);
var
  CodCli: Variant;
begin
  inherited;
  if TfrmPesquisa.Execute('VIEWCLIENTE','_CÓDIGO',CodCli) and (not VarIsNull(CodCli)) then
  begin
    cdsPadrao.Filtered := False;
    if cdsPadrao.Filter <> '' then
      cdsPadrao.Filter := cdsPadrao.Filter + 'CODCLIENTE = '+CodCli
    else
      cdsPadrao.Filter := 'CODCLIENTE = '+VarToStr( CodCli );
    cdsPadrao.Filtered := True;
  end;
end;

procedure TfrmContasReceber.btnNovoClick(Sender: TObject);
begin
  inherited;
  frmContasReceberMan := TfrmContasReceberMan.Create(self);
  try
    frmContasReceberMan.Id := 0;
    frmContasReceberMan.Caption := 'Inserir Conta a Receber';
    frmContasReceberMan.ShowModal;
  finally
    FreeAndNil(frmContasReceberMan);
    FilterData;
  end;
end;

procedure TfrmContasReceber.btnAlterarClick(Sender: TObject);
begin
  inherited;
  frmContasReceberMan := TfrmContasReceberMan.Create(self);
  try
    frmContasReceberMan.Id := cdsPadraoCODCONTASRECEBER.AsInteger;
    frmContasReceberMan.Caption := 'Editar Conta a Receber';
    frmContasReceberMan.ShowModal;
  finally
    FreeAndNil(frmContasReceberMan);
    FilterData;
  end;
end;

initialization
  RegisterClass(TfrmContasReceber);
finalization
  UnRegisterClass(TfrmContasReceber);  

end.
