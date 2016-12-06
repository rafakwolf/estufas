unit unLancCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFormBasico, StdCtrls, ExtCtrls, Buttons, Mask, DBCtrls,
  PLDBEdit, FMTBcd, DB, DBClient, PLClientDataSet, Provider, PLDataSetProvider,
  SqlExpr, PLSQLDataSet, ComCtrls, PLDBEditDateTimePicker;

type
  TTipoRegistro = (trDebito,trCredito,trTransfDebito,trTransfCredito);
  TfrmLancCaixa = class(TfrmFormBasico)
    pnlBotoes: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    dbeContaDebito: TPLDBEdit;
    dbeContaCredito: TPLDBEdit;
    sqldPadrao: TPLSQLDataSet;
    dspPadrao: TPLDataSetProvider;
    cdsPadrao: TPLClientDataSet;
    dsPadrao: TDataSource;
    sqldPadraoCODCAIXA: TIntegerField;
    sqldPadraoCODPLANOCONTAS: TIntegerField;
    sqldPadraoCONTA: TStringField;
    sqldPadraoDATA: TDateField;
    sqldPadraoDESCRICAO: TStringField;
    sqldPadraoDOCUMENTO: TStringField;
    sqldPadraoTIPO: TStringField;
    sqldPadraoVALOR: TFMTBCDField;
    sqldPadraoEXCLUIR: TStringField;
    sqldPadraoORIGEM: TIntegerField;
    sqldPadraoCODORIGEM: TIntegerField;
    cdsPadraoCODCAIXA: TIntegerField;
    cdsPadraoCODPLANOCONTAS: TIntegerField;
    cdsPadraoCONTA: TStringField;
    cdsPadraoDATA: TDateField;
    cdsPadraoDESCRICAO: TStringField;
    cdsPadraoDOCUMENTO: TStringField;
    cdsPadraoTIPO: TStringField;
    cdsPadraoVALOR: TFMTBCDField;
    cdsPadraoEXCLUIR: TStringField;
    cdsPadraoORIGEM: TIntegerField;
    cdsPadraoCODORIGEM: TIntegerField;
    dtpData: TPLDBEditDateTimePicker;
    dbeDescricao: TPLDBEdit;
    dbeDoc: TPLDBEdit;
    dbeValor: TPLDBEdit;
    sqldContas: TPLSQLDataSet;
    dspContas: TPLDataSetProvider;
    cdsContas: TPLClientDataSet;
    dsContas: TDataSource;
    sqldContasCODCONTADEB: TIntegerField;
    sqldContasCONTADEB: TStringField;
    sqldContasCODCONTACRED: TIntegerField;
    sqldContasCONTACRED: TStringField;
    cdsContasCODCONTADEB: TIntegerField;
    cdsContasCONTADEB: TStringField;
    cdsContasCODCONTACRED: TIntegerField;
    cdsContasCONTACRED: TStringField;
    dbrgrpTipo: TDBRadioGroup;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsContasCODCONTADEBValidate(Sender: TField);
    procedure cdsContasCODCONTACREDValidate(Sender: TField);
    procedure dbeContaDebitoClickButton(Sender: TObject);
    procedure dbeContaCreditoClickButton(Sender: TObject);
    procedure dbrgrpTipoClick(Sender: TObject);
    procedure cdsPadraoBeforeApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure cdsPadraoAfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure cdsPadraoNewRecord(DataSet: TDataSet);
  private
    FCodCaixa: Integer;
    procedure SetCodCaixa(const Value: Integer);

    procedure efetuaTransferencia;

    function GetTipoLanc: TTipoRegistro;
    function getContaLancCredito(codLanc: Integer): Integer;
  public
    property CodCaixa: Integer read FCodCaixa write SetCodCaixa;
  end;

var
  frmLancCaixa: TfrmLancCaixa;

implementation

uses
  Funcoes, unPesquisa;

{$R *.dfm}

procedure TfrmLancCaixa.SetCodCaixa(const Value: Integer);
begin
  FCodCaixa := Value;
  if (FCodCaixa > 0) then
  begin
    cdsPadrao.Close;
    cdsPadrao.Params.ParamByName('CODCAIXA').AsInteger := FCodCaixa;
    cdsPadrao.Open;

    case GetTipoLanc of
      trTransfDebito,trTransfCredito:
      begin
        cdsContas.Edit;
        cdsContasCODCONTADEB.AsInteger := cdsPadraoCODPLANOCONTAS.AsInteger;
        cdsContasCODCONTACRED.AsInteger := getContaLancCredito(
          cdsPadraoCODCAIXA.AsInteger);
      end;
      trDebito:
      begin
        cdsContas.Edit;
        cdsContasCODCONTADEB.AsInteger := cdsPadraoCODPLANOCONTAS.AsInteger;
      end;
      trCredito:
      begin
        cdsContas.Edit;
        cdsContasCODCONTACRED.AsInteger := cdsPadraoCODPLANOCONTAS.AsInteger;
      end;
    end;
  end
  else
  begin
    cdsPadrao.Close;
    cdsPadrao.Params[0].Clear;
    cdsPadrao.Open;
    cdsPadrao.Insert;
  end;
end;

procedure TfrmLancCaixa.btnCancelClick(Sender: TObject);
begin
  inherited;
  cdsPadrao.CancelUpdates;
  Close;
end;

procedure TfrmLancCaixa.btnOKClick(Sender: TObject);
begin
  inherited;
  cdsPadrao.ApplyUpdates(0);
  Close;
end;

