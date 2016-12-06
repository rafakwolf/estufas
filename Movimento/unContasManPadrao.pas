unit unContasManPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFormBasico, ExtCtrls, StdCtrls, Buttons, DB,
  DBClient;

type
  TfrmContasManPadrao = class(TfrmFormBasico)
    pnlBotoes: TPanel;
    btnOK: TBitBtn;
    btnCancelar: TBitBtn;
    dsPadrao: TDataSource;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
  public
  end;

var
  frmContasManPadrao: TfrmContasManPadrao;

implementation

{$R *.dfm}

procedure TfrmContasManPadrao.btnCancelarClick(Sender: TObject);
begin
  inherited;
  TClientDataSet(dsPadrao.DataSet).CancelUpdates;
  Close;
end;

procedure TfrmContasManPadrao.btnOKClick(Sender: TObject);
begin
  inherited;
  TClientDataSet(dsPadrao.DataSet).ApplyUpdates(0);
  Close;
end;

end.
