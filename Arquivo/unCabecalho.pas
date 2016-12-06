unit unCabecalho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadraoCadastro, ActnList,  DB, Menus, Buttons,
  ExtCtrls, FMTBcd, DBClient, PLClientDataSet, Provider, PLDataSetProvider,
  SqlExpr, PLSQLDataSet, PLDBImage, StdCtrls, Mask, DBCtrls, PLDBEdit,
  ExtDlgs, System.Actions;

type
  TfrmCabecalho = class(TfrmPadraoCadastro)
    sqldPadrao: TPLSQLDataSet;
    dspPadrao: TPLDataSetProvider;
    cdsPadrao: TPLClientDataSet;
    sqldPadraoCODCABECALHO: TIntegerField;
    sqldPadraoNOME: TStringField;
    sqldPadraoCNPJCPF: TStringField;
    sqldPadraoTELEFONE: TStringField;
    sqldPadraoFAX: TStringField;
    sqldPadraoEMAIL: TStringField;
    sqldPadraoENDERECO: TStringField;
    sqldPadraoNUMERO: TIntegerField;
    sqldPadraoCIDADE: TStringField;
    sqldPadraoBAIRRO: TStringField;
    sqldPadraoCOMPLEMENTO: TStringField;
    sqldPadraoESTADO: TStringField;
    sqldPadraoLOGO: TBlobField;
    cdsPadraoCODCABECALHO: TIntegerField;
    cdsPadraoNOME: TStringField;
    cdsPadraoCNPJCPF: TStringField;
    cdsPadraoTELEFONE: TStringField;
    cdsPadraoFAX: TStringField;
    cdsPadraoEMAIL: TStringField;
    cdsPadraoENDERECO: TStringField;
    cdsPadraoNUMERO: TIntegerField;
    cdsPadraoCIDADE: TStringField;
    cdsPadraoBAIRRO: TStringField;
    cdsPadraoCOMPLEMENTO: TStringField;
    cdsPadraoESTADO: TStringField;
    cdsPadraoLOGO: TBlobField;
    dbeNome: TPLDBEdit;
    dbeCnpjCpf: TPLDBEdit;
    dbeFone: TPLDBEdit;
    dbeFax: TPLDBEdit;
    dbeEmail: TPLDBEdit;
    dbeEndereco: TPLDBEdit;
    dbeNumero: TPLDBEdit;
    dbeCidade: TPLDBEdit;
    dbeBairro: TPLDBEdit;
    dbeComplemento: TPLDBEdit;
    dbeEstado: TPLDBEdit;
    dbimgLogo: TPLDBImage;
    btnAddImg: TBitBtn;
    btnDelImg: TBitBtn;
    opdLogo: TOpenPictureDialog;
    procedure FormCreate(Sender: TObject);
    procedure btnAddImgClick(Sender: TObject);
    procedure btnDelImgClick(Sender: TObject);
  private
  public
  end;

var
  frmCabecalho: TfrmCabecalho;

implementation

{$R *.dfm}

procedure TfrmCabecalho.FormCreate(Sender: TObject);
begin
  inherited;
  if cdsPadrao.IsEmpty then
  begin
    cdsPadrao.Insert;
    cdsPadraoCODCABECALHO.AsInteger := 1;
  end;

end;

procedure TfrmCabecalho.btnAddImgClick(Sender: TObject);
begin
  inherited;
    if opdLogo.Execute then
      dbimgLogo.Picture.LoadFromFile(opdLogo.FileName);
end;

procedure TfrmCabecalho.btnDelImgClick(Sender: TObject);
begin
  inherited;
  dbimgLogo.Field.Clear;
end;

initialization
  RegisterClass(TfrmCabecalho);
finalization
  UnRegisterClass(TfrmCabecalho);

end.
