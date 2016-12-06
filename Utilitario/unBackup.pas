unit unBackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Funcoes, Gauges, StdCtrls, Buttons, Mask, FileCtrl,
  ComCtrls, IniFiles, ExtCtrls, System.Zip;

type
  TfrmBackup = class(TForm)
    btnFechar: TBitBtn;
    Memo: TMemo;
    btnCopy: TBitBtn;
    chDirAutomatico: TCheckBox;
    edtDestino: TLabeledEdit;
    btnOpenDestino: TBitBtn;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure btnCopyClick(Sender: TObject);
    procedure chDirAutomaticoClick(Sender: TObject);
    procedure btnOpenDestinoClick(Sender: TObject);
  private
    Arq : TIniFile;
    
    procedure GravaDiretorio;
    procedure LeDiretorio;
  public
  end;

var
  frmBackup : TfrmBackup;

implementation



{$R *.dfm}

procedure TfrmBackup.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBackup.GravaDiretorio;
begin
  try
    Arq := TIniFile.Create(DiretorioSistema+'BACKUP.INI');
    Arq.WriteString('BACKUP','Destino',edtDestino.Text);

    if(chDirAutomatico.Checked)then
      Arq.WriteString('BACKUP','DirDefault','1')
    else
      Arq.WriteString('BACKUP','DirDefault','0');
  finally
    Arq.Free;
  end;
end;

procedure TfrmBackup.LeDiretorio;
begin
  try
    Arq := TIniFile.Create(DiretorioSistema+'BACKUP.INI');
    edtDestino.Text := Arq.ReadString('BACKUP','Destino','');

    if(Arq.ReadString('BACKUP','DirDefault','') = '1')then
    begin
      chDirAutomatico.Checked := True;
      chDirAutomatico.OnClick(Self);
    end
    else
    begin
      chDirAutomatico.Checked := False;
      chDirAutomatico.OnClick(Self);
    end;  
  finally
    Arq.Free;
  end;
end;

procedure TfrmBackup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaDiretorio;
end;

procedure TfrmBackup.FormShow(Sender: TObject);
begin
  LeDiretorio;
end;

procedure TfrmBackup.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

procedure TfrmBackup.btnCopyClick(Sender: TObject);
var zip: TZipFile;
begin
  btnCopy.Enabled := False;
  Memo.Lines.Clear;
  Sleep(500);
  Memo.Lines.Add('Iniciando cópia...');

  if not(SysUtils.DirectoryExists(ExtractFilePath(application.ExeName)+'Backup\')) then
  begin
    if not(CreateDir(ExtractFilePath(Application.ExeName)+'Backup\'))then
    begin
      Memo.Lines.Add('Impossível criar a pasta Backup...');
      btnCopy.Enabled := True;
      Exit;
    end;
  end;

  Sleep(500);
  Memo.Lines.Add('Criando pasta destino...');
  Sleep(500);
  Memo.Lines.Add('Buscando arquivos...');
  Sleep(500);

  if (chDirAutomatico.Checked) then
  begin
    zip := TZipFile.Create;
    try
      zip.Add('Database\*.fdb',
        ExtractFilePath(Application.ExeName)+'Backup\Copia_'+FormatDateTime('dd_mm_yyyy',date)+'.zip');
    finally
      zip.free;
    end;
  end
  else
  begin
    if (edtDestino.Text = '') then
    begin
      MsgErro('Defina o destino da cópia','Erro');
      btnCopy.Enabled := True;
      Exit;
    end;

    zip := TZipFile.Create;
    try
      zip.Add('Database\*.fdb',
        IncludeTrailingPathDelimiter(edtDestino.Text)+'Copia_'+FormatDateTime('dd_mm_yyyy',date)+'.zip');
    finally
      zip.free;
    end;
  end;

  Memo.Lines.Add('Copiando, aguarde...');
  Sleep(1000);

  Memo.Lines.Add('Cópia realizada com sucesso!');

  btnCopy.Enabled := True;
end;

procedure TfrmBackup.chDirAutomaticoClick(Sender: TObject);
begin
  edtDestino.Enabled := not chDirAutomatico.Checked;

  if not edtDestino.Enabled then
  begin
    edtDestino.Clear;
    edtDestino.Color := clBtnFace;
  end
  else
  begin
    edtDestino.Color := clWindow;
  end;
end;

procedure TfrmBackup.btnOpenDestinoClick(Sender: TObject);
var
  S: string; 
begin
  if SelectDirectory('Destino da cópia','',S) then
    edtDestino.Text := S;
end;

initialization
  RegisterClass(TfrmBackup);
finalization
  UnRegisterClass(TfrmBackup);

end.
