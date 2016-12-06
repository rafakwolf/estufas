unit unPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadraoCadastro, ActnList,  DB, Menus, Buttons,
  ExtCtrls, FMTBcd, DBClient, PLClientDataSet, Provider, PLDataSetProvider,
  SqlExpr, PLSQLDataSet, Grids, DBGrids,  StdCtrls, Mask, DBCtrls,
  PLDBEdit, ComCtrls, PLDBEditDateTimePicker, System.Actions, PLDBGrid;

type
  TfrmPedido = class(TfrmPadraoCadastro)
    sqldPadrao: TPLSQLDataSet;
    dspPadrao: TPLDataSetProvider;
    cdsPadrao: TPLClientDataSet;
    sqldPadraoCODPEDIDO: TIntegerField;
    sqldPadraoCODCLIENTE: TIntegerField;
    sqldPadraoDATAPEDIDO: TDateField;
    sqldPadraoITENS: TIntegerField;
    sqldPadraoTOTALDESCONTO: TFMTBCDField;
    sqldPadraoTOTAL: TFMTBCDField;
    sqldPadraoCLIENTE: TStringField;
    cdsPadraoCODPEDIDO: TIntegerField;
    cdsPadraoCODCLIENTE: TIntegerField;
    cdsPadraoDATAPEDIDO: TDateField;
    cdsPadraoITENS: TIntegerField;
    cdsPadraoTOTALDESCONTO: TFMTBCDField;
    cdsPadraoTOTAL: TFMTBCDField;
    cdsPadraoCLIENTE: TStringField;
    sqldItem: TPLSQLDataSet;
    dspItem: TPLDataSetProvider;
    cdsItem: TPLClientDataSet;
    dsItem: TDataSource;
    sqldItemCODITEMPEDIDO: TIntegerField;
    sqldItemCODPEDIDO: TIntegerField;
    sqldItemCODPRODUTO: TIntegerField;
    sqldItemVALOR: TFMTBCDField;
    sqldItemDESCONTO: TFMTBCDField;
    sqldItemQTDE: TFMTBCDField;
    sqldItemPRODUTO: TStringField;
    sqldItemVALORUNITARIO: TFMTBCDField;
    cdsItemCODITEMPEDIDO: TIntegerField;
    cdsItemCODPEDIDO: TIntegerField;
    cdsItemCODPRODUTO: TIntegerField;
    cdsItemVALOR: TFMTBCDField;
    cdsItemDESCONTO: TFMTBCDField;
    cdsItemQTDE: TFMTBCDField;
    cdsItemPRODUTO: TStringField;
    cdsItemVALORUNITARIO: TFMTBCDField;
    dbeCliente: TPLDBEdit;
    dbeNItens: TPLDBEdit;
    dbeTotalDesc: TPLDBEdit;
    dbeTotal: TPLDBEdit;
    dtpDataPedido: TPLDBEditDateTimePicker;
    sqldItemSUBTOTAL: TFMTBCDField;
    cdsItemSUBTOTAL: TFMTBCDField;
    bvlSepProdutos: TBevel;
    sqldProduto: TPLSQLDataSet;
    dspProduto: TPLDataSetProvider;
    cdsProduto: TPLClientDataSet;
    dsProduto: TDataSource;
    sqldProdutoCODPRODUTO: TIntegerField;
    sqldProdutoNOMEPRODUTO: TStringField;
    sqldProdutoQDTE: TFMTBCDField;
    sqldProdutoDESCONTO: TFMTBCDField;
    sqldProdutoVALOR: TFMTBCDField;
    sqldProdutoSUBTOTAL: TFMTBCDField;
    cdsProdutoCODPRODUTO: TIntegerField;
    cdsProdutoNOMEPRODUTO: TStringField;
    cdsProdutoQDTE: TFMTBCDField;
    cdsProdutoDESCONTO: TFMTBCDField;
    cdsProdutoVALOR: TFMTBCDField;
    cdsProdutoSUBTOTAL: TFMTBCDField;
    dbeCodProduto: TDBEdit;
    dbeNomeProduto: TDBEdit;
    dbeQtde: TDBEdit;
    dbeDesconto: TDBEdit;
    dbeValorUnit: TDBEdit;
    dbeSubTotal: TDBEdit;
    btnBuscaProduto: TBitBtn;
    btnAddProduto: TBitBtn;
    pmItems: TPopupMenu;
    miExcluirItem: TMenuItem;
    pldbgItensPedido: TPLDBGrid;
    procedure cdsPadraoCODCLIENTEValidate(Sender: TField);
    procedure dbeClienteClickButton(Sender: TObject);
    procedure PLFormConfigBeforePost(Sender: TObject);
    procedure rdbgItemExit(Sender: TObject);
    procedure PLFormConfigPrint(Sender: TObject);
    procedure btnBuscaProdutoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAddProdutoClick(Sender: TObject);
    procedure cdsProdutoCODPRODUTOValidate(Sender: TField);
    procedure dbeQtdeExit(Sender: TObject);
    procedure dbeDescontoExit(Sender: TObject);
    procedure dbeValorUnitExit(Sender: TObject);
    procedure cdsItemAfterPost(DataSet: TDataSet);
    procedure cdsPadraoNewRecord(DataSet: TDataSet);
    procedure miExcluirItemClick(Sender: TObject);
    procedure dbeSubTotalExit(Sender: TObject);
    procedure dbeNomeProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PLFormConfigAfterCancelUpdates(Sender: TObject);
    procedure cdsItemBeforeDelete(DataSet: TDataSet);
    procedure cdsItemAfterDelete(DataSet: TDataSet);
    procedure cdsItemAfterInsert(DataSet: TDataSet);
  private
    ItemDeleted: Boolean;

    procedure CountItens;
    procedure CalculaSubTotal;
    procedure CalculaValorUnitario;

    function getValorProduto(IdProduto: Integer): Currency;
  public
  end;

