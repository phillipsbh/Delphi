unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons,ShellAPI, ComCtrls,DB, ToolWin;

  const
  WM_ICONTRAY = WM_USER + 1;


type
  TfrmPrincipal = class(TForm)
    tCheckOPStarted: TTimer;
    tCheckOpFinished: TTimer;
    tHideForm: TTimer;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    pnlBottom: TPanel;
    bitInfMedidas: TBitBtn;
    ToolBar1: TToolBar;
    sbStartOP: TSpeedButton;
    procedure Timer1Timer(Sender: TObject);
    procedure sbStartOPClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tHideFormTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bitInfMedidasClick(Sender: TObject);
    procedure tCheckOpFinishedTimer(Sender: TObject);
    procedure tCheckOPStartedTimer(Sender: TObject);
  private
    { Private declarations }

    vAuxComprObt : integer;
    vAuxAlt_CondA : string;
    vAuxAlt_CondB : string;
    vAuxIsolA : string;
    vAuxIsolB : string;
    vAuxForca_TracaoA : string;
    vAuxForca_TracaoB : string;
    vGroupOP : string;
    //vAuxOP : string;

    vCNTStartedBlank,vCNT : integer;


   TrayIconData: TNotifyIconData;

   c_ErrBD : integer;



  public
    { Public declarations }
    f_busy : boolean;
    F_PROX_OP_MED : string;
    

    procedure TrayMessage(var Msg: TMessage); message WM_ICONTRAY;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uDM, UInfParMedicao, uDlgMotivoInput, uPassFechar;

{$R *.dfm}


{FUNÇÃO PARA RESPONDER A EVENTOS DO MOUSE NO ICONE NA BARRA DE NOTIFICAÇÃO}
procedure TfrmPrincipal.tHideFormTimer(Sender: TObject);
begin


 //SetWindowPos(Self.Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE or SWP_NOACTIVATE );
  Self.Hide;

 tHideForm.Enabled := False;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin

with dm do
 begin


    {Verifica se existe OP iniciada}
   { adoQyFixOPStarted.Close;
    adoQyFixOPStarted.Parameters.ParamByName('pMaq').Value := vMaquina;
    adoQyFixOPStarted.Open;


    if adoQyFixOPStarted.RecordCount > 0 then
       begin

         if v_OP_GLOBAL <> adoQyFixOPStartedOP.AsString then
            geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' NEW OP INITIATED: '+adoQyFixOPStartedOP.AsString+' PRIOR: '+v_OP_GLOBAL ,'LOG_TESTE_NEW_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );



       end ;
    }








    Application.ProcessMessages;
 end;


end;

procedure TfrmPrincipal.TrayMessage(var Msg: TMessage);
begin
  case Msg.lParam of
    WM_LBUTTONDOWN:
    begin

       SELF.Show;
    end;
    WM_RBUTTONDOWN:
    begin
       SELF.Hide;
    end;
  end;
end;

procedure TfrmPrincipal.bitInfMedidasClick(Sender: TObject);
begin

  if tCheckOpFinished.Enabled = False then
   begin
     Application.MessageBox('Não há OP iniciada!','Atenção',MB_OK+MB_ICONWARNING);
   end;

  if frmDlgMotivoInput = nil then
    Application.CreateForm(TfrmDlgMotivoInput,frmDlgMotivoInput);

   frmDlgMotivoInput.FormStyle := fsStayOnTop;


  // BringWindowToTop(frmDlgMotivoInput.Handle);


 {ShowWindow(frmDlgMotivoInput.Handle,SW_NORMAL);
 SendMessage(frmDlgMotivoInput.Handle,WM_SYSCOMMAND,SC_RESTORE,0);
 BringWindowToTop(frmDlgMotivoInput.Handle);
 SetForegroundWindow(frmDlgMotivoInput.Handle);}


 {desabilita timer 2}
  tCheckOpFinished.Enabled := False;

 frmDlgMotivoInput.ShowModal;
     
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
//teste?
SetWindowPos(Self.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE or SWP_NOACTIVATE);


