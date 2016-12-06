unit uConfiguraRelatorio;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB, SqlExpr, RLReport, ConstPadrao, PLDBImage, Funcoes, udmPrincipal;

  procedure PrintIfNotEmptyRL(Report: TRLReport; Print: Boolean = False);
  procedure ConfigRelatorioRL(Report: TRLReport; MemoCabec: TRLMemo;
    imgLogo: TRLImage);  
  
implementation

procedure PrintIfNotEmptyRL(Report: TRLReport; Print: Boolean = False);
begin
  if Assigned(Report.DataSource)and(Report.DataSource is TDataSource)then
  begin
    if Assigned(TDataSource(Report.DataSource).DataSet)then
    begin
      if not TDataSource(Report.DataSource).DataSet.Active then
        TDataSource(Report.DataSource).DataSet.Open;
      if TDataSource(Report.DataSource).DataSet.IsEmpty then
      begin
        MsgAviso(UM_RELATORIOVAZIO);
        Abort;
      end;
    end;
  end;
  if Print then
    Report.Print
  else
    Report.PreviewModal;
end;

procedure ConfigRelatorioRL(Report: TRLReport; MemoCabec: TRLMemo;
  imgLogo: TRLImage);
var
  dbiLogo: TPLDBImage;
  ds: TDataSource;
  qry: TSQLDataSet;
  LogoEmpresa: TPicture;
begin

  LogoEmpresa := TPicture.Create;
  qry := TSQLDataSet.Create(nil);
  ds := TDataSource.Create(nil);
  ds.DataSet := qry;
  dbiLogo := TPLDBImage.Create(nil);

  with qry do
  try
    SQLConnection := DmPrincipal.sqlcPrincipal;
    CommandText := 'select '+
                   'RAZAOSOCIAL, '+
                   'CNPJ, '+
                   'IE, '+
                   'ENDERECO, '+
                   'CIDADE, '+
                   'BAIRRO, '+
                   'CEP, '+
                   'TELEFONE, '+
                   'UF, '+
                   'LOGOEMPRESA, '+
                   'EMAIL '+
                   'from VIEWEMPRESA ';
    Open;

    dbiLogo.DataSource := ds;
    dbiLogo.DataField := 'LOGOEMPRESA';
    dbiLogo.LoadPicture;
    LogoEmpresa.Assign(dbiLogo.Picture);
    imgLogo.Picture.Assign(LogoEmpresa);
    imgLogo.Stretch := True;

    MemoCabec.Lines.Clear;
    MemoCabec.Lines.Add(' '+qry.FieldByName('RAZAOSOCIAL').AsString);
    MemoCabec.Lines.Add(' '+qry.FieldByName('CNPJ').AsString + ' - ' + qry.FieldByName('IE').AsString);
    MemoCabec.Lines.Add(' '+qry.FieldByName('ENDERECO').AsString + ' - ' + qry.FieldByName('CIDADE').AsString + ' - ' + qry.FieldByName('UF').AsString);
    MemoCabec.Lines.Add(' '+qry.FieldByName('BAIRRO').AsString + ' - ' + qry.FieldByName('CEP').AsString+' - '+qry.FieldByName('EMAIL').AsString);

    Report.PreviewOptions.Caption := 'Relatório';
  finally
    LogoEmpresa.Free;
    dbiLogo.Free;
    ds.DataSet := nil;
    ds.Free;
    qry.Free;
  end;
end;

end.
