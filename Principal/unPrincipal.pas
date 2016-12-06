unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, Menus, Buttons, ExtCtrls, StdCtrls, Jpeg, ImgList,
  IniFiles, AppEvnts, Registry, ActnList, FuncoesWin,
  System.Actions, Winapi.ShellAPI;

type
  TfrmPrincipal = class(TForm)
    Status: TStatusBar;
    SetupImpressora: TPrinterSetupDialog;
    MenuPrincipal: TMainMenu;
    Mnu_Arquivo: TMenuItem;
    Mnu_Usuarios: TMenuItem;
    Mnu_ConfigImp: TMenuItem;
    Mnu_TrocaUsu: TMenuItem;
    N8: TMenuItem;
    Mnu_Sair: TMenuItem;
    Mnu_Utilitarios: TMenuItem;
    Mnu_Calend: TMenuItem;
    Mnu_Calc: TMenuItem;
    Mnu_Agenda: TMenuItem;
    Mnu_Mov: TMenuItem;
    Mnu_Cadastros: TMenuItem;
    Mnu_Estufas: TMenuItem;
    Mnu_Rel: TMenuItem;
    Mnu_RelEst: TMenuItem;
    Mnu_Ajuda: TMenuItem;
    Mnu_Sobre: TMenuItem;
    N1: TMenuItem;
    Mnu_Controle: TMenuItem;
    N7: TMenuItem;
    N2: TMenuItem;
    Mnu_RelControle: TMenuItem;
    Mnu_UnVenda: TMenuItem;
    N4: TMenuItem;
    Mnu_CP: TMenuItem;
    aplicaEventos: TApplicationEvents;
    Mnu_RelEstListagem: TMenuItem;
    Mnu_RelEstListData: TMenuItem;
    Mnu_RelEstMetros: TMenuItem;
    Mnu_RelContListagem: TMenuItem;
    Mnu_RelContListData: TMenuItem;
    Mnu_RelContListEst: TMenuItem;
    Mnu_CR: TMenuItem;
    Mnu_ConfigLoc: TMenuItem;
    PanelBotoes: TPanel;
    btnAgenda: TSpeedButton;
    btnEstufas: TSpeedButton;
    btnControle: TSpeedButton;
    btnCR: TSpeedButton;
    btnCP: TSpeedButton;
    btnFechar: TSpeedButton;
    N6: TMenuItem;
    Mnu_Backup: TMenuItem;
    Mnu_TrocarSenha: TMenuItem;
    ListaAcoes: TActionList;
    ac_Usuarios: TAction;
    ac_TrocaSenha: TAction;
    ac_TrocaUsuario: TAction;
    ac_Config: TAction;
    ac_Impressora: TAction;
    ac_Calendario: TAction;
    ac_Calculadora: TAction;
    ac_Agenda: TAction;
    ac_Backup: TAction;
    ac_Controle: TAction;
    ac_ContasPagar: TAction;
    ac_ContasReceber: TAction;
    ac_CadEstufas: TAction;
    ac_CadUn: TAction;
    ac_RelEstufas: TAction;
    ac_RelEstData: TAction;
    ac_RelEstMetros: TAction;
    ac_RelControle: TAction;
    ac_RelContData: TAction;
    ac_RelContEstufa: TAction;
    Mnu_Editor: TMenuItem;
    ac_Editor: TAction;
    clbrPrincipal: TCoolBar;
    btnPedido: TSpeedButton;
    ac_Fornecedor: TAction;
    miFornecedor: TMenuItem;
    ac_Atualizacao: TAction;
    Mnu_Atualizacao: TMenuItem;
    btnAtualizar: TSpeedButton;
    pnlUpdate: TPanel;
    lblUpdate: TLabel;
    pbUPdate: TProgressBar;
    ac_Cliente: TAction;
    Mnu_Cliente: TMenuItem;
    ac_PlanoConta: TAction;
    miPlanoConta: TMenuItem;
    ac_Cabecalho: TAction;
    N3: TMenuItem;
    miCabecalho: TMenuItem;
    ac_Pedido: TAction;
    N5: TMenuItem;
    mnu_Pedido: TMenuItem;
    btnCliente: TSpeedButton;
    btnProduto: TSpeedButton;
    ac_Produto: TAction;
    mnu_Produto: TMenuItem;
    N9: TMenuItem;
    miRelPedidos: TMenuItem;
    miProdutoEntrega: TMenuItem;
    ac_ProdEntrega: TAction;
    ac_RelPedidoPeriodo: TAction;
    miRelPedidoPeriodo: TMenuItem;
    ac_Caixa: TAction;
    N10: TMenuItem;
    mnu_Caixa: TMenuItem;
    btnCaixa: TSpeedButton;
    bhHint: TBalloonHint;
    procedure Mnu_SairClick(Sender: TObject);
    procedure Mnu_SobreClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aplicaEventosException(Sender: TObject; E: Exception);
    procedure btnAgendaClick(Sender: TObject);
    procedure btnEstufasClick(Sender: TObject);
    procedure btnControleClick(Sender: TObject);
    procedure btnCPClick(Sender: TObject);
    procedure btnCRClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure ac_ConfigExecute(Sender: TObject);
    procedure ac_ImpressoraExecute(Sender: TObject);
    procedure ac_CalendarioExecute(Sender: TObject);
    procedure ac_CalculadoraExecute(Sender: TObject);
    procedure ac_AgendaExecute(Sender: TObject);
    procedure ac_BackupExecute(Sender: TObject);
    procedure ac_ControleExecute(Sender: TObject);
    procedure ac_ContasPagarExecute(Sender: TObject);
    procedure ac_ContasReceberExecute(Sender: TObject);
    procedure ac_CadEstufasExecute(Sender: TObject);
    procedure ac_CadUnExecute(Sender: TObject);
    procedure ac_EditorExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UserControlLoginSucess(Sender: TObject; IdUser: Integer;
      Usuario, Nome, Senha, Email: String; Privileged: Boolean);
    procedure ac_FornecedorExecute(Sender: TObject);
    procedure ac_AtualizacaoExecute(Sender: TObject);
    procedure pnlUpdateMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure ac_ClienteExecute(Sender: TObject);
    procedure ac_PlanoContaExecute(Sender: TObject);
    procedure ac_CabecalhoExecute(Sender: TObject);
    procedure ac_RelEstufasExecute(Sender: TObject);
    procedure ac_PedidoExecute(Sender: TObject);
    procedure btnPedidoClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure ac_ProdutoExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ac_ProdEntregaExecute(Sender: TObject);
    procedure ac_RelPedidoPeriodoExecute(Sender: TObject);
    procedure ac_CaixaExecute(Sender: TObject);
    procedure btnCaixaClick(Sender: TObject);
  private
    procedure UpdateMax(max: Integer);
    procedure UpdatePos(pos: Integer);
    procedure UpdateError(MsgError: string);
    procedure UpdateInitialize(Sender: TObject);
    procedure UpdateNoNewVersion(Sender: TObject);
    procedure UpdateFinalize(Sender: TObject);

    procedure InitConfig;
  public
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  Funcoes, uThreadFTP, uVarGlobal,
  unRelProdEntrega, unRelPedidoPeriodo, unRelEstufa;