procedure TfrmLancCaixa.efetuaTransferencia;
begin
  with TPLSQLDataSet.Create(nil) do
  begin
    SQLConnection := sqldPadrao.SQLConnection;
    CommandText := 'insert into CAIXA (CODCAIXA, CODPLANOCONTAS, DATA, ' +
      'DESCRICAO, DOCUMENTO, TIPO, VALOR, EXCLUIR, ORIGEM, CODORIGEM) '+
      'values (0, :CODPLANOCONTAS, current_date, :DESCRICAO, :DOCUMENTO, '+
      QuotedStr('T')+', :VALOR, '+QuotedStr('N')+', 4, :CODORIGEM)';
    Params.ParamByName('CODPLANOCONTAS').AsInteger := cdsContasCODCONTACRED.AsInteger;
    Params.ParamByName('DESCRICAO').AsString := cdsPadraoDESCRICAO.AsString;
    Params.ParamByName('DOCUMENTO').AsString := cdsPadraoDOCUMENTO.AsString;
    Params.ParamByName('VALOR').AsCurrency := cdsPadraoVALOR.AsCurrency;
    Params.ParamByName('CODORIGEM').AsInteger := cdsPadraoCODCAIXA.AsInteger;
    ExecSQL;
  end;
end;

procedure TfrmLancCaixa.FormCreate(Sender: TObject);
begin
  inherited;
  cdsContas.Open;
  cdsContas.Edit;
end;

procedure TfrmLancCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsContas.Cancel; 
  cdsContas.Close;
  inherited;
end;

procedure TfrmLancCaixa.cdsContasCODCONTADEBValidate(Sender: TField);
var
  PlanoContas: string;
begin
  inherited;
  PlanoContas := GetFieldByID(sqldPadrao.SQLConnection,'PLANOCONTAS','DESCRICAO','CODPLANOCONTAS',
    Sender.AsInteger);

  if (PlanoContas <> '') then
    cdsContasCONTADEB.AsString := PlanoContas;
end;

procedure TfrmLancCaixa.cdsContasCODCONTACREDValidate(Sender: TField);
var
  PlanoContas: string;
begin
  inherited;
  PlanoContas := GetFieldByID(sqldPadrao.SQLConnection,'PLANOCONTAS','DESCRICAO','CODPLANOCONTAS',
    Sender.AsInteger);

  if (PlanoContas <> '') then
    cdsContasCONTACRED.AsString := PlanoContas;
end;

procedure TfrmLancCaixa.dbeContaDebitoClickButton(Sender: TObject);
var
  vReturn: Variant;
begin
  inherited;
  if TfrmPesquisa.Execute('VIEWPLANOCONTA','_CÓDIGO',vReturn) then
  begin
    if not VarIsNull(vReturn) then
      cdsContasCODCONTADEB.AsInteger := vReturn;
  end;
end;

procedure TfrmLancCaixa.dbeContaCreditoClickButton(Sender: TObject);
var
  vReturn: Variant;
begin
  inherited;
  if TfrmPesquisa.Execute('VIEWPLANOCONTA','_CÓDIGO',vReturn) then
  begin
    if not VarIsNull(vReturn) then
      cdsContasCODCONTACRED.AsInteger := vReturn;
  end;
end;

function TfrmLancCaixa.getContaLancCredito(codLanc: Integer): Integer;
begin
  with TPLSQLDataSet.Create(nil) do
  begin
    SQLConnection := sqldPadrao.SQLConnection;
    CommandText := 'select '+
                   '  c.CODPLANOCONTAS '+
                   'from CAIXA c '+
                   'where '+
                   '  c.ORIGEM = 4 '+
                   'and '+
                   '  c.CODORIGEM = :CODCAIXA';
    Params.ParamByName('CODCAIXA').AsInteger := codLanc;
    Open;
    Result := Fields[0].AsInteger;
    Free;                 
  end;
end;

function TfrmLancCaixa.GetTipoLanc: TTipoRegistro;
begin
  if cdsPadraoTIPO.AsString = 'T' then
  begin
    if not cdsPadraoORIGEM.IsNull then
      Result := trTransfCredito
    else
      Result := trTransfDebito;
  end
  else
  begin
    if cdsPadraoTIPO.AsString = 'C' then
      Result := trCredito
    else
      Result := trDebito;
  end;
end;

procedure TfrmLancCaixa.dbrgrpTipoClick(Sender: TObject);
begin
  inherited;
  case dbrgrpTipo.ItemIndex of
    0: // Debitos
    begin
      dbeContaDebito.Visible := True;
      dbeContaCredito.Visible := False;
    end;
    1: // Creditos
    begin
      dbeContaDebito.Visible := False;
      dbeContaCredito.Visible := True;
    end;
    2: // Transferencia
    begin
      dbeContaDebito.Visible := True;
      dbeContaCredito.Visible := True;
    end;
  end;
end;

procedure TfrmLancCaixa.cdsPadraoBeforeApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
  inherited;
  if ((cdsPadraoTIPO.AsString = 'T') or (cdsPadraoTIPO.AsString = 'D')) then
    cdsPadraoCODPLANOCONTAS.AsInteger := cdsContasCODCONTADEB.AsInteger
  else
    cdsPadraoCODPLANOCONTAS.AsInteger := cdsContasCODCONTACRED.AsInteger;  
end;

procedure TfrmLancCaixa.cdsPadraoAfterApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
  inherited;
  if cdsPadraoTIPO.AsString = 'T' then
    efetuaTransferencia;
end;

procedure TfrmLancCaixa.cdsPadraoNewRecord(DataSet: TDataSet);
begin
  inherited;
  cdsPadraoTIPO.AsString := 'D';
  cdsPadraoDATA.AsDateTime := Date;
  dbrgrpTipoClick(dbrgrpTipo);
end;

end.
