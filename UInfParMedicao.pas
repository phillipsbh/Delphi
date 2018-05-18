unit UInfParMedicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls,  Grids, DBGrids, DB,
  ImgList, ToolWin, AppEvnts;

type
  TfrmInfParMedicao = class(TForm)
    Panel1: TPanel;
    pnlMSGTitulo: TPanel;
    pnlDefMedidas: TPanel;
    gbAplicacaoA: TGroupBox;
    edTraEspA: TEdit;
    edTraEncA: TEdit;
    edAltEspCondA: TEdit;
    edAltEncCondA: TEdit;
    edAltEspGrampIsolA: TEdit;
    edAltEncGrampIsolA: TEdit;
    gbAplicacaoB: TGroupBox;
    edTraEspB: TEdit;
    edTraEncB: TEdit;
    edAltEspCondB: TEdit;
    edAltEncCondB: TEdit;
    edAltEspGrampIsolB: TEdit;
    edAltEncGrampIsolB: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    pnlSeqProducao: TPanel;
    dscSeqProd: TDataSource;
    StatusBar1: TStatusBar;
    Label6: TLabel;
    Label14: TLabel;
    Label7: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    lbAplicTermA: TLabel;
    lbAplicSeloA: TLabel;
    lbAplicSeloB: TLabel;
    lbAplicTermB: TLabel;
    Label20: TLabel;
    edNumOP: TEdit;
    edCircuito: TEdit;
    Label21: TLabel;
    edCabo: TEdit;
    Label22: TLabel;
    pnlMedLeft: TPanel;
    pnlMedBottom: TPanel;
    pnlMedTop: TPanel;
    gbComprimCabo: TGroupBox;
    edCompCaboEsp: TEdit;
    Label1: TLabel;
    Label23: TLabel;
    Panel2: TPanel;
    edCompCaboObt: TEdit;
    Panel3: TPanel;
    pnlBotoes: TPanel;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    bitConfirma: TBitBtn;
    lbTolerTracaoA: TLabel;
    lbTolerCondA: TLabel;
    lbTolerIsolA: TLabel;
    lbTolerTracaoB: TLabel;
    lbTolerCondB: TLabel;
    lbTolerIsolB: TLabel;
    lbTolerComp: TLabel;
    Label25: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    ApplicationEvents1: TApplicationEvents;
    pnlMsgGeral: TPanel;
    bitFechar: TBitBtn;
    sbEmerg: TSpeedButton;
    procedure sbEmergClick(Sender: TObject);
    procedure bitFecharClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ApplicationEvents1Deactivate(Sender: TObject);
    procedure ApplicationEvents1Activate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edAltEncGrampIsolBKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edAltEncCondBKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTraEncBKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edAltEncGrampIsolAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edAltEncCondAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTraEncAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCompCaboObtKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bitConfirmaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

  vBitol,vTolerAltCondA,vTolerAltCondB,vTolerAltIsolA,vTolerAltIsolB : string;
  vGroupOP,v_OP_SQL_IN,vMSG : string;
  f_OverTolerance : boolean;

  procedure WMShowWindow(var Msg: TWMShowWindow);

  public
    { Public declarations }



  end;

var
  frmInfParMedicao: TfrmInfParMedicao;

implementation

uses uDM, uPrincipal, uPassFechar, uSenha;


const
  // Variável para gravar a resolução conforme programa foi criado
  ScreenWidth : LongInt = 1360;
  ScreenHeight: LongInt = 766;  


{$R *.dfm}

procedure TfrmInfParMedicao.WMShowWindow(var Msg: TWMShowWindow);
begin

  if not Msg.Show then
    Msg.Result := 0
  else
    inherited;
end;

function ObterCoordenada(const Indice, Posicao: Integer): Integer;
begin
  Result := (65535 div (GetSystemMetrics (Indice) -1)) * Posicao;
end;

procedure SimularClick(const X, Y: Integer);
var
Entrada: array [0..1] of TInput;
begin
  ZeroMemory(@Entrada, SizeOf(Entrada));
  // Primeiramente move o cursor do mouse a uma coordenada especifica, em Pixels!
  Entrada[0].Itype := INPUT_MOUSE;
  Entrada[0].mi.dwFlags := MOUSEEVENTF_MOVE or MOUSEEVENTF_ABSOLUTE;
  Entrada[0].mi.dx := ObterCoordenada(SM_CXSCREEN, X);
  Entrada[0].mi.dy := ObterCoordenada(SM_CYSCREEN, Y);
  SendInput(1, Entrada[0], sizeof(TInput)); // Envia o pedido

  // Realiza o click com o botão esquerdo do mouse
  Entrada[1].Itype := INPUT_MOUSE;
  Entrada[1].mi.dwFlags := MOUSEEVENTF_LEFTDOWN or MOUSEEVENTF_LEFTUP;

  SendInput(1, Entrada[1], sizeof(TInput));   // Envia o pedido
end;

procedure TfrmInfParMedicao.ApplicationEvents1Activate(Sender: TObject);
begin
 if Visible then
   SetWindowPos(Handle,HWND_TOPMOST,0,0,0,0,SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE); 
end;

procedure TfrmInfParMedicao.ApplicationEvents1Deactivate(Sender: TObject);
begin

 {desativa FORM TOPMOST}
if Visible then
 begin
 SetWindowPos(Self.Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE or SWP_NOACTIVATE );

 BringWindowToTop(frmInfParMedicao.Handle);
 SetForegroundWindow(frmInfParMedicao.Handle);

 end;



