unit ufmFormBasicoEstufas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unFormBasico, Data.SqlExpr, udmBase;

type
  TfrmFormBasicoEstufas = class(TfrmFormBasico)
  private
  protected
    function getConnection: TSQLConnection; override;
    function getDatamodule: TdmBase; override;
  public
  end;

var
  frmFormBasicoEstufas: TfrmFormBasicoEstufas;

implementation

{$R *.dfm}

uses udmPrincipal;

function TfrmFormBasicoEstufas.getConnection: TSQLConnection;
begin
  Result := DmPrincipal.sqlcPrincipal;
end;

function TfrmFormBasicoEstufas.getDatamodule: TdmBase;
begin
  Result := DmPrincipal;
end;

end.
