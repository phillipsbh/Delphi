unit uDlgMotivoInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmDlgMotivoInput = class(TForm)
    cbMotivoInput: TComboBox;
    Label1: TLabel;
    bitMotOK: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitMotOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDlgMotivoInput: TfrmDlgMotivoInput;

implementation

uses UInfParMedicao, uDM, uLoginQualidade, uPrincipal, uDlgSelectOP;

{$R *.dfm}

procedure TfrmDlgMotivoInput.bitMotOKClick(Sender: TObject);
begin

  with dm do
  begin


     {}

     Self.Hide;

     geraLog('ponto 0 '+FormatDateTime('hh:nn:ss:zzz',Now),'teste_perf.txt','c:\komaxsystem');

      if not adoTBL_DADOS_CORTE.Active then
              adoTBL_DADOS_CORTE.Open;

      F_TIPO_INPUT := 'M';
      vSelectOp := '';

    geraLog('ponto 1 '+FormatDateTime('hh:nn:ss:zzz',Now),'teste_perf.txt','c:\komaxsystem');

     {Se OP NÃO existe, executa comando INSERT. Se OP já existe, executa comando EDIT}
     if getDadosRelatCorte(StrToInt(v_OP_GLOBAL) ) = 0 then
       begin
        adoTBL_DADOS_CORTE.Insert;
        adoTBL_DADOS_CORTEOrderID.AsInteger := StrToInt(v_OP_GLOBAL);
        adoTBL_DADOS_CORTEDATA_RELATORIO.AsDateTime := NOW;
        adoTBL_DADOS_CORTEMaquina_Corte.AsString := vMAQUINA;
        adoTBL_DADOS_CORTEF_INPUT.AsString := F_TIPO_INPUT+F_MOTIVO_INPUT;
         try

           adoTBL_DADOS_CORTE.Post;
          except on e:exception do
            begin

            end;

          end;


       end;

        geraLog('ponto 2 '+FormatDateTime('hh:nn:ss:zzz',Now),'teste_perf.txt','c:\komaxsystem');
       //GRAVA DADOS MEDIÇÃO INICIAL
       // Mostrar as ops
    {    adoQySDBConvert1.Close;
        adoQySDBConvert1.SQL.Clear;
        adoQySDBConvert1.SQL.Add('SELECT OrderID,Circuito,Quantidade,Comprimento,Cabo,Term_A,Selo_A,Term_B,Selo_B, ');
        adoQySDBConvert1.SQL.Add(' Alt_Cond_A,Alt_Cond_B,Alt_Isol_A,Alt_Isol_B,Forc_Trac_A,Forc_Trac_B ');
        adoQySDBConvert1.SQL.Add(' FROM [Status_Prod] with(nolock) WHERE [OrderID] = :pOrder ');
        adoQySDBConvert1.Parameters.ParamByName('pOrder').Value := StrToInt(v_OP_GLOBAL);
        adoQySDBConvert1.Open;


       if adoQySDBConvert1.RecordCount > 0 then
        begin
         getDadosArqKomax_CodigoScan(vMAQUINA,v_OP_GLOBAL,adoQySDBConvert1.FieldByName('Term_A').AsString,adoQySDBConvert1.FieldByName('Term_B').AsString);
         //showmessage('adoQySDBConvert1.RecordCount > 0');
        end;
      }




    if (cbMotivoInput.Text) = 'Medição Final' then
      begin

       F_MOTIVO_INPUT := 'F';

          geraLog('ponto 3 '+FormatDateTime('hh:nn:ss:zzz',Now),'teste_perf.txt','c:\komaxsystem');

        if frmInfParMedicao = nil then
         Application.CreateForm(TfrmInfParMedicao,frmInfParMedicao);
       frmInfParMedicao.ShowModal;

       geraLog('ponto 4 '+FormatDateTime('hh:nn:ss:zzz',Now),'teste_perf.txt','c:\komaxsystem');
      end

    else if (cbMotivoInput.Text) = 'Retomada de Trabalho' then
      begin

       F_MOTIVO_INPUT := 'R';

        if frmInfParMedicao = nil then
         Application.CreateForm(TfrmInfParMedicao,frmInfParMedicao);
        frmInfParMedicao.ShowModal;
      end


    else if (cbMotivoInput.Text) = 'Liberação Setup (Qualidade)' then
      begin

       F_MOTIVO_INPUT := 'Q';

        if FLoginAutorizaQualidade = nil then
          Application.CreateForm(TFLoginAutorizaQualidade,FLoginAutorizaQualidade);
         FLoginAutorizaQualidade.ShowModal;


      end 

    else if (cbMotivoInput.Text) = 'Localizar Ordem de Produção Registrada' then
      begin

       F_MOTIVO_INPUT := '';

        if frmDlgSelectOP = nil then
          Application.CreateForm(TfrmDlgSelectOP,frmDlgSelectOP);
       Hide;
       frmDlgSelectOP.ShowModal;


      end ;






  end;//dm


     Close;



end;

procedure TfrmDlgMotivoInput.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
frmPrincipal.tCheckOpFinished.Enabled := True;
frmDlgMotivoInput := nil;
end;

end.
