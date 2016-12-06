unit unRelatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, FMTBcd, DB, SqlExpr, PLSQLDataSet, PLDBImage,
  RLPreviewForm;

type
  TfrmRelatorios = class(TForm)
    dsPadrao: TDataSource;
  private
    procedure ConfigCabecalho;
  public
  end;

var
  frmRelatorios: TfrmRelatorios;

implementation



{$R *.dfm}

procedure TfrmRelatorios.ConfigCabecalho;
begin
end;

end.