{$R *.DFM}

procedure TfrmPrincipal.Mnu_SairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.Mnu_SobreClick(Sender: TObject);
begin
  Application.MessageBox(PChar('---------------------------' + #13 +
        'CER - Controle de Estufas' + #13 + 'Versão - ' + GetVersaoAppNoBuild + #13 +
        '---------------------------'), 'Sobre', MB_ICONINFORMATION + MB_OK);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  Application.HintPause := 0;
  Application.HintHidePause := 10000;
  Caption := Caption + ' - ' + GetVersaoAppNoBuild;

  ReordenaBotoes([btnAgenda, btnEstufas, btnControle, btnCliente, btnProduto,
    btnPedido, btnCaixa, btnCR, btnCP, btnAtualizar, btnFechar]);

  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TSpeedButton then
    begin
      TSpeedButton(Components[i]).Flat := True;
      TSpeedButton(Components[i]).CustomHint := bhHint;
    end;
  end;

  InitConfig;
end;

procedure TfrmPrincipal.aplicaEventosException(Sender: TObject; E: Exception);
var
  ErrorFile: TStrings;
  path: string;
begin
  ErrorFile := TStringList.Create;
  try
    path := DiretorioSistema + 'Erros.txt';

    if FileExists(path) then
      ErrorFile.LoadFromFile(path);

    ErrorFile.Append(DateTimeToStr(Now) + ' - ' + E.Message);

    ErrorFile.SaveToFile(path);
  finally
    ErrorFile.Free;
  end;

  MsgErro('Ocorreu uma ação inesperada na aplicação.' + #13#13 +
      'Mensagem de erro:' + #13 + '[ ' + E.Message + ' ]' + #13#13 +
      'Informe-o ao programador do sistema.', 'Ação Inesperada');
end;

