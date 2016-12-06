unit unConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, DBCtrls, IniFiles, Grids, DBGrids,
  FMTBcd, DBClient, PLClientDataSet, Provider, PLDataSetProvider,
  DB, SqlExpr, PLSQLDataSet, PLEdit, ValEdit, PLDBGrid;

const
  TextoProcura = 'Procurar...';

type
  TfrmConfig = class(TForm)
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    dsPadrao: TDataSource;
    sqldPadrao: TPLSQLDataSet;
    dspPadrao: TPLDataSetProvider;
    cdsPadrao: TPLClientDataSet;
    sqldPadraoCODCONFIGURACAO: TIntegerField;
    sqldPadraoCHAVE: TStringField;
    sqldPadraoVALOR: TStringField;
    cdsPadraoCODCONFIGURACAO: TIntegerField;
    cdsPadraoCHAVE: TStringField;
    cdsPadraoVALOR: TStringField;
    edtProcura: TPLEdit;
    sqldValor: TPLSQLDataSet;
    dspValor: TPLDataSetProvider;
    cdsValor: TPLClientDataSet;
    sqldValorCODVALORCONFIGURACAO: TIntegerField;
    sqldValorCODCONFIGURACAO: TIntegerField;
    sqldValorVALOR: TStringField;
    cdsValorCODVALORCONFIGURACAO: TIntegerField;
    cdsValorCODCONFIGURACAO: TIntegerField;
    cdsValorVALOR: TStringField;
    sqldPadraoTIPOCAMPO: TIntegerField;
    cdsPadraoTIPOCAMPO: TIntegerField;
    pldbgConfig: TPLDBGrid;
    procedure BtnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cdsPadraoAfterScroll(DataSet: TDataSet);
    procedure edtProcuraChange(Sender: TObject);
    procedure edtProcuraEnter(Sender: TObject);
    procedure edtProcuraExit(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
    procedure pldbgConfigDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure pldbgConfigCellClick(Column: TColumn);
    procedure pldbgConfigKeyPress(Sender: TObject; var Key: Char);
    procedure pldbgConfigEnter(Sender: TObject);
  private
    function getValues(CodConfig: Integer): TStrings;
  public
  end;

var
  frmConfig: TfrmConfig;

implementation

{$R *.dfm}

procedure TfrmConfig.BtnCancelClick(Sender: TObject);
begin
  cdsPadrao.CancelUpdates;
  Close;
end;

procedure TfrmConfig.FormCreate(Sender: TObject);
begin
  cdsPadrao.Open;
end;

function TfrmConfig.getValues(CodConfig: Integer): TStrings;
begin
  Result := TStringList.Create;

  cdsValor.First;
  while not cdsValor.Eof do
  begin
    Result.Add(cdsValorVALOR.AsString);
    cdsValor.Next;
  end;
end;

procedure TfrmConfig.pldbgConfigCellClick(Column: TColumn);
begin
  pldbgConfig.SelectedIndex := 1;
  pldbgConfig.SelectedField.FocusControl;
end;

procedure TfrmConfig.pldbgConfigDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  values: TStrings;
begin
  if Column.FieldName = 'VALOR' then
  begin
    case cdsPadraoTIPOCAMPO.AsInteger of
      0:
      begin
        // campo descritivo
      end;
      1:
      begin
        Column.PickList.Clear;

        values := getValues(cdsPadraoCODCONFIGURACAO.AsInteger);
        try
          Column.PickList.AddStrings(values);
        finally
          values.Free;
        end;
      end;
    end;
  end;
end;

procedure TfrmConfig.pldbgConfigEnter(Sender: TObject);
begin
  pldbgConfig.SelectedIndex := 1;
end;

procedure TfrmConfig.pldbgConfigKeyPress(Sender: TObject; var Key: Char);
begin
  if (cdsPadraoTIPOCAMPO.AsInteger <> 0) then
    Key := #0;
end;

procedure TfrmConfig.cdsPadraoAfterScroll(DataSet: TDataSet);
begin
  cdsValor.Close;
  cdsValor.Params.ParamByName('CODCONFIGURACAO').AsInteger := cdsPadraoCODCONFIGURACAO.AsInteger;
  cdsValor.Open;
end;

procedure TfrmConfig.edtProcuraChange(Sender: TObject);
begin
  cdsPadrao.Locate('CHAVE',edtProcura.Text,[loPartialKey]);
end;

procedure TfrmConfig.edtProcuraEnter(Sender: TObject);
begin
  if edtProcura.Text = TextoProcura then
    edtProcura.Text := ''; 
end;

procedure TfrmConfig.edtProcuraExit(Sender: TObject);
begin
  if edtProcura.Text = '' then
    edtProcura.Text := TextoProcura;
end;

procedure TfrmConfig.BtnOkClick(Sender: TObject);
begin
  cdsPadrao.ApplyUpdates(0);
  Close;
end;

procedure TfrmConfig.cdsPadraoAfterInsert(DataSet: TDataSet);
begin
  cdsPadrao.Cancel;
end;

initialization
  RegisterClass(TfrmConfig);
finalization
  UnRegisterClass(TfrmConfig);

end.