end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin

//if MessageDlg('Tem certeza que deseja encerrar o programa?!', mtConfirmation,[mbYes,mbNo],0 ) = mrNo then

 dm.f_AllowClose := False;

 Application.CreateForm(TfrmPassFechar,frmPassFechar);
frmPassFechar.ShowModal;


 if dm.f_AllowClose then
  frmPrincipal := nil
 else
  Abort;



   {frmPassFechar.FormStyle := fsNormal; //??fsStayOnTop;
                    frmPassFechar.Visible := true;
                    //frmInfParMedicao.Show;

                    ShowWindow(frmPassFechar.Handle,SW_NORMAL);
                    SendMessage(frmPassFechar.Handle,WM_SYSCOMMAND,SC_RESTORE,0);
                    BringWindowToTop(frmPassFechar.Handle);
                    SetForegroundWindow(frmPassFechar.Handle);     }

end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin

 dm.v_VERSAO := '2.1'; //25.11.2016

{Envia programa para barra de tarefas}
with TrayIconData do
  begin
    cbSize := SizeOf(TrayIconData);
    Wnd := Handle;
    uID := 0;
    uFlags := NIF_MESSAGE + NIF_ICON + NIF_TIP;
    uCallbackMessage := WM_ICONTRAY;
    hIcon := Application.Icon.Handle;
    StrPCopy(szTip, Application.Title);
  end;



  Shell_NotifyIcon(NIM_ADD, @TrayIconData);



end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
Shell_NotifyIcon(NIM_DELETE, @TrayIconData);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin

 Caption := 'SYMK - '+dm.v_VERSAO;

 {força minimização da janela ativa - TopWin}
  SendMessage(GetForegroundWindow,WM_SYSCOMMAND,SC_MINIMIZE,0);
 SetWindowPos(Self.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE or SWP_NOACTIVATE);



end;

procedure TfrmPrincipal.sbStartOPClick(Sender: TObject);
begin

tCheckOpFinished.Enabled := False;
tCheckOPStarted.Enabled := True;

end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
begin

 if IsIconic(dm.FindWindowExtd('Komax TopWin')) then
     begin
      //showmessage('isIconic');
       SetWindowPos(Self.Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE or SWP_NOACTIVATE );
       SELF.Hide;
      ShowWindow(dm.FindWindowExtd('Komax TopWin'), SW_RESTORE);
     end
    else
     begin
      //showmessage('NOT isIconic');
       SetForegroundWindow(dm.FindWindowExtd('Komax TopWin'));
     end;

end;

procedure TfrmPrincipal.tCheckOpFinishedTimer(Sender: TObject);
var auxStr,vAux,vTest,vReturnCheckFile,vAuxOP : string;
F_OP_OK,F_OP_REMOVIDA,F_OP_ERR,F_OP_FIM :boolean;
begin

 {** 23.03.2016 - Alteração do momento que a tela de input aparece para o operador.
    Antes a tela deveria aparecer ao final da OP atual, quando o circuito da OP atual era diferente da OP anterior.
    Agora a tela deve aparecer ao final da OP atual se a próxima Op tem circuito diferente a atual ou ao final da
    próxima OP se igual  }

 try
  tCheckOpFinished.Enabled := False;
  tCheckOPStarted.Enabled := False;

