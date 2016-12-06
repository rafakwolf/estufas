unit uConfig;

interface

uses
  Classes, uPublicTypes, SqlExpr, PLSQLDataSet, SysUtils, DB, Variants;

type
  TConfig = class
  private
    FConn : TSQLConnection;
    function GetValue(Id: Integer): Variant;

    function GetAlignCabRelatorio: TAlignCabRel;
    function GetLogoRel: Boolean;
  protected
  public
    constructor Create(conn: TSQLConnection);

    property AlignCabRelatorio: TAlignCabRel read GetAlignCabRelatorio;
    property LogoRel: Boolean read GetLogoRel;
  end;
  
implementation

constructor TConfig.Create(conn: TSQLConnection);
begin
  FConn := conn;
end;

function TConfig.GetAlignCabRelatorio: TAlignCabRel;
begin
  case VarToStr(GetValue(1))[1] of
    'E' : Result := acrLeftJust;
    'C' : Result := acrCenter;
    'D' : Result := acrRightJust;
  else
    Result := acrLeftJust;  
  end;
end;

function TConfig.GetLogoRel: Boolean;
begin
  Result := Copy(GetValue(2),1,1) = 'M';
end;

function TConfig.GetValue(Id: Integer): Variant;
begin
  Result := '-1';
  with TPLSQLDataSet.Create(nil) do
  try
    SQLConnection := FConn;
    CommandText := 'select VALOR from CONFIGURACAO where CODCONFIGURACAO = '+
      IntToStr(Id);
    Open;

    if not Fields[0].IsNull then
      Result := Fields[0].Value;
  finally
    Free;
  end;
end;

end.