var
  frmPedido: TfrmPedido;

implementation

uses
  unPesquisa, Funcoes, unRelPedido;

{$R *.dfm}

procedure TfrmPedido.cdsPadraoCODCLIENTEValidate(Sender: TField);
var
  NomeCliente: string;
begin
  inherited;
  NomeCliente := GetFieldByID(sqldPadrao.SQLConnection, 'CLIENTE', 'RAZAOSOCIAL', 'CODCLIENTE',
    Sender.AsInteger);

  if (NomeCliente <> '') then
    cdsPadraoCLIENTE.AsString := NomeCliente;
end;

procedure TfrmPedido.dbeClienteClickButton(Sender: TObject);
var
  vReturn: Variant;
begin
  inherited;
  if TfrmPesquisa.Execute('VIEWCLIENTE','_CÓDIGO',vReturn) then
  begin
    cdsPadraoCODCLIENTE.AsInteger := vReturn;
    SetFocusIfCan(dbeCodProduto);
  end;
end;

procedure TfrmPedido.PLFormConfigBeforePost(Sender: TObject);
begin
  inherited;
  if UpdatesPending then
    if cdsPadraoCODCLIENTE.IsNull then
    begin
      MsgAviso('É necessário informar um cliente.');
      dbeCliente.SetFocus;
      Abort;
    end;

  if (cdsItem.RecordCount = 0) and UpdatesPending then
  begin
    MsgAviso('Não é possível efetuar um pedido sem ítens.');
    Abort;
  end;
end;

procedure TfrmPedido.CountItens;
begin
  if cdsPadrao.State in [dsEdit, dsInsert] then
    cdsPadraoITENS.AsInteger := cdsItem.RecordCount;
end;

procedure TfrmPedido.rdbgItemExit(Sender: TObject);
begin
  inherited;
  if cdsItem.State in [dsInsert, dsEdit] then
    cdsItem.Post;
end;

procedure TfrmPedido.PLFormConfigPrint(Sender: TObject);
begin
  inherited;
  TfrmRelPedido.ShowReport(cdsPadraoCODPEDIDO.AsInteger);
end;

procedure TfrmPedido.btnBuscaProdutoClick(Sender: TObject);
var
  vReturn: Variant;
begin
  inherited;
  if InEditModes then
  begin
    if TfrmPesquisa.Execute('VIEWPRODUTO','_CÓDIGO',vReturn) then
    begin
      cdsProdutoCODPRODUTO.AsInteger := vReturn;
    end;
  end;
end;

procedure TfrmPedido.FormCreate(Sender: TObject);
begin
  inherited;
  cdsProduto.Open;
  cdsProduto.Edit;
  ItemDeleted := False;
end;

procedure TfrmPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  cdsProduto.Cancel;
  cdsProduto.Close;
end;

procedure TfrmPedido.btnAddProdutoClick(Sender: TObject);
begin
  inherited;
  while not cdsItem.Eof do
  begin
    if cdsProdutoCODPRODUTO.AsInteger = cdsItemCODPRODUTO.AsInteger then
    begin
      MsgAviso('Este produto já está na lista.');
      Exit;
    end;

    cdsItem.Next;
  end;

  cdsItem.Insert;
  cdsItemCODPRODUTO.AsInteger := cdsProdutoCODPRODUTO.AsInteger;
  cdsItemPRODUTO.AsString := cdsProdutoNOMEPRODUTO.AsString;
  cdsItemQTDE.AsCurrency := cdsProdutoQDTE.AsCurrency;
  cdsItemDESCONTO.AsCurrency := cdsProdutoDESCONTO.AsCurrency;
  cdsItemVALOR.AsCurrency := cdsProdutoVALOR.AsCurrency;
  cdsItemSUBTOTAL.AsCurrency := cdsProdutoSUBTOTAL.AsCurrency;
  cdsItem.Post;

  cdsProduto.EmptyDataSet;
  cdsProduto.Edit;

  dbeCodProduto.SetFocus;
end;

procedure TfrmPedido.cdsProdutoCODPRODUTOValidate(Sender: TField);
var
  NomeProd: string;