with dm do
  begin

    Application.ProcessMessages;


    if c_ErrBD > 3 then
     begin
       Application.MessageBox('FALHA NA CONEXÃO COM O BANCO DE DADOS!','ATENÇÃO',MB_OK+MB_ICONERROR);
       Application.Terminate;
     end;


    if (frmInfParMedicao <> nil) or (frmDlgMotivoInput <> nil) then
      begin
       //tCheckOPStarted.Enabled := TRUE;
       exit;
      end;


     {testa BD - SDBCONVERT}

     try

        if  DB_SDBConvert.Connected = False then
            DB_SDBConvert.Connected := True;

     except on e: EDatabaseError do
      begin
        StatusBar1.Panels[0].Text := 'FALHA CONEXÃO BD SDBCONVERT!';
        StatusBar1.Update;
        Self.Repaint;
        c_ErrBD := c_ErrBD + 1;
        tCheckOPStarted.Enabled := TRUE;
        Exit;
      end;

     end;


       {testa BD - TOPNET}

     try

      if  DB_TopNet.Connected = False then
          DB_TopNet.Connected := True;

     except on e: EDatabaseError do
      begin
        c_ErrBD := c_ErrBD + 1;
        StatusBar1.Panels[0].Text := 'FALHA CONEXÃO BD TOPNET!';
        StatusBar1.Update;
        Self.Repaint;
        tCheckOPStarted.Enabled := TRUE;
        Exit;
      end;

     end;

      

    {**** OBTER DADOS MEDIDAS INICIAIS *****!!}
             
            //08.11.2016
           {verifica se OP terminou}

           adoQyFixOPFinished.Close;
           adoQyFixOPFinished.Parameters.ParamByName('pOrdem').Value := v_OP_GLOBAL;
           adoQyFixOPFinished.Open;

           if adoQyFixOPFinishedCNT.AsInteger = 0 then
            F_OP_FIM := True
           else
            begin

             F_OP_FIM := False;

             {if checkFile_OP_Finished(v_OP_GLOBAL,vMAQUINA) = 'OK' then
               begin
                F_OP_FIM := True;
                geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' TESTE CONFIRM OP FINISHED:  '+v_OP_GLOBAL ,'LOG_TESTE_NEW_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );
               end;
              }
            end;

           //verifica se Op com erro
           adoQyOPErr.Close;
           adoQyOPErr.SQL.Clear;
           adoQyOPErr.SQL.Add(' select count(*)cnt from  [SDBConvert].[dbo].[status_prod] sp ');
           adoQyOPErr.SQL.Add('   with (nolock)where  OrderId =:pOP and status in ('''',''Erro'') ');
           adoQyOPErr.SQL.Add('   and OrderId not in (select UserId from [Order]) ');
           adoQyOPErr.Parameters.ParamByName('pOP').Value := v_OP_GLOBAL;
           adoQyOPErr.Open;

            if adoQyOPErrcnt.AsInteger >0 then
             F_OP_ERR := True
            else
             F_OP_ERR := False;



           //Verifica se existe OP iniciada
           adoQyFixOPStarted.Close;
           adoQyFixOPStarted.Parameters.ParamByName('pMaq').Value := vMaquina;
           adoQyFixOPStarted.Open;


           if adoQyFixOPStarted.RecordCount > 1  then
            begin
             adoQyFixOPStarted.Last;
             vAuxOP := adoQyFixOPStartedOP.AsString;
             geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' ERRO: MAIS DO QUE UMA OP INICIADA: ' +v_OP_GLOBAL+' OP2: '+vAuxOP ,'LOG_TESTE_NEW_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );
            end;


           // se NÃO iniciou uma nova op
           if adoQyFixOPStarted.RecordCount = 0  then
            begin


              if vCNTStartedBlank > 3 then
                begin
                  // F_OP_FIM := True;
                  //geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' TESTE OP UNFINISHED['+IntToStr(vCNTStartedBlank)+']'+'  '+v_OP_GLOBAL ,'LOG_TESTE_NEW_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );
                   vCNTStartedBlank := 0;
                   tCheckOpFinished.Enabled := False;
                   tCheckOPStarted.Enabled := True;


                end

              else
                vCNTStartedBlank := vCNTStartedBlank + 1;
             

            end
            else //**if F_OP_FIM then
                 
             begin

                vCNTStartedBlank := 0;


                   {*** TESTE 26.01.2017 ***}
                if adoQyFixOPStartedOP.AsString <> v_OP_GLOBAL then
                 begin

                   vReturnCheckFile := checkFile_OP_Finished(v_OP_GLOBAL,vMAQUINA);

                   if vReturnCheckFile = 'OK' then
                    begin
                     F_OP_FIM := True;
                     geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' OP FINALIZADA: ['+adoQyFixOPStartedOP.AsString+'] '  +v_OP_GLOBAL ,'LOG_TESTE_NEW_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );

                    end
                   else
                    begin

                       if vCNT > 3 then
                        begin
                           F_OP_FIM := True;
                           vCNT := 0;

                        end

                      else
                        vCNT := vCNT + 1;


                     geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' TESTE: '+vReturnCheckFile+'  '+v_OP_GLOBAL ,'LOG_TESTE_NEW_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );
                    end;

                 end;

                  

               //verifica se OP NÃO mais existe (OP finalizada)

                 if (F_OP_FIM) then   //if adoQyFixOPFinishedCNT.AsInteger = 0 then
                 begin


                    //24.02.2017 -> Altera Status OP em Status_Prod
                    //setStatusTabSP(StrToInt(v_OP_GLOBAL),'Completado');


                    //teste: registra OP
                    geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' OP finalizada: '+v_OP_GLOBAL+' - '+v_CIRCUITO_GLOBAL,'LOG_SYMK_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );


                    if F_OP_ERR then
                      geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' OP FINALIZADA COM ERRO.  OP: '+v_OP_GLOBAL+' - '+v_CIRCUITO_GLOBAL,'LOG_ERRO_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );


                        F_TIPO_INPUT := 'A';

                   //Verifica se existe OP iniciada


                       adoQyTopNextOP.Close;
                       adoQyTopNextOP.SQL.Clear;
                       adoQyTopNextOP.SQL.Add(' select TOP(1) o.UserId "OP",p.UserId "Circuito" ');
                       adoQyTopNextOP.SQL.Add('from ProductionJob pj,OrderProductionPosition opp,[Order] o,Product p,Client c WITH (NOLOCK)');
                       adoQyTopNextOP.SQL.Add('where pj.ProductionJobNo = opp.ProductionJobNo and o.OrderNo = opp.OrderNo ');
                       adoQyTopNextOP.SQL.Add('and p.ProductNo = pj.ProductNo and pj.started = 1 and pj.sent = 1 ');
                       adoQyTopNextOP.SQL.Add('and pj.MachineNo = c.ClientNo                                    ');
                       adoQyTopNextOP.SQL.Add('and ClientName =:pMaq and (pj.PiecesGood < pj.TotalPieces or pj.PiecesGood = 0  )             ');
                       adoQyTopNextOP.SQL.Add('order by convert(int,pj.priority),o.UserId ASC ');
                       adoQyTopNextOP.Parameters.ParamByName('pMaq').Value := vMAQUINA;
                       adoQyTopNextOP.Open;

                       v_OP_PROX := adoQyTopNextOPOP.AsString;
                       v_PROX_CIRC := adoQyTopNextOPCircuito.AsString;



                     //se não houve inicialização de OP
                     if v_OP_PROX = '' then
                      begin

                       adoQyTopNextOP.Close;
                       adoQyTopNextOP.SQL.Clear;
                       adoQyTopNextOP.SQL.Add(' select TOP(1) o.UserId "OP",p.UserId "Circuito" ');
                       adoQyTopNextOP.SQL.Add('from ProductionJob pj,OrderProductionPosition opp,[Order] o,Product p,Client c WITH (NOLOCK)');
                       adoQyTopNextOP.SQL.Add('where pj.ProductionJobNo = opp.ProductionJobNo and o.OrderNo = opp.OrderNo ');
                       adoQyTopNextOP.SQL.Add('and p.ProductNo = pj.ProductNo and pj.started = 0 and pj.sent = 1 ');
                       adoQyTopNextOP.SQL.Add('and pj.MachineNo = c.ClientNo                                    ');
                       adoQyTopNextOP.SQL.Add('and ClientName =:pMaq                                            ');
                       adoQyTopNextOP.SQL.Add('order by convert(int ,pj.priority) ');
                       adoQyTopNextOP.Parameters.ParamByName('pMaq').Value := vMAQUINA;
                       adoQyTopNextOP.Open;

                       v_OP_PROX := adoQyTopNextOPOP.AsString;
                       v_PROX_CIRC := adoQyTopNextOPCircuito.AsString;

                     end;



                     //verifica se Circuito Op atual é diferente da proxima OP. Se diferente, exibe tela para input de parâmetros
                     if (v_CIRCUITO_GLOBAL <> v_PROX_CIRC )then      //v_CIRCUITO_ANT
                       begin


                           try
                              //exibe tela de input de parâmetros
                              F_INPUT_OK := False;
                              F_MOTIVO_INPUT  := 'F';

                               if not adoTBL_DADOS_CORTE.Active then
                                    adoTBL_DADOS_CORTE.Open;


                            if DB_SDBConvert.InTransaction then
                              DB_SDBConvert.CommitTrans;

                            DB_SDBConvert.BeginTrans;

                               //Se OP NÃO existe, executa comando INSERT. Se OP já existe, executa comando EDIT
                               if getDadosRelatCorte(StrToInt(v_OP_GLOBAL) ) = 0 then
                                 begin


                                  adoTBL_DADOS_CORTE.Insert;
                                  adoTBL_DADOS_CORTEOrderID.AsInteger := StrToInt(v_OP_GLOBAL);
                                  adoTBL_DADOS_CORTEDATA_RELATORIO.AsDateTime := NOW;
                                  adoTBL_DADOS_CORTEMaquina_Corte.AsString := vMAQUINA;
                                  adoTBL_DADOS_CORTEF_INPUT.AsString := F_TIPO_INPUT + F_MOTIVO_INPUT;
                                  //adoTBL_DADOS_CORTECIRCUITO.AsString := v_CIRCUITO_GLOBAL;
                                   //adoTBL_DADOS_CORTEOPS_AGRUPADAS.AsString := v_OPS_AGRUP;


                                   try

                                     adoTBL_DADOS_CORTE.Post;
                                    except //on e:exception do
                                      begin
                                       geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' Erro gravação[ADOTBL_DADOS_CORTE][1] OP: '+v_OP_GLOBAL,'LOG_ERRO_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );
                                      end;

                                    end;


                                 end;

                            DB_SDBConvert.CommitTrans;


                               //teste 18.11.2016

                              //GRAVA DADOS MEDIÇÃO INICIAL
                               // Mostrar as ops
                                adoQySDBConvert1.Close;
                                adoQySDBConvert1.SQL.Clear;
                                adoQySDBConvert1.SQL.Add('SELECT OrderID,Circuito,Quantidade,Comprimento,Cabo,Term_A,Selo_A,Term_B,Selo_B, ');
                                adoQySDBConvert1.SQL.Add(' Alt_Cond_A,Alt_Cond_B,Alt_Isol_A,Alt_Isol_B,Forc_Trac_A,Forc_Trac_B ');
                                adoQySDBConvert1.SQL.Add(' FROM [Status_Prod] with(nolock) WHERE [OrderID] = :pOrder ');
                                adoQySDBConvert1.Parameters.ParamByName('pOrder').Value := StrToInt(v_OP_GLOBAL);
                                adoQySDBConvert1.Open;


                               if adoQySDBConvert1.RecordCount > 0 then
                                begin
                                 getDadosArqKomax_CodigoScan(vMAQUINA,v_OP_GLOBAL,adoQySDBConvert1.FieldByName('Term_A').AsString,adoQySDBConvert1.FieldByName('Term_B').AsString);

                                end;



                              //força minimização da janela ativa - TopWin
                              SendMessage(GetForegroundWindow,WM_SYSCOMMAND,SC_MINIMIZE,0);

                              //SendMessage(FindWindowExtd('SIMK'),WM_SYSCOMMAND,SC_RESTORE,0);  //??


                              if frmInfParMedicao = nil then
                              Application.CreateForm(TfrmInfParMedicao,frmInfParMedicao);

                              frmInfParMedicao.FormStyle := fsNormal; //??fsStayOnTop;
                              frmInfParMedicao.Visible := true;
                              frmInfParMedicao.pnlMsgGeral.Caption := '';
                              //frmInfParMedicao.Show;

                              ShowWindow(frmInfParMedicao.Handle,SW_NORMAL);
                              SendMessage(frmInfParMedicao.Handle,WM_SYSCOMMAND,SC_RESTORE,0);
                              BringWindowToTop(frmInfParMedicao.Handle);
                              SetForegroundWindow(frmInfParMedicao.Handle);

                              //reset variavel
                              //v_OPS_AGRUP := '';
                              F_PROX_OP_MED := '';



                          except //on e:exception do
                            begin
                            geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' Erro gravação/input medidas[1]. OP: '+v_OP_GLOBAL ,'LOG_ERRO_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );

                            DB_SDBConvert.RollbackTrans;
                            end;

                          end;

                       end
                     else //se mesmo circuito, grava OP com dados medição da OP anterior
                     begin

                       try
                           F_PROX_OP_MED := v_OP_PROX;

                            if not adoTBL_DADOS_CORTE.Active then
                            adoTBL_DADOS_CORTE.Open;

                            if DB_SDBConvert.InTransaction then
                             DB_SDBConvert.CommitTrans;

                            DB_SDBConvert.BeginTrans;


                            //Se OP NÃO existe, executa comando INSERT. Se OP já existe, executa comando EDIT
                            //dados medição de OP anterior
                            if getDadosRelatCorte(StrToInt(v_OP_GLOBAL) ) = 0 then
                            begin

                               adoTBL_DADOS_CORTE.Insert;
                               adoTBL_DADOS_CORTEOrderID.AsInteger := StrToInt(v_OP_GLOBAL);
                               adoTBL_DADOS_CORTEDATA_RELATORIO.AsDateTime := NOW;

                               adoTBL_DADOS_CORTEMaquina_Corte.AsString := vMAQUINA;
                               adoTBL_DADOS_CORTEOBSERVACAO.AsString := 'Medidas vinculadas a OP: '+v_OP_PROX;
                               adoTBL_DADOS_CORTEINPUT_OK.AsString := 'N';
                               adoTBL_DADOS_CORTEINPUT_OP_LINK.AsString := v_OP_PROX;
                               adoTBL_DADOS_CORTEF_INPUT.AsString := F_TIPO_INPUT;
                               adoTBL_DADOS_CORTECIRCUITO.AsString := v_CIRCUITO_GLOBAL;

                               try
                               adoTBL_DADOS_CORTE.Post;
                               except // on e:exception do
                                begin
                                 geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' Erro gravação[ADOTBL_DADOS_CORTE][2] OP: '+v_OP_GLOBAL,'LOG_ERRO_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );
                                end;

                               end;


                               //adoTBL_DADOS_CORTE.Close;

                            end;


                        DB_SDBConvert.CommitTrans;
                        adoTBL_DADOS_CORTE.Open;

                         //GRAVA DADOS MEDIÇÃO INICIAL
                           // Mostrar as ops
                            adoQySDBConvert1.Close;
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


                        // v_OP_GLOBAL := '';

                         //busca op iniciada
                         tCheckOpFinished.Enabled := False;
                         tCheckOPStarted.Enabled := True;
                         Exit;


                       except //on e:exception do

                         geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' Erro gravação/input medidas[2]. OP: '+v_OP_GLOBAL ,'LOG_ERRO_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );
                       end;



                      end; //else  //se mesmo circuito, grava OP com dados medição da OP anterior



                   Application.ProcessMessages;


                 end; // if {verifica se OP NÃO mais existe (OP finalizada)




             end;


   StatusBar1.Panels[0].Text := pchar('Aguardando finalização OP: '+v_OP_GLOBAL);
   StatusBar1.Update;
   Self.Repaint;
   Application.ProcessMessages;
   tCheckOpFinished.Enabled := True;


  end; //with dm1

 except //on e:exception do
  begin
    Application.ProcessMessages;
    tCheckOpFinished.Enabled := False;
    //tCheckOPStarted.Enabled := True;
    dm.geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' Falha em tCheckOpFinishedTimer. OP: '+DM.v_OP_GLOBAL,'LOG_ERRO_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );
    tCheckOPStarted.Enabled := True;
    Exit;
  end;

 end;



end;

procedure TfrmPrincipal.tCheckOPStartedTimer(Sender: TObject);
var vAuxOP :string;
begin

with dm do
 begin

   tCheckOPStarted.Enabled := False;

    {testa BD - SDBCONVERT}

     try

        if  DB_SDBConvert.Connected = False then
            DB_SDBConvert.Connected := True;

     except on e: EDatabaseError do
      begin
        StatusBar1.Panels[0].Text := 'FALHA CONEXÃO BD SDBCONVERT!';
        StatusBar1.Update;
        Self.Repaint;
        Exit;
      end;

     end;


    {testa BD - TOPNET}

     try

       if DB_TopNet.Connected = False then
          DB_TopNet.Connected := True;

     except on e: EDatabaseError do
      begin
        StatusBar1.Panels[0].Text := 'FALHA CONEXÃO BD TOPNET!';
        StatusBar1.Update;
        Self.Repaint;
        Exit;
      end;

     end;


   StatusBar1.Panels[0].Text  := 'Aguardando Inicialização OP...';
   StatusBar1.Update;
   Self.Repaint;
   Application.ProcessMessages;

   v_OP_GLOBAL := '';
  if vMaquina <> '' then
   begin

    {Verifica se existe OP iniciada}
    adoQyFixOPStarted.Close;
    adoQyFixOPStarted.Parameters.ParamByName('pMaq').Value := vMaquina;
    adoQyFixOPStarted.Open;



    {se existe OP iniciada}
    if adoQyFixOPStarted.RecordCount > 0 then
       begin


         if adoQyFixOPStarted.RecordCount > 1 then
         begin

           adoQyFixOPStarted.Last;
           vAuxOP := adoQyFixOPStartedOP.AsString;
           geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' ERRO: MAIS DO QUE UMA OP INICIADA: ' +v_OP_GLOBAL+' OP2: '+vAuxOP ,'LOG_TESTE_NEW_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );

         end;

         bitInfMedidas.Enabled := True;

          {obtem dados OP iniciada}
          v_OP_GLOBAL := adoQyFixOPStartedOP.AsString;
          v_CIRCUITO_GLOBAL := adoQyFixOPStartedCircuito.AsString;


         {}

          {ativa timer verificação OP finalizada}
          tCheckOpFinished.Enabled := True;
          {desativa timer verificação OP iniciada}
          tCheckOPStarted.Enabled := False;


        //* setControlOP_IniProx(StrToInt(v_OP_GLOBAL),0,0,vMAQUINA,v_CIRCUITO_GLOBAL,'');

          StatusBar1.Panels[0].Text  := 'OP Iniciada: '+v_OP_GLOBAL;
          StatusBar1.Update;
          Self.Repaint;
          Application.ProcessMessages;


       end

    else
      begin

      tCheckOpFinished.Enabled := False;
      tCheckOPStarted.Enabled := True;
      bitInfMedidas.Enabled := False;
      end;


   end;


 end;


end;

end.
