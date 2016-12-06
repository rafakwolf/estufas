unit unRelPadraoPortrait;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unRelPadrao, StdCtrls, Buttons, ExtCtrls,
  DB,  PLSQLDataSet, PLDBImage;

type
  TfrmRelPadraoPortrait = class(TfrmRelPadrao)
    dsPadrao: TDataSource;
  private
  protected
    procedure ConfigCabecalhoPadrao;
  public
  end;

var
  frmRelPadraoPortrait: TfrmRelPadraoPortrait;

implementation



{$R *.dfm}

procedure TfrmRelPadraoPortrait.ConfigCabecalhoPadrao;
begin
end;

end.
