unit uThreadFTP;

interface

uses
  Classes, Forms, Windows, SysUtils, IdFTP, IdFTPCommon, IdComponent, Dialogs,
  DBXCommon, SqlExpr;

type
  TOnMax   = procedure(max: Integer) of object;
  TOnPos   = procedure(pos: Integer) of object;
  TOnError = procedure(MsgError: string) of object;

type
  TFTPUpdate = class(TThread)
  private
    FOnMax : TOnMax;
    FOnPos : TOnPos;

    vMax   : Integer;
    vPos   : Integer;
    vErrorMsg: string;

    vVersaoAtual : string;
    TotalSize    : Integer;

    FTP           : TIdFTP;
    FLista        : TStringList;
    File_Download : string;

    TempFile      : TMemoryStream;

    FOnInitialize: TNotifyEvent;
    FOnError: TOnError;
    FOnNoNewVersion: TNotifyEvent;

    dbxConn: TSQLConnection;
    FOnNewVersion: TNotifyEvent;

    function NewVersion: Boolean;
    procedure Download;

    procedure FTPWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);

    procedure FTPWork(Sender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);

    procedure Max;
    procedure Pos;
    procedure Initialize;
    procedure Error;
    procedure NoNewVersion;

    function GetDBXConn: TSQLConnection;
    procedure SetOnNewVersion(const Value: TNotifyEvent);
  protected
    procedure Execute; override;
  public
    constructor Start(VersaoAtual: String);

    property OnMax: TOnMax read FOnMax write FOnMax;
    property OnPos: TOnPos read FOnPos write FOnPos;
    property OnInitialize: TNotifyEvent read FOnInitialize write FOnInitialize;
    property OnError: TOnError read FOnError write FOnError;
    property OnNoNewVersion: TNotifyEvent read FOnNoNewVersion write FOnNoNewVersion;
    property OnNewVersion: TNotifyEvent read FOnNewVersion write SetOnNewVersion;
  end;

implementation

procedure TFTPUpdate.Execute;
begin
  if not Terminated then
  begin
    if NewVersion then
    begin
      Synchronize(Initialize);
      Download;
    end
    else
    begin
      if (vErrorMsg = '') then
        Synchronize(NoNewVersion); // não deu erro e não há nova versão
        
      Terminate;
    end;
  end
  else
  begin
    if Assigned(ftp) then
      FTP.Free;

    if Assigned(TempFile) then
      TempFile.Free;

    if Assigned(FLista) then
      FLista.Free;
  end;
end;

procedure TFTPUpdate.FTPWork(Sender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  vPos := Trunc(AWorkCount/1024);

  if Assigned(FOnPos) then
    Synchronize(Pos);
end;

procedure TFTPUpdate.FTPWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  vMax := Trunc(TotalSize/1024);

  if Assigned(FOnMax) and (TotalSize > 0) then
    Synchronize(Max);
end;

procedure TFTPUpdate.Download;
begin
  try
    if not Assigned(ftp) then
      ftp := TIdFTP.Create(nil);

    ftp.OnWorkBegin := FTPWorkBegin;
    ftp.OnWork      := FTPWork;

    ftp.Host        := 'w3host.com.br';
    ftp.Username    := 'rafawolf';
    ftp.Password    := '99127334';
    ftp.Passive     := True;
    ftp.ReadTimeout := 0;

    try
      if not ftp.Connected then
        ftp.Connect;

      if not ftp.Connected then
      begin
        vErrorMsg := 'Erro na conexão com o servidor FTP (Download)';
        Synchronize(Error);
      end;

      ftp.ChangeDir('/instaladores/CER');

      ftp.TransferType := ftASCII;

      File_Download := '';

      if not Assigned(FLista) then
        FLista := TStringList.Create;

      Flista.Clear;

      ftp.List(FLista, '*.exe', False);

      if 1 > FLista.Count then
      begin
        vErrorMsg := 'Nenhum arquivo disponível no FTP (Download)';
        Synchronize(Error);
      end;

      File_Download := FLista.Strings[0];

      FLista.Free;

      if File_Download = '' then
      begin
        vErrorMsg := 'Arquivo de atualização não disponível no FTP (Download)';
        Synchronize(Error);
      end;

      ftp.TransferType := ftBinary;
      TotalSize := ftp.Size(File_Download);

      // baixa e salva do arquivo de instalação
      TempFile := TMemoryStream.Create;
      try
        ftp.Get(File_Download, TempFile, True);
        ftp.Disconnect;
        TempFile.SaveToFile(IncludeTrailingBackslash(ExtractFilePath(Application.ExeName))+'UpdateCER.exe');
      finally
        TempFile.Free;
      end;      
    except
      on e: Exception do
      begin
        vErrorMsg := e.Message;
        Synchronize(Error);
      end;
    end;
  finally
    if Assigned(ftp) then
    begin
      ftp.Free;
      ftp := nil;
    end;
  end;
end;

function TFTPUpdate.NewVersion: Boolean;
var
  VersaoFtp: string;
  query : TSQLQuery;
begin
  try
    try
      dbxConn := GetDBXConn;

      dbxConn.Connected := True;

      if dbxConn.Connected then
      begin
        query := TSQlQuery.Create(nil);
        query.SQlConnection := dbxConn;
        query.SQL.Clear;
        query.SQL.Add('select versao from sistema where idsistema = 2');
        query.Open;

        VersaoFtp := query.Fields[0].AsString;
      end;

      Result := StrToInt(VersaoFtp) > StrToInt(vVersaoAtual);
    except
      on e: Exception do
      begin
        vErrorMsg := e.Message;
        Synchronize(Error);
      end;
    end;
  finally
    query.Free;
    dbxConn.Free;
  end;
end;

constructor TFTPUpdate.Start(VersaoAtual: String);
begin
  inherited Create(True);
  FreeOnTerminate := True;
  vVersaoAtual    := VersaoAtual;
end;

procedure TFTPUpdate.Max;
begin
  if Assigned(FOnMax) then
    FOnMax(vMax);
end;

procedure TFTPUpdate.Pos;
begin
  if Assigned(FOnPos) then
    FOnPos(vPos);
end;

procedure TFTPUpdate.Initialize;
begin
  if Assigned(FOnInitialize) then
    FOnInitialize(Self);
end;

procedure TFTPUpdate.Error;
begin
  if Assigned(FOnError) then
    FOnError(vErrorMsg);
end;

procedure TFTPUpdate.NoNewVersion;
begin
  if Assigned(FOnNoNewVersion) then
    FOnNoNewVersion(Self);
end;

function TFTPUpdate.GetDBXConn: TSQLConnection;
begin
  Result := TSQLConnection.Create(nil);

  with Result do
  begin
    ConnectionName := 'w3host';
    DriverName     := 'MYSQL';
    GetDriverFunc  := 'getSQLDriverMYSQL';
    LibraryName    := 'dbxmys.dll';
    VendorLib      := 'libmysql.dll';

    params.Clear;
    params.Add('DriverName=MYSQL');
    params.Add('blobsize=-1');
    params.Add('database=rafawolf_rafa');
    params.Add('hostname=w3host.com.br');
    params.Add('localecode=0000');
    params.Add('user_name=rafawolf_rafael');
    params.Add('password=rafa123');
    params.Add('compressed=False');
    params.Add('encrypted=False');
  end;
end;

procedure TFTPUpdate.SetOnNewVersion(const Value: TNotifyEvent);
begin
  FOnNewVersion := Value;
end;

end.