end;

procedure TfrmInfParMedicao.bitConfirmaClick(Sender: TObject);
begin

 with dm do
 begin

   DecimalSeparator  := '.';
   
     {desativa FORM TOPMOST}
     SetWindowPos(Self.Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE or SWP_NOACTIVATE );


    {verifica tolerancia medidas}
           f_OverTolerance := False;
           lbTolerTracaoA.Visible := False;
           lbTolerCondA.Visible := False;
           lbTolerIsolA.Visible := False;
           lbTolerTracaoB.Visible := False;
           lbTolerCondB.Visible := False;
           lbTolerIsolB.Visible := False;
           lbTolerComp.Visible := False;


        IF F_MOTIVO_INPUT  = 'F' THEN
          begin

             if (edCompCaboObt.Text = '' ) then
             begin
               Application.MessageBox('Informe o valor obtido do comprimento do cabo!','Atenção',MB_OK+MB_ICONWARNING);
               Exit;
             end;

            if (edAltEncCondA.Text = '') and (lbAplicTermA.Caption <> '' ) then
             begin
               Application.MessageBox('Informe o valor da Altura do Condutor A!','Atenção',MB_OK+MB_ICONWARNING);
               Exit;
             end;

             if (edAltEncGrampIsolA.Text = '') and (lbAplicTermA.Caption <> '' ) then
             begin
               Application.MessageBox('Informe o valor da Altura do Isolante A!','Atenção',MB_OK+MB_ICONWARNING);
               Exit;
             end;

              if (edAltEncCondB.Text = '') and (lbAplicTermB.Caption <> '' ) then
             begin
               Application.MessageBox('Informe o valor da Altura do Condutor B!','Atenção',MB_OK+MB_ICONWARNING);
               Exit;
             end;

              if (edAltEncGrampIsolB.Text = '') and (lbAplicTermB.Caption <> '' ) then
             begin
               Application.MessageBox('Informe o valor da Altura do Isolante B!','Atenção',MB_OK+MB_ICONWARNING);
               Exit;
             end;



              {tolerância cabo}
               if (  StrToInt(edCompCaboObt.Text) > ( StrToInt(edCompCaboEsp.Text)*1.1 )  )
                    OR (  StrToInt(edCompCaboObt.Text) < ( StrToInt(edCompCaboEsp.Text)*0.9) )  then
                begin
                  f_OverTolerance := True;
                  edCompCaboObt.Color := clRed;
                  lbTolerComp.Visible := True;
                  lbTolerComp.Caption := 'Toler.: 0,1';
                  Self.Repaint;

                end;

          end;




               if lbAplicTermA.Caption <> '' then
                begin


                  {verifica se valor encontrado é maior ou menor que a tolerância estipulada}
                  {condutor}
                  if (StrToFloat(edAltEncCondA.Text) > (StrToFloat(edAltEspCondA.Text) + StrToFloat(vTolerAltCondA) ) )
                    or (StrToFloat(edAltEncCondA.Text) < (StrToFloat(edAltEspCondA.Text) - StrToFloat(vTolerAltCondA) ))  then
                    begin
                      f_OverTolerance := True;

                      edAltEncCondA.Color := clRed;
                      lbTolerCondA.Visible := True;
                      lbTolerCondA.Caption := 'Toler.: '+vTolerAltCondA;
                      Self.Repaint;

                    end;

                   {isolante}
                   if (StrToFloat(edAltEncGrampIsolA.Text) > (StrToFloat(edAltEspGrampIsolA.Text) + StrToFloat(vTolerAltIsolA) ) )
                    or (StrToFloat(edAltEncGrampIsolA.Text) < (StrToFloat(edAltEspGrampIsolA.Text) - StrToFloat(vTolerAltIsolA) ))  then
                    begin
                      f_OverTolerance := True;

                      edAltEncGrampIsolA.Color := clRed;
                      lbTolerIsolA.Visible := True;
                      lbTolerIsolA.Caption := 'Toler.: '+vTolerAltIsolA;
                      Self.Repaint;

                    end;

                end; //tolerancia aplicacao A

                if lbAplicTermB.Caption <> '' then
                begin
                  {verifica se valor encontrado é maior ou menor que a tolerância estipulada}
                  {condutor}
                  if (StrToFloat(edAltEncCondB.Text) > (StrToFloat(edAltEspCondB.Text) + StrToFloat(vTolerAltCondB) ) )
                    or (StrToFloat(edAltEncCondB.Text) < (StrToFloat(edAltEspCondB.Text) - StrToFloat(vTolerAltCondB) ))  then
                    begin
                      f_OverTolerance := True;

                      edAltEncCondB.Color := clRed;
                      lbTolerCondB.Visible := True;
                      lbTolerCondB.Caption := 'Toler.: '+vTolerAltCondB;
                      Self.Repaint;

                    end;

                   {isolante}
                   if (StrToFloat(edAltEncGrampIsolB.Text) > (StrToFloat(edAltEspGrampIsolB.Text) + StrToFloat(vTolerAltIsolB) ) )
                    or (StrToFloat(edAltEncGrampIsolB.Text) < (StrToFloat(edAltEspGrampIsolB.Text) - StrToFloat(vTolerAltIsolB) ))  then
                    begin
                      f_OverTolerance := True;

                      edAltEncGrampIsolB.Color := clRed;
                      lbTolerIsolB.Visible := True;
                      lbTolerIsolB.Caption := 'Toler.: '+vTolerAltIsolB;
                      Self.Repaint;

                    end;

                end; //tolerancia aplicacao B




     {verfica se houve input de valores fora da tolerância}
      if f_OverTolerance then
      begin

        if MessageDlg('Houve valores de medidas fora da tolerância. Confirmar valores?!',mtConfirmation,[mbYes,mbNo],0)= mrYes then
         begin
          //**adoTBL_DADOS_CORTEOBSERVACAO.AsString := 'Altura Condutor/Isolante aprovados fora de tolerância';
           vMSG := 'Altura Condutor/Isolante aprovados fora de tolerância';
         end
        else
          begin
           Exit;
          end;


      end;






   try

       adoTBL_DADOS_CORTE.Close;
       adoTBL_DADOS_CORTE.Open;


         if adoTBL_DADOS_CORTE.Locate('ORDERID',StrToInt(edNumOP.Text),[]) then    //getDadosRelatCorte(StrToInt(edNumOP.Text) ) > 0
              adoTBL_DADOS_CORTE.Edit
         else
          begin
              Application.MessageBox(pchar('Ordem de Produção não localizada: '+edNumOP.Text),'Atenção',MB_OK+MB_ICONERROR);
              adoTBL_DADOS_CORTE.Cancel;
              Exit;
          end;



       vGroupOP := '';

         {MEDIÇÃO FINAL}
         IF F_MOTIVO_INPUT  = 'F' THEN
             begin


                 {Insert/Edit}

                  adoTBL_DADOS_CORTECIRCUITO.AsString := edCircuito.Text;
                  adoTBL_DADOS_CORTECABO.AsString := edCabo.Text;
                  adoTBL_DADOS_CORTECOMPR_OBTIDO.AsInteger := StrToInt( edCompCaboObt.Text);
                  adoTBL_DADOS_CORTEALT_COND_A_OBTIDO.AsString := edAltEncCondA.Text;
                  adoTBL_DADOS_CORTEALT_ISOL_A_OBTIDO.AsString := edAltEncGrampIsolA.Text;
                  adoTBL_DADOS_CORTEALT_COND_B_OBTIDO.AsString := edAltEncCondB.Text;
                  adoTBL_DADOS_CORTEALT_ISOL_B_OBTIDO.AsString := edAltEncGrampIsolB.Text;
                  //adoTBL_DADOS_CORTEFORCA_TRACAO_A_OBTIDO.AsString := edTraEncA.Text;
                  //adoTBL_DADOS_CORTEFORCA_TRACAO_B_OBTIDO.AsString := edTraEncB.Text;
                  //adoTBL_DADOS_CORTENF_CABO
                  adoTBL_DADOS_CORTEINPUT_OK.AsString := 'S';
                  adoTBL_DADOS_CORTEALT_COND_A_INICIAL.AsString := edAltEspCondA.Text;
                  adoTBL_DADOS_CORTEALT_COND_B_INICIAL.AsString := edAltEspCondB.Text;
                  adoTBL_DADOS_CORTEALT_ISOL_A_INICIAL.asstring := edAltEspGrampIsolA.Text;
                  adoTBL_DADOS_CORTEALT_ISOL_B_INICIAL.asstring := edAltEspGrampIsolB.Text;
                  adoTBL_DADOS_CORTETRACAO_A_INICIAL.asstring := edTraEspA.Text;
                  adoTBL_DADOS_CORTETRACAO_B_INICIAL.asstring := edTraEspB.Text;
                  adoTBL_DADOS_CORTECOMPR_CABO_INICIAL.AsString := edCompCaboEsp.Text;



                  {obtem ops agrupadas}
                   vGroupOP := GetOPsAgrupadasPend(StrToInt(edNumOP.Text));
                   if vGroupOP <> '' then
                   adoTBL_DADOS_CORTEOPS_AGRUPADAS.AsString := vGroupOP;

                   if (f_OverTolerance) then
                     adoTBL_DADOS_CORTENOTA_MEDICAO.AsString := vMSG;

             end// Medição Final



           {LIBERAÇÃO SETUP QUALIDADE}

         ELSE IF F_MOTIVO_INPUT  = 'Q' THEN
              begin

                 if (edTraEncA.Text = '') and (lbAplicTermA.Caption <> '' ) then
                 begin
                   Application.MessageBox('Informe o valor da Tração do Terminal A!','Atenção',MB_OK+MB_ICONWARNING);
                   Exit;
                 end;

                if (edAltEncCondA.Text = '') and (lbAplicTermA.Caption <> '' ) then
                 begin
                   Application.MessageBox('Informe o valor da Altura do Condutor A!','Atenção',MB_OK+MB_ICONWARNING);
                   Exit;
                 end;

                 if (edAltEncGrampIsolA.Text = '') and (lbAplicTermA.Caption <> '' ) then
                 begin
                   Application.MessageBox('Informe o valor da Altura do Isolante A!','Atenção',MB_OK+MB_ICONWARNING);
                   Exit;
                 end;

                 if (edTraEncB.Text = '') and (lbAplicTermB.Caption <> '' ) then
                 begin
                   Application.MessageBox('Informe o valor da Tração do Terminal A!','Atenção',MB_OK+MB_ICONWARNING);
                   Exit;
                 end;


                  if (edAltEncCondB.Text = '') and (lbAplicTermB.Caption <> '' ) then
                 begin
                   Application.MessageBox('Informe o valor da Altura do Condutor B!','Atenção',MB_OK+MB_ICONWARNING);
                   Exit;
                 end;

                  if (edAltEncGrampIsolB.Text = '') and (lbAplicTermB.Caption <> '' ) then
                 begin
                   Application.MessageBox('Informe o valor da Altura do Isolante B!','Atenção',MB_OK+MB_ICONWARNING);
                   Exit;
                 end;



                 {Insert/Edit}

                  adoTBL_DADOS_CORTETRACAO_A_QUALIDADE.AsString := edTraEncA.Text;
                  adoTBL_DADOS_CORTETRACAO_B_QUALIDADE.AsString := edTraEncB.Text;
                  adoTBL_DADOS_CORTEALT_COND_A_QUALIDADE.AsString := edAltEncCondA.Text;
                  adoTBL_DADOS_CORTEALT_ISOL_A_QUALIDADE.AsString := edAltEncGrampIsolA.Text;
                  adoTBL_DADOS_CORTEALT_COND_B_QUALIDADE.AsString := edAltEncCondB.Text;
                  adoTBL_DADOS_CORTEALT_ISOL_B_QUALIDADE.AsString := edAltEncGrampIsolB.Text;
                  adoTBL_DADOS_CORTEREGISTRO_INSP_QUALIDADE.AsString := F_REG_INSP_QUAL;
                  adoTBL_DADOS_CORTECIRCUITO.AsString := edCircuito.Text;
                  adoTBL_DADOS_CORTECABO.AsString := edCabo.Text;

              end// {LIBERAÇÃO SETUP QUALIDADE}




          {RETOMADA DE TRABALHO}

         ELSE IF F_MOTIVO_INPUT  = 'R' THEN
          begin

             if (edTraEncA.Text = '') and (lbAplicTermA.Caption <> '' ) then
             begin
               Application.MessageBox('Informe o valor da Tração do Terminal A!','Atenção',MB_OK+MB_ICONWARNING);
               Exit;
             end;

            if (edAltEncCondA.Text = '') and (lbAplicTermA.Caption <> '' ) then
             begin
               Application.MessageBox('Informe o valor da Altura do Condutor A!','Atenção',MB_OK+MB_ICONWARNING);
               Exit;
             end;

             if (edAltEncGrampIsolA.Text = '') and (lbAplicTermA.Caption <> '' ) then
             begin
               Application.MessageBox('Informe o valor da Altura do Isolante A!','Atenção',MB_OK+MB_ICONWARNING);
               Exit;
             end;

             if (edTraEncB.Text = '') and (lbAplicTermB.Caption <> '' ) then
             begin
               Application.MessageBox('Informe o valor da Tração do Terminal A!','Atenção',MB_OK+MB_ICONWARNING);
               Exit;
             end;


              if (edAltEncCondB.Text = '') and (lbAplicTermB.Caption <> '' ) then
             begin
               Application.MessageBox('Informe o valor da Altura do Condutor B!','Atenção',MB_OK+MB_ICONWARNING);
               Exit;
             end;

              if (edAltEncGrampIsolB.Text = '') and (lbAplicTermB.Caption <> '' ) then
             begin
               Application.MessageBox('Informe o valor da Altura do Isolante B!','Atenção',MB_OK+MB_ICONWARNING);
               Exit;
             end;


             {Insert/Edit}

              if lbAplicTermA.Caption <> '' then
               begin

                adoTBL_DADOS_CORTETRACAO_RETOMA_TRAB_A.AsString := edTraEncA.Text;
                adoTBL_DADOS_CORTEALT_COND_RETOMA_TRAB_A.AsString :=  edAltEncCondA.Text;
                adoTBL_DADOS_CORTEALT_ISOL_RETOMA_TRAB_A.AsString := edAltEncGrampIsolA.Text;

               end;

               if lbAplicTermB.Caption <> '' then
               begin

                adoTBL_DADOS_CORTETRACAO_RETOMA_TRAB_B.AsString := edTraEncB.Text;
                adoTBL_DADOS_CORTEALT_COND_RETOMA_TRAB_B.AsString :=  edAltEncCondB.Text;
                adoTBL_DADOS_CORTEALT_ISOL_RETOMA_TRAB_B.AsString := edAltEncGrampIsolB.Text;

               end;


          end// {RETOMADA DE TRABALHO}
       else
        begin
          
                 {Insert/Edit}

                  adoTBL_DADOS_CORTECOMPR_OBTIDO.AsInteger := StrToInt( edCompCaboObt.Text);
                  adoTBL_DADOS_CORTEALT_COND_A_OBTIDO.AsString := edAltEncCondA.Text;
                  adoTBL_DADOS_CORTEALT_ISOL_A_OBTIDO.AsString := edAltEncGrampIsolA.Text;
                  adoTBL_DADOS_CORTEALT_COND_B_OBTIDO.AsString := edAltEncCondB.Text;
                  adoTBL_DADOS_CORTEALT_ISOL_B_OBTIDO.AsString := edAltEncGrampIsolB.Text;
                  //adoTBL_DADOS_CORTEFORCA_TRACAO_A_OBTIDO.AsString := edTraEncA.Text;
                  //adoTBL_DADOS_CORTEFORCA_TRACAO_B_OBTIDO.AsString := edTraEncB.Text;
                  //adoTBL_DADOS_CORTENF_CABO
                  adoTBL_DADOS_CORTEINPUT_OK.AsString := 'S';
                  adoTBL_DADOS_CORTECIRCUITO.AsString := edCircuito.Text;
                  adoTBL_DADOS_CORTECABO.AsString := edCabo.Text;

                  {obtem ops agrupadas}
                   vGroupOP := GetOPsAgrupadasPend(StrToInt(edNumOP.Text));
                   if vGroupOP <> '' then
                   adoTBL_DADOS_CORTEOPS_AGRUPADAS.AsString := vGroupOP;

                   if (f_OverTolerance) then
                     adoTBL_DADOS_CORTENOTA_MEDICAO.AsString := vMSG;
        end;






        adoTBL_DADOS_CORTE.Post;
      except on e:exception  do
       begin
        geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' Falha na gravação dados input [TELA]. OP: '+DM.v_OP_GLOBAL,'LOG_ERRO_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );
        adoTBL_DADOS_CORTE.Cancel;
        SetWindowPos(Self.Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE or SWP_NOACTIVATE );
        Application.MessageBox(pchar('FALHA NA GRAVAÇÃO DOS PARÂMETROS DE MEDIÇÃO! OP: '+edNumOP.Text+#13+' Erro: '+e.Message),'Atenção',MB_OK+MB_ICONERROR);
        frmInfParMedicao.Close;
        Exit;
       end;


   end;



     {Se existem OPs agrupadas, grava medidas das OPs conforme Op atual}
     if (F_MOTIVO_INPUT  = 'F') and ( vGroupOP <> '' ) then
      begin

        v_OP_SQL_IN := StringReplace(vGroupOP,'-',',',[rfReplaceAll]);


         adoQyConvertFunc.Close;
         adoQyConvertFunc.SQL.Clear;
         adoQyConvertFunc.SQL.Text := 'update DADOS_RELAT_CORTE set '+
         ' COMPR_OBTIDO = '+QuotedStr(edCompCaboObt.Text)+
         ', ALT_COND_A_OBTIDO = '+QuotedStr(edAltEncCondA.Text)+
         ', ALT_ISOL_A_OBTIDO = '+QuotedStr(edAltEncGrampIsolA.Text)+
         ', ALT_COND_B_OBTIDO = '+QuotedStr(edAltEncCondB.Text)+
         ', ALT_ISOL_B_OBTIDO = '+QuotedStr(edAltEncGrampIsolB.Text)+

         ',ALT_COND_A_INICIAL = '+QuotedStr(adoTBL_DADOS_CORTEALT_COND_A_INICIAL.AsString) +
         ',ALT_ISOL_A_INICIAL = '+QuotedStr(adoTBL_DADOS_CORTEALT_ISOL_A_INICIAL.AsString) +
         ',ALT_ISOL_B_INICIAL = '+QuotedStr(adoTBL_DADOS_CORTEALT_ISOL_B_INICIAL.AsString) +
         ',ALT_COND_B_INICIAL = '+QuotedStr(adoTBL_DADOS_CORTEALT_COND_B_INICIAL.AsString) +
         ',TRACAO_A_INICIAL   = '+QuotedStr(adoTBL_DADOS_CORTETRACAO_A_INICIAL.AsString) +
         ',TRACAO_B_INICIAL   = '+QuotedStr(adoTBL_DADOS_CORTETRACAO_B_INICIAL.AsString) +
         ',NF_CABO            = '+QuotedStr(adoTBL_DADOS_CORTENF_CABO.AsString) +
         ',NF_TERM_A          = '+QuotedStr(adoTBL_DADOS_CORTENF_TERM_A.AsString) +
         ',NF_TERM_B          = '+QuotedStr(adoTBL_DADOS_CORTENF_TERM_B.AsString) +
         ',COMPR_CABO_INICIAL = '+QuotedStr(adoTBL_DADOS_CORTECOMPR_CABO_INICIAL.AsString)+
         ',CABO = '+QuotedStr(adoTBL_DADOS_CORTECABO.AsString)+
         ',REGISTRO_OPERADOR  = '+QuotedStr(adoTBL_DADOS_CORTEREGISTRO_OPERADOR.AsString)+
         ', INPUT_OK = ''S'' '+
         ' where ORDERID in ('+v_OP_SQL_IN+')' ;



       try
         adoQyConvertFunc.ExecSQL;
       except on e:exception  do
         begin
          //Application.MessageBox(pchar('FALHA NA ATUALIZAÇÃO DOS PARÂMETROS DE MEDIÇÃO!'+#13+' Erro: '+e.Message),'Atenção',MB_OK+MB_ICONERROR);
          geraLog(FormatDateTime('dd.mm.yy hh:nn:ss',now)+' - FALHA NA ATUALIZAÇÃO DOS PARÂMETROS DE MEDIÇÃO! Erro: '+e.Message,'LOG_ERRO_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','c:\KomaxSystem' );
          Exit;
         end;

       end;

       vGroupOP := '';
       v_OP_SQL_IN := '';
      end;


     {fecha tela}
     F_INPUT_OK := True;

     SendMessage(dm.FindWindowExtd('Komax TopWin'),WM_SYSCOMMAND,SC_MAXIMIZE,0);
     //BringWindowToTop(dm.FindWindowExtd('TopWin'));
     SetForegroundWindow(dm.FindWindowExtd('Komax TopWin'));
     frmInfParMedicao.Close;

     
 end; //With DM2




end;

procedure TfrmInfParMedicao.bitFecharClick(Sender: TObject);
begin


{desativa FORM TOPMOST}
 SetWindowPos(Self.Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE or SWP_NOACTIVATE );



  //força minimização da janela ativa - TopWin
  SendMessage(GetForegroundWindow,WM_SYSCOMMAND,SC_MINIMIZE,0);

  dm.f_AllowClose := False;

  if frmPassFechar = nil then
 Application.CreateForm(TfrmPassFechar,frmPassFechar);
 frmPassFechar.ShowModal;





  {SendMessage(frmPassFechar.Handle,WM_SYSCOMMAND,SC_RESTORE,0);
  BringWindowToTop(frmPassFechar.Handle);
  SetForegroundWindow(frmPassFechar.Handle);

 }
 if NOT dm.f_AllowClose then
   begin
    SendMessage(frmInfParMedicao.Handle,WM_SYSCOMMAND,SC_RESTORE,0);
    //BringWindowToTop(frmInfParMedicao.Handle);

    Abort;

   end
 else
   frmInfParMedicao.Close;


end;

procedure TfrmInfParMedicao.edAltEncCondAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_RETURN then
 Perform(Wm_NextDlgCtl,0,0);
end;

procedure TfrmInfParMedicao.edAltEncCondBKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_RETURN then
 Perform(Wm_NextDlgCtl,0,0);
end;

procedure TfrmInfParMedicao.edAltEncGrampIsolAKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key = VK_RETURN then
 Perform(Wm_NextDlgCtl,0,0);
end;

procedure TfrmInfParMedicao.edAltEncGrampIsolBKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key = VK_RETURN then
 Perform(Wm_NextDlgCtl,0,0);
end;

procedure TfrmInfParMedicao.edCompCaboObtKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_RETURN then
 Perform(Wm_NextDlgCtl,0,0);
end;

procedure TfrmInfParMedicao.edTraEncAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_RETURN then
 Perform(Wm_NextDlgCtl,0,0);
end;

procedure TfrmInfParMedicao.edTraEncBKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_RETURN then
 Perform(Wm_NextDlgCtl,0,0);
end;

procedure TfrmInfParMedicao.FormActivate(Sender: TObject);
begin
SetWindowPos(Handle,HWND_TOPMOST,0,0,0,0,SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE);
end;

procedure TfrmInfParMedicao.FormClose(Sender: TObject; var Action: TCloseAction);
var auxMSG : string;
begin


 with dm do
  begin


   {desativa FORM TOPMOST}
   SetWindowPos(Self.Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE or SWP_NOACTIVATE );



    {verifica fechamento da tela de input sem informar dados de medição}
   if(   (getDadosRelatCorte(StrToInt(edNumOP.Text) ) > 0)and (F_INPUT_OK = FALSE )   )then
      begin

       {desativa FORM TOPMOST}
       SetWindowPos(Self.Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE or SWP_NOACTIVATE );

         if MessageDlg('Confirma fechamento da tela de informação de medidas?!', mtConfirmation,[mbYes,mbNo],0 ) = mrNo then
         begin

          Abort;
         end;

       

       if not adoTBL_DADOS_CORTE.Active then
       adoTBL_DADOS_CORTE.Open;

       if adoTBL_DADOS_CORTE.Locate('ORDERID',StrToInt(edNumOP.Text),[]) then    //getDadosRelatCorte(StrToInt(edNumOP.Text) ) > 0
         begin

             adoTBL_DADOS_CORTE.Edit;


            auxMSG := 'MEDIÇÃO IGNORADA';

            if F_MOTIVO_INPUT = 'F' then
               auxMSG := 'MEDIÇÃO IGNORADA PELO OPERADOR'
            else if F_MOTIVO_INPUT = 'R' then
               auxMSG := 'MEDIÇÃO NA RETOMADA DE TRABALHO IGNORADA PELO OPERADOR'
            else if F_MOTIVO_INPUT = 'Q' then
               auxMSG := 'MEDIÇÃO IGNORADA PELO INSPETOR DE QUALIDADE';


            adoTBL_DADOS_CORTE.Edit;
            adoTBL_DADOS_CORTEOBSERVACAO.AsString := auxMSG;
            adoTBL_DADOS_CORTE.Post;

         end;

      end;






  end;


  {busca nova op iniciada}
   frmPrincipal.tCheckOpFinished.Enabled := False;
  frmPrincipal.tCheckOPStarted.Enabled := True;


  dm.F_TIPO_INPUT := '';

 // frmPrincipal.tHideForm.Enabled := True;
  ShowWindow(frmPrincipal.Handle,SW_HIDE);


 frmInfParMedicao := nil;

end;

procedure TfrmInfParMedicao.FormCreate(Sender: TObject);
begin

 with frmPrincipal do
 begin
  {}
  tCheckOPStarted.Enabled := False;
  tCheckOpFinished.Enabled := False;

 end;

end;

procedure TfrmInfParMedicao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if Key = VK_RETURN then
 Perform(Wm_NextDlgCtl,0,0);

end;

procedure TfrmInfParMedicao.FormShow(Sender: TObject);
begin


   DecimalSeparator  := '.';


       {ATIVA FORM TOPMOST}
  SetWindowPos(Self.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE or SWP_NOACTIVATE ); //or SWP_NOACTIVATE

   SendMessage(Self.Handle,WM_ACTIVATE,0,0);

   SimularClick(edCompCaboObt.Left,edCompCaboObt.Top);

  // SetWindowPos(Self.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE or SWP_NOACTIVATE ); //or SWP_NOACTIVATE

   with dm do
   begin



     // Mostrar as ops
      adoQySDBConvert1.Close;
      adoQySDBConvert1.SQL.Clear;
      adoQySDBConvert1.SQL.Add('SELECT OrderID,Circuito,Quantidade,Comprimento,Cabo,Term_A,Selo_A,Term_B,Selo_B, ');
      adoQySDBConvert1.SQL.Add(' Alt_Cond_A,Alt_Cond_B,Alt_Isol_A,Alt_Isol_B,Forc_Trac_A,Forc_Trac_B ');
      adoQySDBConvert1.SQL.Add(' FROM [Status_Prod] with(nolock) WHERE [OrderID] = :pOrder ');
      if (F_TIPO_INPUT = 'M')and (vSelectOp <> '') then
       adoQySDBConvert1.Parameters.ParamByName('pOrder').Value := vSelectOp
      else
      adoQySDBConvert1.Parameters.ParamByName('pOrder').Value := v_OP_GLOBAL;

      adoQySDBConvert1.Open;


      {preenche campos}

       edNumOP.Text := adoQySDBConvert1.FieldByName('OrderID').AsString;
       edCircuito.Text := adoQySDBConvert1.FieldByName('Circuito').AsString;
       edCabo.Text := adoQySDBConvert1.FieldByName('Cabo').AsString;
       edCompCaboEsp.Text := adoQySDBConvert1.FieldByName('Comprimento').AsString;

       vBitol := GetBitolaFromDescCabo(edCabo.Text);

       {Aplicação A}
       lbAplicTermA.Caption := adoQySDBConvert1.FieldByName('Term_A').AsString;
       lbAplicSeloA.Caption := adoQySDBConvert1.FieldByName('Selo_A').AsString;

       if lbAplicTermA.Caption <> '' then
        begin

         edTraEspA.Text := StringReplace(adoQySDBConvert1.FieldByName('Forc_Trac_A').AsString,',','.',[]);
         edAltEspCondA.Text := StringReplace(adoQySDBConvert1.FieldByName('Alt_Cond_A').AsString,',','.',[]);
         edAltEspGrampIsolA.Text := StringReplace(adoQySDBConvert1.FieldByName('Alt_Isol_A').AsString,',','.',[]);

         vTolerAltCondA := GetToleranciaTermSpecif(lbAplicTermA.Caption,vBitol,'ALT_COND');
         vTolerAltIsolA := GetToleranciaTermSpecif(lbAplicTermA.Caption,vBitol,'ALT_ISOL');

        end;

       {Aplicação B}

       lbAplicTermB.Caption := adoQySDBConvert1.FieldByName('Term_B').AsString;
       lbAplicSeloB.Caption := adoQySDBConvert1.FieldByName('Selo_B').AsString;

       if lbAplicTermB.Caption <> '' then
        begin
         edTraEspB.Text := StringReplace(adoQySDBConvert1.FieldByName('Forc_Trac_B').AsString,',','.',[]);
         edAltEspCondB.Text := StringReplace(adoQySDBConvert1.FieldByName('Alt_Cond_B').AsString,',','.',[]);
         edAltEspGrampIsolB.Text := StringReplace(adoQySDBConvert1.FieldByName('Alt_Isol_B').AsString,',','.',[]);

          vTolerAltCondB := GetToleranciaTermSpecif(lbAplicTermB.Caption,vBitol,'ALT_COND') ;
          vTolerAltIsolB := GetToleranciaTermSpecif(lbAplicTermB.Caption,vBitol,'ALT_ISOL') ;

        end;




      frmInfParMedicao.Color := clBtnFace;



     {verifica motivo input parâmetros}
      if F_MOTIVO_INPUT = 'F' then
         begin

            pnlMSGTitulo.Caption := 'MEDIÇÃO FINAL';

           {habilita campos}
           edCompCaboObt.Enabled := True;
           edCompCaboObt.Color := $00B0FFFF;

           edCompCaboObt.SetFocus;


           if lbAplicTermA.Caption <> '' then
            begin
               edAltEncCondA.Enabled := True;
               edAltEncCondA.Color := $00B0FFFF;
               edAltEncGrampIsolA.Enabled := True;
               edAltEncGrampIsolA.Color := $00B0FFFF;


            end
           else
            begin
               edAltEncCondA.Enabled := False;
               edAltEncCondA.Color := clBtnFace;
               edAltEncGrampIsolA.Enabled := False;
               edAltEncGrampIsolA.Color := clBtnFace;

          
            end;


           if lbAplicTermB.Caption <> '' then
            begin
               edAltEncCondB.Enabled := True;
               edAltEncCondB.Color := $00B0FFFF;
               edAltEncGrampIsolB.Enabled := True;
               edAltEncGrampIsolB.Color := $00B0FFFF;
            end
           else
            begin
               edAltEncCondB.Enabled := False;
               edAltEncCondB.Color := clBtnFace;
               edAltEncGrampIsolB.Enabled := False;
               edAltEncGrampIsolB.Color := clBtnFace;

            end;

            

           {desabilita campos}

           edTraEncA.Enabled := False;
           edTraEncA.Color := clBtnFace;

           edTraEncB.Enabled := False;
           edTraEncB.Color := clBtnFace;

         end

       Else if  F_MOTIVO_INPUT = 'Q' then
         begin

           //***** DEFINIR ACESSO POR SENHA *******

           pnlMSGTitulo.Caption := 'LIBERAÇÃO SETUP (QUALIDADE)';

           {cor background}

           frmInfParMedicao.Color := clTeal;
           frmInfParMedicao.Repaint;

           {habilita campos}

           if lbAplicTermA.Caption <> '' then
            begin

              edTraEncA.Enabled := True;
              edTraEncA.Color := $00B0FFFF;
              edAltEncCondA.Enabled := True;
              edAltEncCondA.Color := $00B0FFFF;
              edAltEncGrampIsolA.Enabled := True;
              edAltEncGrampIsolA.Color := $00B0FFFF;

              edTraEncA.SetFocus;
            end
           else
            begin

               edTraEncA.Enabled := False;
               edTraEncA.Color := clBtnFace;
               edAltEncCondA.Enabled := False;
               edAltEncCondA.Color := clBtnFace;
               edAltEncGrampIsolA.Enabled := False;
               edAltEncGrampIsolA.Color := clBtnFace;

            end;

            if lbAplicTermB.Caption <> '' then
            begin

              edTraEncB.Enabled := True;
              edTraEncB.Color := $00B0FFFF;
              edAltEncCondB.Enabled := True;
              edAltEncCondB.Color := $00B0FFFF;
              edAltEncGrampIsolB.Enabled := True;
              edAltEncGrampIsolB.Color := $00B0FFFF;
            end
           else
            begin

               edTraEncB.Enabled := False;
               edTraEncB.Color := clBtnFace;
               edAltEncCondB.Enabled := False;
               edAltEncCondB.Color := clBtnFace;
               edAltEncGrampIsolB.Enabled := False;
               edAltEncGrampIsolB.Color := clBtnFace;

            end;


           {desabilita campos}

           edCompCaboObt.Enabled := False;
           edCompCaboObt.Color := clBtnFace;

         end

      Else if  F_MOTIVO_INPUT = 'R' then
         begin

           //***** DEFINIR ACESSO POR SENHA *******

           pnlMSGTitulo.Caption := 'RETOMADA DE TRABALHO';

           {habilita campos}
           edCompCaboObt.Enabled := True;
           edCompCaboObt.Color := $00B0FFFF;

           edCompCaboObt.SetFocus;


           if lbAplicTermA.Caption <> '' then
            begin
               edAltEncCondA.Enabled := True;
               edAltEncCondA.Color := $00B0FFFF;
               edAltEncGrampIsolA.Enabled := True;
               edAltEncGrampIsolA.Color := $00B0FFFF;
               edTraEncA.Enabled := True;
               edTraEncA.Color :=$00B0FFFF;

            end
           else
            begin
               edAltEncCondA.Enabled := False;
               edAltEncCondA.Color := clBtnFace;
               edAltEncGrampIsolA.Enabled := False;
               edAltEncGrampIsolA.Color := clBtnFace;
               edTraEncA.Enabled := False;
               edTraEncA.Color := clBtnFace;
            end;


           if lbAplicTermB.Caption <> '' then
            begin
               edAltEncCondB.Enabled := True;
               edAltEncCondB.Color := $00B0FFFF;
               edAltEncGrampIsolB.Enabled := True;
               edAltEncGrampIsolB.Color := $00B0FFFF;
               edTraEncB.Enabled := True;
               edTraEncB.Color :=$00B0FFFF;
            end
           else
            begin
               edAltEncCondB.Enabled := False;
               edAltEncCondB.Color := clBtnFace;
               edAltEncGrampIsolB.Enabled := False;
               edAltEncGrampIsolB.Color := clBtnFace;

               edTraEncB.Enabled := False;
               edTraEncB.Color := clBtnFace;

            end;



           {desabilita campos}

           edCompCaboObt.Enabled := False;
           edCompCaboObt.Color := clBtnFace;



         end ;





        {GRAVA DADOS MEDIÇÃO INICIAL}

       getDadosArqKomax_CodigoScan(vMAQUINA,edNumOP.Text,lbAplicTermA.Caption,lbAplicTermB.Caption);





     Application.ProcessMessages;

   end; //with dm









end;

procedure TfrmInfParMedicao.sbEmergClick(Sender: TObject);
begin


{desativa FORM TOPMOST}
 SetWindowPos(Self.Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE or SWP_NOACTIVATE );



  //força minimização da janela ativa - TopWin
  SendMessage(GetForegroundWindow,WM_SYSCOMMAND,SC_MINIMIZE,0);

  dm.f_AllowClose := False;

  if frmPassFechar = nil then
  Application.CreateForm(TfrmPassFechar,frmPassFechar);
  frmPassFechar.ShowModal;


  {SendMessage(frmPassFechar.Handle,WM_SYSCOMMAND,SC_RESTORE,0);
  BringWindowToTop(frmPassFechar.Handle);
  SetForegroundWindow(frmPassFechar.Handle);

 }
 if NOT dm.f_AllowClose then
   begin
    SendMessage(frmInfParMedicao.Handle,WM_SYSCOMMAND,SC_RESTORE,0);
    //BringWindowToTop(frmInfParMedicao.Handle);

    Abort;

   end
 else
   Application.Terminate;





end;

end.
