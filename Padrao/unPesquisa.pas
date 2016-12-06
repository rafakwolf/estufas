unit unPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, PLEdit, Grids, DBGrids, Buttons,
  FMTBcd, SqlExpr, PLSQLDataSet, DBClient, PLClientDataSet, Provider,
  PLDataSetProvider;

type
  TConditionType = (ctIgual,ctContenha,ctComeceCom,ctTerminandoCom,ctNenhum);
  TfrmPesquisa = class(TForm)
    btnOK: TBitBtn;
    btnCancelar: TBitBtn;
    edtProcurar: TPLEdit;
    cbbCampos: TComboBox;
    cbbCondicoes: TComboBox;
    btnProcurar: TBitBtn;
    dsPesquisa: TDataSource;
    sqldPesquisa: TPLSQLDataSet;
    dspPesquisa: TPLDataSetProvider;
    cdsPesquisa: TPLClientDataSet;
    lblCampos: TLabel;
    lblCondicoes: TLabel;
    dbgPesquisa: TDBGrid;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure btnProcurarClick(Sender: TObject);
    procedure dbgPesquisaDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure FieldsInCombo;
    procedure FieldsInGrid;

    function GetCondition: TConditionType;    
  public
    class function Execute(ViewName: string; FieldReturn: string;
      var vResult: Variant): Boolean;
  end;

var
  frmPesquisa: TfrmPesquisa;

implementation

{$R *.dfm}

class function TfrmPesquisa.Execute(ViewName, FieldReturn: string;
  var vResult: Variant): Boolean;
begin
  frmPesquisa := TfrmPesquisa.Create(Application);
  with frmPesquisa do
  try
    cdsPesquisa.Close;
    sqldPesquisa.CommandText := 'select * from '+ViewName;
    cdsPesquisa.Open;

    FieldsInCombo;
    FieldsInGrid;

    cbbCampos.ItemIndex    := 0;
    cbbCondicoes.ItemIndex := 0;

    Result := ShowModal = mrOk;

    if Result and (not VarIsNull(cdsPesquisa.FieldByName(FieldReturn).AsVariant)) then
      vResult := cdsPesquisa.FieldByName(FieldReturn).AsVariant
    else
      vResult := Null;
  finally
    FreeAndNil(frmPesquisa);
  end;
end;

procedure TfrmPesquisa.FieldsInCombo;
var
  i: Integer;
begin
  for i := 0 to cdsPesquisa.FieldCount-1 do
  begin
    if (Pos('_',cdsPesquisa.Fields[i].FieldName) < 1) then
      cbbCampos.Items.Add(cdsPesquisa.Fields[i].DisplayLabel);
  end;
end;

function TfrmPesquisa.GetCondition: TConditionType;
begin
  case cbbCondicoes.ItemIndex of
    0: Result := ctIgual;
    1: Result := ctContenha;
    2: Result := ctComeceCom;
    3: Result := ctTerminandoCom
  else
    Result := ctNenhum;
  end;
end;

procedure TfrmPesquisa.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

procedure TfrmPesquisa.btnProcurarClick(Sender: TObject);
var
  Filtro, campo, value: string;
begin
  Filtro := '';

  campo  := cbbCampos.Items[cbbCampos.ItemIndex];
  value  := edtProcurar.Text;

  if campo = '' then Exit;
  if value = '' then Exit;
  
  case cdsPesquisa.FieldByName(campo).DataType of
    ftString,ftMemo,ftFmtMemo,ftWideString,ftFixedChar:
    begin
      case GetCondition of
        ctIgual         : Filtro := campo+' like '+QuotedStr(value);
        ctContenha      : Filtro := campo+' like '+QuotedStr('%'+value+'%');
        ctComeceCom     : Filtro := campo+' like '+QuotedStr(value+'%');
        ctTerminandoCom : Filtro := campo+' like '+QuotedStr('%'+value);
        ctNenhum        : Filtro := '';
      end;
    end;
    ftInteger,ftSmallint,ftWord,ftFloat,ftCurrency,ftLargeint,ftFMTBcd:
    begin
      Filtro := campo+' = '+value;
    end;
    ftDate,ftDateTime,ftTimeStamp:
    begin
      Filtro := campo+' = '+QuotedStr(value);
    end;
  end;

  if Filtro <> '' then
  begin
    cdsPesquisa.Filtered := False;
    cdsPesquisa.Filter := Filtro;
    cdsPesquisa.Filtered := True;
  end;
  
  btnOK.Enabled := not cdsPesquisa.IsEmpty;
end;

procedure TfrmPesquisa.FieldsInGrid;
var
  i: Integer;
begin
  for i := 0 to dbgPesquisa.Columns.Count-1 do
  begin
    if Pos('_', dbgPesquisa.Columns.Items[i].FieldName) > 0 then
      dbgPesquisa.Columns.Items[i].Visible := False;
  end;
end;

procedure TfrmPesquisa.dbgPesquisaDblClick(Sender: TObject);
begin
  btnOK.Click;
end;

procedure TfrmPesquisa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then
    btnCancelar.Click;
end;

end.
