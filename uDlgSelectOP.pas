unit uDlgSelectOP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TfrmDlgSelectOP = class(TForm)
    cbListaOP: TComboBox;
    Label1: TLabel;
    bitOK: TBitBtn;
    dtpDataRegOP: TDateTimePicker;
    Label2: TLabel;
    rgMotivo: TRadioGroup;
    procedure bitOKClick(Sender: TObject);
    procedure dtpDataRegOPChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDlgSelectOP: TfrmDlgSelectOP;

implementation

uses uDM, UInfParMedicao;

{$R *.dfm}

procedure TfrmDlgSelectOP.bitOKClick(Sender: TObject);
begin
 with dm do
 begin

   vSelectOp := '';

     if rgMotivo.ItemIndex = 0 then
        F_MOTIVO_INPUT := 'Q'  //Qualidade
     else if rgMotivo.ItemIndex = 1 then
        F_MOTIVO_INPUT := 'F'  //Medição Final
     else if rgMotivo.ItemIndex = 2 then
        F_MOTIVO_INPUT := 'R'  //Retomada Trabalho
     else
      begin
         Application.MessageBox('Não foi informado nenhum motivo!','Atenção',MB_OK+MB_ICONWARNING);
         Exit;
      end;



     if cbListaOP.Items.IndexOf(cbListaOP.Text) = -1 then
       begin
         Application.MessageBox('Número de Ordem de Produção não encontrada!','Atenção',MB_OK+MB_ICONWARNING);
         Exit;
       end
     else
       begin
         vSelectOp := cbListaOP.Text;

        if frmInfParMedicao = nil then
           Application.CreateForm(TfrmInfParMedicao,frmInfParMedicao);

         hide;
         frmInfParMedicao.ShowModal;



       end;


 end;//with dm
  close;



end;

procedure TfrmDlgSelectOP.dtpDataRegOPChange(Sender: TObject);
begin
 with dm do
 begin


  cbListaOP.Text := '';
   
  //lista Ops da data
  adoQyConvertFunc.Close;
  adoQyConvertFunc.SQL.Clear;
  adoQyConvertFunc.SQL.Add('select OrderId from Dados_Relat_Corte where convert(nvarchar(10),data_relatorio,103)= :pData ');
  adoQyConvertFunc.SQL.Add('order by 1 ');
  adoQyConvertFunc.Parameters.ParamByName('pData').Value := FormatDateTime('dd/mm/yyyy',dtpDataRegOP.Date);
  adoQyConvertFunc.Open;
  

  adoQyConvertFunc.First;
  cbListaOP.Items.Clear;
  while not adoQyConvertFunc.Eof do
   begin
     cbListaOP.Items.Add(adoQyConvertFunc.FieldByName('OrderId').AsString);
     adoQyConvertFunc.Next;
     Application.ProcessMessages;
   end;




 end;



end;

procedure TfrmDlgSelectOP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
frmDlgSelectOP := nil;
end;

procedure TfrmDlgSelectOP.FormShow(Sender: TObject);
begin

 with dm do
 begin

  vSelectOp := '';


  //obtem data atual
  dtpDataRegOP.Date := Date;

  //lista Ops da data
  adoQyConvertFunc.Close;
  adoQyConvertFunc.SQL.Clear;
  adoQyConvertFunc.SQL.Add('select OrderId from Dados_Relat_Corte where convert(nvarchar(10),data_relatorio,103)= :pData ');
  adoQyConvertFunc.SQL.Add('order by 1 ');
  adoQyConvertFunc.Parameters.ParamByName('pData').Value := DateToStr(dtpDataRegOP.Date);
  adoQyConvertFunc.Open;

  adoQyConvertFunc.First;
  cbListaOP.Items.Clear;
  while not adoQyConvertFunc.Eof do
   begin
     cbListaOP.Items.Add(adoQyConvertFunc.FieldByName('OrderId').AsString);
     adoQyConvertFunc.Next;
     Application.ProcessMessages;
   end;




 end;


end;

end.
