unit unConexao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ImgList, ComCtrls, ExtCtrls, Buttons, DB, SqlExpr,
  Types;

type
  TfrmConexao = class(TForm)
    cbbComp: TComboBoxEx;
    ilImagens: TImageList;
    LabelServidores: TLabel;
    bbConfirma: TBitBtn;
    bbCancela: TBitBtn;
    bbCarregarServidores: TBitBtn;
    cbServidorLocal: TCheckBox;
    ConexaoRede: TSQLConnection;
    BevelLinha: TBevel;
    stbStatus: TStatusBar;
    procedure bbCarregarServidoresClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbConfirmaClick(Sender: TObject);
    procedure cbServidorLocalClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure EnabledButtons(Enabled: Boolean);
  public
    function Rede(ServerName, AliasName: String): Boolean;
  end;

var
  frmConexao: TfrmConexao;

implementation

uses Funcoes, FuncoesWin;

{$R *.dfm}

procedure TfrmConexao.bbCarregarServidoresClick(Sender: TObject);
var
  x: Integer;
  sl: TStrings;
begin
  stbStatus.SimpleText := ' Iniciando busca...';
  cbbComp.Clear;
  cbbComp.Items.Clear;
  EnabledButtons(False);
  try
    sl := TStringList.Create;
    ScanNetworkResources(RESOURCETYPE_DISK, RESOURCEDISPLAYTYPE_SERVER, sl);

    for  x := 0 to sl.Count - 1 do
    begin
      if (sl[x] <> '') then
      begin
        if Rede(sl[x], 'ESTUFAS') then
          cbbComp.ItemsEx.AddItem(sl[x], 1,1,1, 0, nil)
        else
          cbbComp.ItemsEx.AddItem(sl[x], 0,0,0, 0, nil);
      end;
    end;
  finally
    cbbComp.Enabled := True;
    cbbComp.DroppedDown := True;
    stbStatus.SimpleText := ' Operação Finalizada...';
    EnabledButtons(True);
    sl.Free;
  end;  
end;

procedure TfrmConexao.FormShow(Sender: TObject);
var
  OldServer: String;
begin
  OldServer := ReadIniFile('CONEXAO', 'Servidor');
  if OldServer <> '' then
  begin
    cbbComp.ItemsEx.AddItem(OldServer, 1,1,1, 0, nil);
    cbbComp.ItemIndex := 0;
  end;

  cbServidorLocal.Checked := (OldServer = '127.0.0.1');

  ForceForegroundWindow(Handle);
end;

procedure TfrmConexao.bbConfirmaClick(Sender: TObject);
begin
  if (cbbComp.Text <> '') then
    WriteIniFile('CONEXAO', 'Servidor', cbbComp.Text)
  else
  begin
    MsgCuidado('Escolha o servidor antes de prosseguir.');
    ModalResult := mrNone;
    Exit;
  end;
end;

procedure TfrmConexao.cbServidorLocalClick(Sender: TObject);
begin
  cbbComp.Enabled := not cbServidorLocal.Checked;
  bbCarregarServidores.Enabled := not cbServidorLocal.Checked;
  if cbServidorLocal.Checked then
  begin
    cbbComp.ItemsEx.Clear;
    cbbComp.ItemsEx.AddItem('127.0.0.1', 1,1,1, 0, nil);
    cbbComp.ItemIndex := 0;
    bbConfirma.Enabled := True;
  end;
end;

function TfrmConexao.Rede(ServerName, AliasName: String): Boolean;
begin
  stbStatus.SimpleText := ' Verificando: ' + ServerName + '...';
  Application.ProcessMessages;
end;

procedure TfrmConexao.FormCreate(Sender: TObject);
begin
  SetDialogForm(Self);
  stbStatus.SimpleText := EmptyStr;
end;

procedure TfrmConexao.EnabledButtons(Enabled: Boolean);
begin
  bbConfirma.Enabled := Enabled;
  bbCancela.Enabled := Enabled;
  bbCarregarServidores.Enabled := Enabled;
end;

procedure TfrmConexao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
