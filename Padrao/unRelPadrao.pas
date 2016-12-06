unit unRelPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFormBasico, ExtCtrls, StdCtrls, Buttons, DB;

type
  TfrmRelPadrao = class(TfrmFormBasico)
    pnlBotoes: TPanel;
    btnVisualizar: TBitBtn;
    btnImprimir: TBitBtn;
    btnSair: TBitBtn;
    procedure btnSairClick(Sender: TObject);
  private
  protected

  public
  end;

var
  frmRelPadrao: TfrmRelPadrao;

implementation



{$R *.dfm}

procedure TfrmRelPadrao.btnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
