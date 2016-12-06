unit unContasReceberMan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unContasManPadrao, StdCtrls, Buttons, ExtCtrls, DB, FMTBcd,
  DBClient, PLClientDataSet, Provider, PLDataSetProvider, SqlExpr,
  PLSQLDataSet, Mask, DBCtrls, PLDBEdit, ComCtrls, PLDBEditDateTimePicker;

type
  TfrmContasReceberMan = class(TfrmContasManPadrao)
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
    dtpData: TPLDBEditDateTimePicker;
    dtpVenc: TPLDBEditDateTimePicker;
    dbeDescricao: TPLDBEdit;
    dbePlanoConta: TPLDBEdit;
    dbeCliente: TPLDBEdit;
    dbeDoc: TPLDBEdit;
    dbeValor: TPLDBEdit;
    grpRecebimento: TGroupBox;
    dbeJuro: TPLDBEdit;
    dbeDescto: TPLDBEdit;
    dtpDataPagto: TPLDBEditDateTimePicker;
    dbeValorPago: TPLDBEdit;
    procedure dbePlanoContaClickButton(Sender: TObject);
    procedure dbeClienteClickButton(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure cdsPadraoCODPLANOCONTASValidate(Sender: TField);
    procedure cdsPadraoCODCLIENTEValidate(Sender: TField);
  private
    FId: Integer;
    procedure SetId(const Value: Integer);
  public
    property Id: Integer read FId write SetId;
  end;

var
  frmContasReceberMan: TfrmContasReceberMan;

implementation

uses
  Funcoes, unPesquisa, udmPrincipal;

{$R *.dfm}

procedure TfrmContasReceberMan.SetId(const Value: Integer);
begin
  FId := Value;

  if (FId > 0) then
  begin
    cdsPadrao.Close;
    cdsPadrao.Params.ParamByName('CODCONTASRECEBER').AsInteger := FId;
    cdsPadrao.Open;

    cdsPadrao.Edit;
  end
  else
  begin
    cdsPadrao.Close;
    cdsPadrao.Params.ParamByName('CODCONTASRECEBER').Clear;
    cdsPadrao.Open;
    
    cdsPadrao.Insert;
    cdsPadraoDATA.AsDateTime := Date;
  end;  
end;

procedure TfrmContasReceberMan.dbePlanoContaClickButton(Sender: TObject);
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

procedure TfrmContasReceberMan.dbeClienteClickButton(Sender: TObject);
var
  vReturn: Variant;
begin
  inherited;
  if TfrmPesquisa.Execute('VIEWCLIENTE','_CÓDIGO',vReturn) then
  begin
    if not VarIsNull(vReturn) then
      cdsPadraoCODCLIENTE.AsInteger := vReturn;
  end;
end;

procedure TfrmContasReceberMan.btnOKClick(Sender: TObject);
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

procedure TfrmContasReceberMan.cdsPadraoCODPLANOCONTASValidate(
  Sender: TField);
var
  PlanoContas: string;
begin
  inherited;
  PlanoContas := GetFieldByID(sqldPadrao.SQLConnection,'PLANOCONTAS','DESCRICAO','CODPLANOCONTAS',
    Sender.AsInteger);

  if (PlanoContas <> '') then
    cdsPadraoPLANOCONTAS.AsString := PlanoContas;
end;

procedure TfrmContasReceberMan.cdsPadraoCODCLIENTEValidate(Sender: TField);
var
  Cliente: string;
begin
  inherited;
  Cliente := GetFieldByID(sqldPadrao.SQLConnection,'CLIENTE','RAZAOSOCIAL','CODCLIENTE',
    Sender.AsInteger);

  if (Cliente <> '') then
    cdsPadraoCLIENTE.AsString := Cliente;
end;

end.
