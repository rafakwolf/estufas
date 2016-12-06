unit unLogAtualizacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, ComCtrls, Funcoes, ExtCtrls;

const
  WM_INICIA_ATUALIZACAO = WM_USER+999;

type
  TfrmLogAtualizacao = class(TForm)
    mmLog: TMemo;
    ListaArquivo: TFileListBox;
    lbInfo: TLabel;
    pbProcesso: TProgressBar;
    imgLog: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function ExecutaAtualizacao: Boolean;
    procedure Mensagem(Texto: string; Cor: TColor = clBlack);
  protected
    procedure IniciaAtualizacao(var Msg: TMessage); message WM_INICIA_ATUALIZACAO;
  public
    Resultado: Boolean;
    procedure SalvaLog(pVersao: string);
  end;

var
  frmLogAtualizacao: TfrmLogAtualizacao;

implementation

uses udmAtualizacao, FuncoesWin;

{$R *.dfm}

procedure TfrmLogAtualizacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Resultado then
    ModalResult := mrOk
  else
    ModalResult := mrCancel;

  if Assigned(dmAtualizacao) then
  begin
    if dmAtualizacao.ibdbConexao.Connected then
      dmAtualizacao.Desconectar;
  end;      
    
  Action := caFree;
end;

procedure TfrmLogAtualizacao.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmAtualizacao);
end;

procedure TfrmLogAtualizacao.FormCreate(Sender: TObject);
begin
  if not Assigned(DmAtualizacao) then
    DmAtualizacao := TDmAtualizacao.Create(Self);
    
  DmAtualizacao.FormLog := Self;
  
  ClientHeight := 73;
  ClientWidth  := 553;
  pbProcesso.Position := 0;
  Resultado := False;
end;

procedure TfrmLogAtualizacao.FormShow(Sender: TObject);
begin
  PostMessageAllForms(WM_INICIA_ATUALIZACAO, Self);
end;

function TfrmLogAtualizacao.ExecutaAtualizacao: Boolean;

  function GetPastaUpdate(VersaoBanco: string): string;
  begin
    Result := IncludeTrailingBackslash(
      IncludeTrailingBackslash(ExtractFilePath(Application.ExeName))+
      'UpdateFiles')+VersaoBanco;
  end;

var
  x: Integer;
begin
  Result := True;
  try
    with dmAtualizacao do
    begin
      while GetVersaoBanco < StrToIntDef( getVersaoAppNoBuild, 0) do
      begin
        Mensagem('Atualizando banco de dados...');
        if SysUtils.DirectoryExists(GetPastaUpdate(IntToStr(GetVersaoBanco))) then
        begin
          ListaArquivo.Directory := GetPastaUpdate(IntToStr(GetVersaoBanco));
          pbProcesso.Max := ListaArquivo.Count;

          if (ListaArquivo.Count > 0) then
          begin

            for x := 0 to ListaArquivo.Count - 1 do
            begin
              LocalArquivo := ListaArquivo.Items[x];
              ExecutaScript;
              pbProcesso.Position := pbProcesso.Position + 1;
              Application.ProcessMessages;
            end;

            SalvaLog(IntToStr(GetVersaoBanco-1));
          end;
        end
        else
        begin
          Result := False;
          MsgErro('A pasta "' + IntToStr(GetVersaoBanco) + '" não foi encontrada, a atualização do sistema será interrompida.' + #13#10 +
            'Entre em contato com o suporte para solucionar o problema.');
          Break;
        end;
      end;
    end;
  except
    Result := False;
  end;
end;

procedure TfrmLogAtualizacao.IniciaAtualizacao(var Msg: TMessage);
begin
  try
    try
      dmAtualizacao.Conectar;
      Resultado := ExecutaAtualizacao;
    except
      on e: Exception do
      begin
        MsgErro(e.Message, 'Problema de atualização');
        Application.Terminate;
        Abort;
      end;
    end;
  finally
    dmAtualizacao.Desconectar;
    Close;
  end;
end;

procedure TfrmLogAtualizacao.Mensagem(Texto: string; Cor: TColor);
begin
  lbInfo.Visible := True;
  lbInfo.Font.Color := Cor;
  lbInfo.Caption := Texto;
  lbInfo.Refresh;
end;

procedure TfrmLogAtualizacao.SalvaLog(pVersao: string);
begin
  mmLog.Lines.SaveToFile(DiretorioSistema+'LogAtualizacao_'+pVersao+'.log');
  mmLog.Lines.Clear;
end;

initialization
  RegisterClass(TfrmLogAtualizacao);
finalization
  UnRegisterClass(TfrmLogAtualizacao);
end.
