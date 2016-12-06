unit unContasPagarMan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unContasManPadrao, StdCtrls, Buttons, ExtCtrls, DB, FMTBcd,
  DBClient, PLClientDataSet, Provider, PLDataSetProvider, SqlExpr,
  PLSQLDataSet, Mask, DBCtrls, PLDBEdit, ComCtrls, PLDBEditDateTimePicker;

type
  TfrmContasPagarMan = class(TfrmContasManPadrao)
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
    dtpData: TPLDBEditDateTimePicker;
    dtpVenc: TPLDBEditDateTimePicker;
    dbeDescricao: TPLDBEdit;
    dbePlanoConta: TPLDBEdit;
    dbeForn: TPLDBEdit;
    dbeDoc: TPLDBEdit;
    dbeValor: TPLDBEdit;
    sqldPadraoVALORPAGO: TFMTBCDField;
    cdsPadraoVALORPAGO: TFMTBCDField;
    grpPagamento: TGroupBox;
    dbeJuro: TPLDBEdit;
    dbeDescto: TPLDBEdit;
    dtpDataPagto: TPLDBEditDateTimePicker;
    dbeValorPago: TPLDBEdit;
    procedure dbePlanoContaClickButton(Sender: TObject);
    procedure cdsPadraoCODPLANOCONTASValidate(Sender: TField);
    procedure dbeFornClickButton(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure cdsPadraoCODFORNECEDORValidate(Sender: TField);
  private
    FId: Integer;
    procedure SetId(const Value: Integer);
  public
    property Id: Integer read FId write SetId;
  end;

var
  frmContasPagarMan: TfrmContasPagarMan;

implementation

uses
  unPesquisa, Funcoes;

{$R *.dfm}

procedure TfrmContasPagarMan.SetId(const Value: Integer);
begin
  FId := Value;

  if (FId > 0) then
  begin
    cdsPadrao.Close;
    cdsPadrao.Params.ParamByName('CODCONTASPAGAR').AsInteger := FId;
    cdsPadrao.Open;

    cdsPadrao.Edit;
  end
  else
  begin
    cdsPadrao.Close;
    cdsPadrao.Params.ParamByName('CODCONTASPAGAR').Clear;
    cdsPadrao.Open;
    
    cdsPadrao.Insert;
    cdsPadraoDATA.AsDateTime := Date;
  end;
end;

procedure TfrmContasPagarMan.dbePlanoContaClickButton(Sender: TObject);
var
  vReturn: Variant;
begin
  inherited;
  if TfrmPesquisa.Execute('VIEWPLANOCONTA','_CÓDIGO',vReturn) then
  begin
    if not VarIsNull(vReturn) then
      cdsPadraoCODPLANOCONTAS.AsInteger := vReturn;
  end;
end;

procedure TfrmContasPagarMan.cdsPadraoCODPLANOCONTASValidate(
  Sender: TField);
var
  PlanoContas: string;
begin
  inherited;
  PlanoContas := GetFieldByID(sqldPadrao.SQLConnection,'PLANOCONTAS','DESCRICAO','CODPLANOCONTAS',
    Sender.AsInteger);

  if (PlanoContas <> '') then
    cdsPadraoPLANCCONTAS.AsString := PlanoContas;
end;

procedure TfrmContasPagarMan.dbeFornClickButton(Sender: TObject);
var
  vReturn: Variant;
begin
  inherited;
  if tfrmPesquisa.Execute('VIEWFORNECEDOR','_CÓDIGO',vReturn) then
  begin
    if not VarIsNull(vReturn) then
      cdsPadraoCODFORNECEDOR.AsInteger := vReturn;
  end;
end;

procedure TfrmContasPagarMan.btnOKClick(Sender: TObject);
begin
  if cdsPadraoVENCIMENTO.IsNull then
  begin
    MsgCuidado('Defina uma data de vencimento.');
    SetFocusIfCan(dtpVenc);
    Exit;
  end;

  if cdsPadraoVALOR.IsNull then
  begin
    MsgCuidado('Defina um valor para a conta.');
    SetFocusIfCan(dbeValor);
    Exit;
  end;

  inherited;
end;

procedure TfrmContasPagarMan.cdsPadraoCODFORNECEDORValidate(
  Sender: TField);
var
  Forn: string;
begin
  inherited;
  Forn := GetFieldByID(sqldPadrao.SQLConnection,'FORNECEDOR','RAZAOSOCIAL','CODFORNECEDOR',
    Sender.AsInteger);

  if (Forn <> '') then
    cdsPadraoFORNECEDOR.AsString := Forn;
end;

end.