procedure TfrmPrincipal.btnAgendaClick(Sender: TObject);
begin
  if (Mnu_Agenda.Enabled) then
    Mnu_Agenda.Click;
end;

procedure TfrmPrincipal.btnEstufasClick(Sender: TObject);
begin
  if (Mnu_Estufas.Enabled) then
    Mnu_Estufas.Click;
end;

procedure TfrmPrincipal.btnControleClick(Sender: TObject);
begin
  if (Mnu_Controle.Enabled) then
    Mnu_Controle.Click;
end;

procedure TfrmPrincipal.btnCPClick(Sender: TObject);
begin
  if (Mnu_CP.Enabled) then
    Mnu_CP.Click;
end;

procedure TfrmPrincipal.btnCRClick(Sender: TObject);
begin
  if (Mnu_CR.Enabled) then
    Mnu_CR.Click;
end;

procedure TfrmPrincipal.btnFecharClick(Sender: TObject);
begin
  if (Mnu_Sair.Enabled) then
    Mnu_Sair.Click;
end;

procedure TfrmPrincipal.ac_ConfigExecute(Sender: TObject);
begin
  ChamaForm('TfrmConfig', TAction(Sender).Caption, self);
end;

procedure TfrmPrincipal.ac_ImpressoraExecute(Sender: TObject);
begin
  if PrinterExists then
    SetupImpressora.Execute;
end;

procedure TfrmPrincipal.ac_CalendarioExecute(Sender: TObject);
begin
  ChamaForm('TfrmCalendario', TAction(Sender).Caption, self);
end;

procedure TfrmPrincipal.ac_CalculadoraExecute(Sender: TObject);
begin
  ShellExecute(0,'open',PChar('calc.exe'),nil,nil,SW_SHOWNORMAL);
end;

procedure TfrmPrincipal.ac_AgendaExecute(Sender: TObject);
begin
  ChamaForm('TfrmAgenda', TAction(Sender).Caption, self);
end;

procedure TfrmPrincipal.ac_BackupExecute(Sender: TObject);
begin
  ChamaForm('TfrmBackup', TAction(Sender).Caption, self);
end;

procedure TfrmPrincipal.ac_ControleExecute(Sender: TObject);
begin
  ChamaForm('TfrmControle', TAction(Sender).Caption, self);
end;

procedure TfrmPrincipal.ac_ContasPagarExecute(Sender: TObject);
begin
  ChamaForm('TfrmContasPagar', TAction(Sender).Caption, self);
end;

procedure TfrmPrincipal.ac_ContasReceberExecute(Sender: TObject);
begin
  ChamaForm('TfrmContasReceber', TAction(Sender).Caption, self);
end;

procedure TfrmPrincipal.ac_CadEstufasExecute(Sender: TObject);
begin
  ChamaForm('TfrmEstufas', TAction(Sender).Caption, self);
end;

procedure TfrmPrincipal.ac_CadUnExecute(Sender: TObject);
begin
  ChamaForm('TfrmUnidades', TAction(Sender).Caption, self);
end;

procedure TfrmPrincipal.ac_EditorExecute(Sender: TObject);
begin
  ShellExecute(0,'open',PChar('wordpad.exe'),nil,nil,SW_SHOWNORMAL);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  SetForegroundWindow(handle);
  Status.Panels[2].Text := DataExtenso(Date);
end;

procedure TfrmPrincipal.UserControlLoginSucess(Sender: TObject;
  IdUser: Integer; Usuario, Nome, Senha, Email: String; Privileged: Boolean);
begin
  Status.Panels[1].Text := Usuario;
end;

procedure TfrmPrincipal.ac_FornecedorExecute(Sender: TObject);
begin
  ChamaForm('TfrmFornecedor', TAction(Sender).Caption, self);
end;

procedure TfrmPrincipal.ac_AtualizacaoExecute(Sender: TObject);
var
  ftp: TFTPUpdate;
begin
  ftp := TFTPUpdate.Start(GetVersaoAppNoBuild);
  try
    ftp.OnMax := UpdateMax;
    ftp.OnPos := UpdatePos;
    ftp.OnInitialize := UpdateInitialize;
    ftp.OnError := UpdateError;
    ftp.OnNoNewVersion := UpdateNoNewVersion;
    ftp.OnTerminate := UpdateFinalize;

    ftp.Resume;
  except
    on E: Exception do
    begin
      MsgErro('Erro tentando iniciar verificação de atualização.' + #13 +
          'ERRO: ' + E.Message);
    end;
  end;
end;

