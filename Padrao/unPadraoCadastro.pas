unit unPadraoCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFormBasico, Menus, ExtCtrls, Buttons, DB, DBCtrls, DBClient,
  ActnList, System.Actions;

type
  TfrmPadraoCadastro = class(TfrmFormBasico)
    pnlActions: TPanel;
    btnNovo: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnProcurar: TSpeedButton;
    btnSair: TSpeedButton;
    dsPadrao: TDataSource;
    alNavigateActions: TActionList;
    actNovo: TAction;
    actAlterar: TAction;
    actExcluir: TAction;
    actSalvar: TAction;
    actCancelar: TAction;
    actProcurar: TAction;
    actImprimir: TAction;
    actSair: TAction;
    btnImprimir: TSpeedButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actSairExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure actProcurarExecute(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
  private
    ComponentFocusWhenPost : TWinControl;
    WasInserting : Boolean;
    IdResultPesquisa : Variant;
  protected
    procedure MyHandleReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError;
      UpdateKind: TUpdateKind; var Action: TReconcileAction);

    function UpdatesPending: Boolean;
    function InEditModes: Boolean;

    procedure deleteRecord; virtual;
    procedure applyUpdates; virtual;
  public
  end;

var
  frmPadraoCadastro: TfrmPadraoCadastro;

implementation

uses
  unPesquisa, Funcoes;

{$R *.dfm}

procedure TfrmPadraoCadastro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;

  CanClose := True;

  SelectNext(ActiveControl, True, False);

  if Assigned(dsPadrao.DataSet) then
  begin
    if (UpdatesPending) then
      case Application.MessageBox(PChar('Existem alterações pendentes no processo "' + Caption + '".'+#13+
        'Deseja gravar as alterações?'), 'Confirmação', mb_yesnocancel or mb_iconquestion) of
        Id_Yes: TClientDataSet(dsPadrao.DataSet).ApplyUpdates(0);
        Id_No : TClientDataSet(dsPadrao.DataSet).CancelUpdates;
        Id_Cancel: CanClose := False;
      end;
  end;

end;

procedure TfrmPadraoCadastro.actAlterarExecute(Sender: TObject);
begin
  inherited;
  dsPadrao.DataSet.Edit;
end;

procedure TfrmPadraoCadastro.actCancelarExecute(Sender: TObject);
begin
  inherited;
  TClientDataSet(dsPadrao.DataSet).CancelUpdates;
end;

procedure TfrmPadraoCadastro.actExcluirExecute(Sender: TObject);
begin
  inherited;
  if MsgSN('Deseja realmente excluir este registro?') then
    deleteRecord;
end;

procedure TfrmPadraoCadastro.actNovoExecute(Sender: TObject);
begin
  inherited;
  dsPadrao.DataSet.Insert;
end;

procedure TfrmPadraoCadastro.actProcurarExecute(Sender: TObject);
var
  formname : string;
  res : Variant;
begin
  inherited;
  formname := Copy(ClassName,5,Length(ClassName));

  if TfrmPesquisa.Execute('view'+formname,'_CÓDIGO',res) then
  begin
    dsPadrao.DataSet.Close;

    if TClientDataSet(dsPadrao.DataSet).Params.Count = 0 then
      Raise Exception.Create('No params on '+dsPadrao.DataSet.Name);

    if (res <> Null) then
    begin
      TClientDataSet(dsPadrao.DataSet).Params[0].AsInteger := res;
      dsPadrao.DataSet.Open;
    end;
  end;
end;

procedure TfrmPadraoCadastro.actSairExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmPadraoCadastro.actSalvarExecute(Sender: TObject);
begin
  inherited;
  applyUpdates;
end;

procedure TfrmPadraoCadastro.applyUpdates;
begin
  getDatamodule.startTransaction;
  try
    TClientDataSet(dsPadrao.DataSet).ApplyUpdates(0);
    getDatamodule.commitTransaction;
  except
    on e: Exception do
    begin
      getDatamodule.rollbackTransaction;
      raise Exception.Create(e.Message);
    end;
  end;
end;

procedure TfrmPadraoCadastro.deleteRecord;
begin
  getDatamodule.startTransaction;
  try
    dsPadrao.DataSet.Delete;
    TClientDataSet(dsPadrao.DataSet).ApplyUpdates(0);
    getDatamodule.commitTransaction;
  except
    on e: Exception do
    begin
      getDatamodule.rollbackTransaction;
      raise Exception.Create(e.Message);
    end;
  end;
end;

procedure TfrmPadraoCadastro.FormShow(Sender: TObject);
var
  i: Integer;
begin
  inherited;

  for i := 0 to ComponentCount-1 do
  begin
    if Components[i] is TFMTBCDField then
    begin
      if TFMTBCDField(Components[i]).Tag = 0 then
        TFMTBCDField(Components[i]).DisplayFormat := '#,##0.00';
    end
    else if (Components[i] is TClientDataSet) then
    begin
      if not Assigned(TClientDataSet(Components[i]).OnReconcileError) then
        TClientDataSet(Components[i]).OnReconcileError := MyHandleReconcileError;
    end;
  end;
end;

function TfrmPadraoCadastro.InEditModes: Boolean;
begin
  Result := dsPadrao.DataSet.State in dsEditModes;
end;

procedure TfrmPadraoCadastro.FormCreate(Sender: TObject);
begin
  inherited;
  dsPadrao.AutoEdit := False;
end;

function TfrmPadraoCadastro.UpdatesPending: Boolean;
begin
  Result := TClientDataSet(dsPadrao.Dataset).ChangeCount > 0;
end;

procedure TfrmPadraoCadastro.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  inherited;
  Resize := False;
end;

procedure TfrmPadraoCadastro.MyHandleReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
const
  CRLF = #13#10;
var
  S: String;
begin
  Action := raAbort;

  if pos('PRIMARY or UNIQUE KEY', E.Message) <> 0 then
  begin
    S := 'Já existe um registro no banco de dados com este mesmo identificador.';
  end
  else if pos('violation of FOREIGN KEY', E.Message) <> 0 then
  begin
    if UpdateKind = ukDelete then
      S := 'O registro que você está tentando excluir já está sendo utilizado em outras partes do sistema.'
    else
      S := 'O registro que você está tentando gravar depende de uma informação que não existe. '+
           'Verifique o preenchimento dos campos com pesquisa e tente novamente.';
  end
  else
  begin
    S := 'Erro ao executar esta ação. Por favor entre em contato com suporte. '+
         'ERRO: '+E.Message;
  end;

  S := S + crlf+crlf+'DataSet: ' + DataSet.Owner.Name + CRLF;

  case UpdateKind of
    ukModify: S := S + 'Operação: Alteração' + CRLF;
    ukInsert: S := S + 'Operação: Inserção' + CRLF;
    ukDelete: S := S + 'Operação: Exclusão' + CRLF;
  end;

  MsgErro(S);
end;

end.
