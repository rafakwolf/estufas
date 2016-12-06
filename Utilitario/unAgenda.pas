unit unAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, ExtCtrls, Grids, DBGrids, ToolWin,
  ComCtrls, Buttons, Menus, Tabs, FMTBcd, DBClient, PLClientDataSet,
  Provider, PLDataSetProvider, DB, SqlExpr, PLSQLDataSet;

type
  TfrmAgenda = class(TForm)
    Menu: TPopupMenu;
    mInserir: TMenuItem;
    mEditar: TMenuItem;
    N1: TMenuItem;
    mExcluir: TMenuItem;
    btnCadastrar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnFechar: TSpeedButton;
    TabPesq: TTabSet;
    Grade: TDBGrid;
    edtPesq: TLabeledEdit;
    dbnNavegador: TDBNavigator;
    sqldPadrao: TPLSQLDataSet;
    dspPadrao: TPLDataSetProvider;
    cdsPadrao: TPLClientDataSet;
    sqldPadraoCODAGENDA: TIntegerField;
    sqldPadraoNOME: TStringField;
    sqldPadraoTELEFONE: TStringField;
    sqldPadraoCELULAR: TStringField;
    sqldPadraoOBS: TStringField;
    cdsPadraoCODAGENDA: TIntegerField;
    cdsPadraoNOME: TStringField;
    cdsPadraoTELEFONE: TStringField;
    cdsPadraoCELULAR: TStringField;
    cdsPadraoOBS: TStringField;
    dsPadrao: TDataSource;
    procedure Btn_TODOSClick(Sender: TObject);
    procedure mInserirClick(Sender: TObject);
    procedure mEditarClick(Sender: TObject);
    procedure mExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure TabPesqClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edtPesqChange(Sender: TObject);
    procedure GradeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure Filtra(Valor: String; Numero: Integer);
  public
  end;

var
  frmAgenda: TfrmAgenda;

implementation

uses
  unAgEdit, Funcoes;

{$R *.dfm}

procedure TfrmAgenda.Filtra(Valor: String; Numero: Integer);
begin
  case Numero of
    0  : Valor := 'A';
    1  : Valor := 'B';
    2  : Valor := 'C';
    3  : Valor := 'D';
    4  : Valor := 'E';
    5  : Valor := 'F';
    6  : Valor := 'G';
    7  : Valor := 'H';
    8  : Valor := 'I';
    9  : Valor := 'J';
    10 : Valor := 'K';
    11 : Valor := 'L';
    12 : Valor := 'M';
    13 : Valor := 'N';
    14 : Valor := 'O';
    15 : Valor := 'P';
    16 : Valor := 'Q';
    17 : Valor := 'R';
    18 : Valor := 'S';
    19 : Valor := 'T';
    20 : Valor := 'Y';
    21 : Valor := 'U';
    22 : Valor := 'V';
    23 : Valor := 'W';
    24 : Valor := 'X';
    25 : Valor := 'Z';
  end;

  cdsPadrao.Filtered := False;
  cdsPadrao.Filter   := 'upper(NOME) like '+QuotedStr(Valor+'%');
  cdsPadrao.Filtered := True;
end;

procedure TfrmAgenda.Btn_TODOSClick(Sender: TObject);
begin
  cdsPadrao.Filtered := False;   
end;

procedure TfrmAgenda.mInserirClick(Sender: TObject);
begin
  frmAgEdit := TfrmAgEdit.Create(self);
  frmAgEdit.CodAgenda := 0;
  frmAgEdit.Caption := 'Incluir contato';
  frmAgEdit.ShowModal;
  FreeAndNil(frmAgEdit);

  cdsPadrao.Close;
  cdsPadrao.Open;
end;

procedure TfrmAgenda.mEditarClick(Sender: TObject);
begin
  frmAgEdit := TfrmAgEdit.Create(self);
  frmAgEdit.CodAgenda := cdsPadraoCODAGENDA.AsInteger;
  frmAgEdit.Caption := 'Editar contato';  
  frmAgEdit.ShowModal;
  FreeAndNil(frmAgEdit);

  cdsPadrao.Close;
  cdsPadrao.Open;  
end;

procedure TfrmAgenda.mExcluirClick(Sender: TObject);
begin
  if cdspadrao.IsEmpty then
    Exit;

  if MsgSN('Excluir '+cdsPadraoNOME.AsString+'?','Confirme') then
  begin
    cdspadrao.Delete;
    cdspadrao.ApplyUpdates(0);
  end;  
end;

procedure TfrmAgenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_f1 then
    mInserir.Click;

  if key = vk_f2 then
    mEditar.Click;
    
  if key = vk_delete then
    mExcluir.Click;
end;
 
procedure TfrmAgenda.FormShow(Sender: TObject);
begin
  cdspadrao.Open;
end;

procedure TfrmAgenda.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

procedure TfrmAgenda.TabPesqClick(Sender: TObject);
begin
  Filtra('',TabPesq.TabIndex);
end;

procedure TfrmAgenda.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAgenda.edtPesqChange(Sender: TObject);
begin
  LocalizarSimples(cdsPadrao,'NOME',edtPesq.Text);
end;

procedure TfrmAgenda.GradeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if State = [] then
  begin
    if cdsPadrao.RecNo mod 2 = 1 then
      Grade.Canvas.Brush.Color := $00F0F0F0
    else
      Grade.Canvas.Brush.Color := clWhite;
  end;
  
  Grade.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmAgenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cdsPadrao.Close;
end;

initialization
  RegisterClass(TfrmAgenda);
finalization
  UnRegisterClass(TfrmAgenda);

end.
