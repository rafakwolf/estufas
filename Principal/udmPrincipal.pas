unit udmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBase, WideStrings, DBXFirebird, FMTBcd, IdContext,
  DB, SqlExpr, uPublicTypes, PLSQLConnection;

type
  TDmPrincipal = class(TdmBase)
    procedure DataModuleCreate(Sender: TObject);
    procedure sqlcPrincipalBeforeConnect(Sender: TObject);
  private
  public
  end;

var
  DmPrincipal: TDmPrincipal;

implementation

uses
  Funcoes, FuncoesWin;

{$R *.dfm}

procedure TDmPrincipal.DataModuleCreate(Sender: TObject);
begin
  inherited;
  if sqlcPrincipal.Connected then
    raise Exception.Create('Conectado.');

  try
    sqlcPrincipal.Connected := False;
    sqlcPrincipal.Connected := True;
  except
    on e: Exception do
    begin
      MsgErro('Erro de conexão.'+#13+
        'ERRO: '+e.Message);
    end;
  end;
end;

procedure TDmPrincipal.sqlcPrincipalBeforeConnect(Sender: TObject);
begin
  inherited;
  with sqlcPrincipal do
  begin
    ConnectionName := 'ESTUFAS';
    DriverName     := 'Firebird';
    GetDriverFunc  := 'getSQLDriverINTERBASE';
    LibraryName    := 'dbxfb.dll';
    VendorLib      := 'fbclient.dll';

    Params.Clear;
    Params.Add('DriverName=Firebird');
    Params.Add('Database='+ReadIniFile('CONEXAO', 'Servidor')+':'+ReadIniFile('CONEXAO', 'DB'));
    Params.Add('User_Name=SYSDBA');
    Params.Add('Password=masterkey');
    Params.Add('SQLDialect=3');
    Params.Add('Role=');
    Params.Add('ServerCharSet=');
    Params.Add('ErrorResourceFile=');
    Params.Add('LocaleCode=0000');
    Params.Add('BlobSize=-1');
    Params.Add('CommitRetain=False');
    Params.Add('WaitOnLock=True');
    Params.Add('Trim Char=False');
    Params.Add('IsolationLevel=ReadCommitted');
  end;
end;

end.
