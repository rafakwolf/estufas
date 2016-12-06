unit unFormBasico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGrids, Data.SqlExpr, udmBase;

type
  TfrmFormBasico = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
  protected
    function getConnection: TSQLConnection; virtual; abstract;
    function getDatamodule: TdmBase; virtual; abstract;
  public
  end;

var
  frmFormBasico: TfrmFormBasico;

implementation

uses
  Funcoes;

{$R *.dfm}

procedure TfrmFormBasico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmFormBasico.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
  begin
    if not (ActiveControl is TDBGrid) then
    begin
      Key := Chr(0);
      Perform(WM_NEXTDLGCTL, 0, 0);
    end;
  end;  
end;

procedure TfrmFormBasico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmFormBasico.FormCreate(Sender: TObject);
begin
  CentralizaForm(self);
end;

end.