procedure TfrmPrincipal.UpdateError(MsgError: string);
begin
  pnlUpdate.Visible := False;
  MsgErro('Houve um erro ao tentar verificar a versão.' + #13 + 'ERRO: ' +
      MsgError);
end;

procedure TfrmPrincipal.UpdateInitialize(Sender: TObject);
begin
  lblUpdate.Caption := 'Iniciando download...';
  pnlUpdate.Visible := True;
  pnlUpdate.Top := clbrPrincipal.Height + 10;
  pnlUpdate.Left := 10;
  Application.ProcessMessages;
end;

procedure TfrmPrincipal.UpdateMax(max: Integer);
begin
  pbUPdate.max := max;
  Application.ProcessMessages;
end;

procedure TfrmPrincipal.UpdateNoNewVersion(Sender: TObject);
begin
  MsgAviso('Você já tem a versão mais nova deste software.', 'Atualização');
end;

procedure TfrmPrincipal.UpdatePos(pos: Integer);
begin
  lblUpdate.Caption := IntToStr(pos) + ' Kb baixados...';
  pbUPdate.Position := pos;
  Application.ProcessMessages;
end;

procedure TfrmPrincipal.pnlUpdateMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  pnlUpdate.Perform(WM_SYSCOMMAND, $F012, 0);
  ReleaseCapture;
end;

procedure TfrmPrincipal.UpdateFinalize(Sender: TObject);
begin
  if pnlUpdate.Visible then
  begin
    lblUpdate.Caption := 'Download finalizado.';
    if FileExists(DiretorioSistema + 'UpdateCER.exe') then
    begin
      if MsgSN('Deseja efetuar a instalação agora?') then
      begin

        Application.Terminate;
      end;
    end;
  end;

  pnlUpdate.Visible := False;
end;

procedure TfrmPrincipal.ac_ClienteExecute(Sender: TObject);
begin
  ChamaForm('TfrmCliente', TAction(Sender).Caption, self);
end;

procedure TfrmPrincipal.ac_PlanoContaExecute(Sender: TObject);
begin
  ChamaForm('TfrmPlanoConta', TAction(Sender).Caption, self);
end;

procedure TfrmPrincipal.ac_CabecalhoExecute(Sender: TObject);
begin
  ChamaForm('TfrmCabecalho', TAction(Sender).Caption, self);
end;

procedure TfrmPrincipal.ac_RelEstufasExecute(Sender: TObject);
begin
  frmRelEstufa := TfrmRelEstufa.Create(nil);
  frmRelEstufa.btnVisualizar.Click;
  frmRelEstufa.Release;
end;

procedure TfrmPrincipal.InitConfig;
begin

end;

procedure TfrmPrincipal.ac_PedidoExecute(Sender: TObject);
begin
  ChamaForm('TfrmPedido', TAction(Sender).Caption, self);
end;

procedure TfrmPrincipal.btnPedidoClick(Sender: TObject);
begin
  if mnu_Pedido.Enabled then
    mnu_Pedido.Click;
end;

procedure TfrmPrincipal.btnCaixaClick(Sender: TObject);
begin
  if mnu_Caixa.Enabled then
    mnu_Caixa.Click;
end;

procedure TfrmPrincipal.btnClienteClick(Sender: TObject);
begin
  if Mnu_Cliente.Enabled then
    Mnu_Cliente.Click;
end;

procedure TfrmPrincipal.btnProdutoClick(Sender: TObject);
begin
  if mnu_Produto.Enabled then
    mnu_Produto.Click;
end;

procedure TfrmPrincipal.ac_ProdutoExecute(Sender: TObject);
begin
  ChamaForm('TfrmProduto', TAction(Sender).Caption, self);
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  Config.Free;
end;

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := MsgSN('Deseja finalizar o programa?', 'Finalizando');
end;

procedure TfrmPrincipal.ac_ProdEntregaExecute(Sender: TObject);
begin
  frmRelProdEntrega := TfrmRelProdEntrega.Create(nil);
  frmRelProdEntrega.ShowModal;
  FreeAndNil(frmRelProdEntrega);
end;

procedure TfrmPrincipal.ac_RelPedidoPeriodoExecute(Sender: TObject);
begin
  frmRelPedidoPeriodo := TfrmRelPedidoPeriodo.Create(nil);
  frmRelPedidoPeriodo.ShowModal;
  frmRelPedidoPeriodo.Release;
end;

procedure TfrmPrincipal.ac_CaixaExecute(Sender: TObject);
begin
  ChamaForm('TfrmCaixa', 'Caixa', self);
end;

end.
