program ESTUFAS;

uses
  Forms,
  Windows,
  SysUtils,
  IniFiles,
  Dialogs,
  unPrincipal in 'Principal\unPrincipal.pas' {frmPrincipal},
  unCalendario in 'Utilitario\unCalendario.pas' {frmCalendario},
  unAgenda in 'Utilitario\unAgenda.pas' {frmAgenda},
  unAgEdit in 'Utilitario\unAgEdit.pas' {frmAgEdit},
  unConfig in 'Arquivo\unConfig.pas' {frmConfig},
  unBackup in 'Utilitario\unBackup.pas' {frmBackup},
  unRelatorios in 'Padrao\unRelatorios.pas' {frmRelatorios},
  unPadraoCadastro in 'Padrao\unPadraoCadastro.pas' {frmPadraoCadastro},
  unFormBasico in 'Padrao\unFormBasico.pas' {frmFormBasico},
  unPesquisa in 'Padrao\unPesquisa.pas' {frmPesquisa},
  unControle in 'Movimento\unControle.pas' {frmControle},
  unEstufas in 'Cadastro\unEstufas.pas' {frmEstufas},
  unUnidades in 'Cadastro\unUnidades.pas' {frmUnidades},
  unContasPadrao in 'Movimento\Padrao\unContasPadrao.pas' {frmContasPadrao},
  unConexao in 'Comun\unConexao.pas' {frmConexao},
  unCaixa in 'Movimento\unCaixa.pas' {frmCaixa},
  unFornecedor in 'Cadastro\unFornecedor.pas' {frmFornecedor},
  uThreadFTP in 'Ajuda\uThreadFTP.pas',
  unCliente in 'Cadastro\unCliente.pas' {frmCliente},
  udmAtualizacao in 'Atualizacao\udmAtualizacao.pas' {DmAtualizacao: TDataModule},
  unLogAtualizacao in 'Atualizacao\unLogAtualizacao.pas' {frmLogAtualizacao},
  unPlanoConta in 'Cadastro\unPlanoConta.pas' {frmPlanoConta},
  unCabecalho in 'Arquivo\unCabecalho.pas' {frmCabecalho},
  unRelListaEstufa in 'Relatorio\Estufas\unRelListaEstufa.pas' {frmRelListaEstufa},
  unContasPagar in 'Movimento\unContasPagar.pas' {frmContasPagar},
  unContasReceber in 'Movimento\unContasReceber.pas' {frmContasReceber},
  unContasManPadrao in 'Movimento\unContasManPadrao.pas' {frmContasManPadrao},
  unContasPagarMan in 'Movimento\unContasPagarMan.pas' {frmContasPagarMan},
  unContasReceberMan in 'Movimento\unContasReceberMan.pas' {frmContasReceberMan},
  uConfig in 'Arquivo\uConfig.pas',
  uPublicTypes in 'Util\uPublicTypes.pas',
  uVarGlobal in 'Util\uVarGlobal.pas',
  unPedido in 'Movimento\unPedido.pas' {frmPedido},
  unProduto in 'Cadastro\unProduto.pas' {frmProduto},
  unRelPedido in 'Movimento\Relatorio\unRelPedido.pas' {frmRelPedido},
  udmEmail in 'Principal\udmEmail.pas' {dmEmail: TDataModule},
  unDialogRelPadrao in 'Padrao\unDialogRelPadrao.pas' {frmRelDialogPadrao},
  unRelPadrao in 'Padrao\unRelPadrao.pas' {frmRelPadrao},
  unRelPadraoPortrait in 'Padrao\unRelPadraoPortrait.pas' {frmRelPadraoPortrait},
  unRelEstufa in 'Cadastro\Relatorios\unRelEstufa.pas' {frmRelEstufa},
  unRelProdEntrega in 'Movimento\Relatorio\unRelProdEntrega.pas' {frmRelProdEntrega},
  unRelPedidoPeriodo in 'Movimento\Relatorio\unRelPedidoPeriodo.pas' {frmRelPedidoPeriodo},
  unRelPedido2 in 'Movimento\Relatorio\unRelPedido2.pas' {frmRelPedido2},
  unLancCaixa in 'Movimento\unLancCaixa.pas' {frmLancCaixa},
  udmPrincipal in 'Principal\udmPrincipal.pas' {DmPrincipal: TDataModule},
  ClassesGerador in '..\Util\ClassesGerador.pas',
  ConstPadrao in '..\Util\ConstPadrao.pas',
  Extensos in '..\Util\Extensos.pas',
  Funcoes in '..\Util\Funcoes.pas',
  FuncoesWin in '..\Util\FuncoesWin.pas',
  HDFunc in '..\Util\HDFunc.pas',
  uBackupRestore in '..\Util\uBackupRestore.pas',
  uCheque in '..\Util\uCheque.pas',
  uClasses in 'Util\uClasses.pas',
  uClassMenu in '..\Util\uClassMenu.pas',
  uConfiguraRelatorio in 'Util\uConfiguraRelatorio.pas',
  uSysTray in '..\Util\uSysTray.pas',
  uThreadCopiaDiaria in '..\Util\uThreadCopiaDiaria.pas',
  udmBase in '..\Util\DataModule\udmBase.pas' {dmBase: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  ufmFormBasicoEstufas in 'Padrao\ufmFormBasicoEstufas.pas' {frmFormBasicoEstufas};

{$R *.res}

begin
  TStyleManager.TrySetStyle('Light');
  Application.Title := 'Controle de Estufas';
  Application.Initialize;

  with TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini')) do
  try
    if ReadString('CONEXAO', 'Servidor', '') = '' then
    begin
      frmConexao := TfrmConexao.Create(nil);
      try
        frmConexao.ShowModal;

        if ReadString('CONEXAO', 'Servidor', '') = '' then
        begin
          Application.MessageBox('Não é possivel iniciar o sistema sem um servidor de dados configurado.',
            'Servidor', MB_OK + MB_ICONERROR);
          Application.Terminate;
          Exit;
        end;
      finally
        FreeAndNil(frmConexao);
      end;
    end;
  finally
    Free;
  end;

  Application.CreateForm(TDmPrincipal, DmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  //frmPrincipal.UserControl.Execute;

  Application.Run;
end.
