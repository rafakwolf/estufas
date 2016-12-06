unit udmEmail;

interface

uses
  SysUtils, Classes, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdMessageClient, IdSMTP, IdMessage, IdIOHandler,
  IdIOHandlerSocket, IdSSLOpenSSL, IdExplicitTLSClientServerBase,
  IdSMTPBase, IdAttachmentFile, IdIOHandlerStack, IdSSL;

type
  TdmEmail = class(TDataModule)
  private
  public
    function Connect(host: string; port: Integer; UserName,password: string): Boolean;
    procedure Disconnect;
    procedure SendMail(dest, subject: string; FileList: TStrings);
  end;

var
  dmEmail: TdmEmail;

implementation

{$R *.dfm}

function TdmEmail.Connect(host: string; port: Integer; UserName,password: string): Boolean;
begin
end;

procedure TdmEmail.Disconnect;
begin
end;

procedure TdmEmail.SendMail(dest, subject: string; FileList: TStrings);
begin
end;

end.
