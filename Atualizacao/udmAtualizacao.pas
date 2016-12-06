unit udmAtualizacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBDatabase, IBScript, IBCustomDataSet, IBTable, unLogAtualizacao,
  Funcoes, IBDatabaseInfo, IdTCPServer;

type
  TDmAtualizacao = class(TDataModule)
    ibtTransac: TIBTransaction;
    ibtbVersao: TIBTable;
    ibInfoConexao: TIBDatabaseInfo;
    ibsScript: TIBScript;
    ibtbVersaoCODSISTEMA: TIntegerField;
    ibtbVersaoVERSAO: TIBStringField;
    IBDbConexao: TIBDatabase;
    procedure ibdbConexaoAfterConnect(Sender: TObject);
    procedure ibdbConexaoBeforeConnect(Sender: TObject);
  private
    procedure IniciaTransacao;
    procedure ComitaTransacao(NomeArquivo: string);
    procedure CancelaTransacao(NomeArquivo, Erro: String);

    procedure LogInicia(NomeArquivo: string);
    procedure LogSucesso(NomeArquivo: string);
    procedure LogErro(NomeArquivo, MsgErro: string);
    
    procedure SetLocalArquivo(const Value: string);
    function GetLocalArquivo: string;

    procedure Log(msg: string);
  public
    FLocalArquivo: string;
    FormLog: TfrmLogAtualizacao;
    
    procedure Conectar;
    procedure Desconectar;
    function GetVersaoBanco: Integer;
    function ExecutaScript: Boolean;
    property LocalArquivo: string read GetLocalArquivo write SetLocalArquivo;
  end;

var
  DmAtualizacao: TDmAtualizacao;

implementation

{$R *.dfm}

procedure TDmAtualizacao.IniciaTransacao;
begin
  if not ibtTransac.InTransaction then
    ibtTransac.StartTransaction;
end;

procedure TDmAtualizacao.ComitaTransacao(NomeArquivo: string);
begin
  ibtTransac.Commit;
  LogSucesso(NomeArquivo);
end;

procedure TDmAtualizacao.CancelaTransacao(NomeArquivo, Erro: String);
begin
  ibtTransac.Rollback;
  LogErro(NomeArquivo, Erro);
end;

procedure TDmAtualizacao.Conectar;
begin
  try
    if not ibdbConexao.Connected then
      ibdbConexao.Connected := True;
  except
    on e: Exception do
    begin
      raise Exception.Create('Problema de conexão da atualização. Entre em contato com o suporte.' + #13#10 +
        'DADOS TÉCNICOS: ' + e.Message);
    end;
  end;
end;

procedure TDmAtualizacao.Desconectar;
begin
  if ibdbConexao.Connected then
    ibdbConexao.Close;
end;

procedure TDmAtualizacao.LogInicia(NomeArquivo: string);
begin
  FormLog.mmLog.Lines.Add('Iniciada atualização de ' + NomeArquivo + '...');
end;

procedure TDmAtualizacao.LogSucesso(NomeArquivo: string);
begin
  FormLog.mmLog.Lines.Add('Atualização de ' + NomeArquivo + ' OK!');
  FormLog.mmLog.Lines.Add('-----------------------------------------------------------');
end;

procedure TDmAtualizacao.LogErro(NomeArquivo, MsgErro: string);
begin
  FormLog.mmLog.Lines.Add('ERRO NA ATUALIZAÇÃO de ' + NomeArquivo + '!');
  FormLog.mmLog.Lines.Add('Dados técnicos do erro: ' + MsgErro);
  FormLog.mmLog.Lines.Add('-----------------------------------------------------------');
end;

function TDmAtualizacao.GetVersaoBanco: Integer;
var
  versao: string;
begin
  if dmAtualizacao = nil then
    Exit;

  try
    if not ibtbVersao.Active then
      ibtbVersao.Open;

    versao := Trim(ibtbVersaoVERSAO.AsString);
    Result := StrToInt(Copy(versao,1,Length(versao)-2));
  finally
    ibtbVersao.Close;
  end;
end;

function TDmAtualizacao.GetLocalArquivo: string;
begin
  Result := FLocalArquivo;
end;

procedure TDmAtualizacao.SetLocalArquivo(const Value: string);
begin
  FLocalArquivo := Value;
  if not FileExists(FLocalArquivo) then
    raise Exception.Create('Arquivo ' + FLocalArquivo + ' não foi encontrado.'); 
end;

function TDmAtualizacao.ExecutaScript: Boolean;
begin
  try
    if ibdbConexao.Connected then
    begin
      try
        IniciaTransacao;
        LogInicia(ExtractFileName(FLocalArquivo));

        with ibsScript do
        begin
          Script.LoadFromFile(FLocalArquivo);
          ExecuteScript;
        end;

        ComitaTransacao(ExtractFileName(FLocalArquivo));
      except
        on e: Exception do
          CancelaTransacao(ExtractFileName(FLocalArquivo), e.Message);
      end;
    end
    else
      CancelaTransacao(ExtractFileName(FLocalArquivo), 'ERRO DE CONEXÃO');
  except
    Result := False;
    raise Exception.Create('Erro na execução do script.');
  end;
end;

procedure TDmAtualizacao.ibdbConexaoBeforeConnect(Sender: TObject);
begin
  with ibdbConexao do
  begin
    SQLDialect := 3;
    LoginPrompt := False;
    DefaultTransaction := ibtTransac;
    DatabaseName := ReadIniFile('Conexao', 'Servidor')+':ESTUFAS';
    Params.Add('user_name=SYSDBA');
    Params.Add('password=masterkey');
  end;  
end;

procedure TDmAtualizacao.ibdbConexaoAfterConnect(Sender: TObject);
begin
  inherited;
  if ibdbConexao.Connected then
    if (ibInfoConexao.UserNames.Count > 1) then
    begin
      Application.MessageBox(PChar('O sistema deve ser fechado nas estações caso esteja sendo utilizado em rede.' +
        'Verifique-as e tente novamente.' + #13#10 + 'O sistema será finalizado.'), 'Problema de atualização',
        MB_OK or MB_ICONWARNING);
      Application.Terminate;
      Abort;
    end;
end;

procedure TDmAtualizacao.Log(msg: string);
var
  path  : TFileName;
  log   : TFileStream;
  lsize : Int64;
begin
  with TStringList.Create do
  try
    try
      path := DiretorioSistema+'LOG.log';

      if FileExists(path) then
      begin
        log := TFileStream.Create(path,fmOpenRead);
        lsize := log.Size;
        log.Free;

        if lsize > 10485760 then
          DeleteFile(PChar(path))
        else
          LoadFromFile(path);
      end;

      Add(DateTimeToStr(now)+': '+msg);
      Add('');

      SaveToFile(path);
    except
    end;
  finally
    Free;
  end;
end;

end.
