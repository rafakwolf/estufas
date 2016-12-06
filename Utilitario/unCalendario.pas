unit unCalendario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, Calendar, StdCtrls, Buttons, ComCtrls;

type
  TfrmCalendario = class(TForm)
    BtnFechar: TBitBtn;
    Calendario: TMonthCalendar;
    procedure FormShow(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
  public
  end;

var
  frmCalendario: TfrmCalendario;

implementation

{$R *.dfm}

procedure TfrmCalendario.FormShow(Sender: TObject);
begin
  Calendario.Date := Date;
end;

procedure TfrmCalendario.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCalendario.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

initialization
  RegisterClass(TfrmCalendario);
finalization
  UnRegisterClass(TfrmCalendario);

end.
