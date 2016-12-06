unit unAgEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Mask, Buttons, DB, FMTBcd,
  DBClient, PLClientDataSet, Provider, PLDataSetProvider, SqlExpr,
  PLSQLDataSet, PLDBEdit;

type
  TfrmAgEdit = class(TForm)
    Gravar: TBitBtn;
    Desistir: TBitBtn;
    memoObs: TDBMemo;
    edtTelefone: TDBEdit;
    edtNome: TDBEdit;
    nome: TLabel;
    telefone: TLabel;
    obs: TLabel;
    sqldPadrao: TPLSQLDataSet;
    dspPadrao: TPLDataSetProvider;
    cdsPadrao: TPLClientDataSet;
    cdsPadraoCODAGENDA: TIntegerField;
    cdsPadraoNOME: TStringField;
    cdsPadraoTELEFONE: TStringField;
    cdsPadraoCELULAR: TStringField;
    cdsPadraoOBS: TStringField;
    dsPadrao: TDataSource;
    dbeCelular: TPLDBEdit;
    sqldPadraoCODAGENDA: TIntegerField;
    sqldPadraoNOME: TStringField;
    sqldPadraoTELEFONE: TStringField;
    sqldPadraoCELULAR: TStringField;
    sqldPadraoOBS: TStringField;
    procedure DesistirClick(Sender: TObject);
    procedure GravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure memoObsKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
  private
    FCodAgenda: Integer;
    procedure SetCodAgenda(const Value: Integer);
  public
    property CodAgenda: Integer read FCodAgenda write SetCodAgenda;
  end;

var
  frmAgEdit: TfrmAgEdit;

implementation



{$R *.dfm}

procedure TfrmAgEdit.DesistirClick(Sender: TObject);
begin
  cdspadrao.CancelUpdates;
  Close;
end;

procedure TfrmAgEdit.GravarClick(Sender: TObject);
begin
  if (edtNome.Text = '') then
  begin
    MessageDlg('O nome é obrigatório.',mtInformation,[mbOk],0);
    edtNome.SelectAll;
    edtNome.SetFocus;
    Exit;
  end;

  cdspadrao.ApplyUpdates(0);
  Close;
end;

procedure TfrmAgEdit.FormShow(Sender: TObject);
begin
  edtNome.SetFocus;
end;
 
procedure TfrmAgEdit.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

procedure TfrmAgEdit.memoObsKeyPress(Sender: TObject; var Key: Char);
begin
  Key := AnsiUpperCase(Key)[Length(Key)];
end;

procedure TfrmAgEdit.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  Key := AnsiUpperCase(Key)[Length(Key)];
end;

procedure TfrmAgEdit.SetCodAgenda(const Value: Integer);
begin
  FCodAgenda := Value;
  
  if FCodAgenda > 0 then
  begin
    cdsPadrao.Close;
    cdsPadrao.Params.ParamByName('CODAGENDA').AsInteger := FCodAgenda;
    cdsPadrao.Open;
    cdspadrao.Edit;
  end
  else
  begin
    cdsPadrao.Close;
    cdsPadrao.Params.ParamByName('CODAGENDA').Clear;
    cdsPadrao.Open;
    cdspadrao.Insert;
  end;
end;

end.
