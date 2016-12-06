unit unDialogRelPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFormBasico, ExtCtrls, Buttons;

type
  TfrmRelDialogPadrao = class(TfrmFormBasico)
    pnlBotoes: TPanel;
    btnVisualizar: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnSair: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
  private
  public
  end;

var
  frmRelDialogPadrao: TfrmRelDialogPadrao;

implementation

{$R *.dfm}

procedure TfrmRelDialogPadrao.btnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