begin
  inherited;
  NomeProd :=
    GetFieldByID(sqldPadrao.SQLConnection,'PRODUTO','NOME','CODPRODUTO',Sender.AsInteger);

  if (NomeProd <> '') then
  begin
    cdsProdutoNOMEPRODUTO.AsString := NomeProd;

    cdsProdutoQDTE.AsCurrency := 1;
    cdsProdutoVALOR.AsCurrency := getValorProduto(Sender.AsInteger);
    cdsProdutoDESCONTO.AsCurrency := 0;

    CalculaSubTotal;

    dbeQtde.SetFocus;
  end
  else
  begin
    MsgAviso('Produto não encontrado.');
  end;
end;

procedure TfrmPedido.CalculaSubTotal;
begin
  cdsProdutoSUBTOTAL.AsCurrency :=
    (cdsProdutoVALOR.AsCurrency *cdsProdutoQDTE.AsCurrency);
end;

procedure TfrmPedido.dbeQtdeExit(Sender: TObject);
begin
  inherited;
  if not cdsProdutoQDTE.IsNull then
    CalculaSubTotal;
end;

procedure TfrmPedido.dbeDescontoExit(Sender: TObject);
begin
  inherited;
  if not cdsProdutoDESCONTO.IsNull then
  begin
    CalculaValorUnitario; 
    CalculaSubTotal;
  end;
end;

procedure TfrmPedido.dbeValorUnitExit(Sender: TObject);
begin
  inherited;
  if not cdsProdutoVALOR.IsNull then
    CalculaSubTotal;
end;

procedure TfrmPedido.cdsItemAfterPost(DataSet: TDataSet);
begin
  inherited;
  if not ItemDeleted then
  begin
    cdsPadraoTOTALDESCONTO.AsCurrency := (cdsPadraoTOTALDESCONTO.AsCurrency + cdsItemDESCONTO.AsCurrency);
    cdsPadraoTOTAL.AsCurrency := (cdsPadraoTOTAL.AsCurrency + cdsItemSUBTOTAL.AsCurrency);

    CountItens;
  end;
end;

procedure TfrmPedido.CalculaValorUnitario;
begin
  if cdsProdutoDESCONTO.AsCurrency > 0 then
    cdsProdutoVALOR.AsCurrency := (getValorProduto(cdsProdutoCODPRODUTO.AsInteger) - cdsProdutoDESCONTO.AsCurrency)
  else
    cdsProdutoVALOR.AsCurrency := getValorProduto(cdsProdutoCODPRODUTO.AsInteger);  
end;

function TfrmPedido.getValorProduto(IdProduto: Integer): Currency;
begin
  with TPLSQLDataSet.Create(nil) do
  try
    SQLConnection := sqldPadrao.SQLConnection;
    CommandText := 'select VALORUNITARIO from PRODUTO where CODPRODUTO = '+IntToStr(IdProduto);
    Open;

    Result := Fields[0].AsCurrency;
  finally
    Free;
  end;
end;

procedure TfrmPedido.cdsPadraoNewRecord(DataSet: TDataSet);
begin
  inherited;
  cdsPadraoDATAPEDIDO.AsDateTime := Date;
end;

procedure TfrmPedido.miExcluirItemClick(Sender: TObject);
begin
  inherited;
  if InEditModes then
  begin
    if MsgSN('Deseja excluir este ítem?') then
    begin
      ItemDeleted := True;
      cdsItem.Delete;
    end;
  end
  else
    MsgAviso('Para excluir um ítem clique em Alterar.');
end;

procedure TfrmPedido.dbeSubTotalExit(Sender: TObject);
begin
  inherited;
  btnAddProduto.SetFocus;
end;

procedure TfrmPedido.dbeNomeProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F2) then
    btnBuscaProduto.Click;
end;

procedure TfrmPedido.PLFormConfigAfterCancelUpdates(Sender: TObject);
begin
  inherited;
  cdsProduto.Close;
  cdsProduto.Open;
  cdsProduto.Edit;
end;

procedure TfrmPedido.cdsItemBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if cdsPadraoTOTALDESCONTO.AsCurrency > 0 then
    cdsPadraoTOTALDESCONTO.AsCurrency := (cdsPadraoTOTALDESCONTO.AsCurrency - cdsItemDESCONTO.AsCurrency);

  if cdsPadraoTOTAL.AsCurrency > 0 then
    cdsPadraoTOTAL.AsCurrency := (cdsPadraoTOTAL.AsCurrency - cdsItemSUBTOTAL.AsCurrency);
end;

procedure TfrmPedido.cdsItemAfterDelete(DataSet: TDataSet);
begin
  inherited;
  CountItens;
  if cdsItem.RecordCount = 0 then
  begin
    if cdsPadraoTOTAL.AsCurrency > 0 then
      cdsPadraoTOTAL.AsCurrency := 0;

    if cdsPadraoTOTALDESCONTO.AsCurrency > 0 then
      cdsPadraoTOTALDESCONTO.AsCurrency := 0;  
  end;
end;

procedure TfrmPedido.cdsItemAfterInsert(DataSet: TDataSet);
begin
  inherited;
  ItemDeleted := False;
end;

initialization
  RegisterClass(TfrmPedido);
finalization
  UnRegisterClass(TfrmPedido);  

end.
