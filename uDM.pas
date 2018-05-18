unit uDM;

interface

uses
  SysUtils, Classes, DB, ADODB,IniFiles,Windows,Forms,Dialogs;

type
  Tdm = class(TDataModule)
    DB_SDBConvert: TADOConnection;
    adoTBL_DADOS_CORTE: TADOTable;
    DB_TopNet: TADOConnection;
    adoQyFixOPStarted: TADOQuery;
    adoQyFixOPStartedOP: TStringField;
    adoQyFixOPStartedCircuito: TStringField;
    adoQyFixOPFinished: TADOQuery;
    adoQyFixOPFinishedCNT: TIntegerField;
    adoQyDadosRelat: TADOQuery;
    adoQySDBConvert1: TADOQuery;
    adoQyConvertFunc: TADOQuery;
    adoQyTopnetFunc: TADOQuery;
    adoQyDadosRelatID_REGISTRO: TAutoIncField;
    adoQyDadosRelatOrderID: TIntegerField;
    adoQyDadosRelatCOMPR_OBTIDO: TIntegerField;
    adoQyDadosRelatNF_CABO: TStringField;
    adoQyDadosRelatCOD_MA_A: TStringField;
    adoQyDadosRelatNF_TERM_A: TStringField;
    adoQyDadosRelatALT_COND_A_OBTIDO: TStringField;
    adoQyDadosRelatALT_ISOL_A_OBTIDO: TStringField;
    adoQyDadosRelatFORCA_TRACAO_A_OBTIDO: TStringField;
    adoQyDadosRelatCOD_MA_B: TStringField;
    adoQyDadosRelatNF_TERM_B: TStringField;
    adoQyDadosRelatALT_COND_B_OBTIDO: TStringField;
    adoQyDadosRelatALT_ISOL_B_OBTIDO: TStringField;
    adoQyDadosRelatFORCA_TRACAO_B_OBTIDO: TStringField;
    adoQyDadosRelatMaquina_Corte: TStringField;
    adoQyDadosRelatDATA_RELATORIO: TDateTimeField;
    adoQyDadosRelatLIBERA_SETUP_QUALIDADE: TStringField;
    adoQyDadosRelatREGISTRO_OPERADOR: TStringField;
    adoQyDadosRelatTRACAO_RETOMA_TRAB_A: TStringField;
    adoQyDadosRelatALT_COND_RETOMA_TRAB_A: TStringField;
    adoQyDadosRelatALT_COND_RETOMA_TRAB_B: TStringField;
    adoQyDadosRelatALT_ISOL_RETOMA_TRAB_A: TStringField;
    adoQyDadosRelatALT_ISOL_RETOMA_TRAB_B: TStringField;
    adoQyDadosRelatTRACAO_RETOMA_TRAB_B: TStringField;
    adoQyDadosRelatTRACAO_A_QUALIDADE: TStringField;
    adoQyDadosRelatTRACAO_B_QUALIDADE: TStringField;
    adoQyDadosRelatALT_COND_A_QUALIDADE: TStringField;
    adoQyDadosRelatALT_COND_B_QUALIDADE: TStringField;
    adoQyDadosRelatALT_ISOL_A_QUALIDADE: TStringField;
    adoQyDadosRelatALT_ISOL_B_QUALIDADE: TStringField;
    adoQyDadosRelatREGISTRO_INSP_QUALIDADE: TStringField;
    adoTBL_DADOS_CORTEID_REGISTRO: TAutoIncField;
    adoTBL_DADOS_CORTEOrderID: TIntegerField;
    adoTBL_DADOS_CORTECOMPR_OBTIDO: TIntegerField;
    adoTBL_DADOS_CORTENF_CABO: TStringField;
    adoTBL_DADOS_CORTECOD_MA_A: TStringField;
    adoTBL_DADOS_CORTENF_TERM_A: TStringField;
    adoTBL_DADOS_CORTEALT_COND_A_OBTIDO: TStringField;
    adoTBL_DADOS_CORTEALT_ISOL_A_OBTIDO: TStringField;
    adoTBL_DADOS_CORTEFORCA_TRACAO_A_OBTIDO: TStringField;
    adoTBL_DADOS_CORTECOD_MA_B: TStringField;
    adoTBL_DADOS_CORTENF_TERM_B: TStringField;
    adoTBL_DADOS_CORTEALT_COND_B_OBTIDO: TStringField;
    adoTBL_DADOS_CORTEALT_ISOL_B_OBTIDO: TStringField;
    adoTBL_DADOS_CORTEFORCA_TRACAO_B_OBTIDO: TStringField;
    adoTBL_DADOS_CORTEMaquina_Corte: TStringField;
    adoTBL_DADOS_CORTEDATA_RELATORIO: TDateTimeField;
    adoTBL_DADOS_CORTELIBERA_SETUP_QUALIDADE: TStringField;
    adoTBL_DADOS_CORTEREGISTRO_OPERADOR: TStringField;
    adoTBL_DADOS_CORTETRACAO_RETOMA_TRAB_A: TStringField;
    adoTBL_DADOS_CORTEALT_COND_RETOMA_TRAB_A: TStringField;
    adoTBL_DADOS_CORTEALT_COND_RETOMA_TRAB_B: TStringField;
    adoTBL_DADOS_CORTEALT_ISOL_RETOMA_TRAB_A: TStringField;
    adoTBL_DADOS_CORTEALT_ISOL_RETOMA_TRAB_B: TStringField;
    adoTBL_DADOS_CORTETRACAO_RETOMA_TRAB_B: TStringField;
    adoTBL_DADOS_CORTETRACAO_A_QUALIDADE: TStringField;
    adoTBL_DADOS_CORTETRACAO_B_QUALIDADE: TStringField;
    adoTBL_DADOS_CORTEALT_COND_A_QUALIDADE: TStringField;
    adoTBL_DADOS_CORTEALT_COND_B_QUALIDADE: TStringField;
    adoTBL_DADOS_CORTEALT_ISOL_A_QUALIDADE: TStringField;
    adoTBL_DADOS_CORTEALT_ISOL_B_QUALIDADE: TStringField;
    adoTBL_DADOS_CORTEREGISTRO_INSP_QUALIDADE: TStringField;
    adoTBL_DADOS_CORTEOBSERVACAO: TStringField;
    adoQyDadosRelatOBSERVACAO: TStringField;
    adoTBL_DADOS_CORTEF_INPUT: TStringField;
    adoQyTopNextOP: TADOQuery;
    adoQyTopNextOPOP: TStringField;
    adoQyTopNextOPCircuito: TStringField;
    adoTBL_DADOS_CORTEALT_COND_A_INICIAL: TStringField;
    adoTBL_DADOS_CORTEALT_ISOL_A_INICIAL: TStringField;
    adoTBL_DADOS_CORTEALT_ISOL_B_INICIAL: TStringField;
    adoTBL_DADOS_CORTEALT_COND_B_INICIAL: TStringField;
    adoTBL_DADOS_CORTETRACAO_A_INICIAL: TStringField;
    adoTBL_DADOS_CORTETRACAO_B_INICIAL: TStringField;
    adoTBL_DADOS_CORTEOPS_AGRUPADAS: TStringField;
    adoQyDadosRelatF_INPUT: TStringField;
    adoQyDadosRelatALT_COND_A_INICIAL: TStringField;
    adoQyDadosRelatALT_ISOL_A_INICIAL: TStringField;
    adoQyDadosRelatALT_ISOL_B_INICIAL: TStringField;
    adoQyDadosRelatALT_COND_B_INICIAL: TStringField;
    adoQyDadosRelatTRACAO_A_INICIAL: TStringField;
    adoQyDadosRelatTRACAO_B_INICIAL: TStringField;
    adoQyDadosRelatOPS_AGRUPADAS: TStringField;
    adoTBL_DADOS_CORTEINPUT_OK: TStringField;
    adoTBL_DADOS_CORTEINPUT_OP_LINK: TIntegerField;
    adoQyDadosRelatINPUT_OK: TStringField;
    adoQyDadosRelatINPUT_OP_LINK: TIntegerField;
    adoQyConvertFunc2: TADOQuery;
    adoQyGeral1: TADOQuery;
    adoTBL_DADOS_CORTENOTA_MEDICAO: TStringField;
    adoTBL_DADOS_CORTECOMPR_CABO_INICIAL: TStringField;
    adoTBLControlOP: TADOTable;
    adoQyOPErr: TADOQuery;
    adoQyOPErrcnt: TIntegerField;
    adoTBL_DADOS_CORTECIRCUITO: TStringField;
    adoTBL_DADOS_CORTECABO: TStringField;
    adoTBLControlOPID_Control: TAutoIncField;
    adoTBLControlOPMaquinaCorte: TStringField;
    adoTBLControlOPDataOperacao: TDateTimeField;
    adoTBLControlOPOp_Iniciada: TIntegerField;
    adoTBLControlOPOp_Anterior: TIntegerField;
    adoTBLControlOPOp_Proxima: TIntegerField;
    adoTBLControlOPCircuito_Iniciado: TStringField;
    adoTBLControlOPCircuito_Proximo: TStringField;
    adoTBLControlOPALT_COND_A_INICIAL: TStringField;
    adoTBLControlOPALT_COND_B_INICIAL: TStringField;
    adoTBLControlOPALT_ISOL_A_INICIAL: TStringField;
    adoTBLControlOPALT_ISOL_B_INICIAL: TStringField;
    adoTBLControlOPTRACAO_A_INICIAL: TStringField;
    adoTBLControlOPTRACAO_B_INICIAL: TStringField;
    adoTBLControlOPNF_TERM_A: TStringField;
    adoTBLControlOPNF_TERM_B: TStringField;
    adoTBLControlOPCOMPR_CABO_INICIAL: TStringField;
    adoTBLControlOPNOTA_MEDICAO: TStringField;
    adoTBLControlOPNF_CABO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }

    iniConf : TIniFile;
    dataSrc,dataSrcTest : string;


  public
    { Public declarations }

    vMAQUINA : string;
    F_MOTIVO_INPUT : string; // [F]-> Medição Final - [Q]-> Liberação Setup (Qualidade) - [R]-> Retomada de Trabalho
    F_TIPO_INPUT : string; // [A]-> Automático - [M]-> Manual
    F_REG_INSP_QUAL : string;
    v_OP_GLOBAL : string;
    v_OP_ANT : string;
    v_OP_PROX : string;
    v_CIRCUITO_GLOBAL :string;
    v_CIRCUITO_ANT :string;
   // v_CIRCUITO_PROX : string;
    v_PROX_CIRC : string;
    v_OPS_AGRUP : string;
    F_OP_AUX_OP_STARTED : string;
    vSelectOp : string;
    

    F_INPUT_OK,F_ERROR,f_AllowClose : boolean;

    F_PARAM_EXT : string;

    v_VERSAO : string;

   function getDadosRelatCorte(pOP : integer): integer;
   function FindWindowExtd(partialTitle: string): HWND;

   function validaAndGetDadosLogin(pReg,pSenha,pAcesso : string):boolean;

   function GetBitolaFromDescCabo(pCabo : string): string;
   function GetToleranciaTermSpecif(pTerm,pBitola,pEspecif : string):string;//pEspecif = [ALT_COND],[ALT_ISOL],[TRACAO]
   function GetValueTermSpecif(pTerm,pBitola,pEspecif : string):string;//pEspecif = [ALT_COND],[ALT_ISOL],[TRACAO]
   procedure GetDadosProxOP(pMachine : string);
   function GetOPsAgrupadasPend(pOpAtual : integer):string;
   procedure ReplicaDadosMedOp(pOP : string);
   procedure getDadosArqKomax_CodigoScan(pMaquina: String; pOp : string; pTermA : string; pTermB : string);


   procedure setControlOPSYMK(pOP : Integer;pMaq,AltCA,AltCB,AltIA,AltIB,TA,TB,NFA,NFB,NFC,PObs : string);
   procedure setControlOP_IniProx(pOP,pOP_Prox,pOP_Last : Integer;pMaq,pCirc,pCirc_Prox : string);

   procedure getControlOP_dados(pMaq : string);

   procedure geraLog(texto,nomArq,nomDir : string);
   //** 26.01.2017
   function checkFile_OP_Finished(pOP,pMaq : string):string; // {OK}-> Finalizada  /{PEND}-> Pendente /{SKIP}-> OP Não finalizou e foi iniciada uma nova
   procedure setStatusTabSP(pOP : Integer;pStatus : String );

   function getSenhaLib1():string;
   procedure updateSenhaLib1(pPass : string);

   function getJustNumbers(pText : string):string;

  end;

var
  dm: Tdm;

implementation

{$R *.dfm}




	
{ainda não utilizado no programa... 18.05.2016}
function WinActivate(const AWinTitle: string): boolean;
var
  _WindowHandle: HWND;
begin
  Result := false;
  _WindowHandle := FindWindow(nil, PChar(AWinTitle));
  if _WindowHandle <> 0 then
  begin
    if IsIconic(_WindowHandle) then
      Result := ShowWindow(_WindowHandle, SW_RESTORE)
    else
      Result := SetForegroundWindow(_WindowHandle);
  end;
end;


function Tdm.checkFile_OP_Finished(pOP,pMaq: string): string;
var
Lista: TextFile;
Year, Month, Day, Hour, Min, Sec, MSec: Word;
Data: TDateTime;
Ano, Mes, Dia,Caminhoarq,Caminhoarq2,pTesteOP, linha, vAuxResult: String;

F_Path1,F_Path2,F_ProductionFim,F_ProductionStart,F_ProductionStart_Teste,F_OP_STARTED,F_OP_END : boolean;
pReqPieces,pPiecesGood : integer;

vMCTag : string;
begin

  Result := '';

    Data := Now;
       DecodeDate(Data, Year, Month, Day);
       DecodeTime(Data, Hour, Min, Sec, MSec);
       Ano := IntToStr(Year);

       If Month < 10 Then
          Mes := '0'+IntToStr(Month)
       else
          Mes := IntToStr(Month);

       If Day < 10 Then
          Dia := '0'+IntToStr(Day)
       else
          Dia := IntToStr(Day);


       {bloco texto referente a maquina corte "BLOCK"}
       vMCTag := 'MC' + Copy(pMaq,7,2);


        adoQyTopnetFunc.Close;
        adoQyTopnetFunc.SQL.Clear;
        adoQyTopnetFunc.SQL.Add('SELECT * FROM [Client] WHERE [ClientName] =:pMaq ');
        adoQyTopnetFunc.Parameters.ParamByName('pMaq').Value := pMaq;
        adoQyTopnetFunc.Open;



   Caminhoarq := adoQyTopnetFunc.FieldByName('WPCSDataPath').AsString+'\Producti.SDC';
   Caminhoarq2 := adoQyTopnetFunc.FieldByName('WPCSDataPath').AsString+'\'+'Producti\'+Ano+'\'+Mes+'\'+Dia+'\Producti.SDC';



   
   try

    F_Path1 := False;

      If FileExists( Caminhoarq ) Then
       Begin


          AssignFile(Lista,Caminhoarq);
          Reset(Lista); // Abre o arquivo para leitura;
           //ShowMessage(Caminhoarq);

           While not eof(Lista) do
            begin

              Readln(Lista,linha);


              if Pos('[ProductionStarted]',linha) > 0 then
               begin
                F_ProductionStart := True;

               end
             else if linha = '' then
              F_ProductionStart := False;


            { ** 20.02.2017
             if F_ProductionStart  then
                begin


                   if pos('job='+pOP, LowerCase(linha))>0 then
                        F_OP_STARTED := True;



                end;


               if F_OP_STARTED then
                begin
             }


                  {if F_OP_AUX_OP_STARTED <> pOP then
                   geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' OP INICIADA LOCALIZADA(1): '+pOP ,'LOG_TESTE_NEW_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );
                   }

                  F_OP_AUX_OP_STARTED := pOP;




                    if Pos('[ProductionTerminated]',linha) > 0 then
                     begin
                      F_ProductionFim := True;

                     end
                   else if linha = '' then
                    F_ProductionFim := False;


                    if F_ProductionFim then
                     begin
                       // geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' job='+pOP ,'LOG_TESTE_NEW_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );



                         if pos('job='+pOP, LowerCase(linha))>0 then
                           begin
                           // geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' linha-> '+linha ,'LOG_TESTE_NEW_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );
                            F_OP_END := True;
                           end;



                         if F_OP_END then
                          begin

                            if Pos('ProductionRequestedPieces=',linha) > 0 then
                               pReqPieces := StrToInt( copy(linha,length('ProductionRequestedPieces=')+1));

                            if Pos('TotalGoodPieces=',linha) > 0 then
                               pPiecesGood := StrToInt( copy(linha,length('TotalGoodPieces=')+1));


                          end;


                     end
                     else // FINALIZAÇÃO
                       begin

                           if F_OP_END then
                             begin
                              F_Path1 := True;
                              geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' OP END(1): '+pOP+' ProductionRequestedPieces= '+IntToStr(pReqPieces)+' PiecesGood= '+IntToStr(pPiecesGood) ,'LOG_TESTE_NEW_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );
                              //Result := 'OK';
                              vAuxResult := 'OK';
                              //geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' SHOULD NEVER HAPPEN: '+pOP,'LOG_TESTE_NEW_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );
                              break;
                             end;


                          //verifica se iniciou uma nova OP sem atual ter sido terminada
                            if Pos('[ProductionStarted]',linha) > 0 then
                             begin
                              F_ProductionStart_Teste := True;

                             end
                           else if linha = '' then
                            F_ProductionStart_Teste := False;


                          if F_ProductionStart_Teste  then
                              begin


                                 if (LowerCase(Copy(linha,1,4)) = 'job=') then
                                 begin
                                   pTesteOP := Copy(linha,5);
                                   pTesteOP := Copy(pTesteOP,1,Pos(',',pTesteOP)-1);
                                 end;


                                 {**if (pTesteOP <> pOP) and (pTesteOP<>'')  then
                                  begin
                                  geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' OP SKIPPED(1): '+pTesteOP+' <> '+ pOP ,'LOG_TESTE_NEW_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );
                                    //Result := 'SKIP';
                                    vAuxResult := 'SKIP';
                                    pTesteOP := '';
                                  end;
                                    }

                              end;


                        end; //Else - Finaliza



             //**   end; // IF - F_OP_STARTED





              Application.ProcessMessages;
            end; //While


           // Result := 'PEND'
         { if vAuxResult = '' then
           vAuxResult := 'PEND';}


       end; // If file exists


   finally
      CloseFile(Lista);

   end;





       {se não encontrou a OP no caminho 1, tenta localizá-la no caminho 2}
  IF (F_Path1 = False) THEN
  begin

    try

    

      If FileExists( Caminhoarq2 ) Then
       Begin


          AssignFile(Lista,Caminhoarq2);
          Reset(Lista); // Abre o arquivo para leitura;
           //ShowMessage(Caminhoarq);

           While not eof(Lista) do
            begin

              Readln(Lista,linha);



              if Pos('[ProductionStarted]',linha) > 0 then
               begin
                F_ProductionStart := True;

               end
             else if linha = '' then
              F_ProductionStart := False;


             { 20.02.2017
             if F_ProductionStart  then
                begin


                   if pos('job='+pOP, LowerCase(linha))>0 then
                        F_OP_STARTED := True;



                end;


               if F_OP_STARTED then
                begin
              }

              
                  F_Path2 := True;

                  if F_OP_AUX_OP_STARTED <> pOP then
                   geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' OP INICIADA LOCALIZADA(2): '+pOP ,'LOG_TESTE_NEW_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );

                  F_OP_AUX_OP_STARTED := pOP;




                    if Pos('[ProductionTerminated]',linha) > 0 then
                     begin
                      F_ProductionFim := True;

                     end
                   else if linha = '' then
                    F_ProductionFim := False;


                    if F_ProductionFim then
                     begin


                         if pos('job='+pOP, LowerCase(linha))>0 then
                           begin
                           // geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' linha-> '+linha ,'LOG_TESTE_NEW_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );
                            F_OP_END := True;
                           end;


                         if F_OP_END then
                          begin

                            if Pos('ProductionRequestedPieces=',linha) > 0 then
                               pReqPieces := StrToInt( copy(linha,length('ProductionRequestedPieces=')+1));

                            if Pos('TotalGoodPieces=',linha) > 0 then
                               pPiecesGood := StrToInt( copy(linha,length('TotalGoodPieces=')+1));

                          end;


                     end
                     else // FINALIZAÇÃO
                       begin

                           if F_OP_END then
                             begin
                              geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' OP END(2): '+pOP+' ProductionRequestedPieces= '+IntToStr(pReqPieces)+' PiecesGood= '+IntToStr(pPiecesGood) ,'LOG_TESTE_NEW_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );
                              //Result := 'OK';
                              vAuxResult := 'OK';
                              //geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' SHOULD NEVER HAPPEN: '+pOP,'LOG_TESTE_NEW_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );
                              break;
                             end;


                          //verifica se iniciou uma nova OP sem atual ter sido terminada
                         {   if Pos('[ProductionStarted]',linha) > 0 then
                             begin
                              F_ProductionStart_Teste := True;

                             end
                           else if linha = '' then
                            F_ProductionStart_Teste := False;


                          if F_ProductionStart_Teste  then
                              begin


                                 if (LowerCase(Copy(linha,1,4)) = 'job=') then
                                 begin
                                   pTesteOP := Copy(linha,5);
                                   pTesteOP := Copy(pTesteOP,1,Pos(',',pTesteOP)-1);
                                 end;


                                 if pTesteOP <> pOP then
                                  begin
                                  geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' OP SKIPPED(2): '+pOP+' TesteOP: '+pTesteOP ,'LOG_TESTE_NEW_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );
                                    //Result := 'SKIP';
                                    vAuxResult := 'SKIP';
                                  end;


                              end;
                            }

                        end; //Else - Finaliza



               //** end; // IF - F_OP_STARTED

               

              Application.ProcessMessages;
            end; //While


           // Result := 'PEND'
          if vAuxResult = '' then          
           vAuxResult := 'PEND';


       end; // If file exists


   finally
      CloseFile(Lista);

   end;





  end; //path 2



  Result := vAuxResult;



end;

procedure Tdm.DataModuleCreate(Sender: TObject);
var f:TextFile;
    Linha,userId,passServ:String;
Begin

     {parâmetro da execução komaxsystem}
     F_PARAM_EXT := ParamStr(1);

        {configuração database via arquivo ini - config.ini}


          iniConf := TiniFile.Create( ExtractFilePath ( Application.ExeName) + 'komax.ini');

          try
          passServ :=  iniConf.ReadString('KOMAX_BD','Password','');
          userId := iniConf.ReadString('KOMAX_BD','UserID','');
          dataSrc := iniConf.ReadString('KOMAX_BD','DataSource','');
          dataSrcTest := iniConf.ReadString('KOMAX_BD','TestMode','');
          vMaquina := iniConf.ReadString('KOMAX_BD','Maquina','');
          finally
            iniConf.Free;
          end;


        if vMaquina = '' then
         begin
              // Busca o arquivo para definir o servidor
            If FileExists('C:\KomaxSystem\Maquina.ini') Then
              begin

               try
                AssignFile(f,'C:\KomaxSystem\Maquina.ini');
                Reset(f);

                Readln(f,linha);
                vMaquina := linha;
               finally
                 CloseFile(f);
               end;

              end;

         end;


         if vMaquina = '' then
          begin
            // *** dialogo para informar maquina

            Application.MessageBox('NÃO FOI INFORMADA A MÁQUINA DE CORTE!','ATENÇÃO',MB_OK+MB_ICONWARNING);
            Exit;
            
          end;





        {BD SDBConvert}

        if DB_SDBConvert.Connected = true then
           DB_SDBConvert.Connected := False;

           if dataSrcTest <> 'ON' then
            begin


              DB_SDBConvert.ConnectionString:='Provider=SQLOLEDB.1;Password='+passServ+';Persist Security Info=True;User ID='+
              userId+';Initial Catalog=SDBConvert;Data Source='+dataSrc+';Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=komaxsystem;Use Encryption for Data=False;Tag with column collation when possible=False';

            end
           else
            begin

             DB_SDBConvert.ConnectionString:='Provider=SQLOLEDB.1;Password='+passServ+';Persist Security Info=True;User ID='+
              userId+';Initial Catalog=SDBConvert_TESTE;Data Source='+dataSrc+';Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=komaxsystem;Use Encryption for Data=False;Tag with column collation when possible=False';

            end;

        DB_SDBConvert.Connected := True;


       {BD TOPNET}

        if DB_TopNet.Connected = true then
           DB_TopNet.Connected := False;

           if dataSrcTest <> 'ON' then
            begin


              DB_TopNet.ConnectionString:='Provider=SQLOLEDB.1;Password='+passServ+';Persist Security Info=True;User ID='+
              userId+';Initial Catalog=KomaxTopSuite;Data Source='+dataSrc+';Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=komaxsystem;Use Encryption for Data=False;Tag with column collation when possible=False';

            end
           else
            begin

             DB_TopNet.ConnectionString:='Provider=SQLOLEDB.1;Password='+passServ+';Persist Security Info=True;User ID='+
              userId+';Initial Catalog=KomaxTopSuite_TESTE;Data Source='+dataSrc+';Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=komaxsystem;Use Encryption for Data=False;Tag with column collation when possible=False';

            end;

        DB_TopNet.Connected := True;




   // if not adoTBL_DADOS_CORTE.Active then
    //     adoTBL_DADOS_CORTE.Open;




end;

function Tdm.FindWindowExtd(partialTitle: string): HWND;
var
  hWndTemp: hWnd;
  iLenText: Integer;
  cTitletemp: array [0..254] of Char;
  sTitleTemp: string;
begin
  hWndTemp := FindWindow(nil, nil);
  while hWndTemp <> 0 do begin
    iLenText := GetWindowText(hWndTemp, cTitletemp, 255);
    sTitleTemp := cTitletemp;
    sTitleTemp := UpperCase(copy( sTitleTemp, 1, iLenText));
    partialTitle := UpperCase(partialTitle);
    if pos( partialTitle, sTitleTemp ) <> 0 then
      Break;
    hWndTemp := GetWindow(hWndTemp, GW_HWNDNEXT);
  end;
  result := hWndTemp;

end;



procedure Tdm.geraLog(texto, nomArq, nomDir: string);
var vnomelog : string;
vlog : TextFile;
begin
  {log importação arquivo}
     if not DirectoryExists(nomDir) then
      ForceDirectories(nomDir);

  vnomelog := nomDir+'\'+nomArq;
  AssignFile(vlog,vnomelog);
  if FileExists(vnomelog)then
  Append(vlog)
  else
  Rewrite(vlog);
     try
       Writeln(vlog,texto);
     finally
      CloseFile(vlog);
     end;


end;

procedure Tdm.getControlOP_dados(pMaq: string);
begin

  adoQyConvertFunc.Close;
  adoQyConvertFunc.SQL.Clear;
  adoQyConvertFunc.SQL.Add('select * from Dados_Medicao_SYMK with (nolock) where MaquinaCorte = :Maq ' );
  adoQyConvertFunc.Parameters.ParamByName('Maq').Value := pMaq;
  adoQyConvertFunc.Open;



end;

procedure Tdm.getDadosArqKomax_CodigoScan(pMaquina: String; pOp : string; pTermA : string; pTermB : string);

Var
Arq1, Lista: TextFile;
Year, Month, Day, Hour, Min, Sec, MSec: Word;
Data: TDateTime;
Ano, Mes, Dia,Caminhoarq,Caminhoarq2, linha: String;
auxPos1,auxPos2,i: Integer;
F_OP_MATCH,F_Scan,F_SampleStart,F_Counter,F_SampleTerm,F_LearnStart,F_MeasureData,F_LearnTerm,F_ProductionStart,F_ProductionFim,F_Path1 : boolean;
vBlock,vMCTag, vScanCabo,vScanTermA,vScanTermB,auxStr,vCheckOP,vChkFinishOP : string;
vCompCabo,vAltCondA,vAltCondB,vAltIsolA,vAltIsolB,vTracaoA,vTracaoB,vTerm1,vTerm2,vUser : string;
vauxStr1,vauxStr2,vauxStr3 : string;
begin



       Data := Now;
       DecodeDate(Data, Year, Month, Day);
       DecodeTime(Data, Hour, Min, Sec, MSec);
       Ano := IntToStr(Year);

       If Month < 10 Then
          Mes := '0'+IntToStr(Month)
       else
          Mes := IntToStr(Month);

       If Day < 10 Then
          Dia := '0'+IntToStr(Day)
       else
          Dia := IntToStr(Day);


       {bloco texto referente a maquina corte "BLOCK"}
       vMCTag := 'MC' + Copy(pMaquina,7,2);


        adoQyTopnetFunc.Close;
        adoQyTopnetFunc.SQL.Clear;
        adoQyTopnetFunc.SQL.Add('SELECT * FROM [Client] WHERE [ClientName] =:pMaq ');
        adoQyTopnetFunc.Parameters.ParamByName('pMaq').Value := pMaquina;
        adoQyTopnetFunc.Open;



   Caminhoarq := adoQyTopnetFunc.FieldByName('WPCSDataPath').AsString+'\Producti.SDC';
   Caminhoarq2 := adoQyTopnetFunc.FieldByName('WPCSDataPath').AsString+'\'+'Producti\'+Ano+'\'+Mes+'\'+Dia+'\Producti.SDC';

   try

    F_Path1 := False;

    If FileExists( Caminhoarq ) Then
     Begin



       try
          AssignFile(Lista,Caminhoarq);
          Reset(Lista); // Abre o arquivo para leitura;
           //ShowMessage(Caminhoarq);

           While not eof(Lista) do
            begin

              Readln(Lista,linha);


            // ShowMessage(Caminhoarq);
              if Pos('[MaterialScan]',linha) > 0 then
                 begin
                  F_Scan := True;

                 end
              else if linha = '' then
                 begin
                   F_Scan := False ;
                   //Continue;
                 end;

               {se tag "MaterialScan" encontrada}
               if F_Scan then
                begin



                  if LowerCase( Copy(linha,1,6)  )= 'block=' then
                    begin



                      if pos('TRUE',linha) > 0 then
                        begin
                         vBlock := '';
                             {obtem dados leitura cabo}
                            if pos('CABO',linha) > 0 then
                               begin
                                //vBlock := Copy(linha,7);
                                //ex: Block= "MC39CABO", TRUE, "Q179217+4300+377077+"
                                 vScanCabo := '';
                                 auxStr := StringReplace( (Copy(linha, pos('TRUE,',linha)+5 )),' ','',[rfReplaceAll]);  // string length "TRUE," = 5
                                 auxStr := StringReplace(auxStr,'"','',[rfReplaceAll]);

                                 vauxStr1 := Copy(auxStr,1,pos('+',auxStr)-1); //**Q179217
                                 vauxStr2 := Copy(auxStr,pos('+',auxStr)+1); //4300+377077+
                                 auxStr := vauxStr2;
                                 vauxStr2 := Copy(vauxStr2,1,Pos('+',vauxStr2)-1 );//**4300

                                 vauxStr3 := Copy(auxStr,pos('+',auxStr)+1 );//377077+
                                 vauxStr3 := Copy(vauxStr3,1,pos('+',vauxStr3)-1);//**377077

                                 vScanCabo :=  vauxStr3;
                                 auxStr := '';

                               end;

                              {obtem dados leitura Terminal A}
                            if pos( vMCTag+'P1',linha) > 0 then
                              begin
                                //ex: Block= "MC39P1", TRUE, "14500389+2855", "Q1433+4000+377713+"

                                VScanTermA:= '';


                                AuxPos1 := Pos(pTermA,linha );

                                if (auxPos1 > 0) and (pTermA <> '') then
                                 begin
                                  // 14500389+2855", "Q1433+4000+377713+"
                                  // "Q1433+4000+377713+"
                                   auxStr := Copy(linha,auxPos1);
                                   auxStr := Copy(auxStr,Pos('"',auxStr)+2);
                                   auxStr := StringReplace(auxStr,'"','',[rfReplaceAll]);
                                   auxStr := StringReplace(auxStr,' ','',[rfReplaceAll]); //Q1433+4000+377713

                                   vauxStr1 := Copy(auxStr,1,pos('+',auxStr)-1);//**Q1433
                                   vauxStr2 := Copy(auxStr,pos('+',auxStr)+1); //4000+377713+
                                   auxStr := vauxStr2;
                                   vauxStr2 := Copy(vauxStr2,1,Pos('+',vauxStr2)-1 );//**4000

                                   vauxStr3 := Copy(auxStr,pos('+',auxStr)+1 );//377713+
                                   vauxStr3 := Copy(vauxStr3,1,pos('+',vauxStr3)-1);//3377713

                                   vScanTermA:=  vauxStr3;
                                 end;


                                 auxStr := '';

                               end;

                               {obtem dados leitura Terminal B}
                            if pos( vMCTag+'P2',linha) > 0 then
                              begin
                                //ex: Block= "MC39P2", TRUE, "14500389+2855", "Q1433+4000+377713+"

                                 vScanTermB := '';
                                 AuxPos1 := Pos(pTermB,linha );

                                if (auxPos1 > 0) and (pTermB <> '') then
                                 begin
                                  // 14500389+2855", "Q1433+4000+377713+"
                                  // "Q1433+4000+377713+"
                                   auxStr := Copy(linha,auxPos1);
                                   auxStr := Copy(auxStr,Pos('"',auxStr)+2);
                                   auxStr := StringReplace(auxStr,'"','',[rfReplaceAll]);
                                   auxStr := StringReplace(auxStr,' ','',[rfReplaceAll]);

                                   vauxStr1 := Copy(auxStr,1,pos('+',auxStr)-1);//**Q1433
                                   vauxStr2 := Copy(auxStr,pos('+',auxStr)+1); //4000+377713+
                                   auxStr := vauxStr2;
                                   vauxStr2 := Copy(vauxStr2,1,Pos('+',vauxStr2)-1 );//**4000

                                   vauxStr3 := Copy(auxStr,pos('+',auxStr)+1 );//377713+
                                   vauxStr3 := Copy(vauxStr3,1,pos('+',vauxStr3)-1);//3377713
                                   
                                   vScanTermB:=  vauxStr3;
                                 end;

                                 auxStr := '';

                               end;



                        end;


                      //F_Scan := False;

                    end; //if "Block"


                 end; //if F_SCAN




                    if Pos('[LearnStarted]',linha) > 0 then
                    begin
                      F_LearnStart := True;

                    end
                    else if linha = '' then
                     begin
                      F_LearnStart := False;
                       //Continue;
                     end;




                     if F_LearnStart then
                      begin
                        //Job=17177363, 3947
                         // SHOWMESSAGE('LEARN: '+linha);
                          if LowerCase(Copy(linha,1,4)) = 'job=' then
                            begin
                              vCheckOP := Copy(linha,5 );
                              vCheckOP := Copy(vCheckOP,1,Pos(',',vCheckOP)-1);
                             //SHOWMESSAGE('LEARN: '+linha);
                            end;


                       // SHOWMESSAGE('LEARN: '+linha+'  pOp <> vCheckOP '+pOp+' <> '+vCheckOP);
                        if pOp <> vCheckOP then
                          begin
                          F_OP_MATCH := False;;
                          //Continue;

                          end
                        else
                          begin

                            F_OP_MATCH := True;
                            F_LearnStart := False;
                          end;

                      end;



                  {se OP localizada na arquivo}

                   if F_OP_MATCH then
                    begin


                      {***DISABLED: 22.11.2016 -> OBTENÇÃO VIA STATUS_PROD

                        //Obter medidas iniciais
                       if Pos('[MeasurementData]',linha) > 0 then
                        begin
                         F_MeasureData := True;
                         //Continue;
                        end
                       else if linha = '' then
                       F_MeasureData := False;



                       if F_MeasureData then
                        begin

                         //WireLength=FASE3   050FP -W, TRUE, 1650
                         //CrimpHeight=FASE3   050FP -W, 14500389, TRUE, 1.19
                         //CrimpHeightInsulation=FASE3   050FP -W, 14500389, TRUE, 3.68
                         //PullOffForce=FASE3   050FP -W, 14500389, TRUE, 111.9
                            //**WireLength=FASE5   050FW -OR, TRUE, 735
                           if Pos('WireLength=',linha) > 0 then
                             begin
                               auxPos1 := Pos('TRUE,',linha); // string length "TRUE," = 5

                                if auxPos1 > 0 then
                                 begin
                                   vCompCabo := StringReplace( (copy(linha,auxPos1 + 5)),' ','',[rfReplaceAll]);
                                 end;

                               auxPos1 := 0;


                             end;

                             if Pos('CrimpHeight=',linha) > 0 then
                             begin
                               auxPos1 := Pos('TRUE,',linha); // string length "TRUE," = 5
                               vAltCondA := '';
                               vAltCondB := '';

                                if auxPos1 > 0 then
                                 begin
                                     //se o terminal da OP foi encontrado na linha do texto
                                    if (Pos(pTermA,linha) > 0 ) and (pTermA <> '') then
                                        vAltCondA := StringReplace( (copy(linha,auxPos1 + 5)),' ','',[rfReplaceAll])

                                    else if (Pos(pTermB,linha) > 0 ) and (pTermB <> '') then
                                        vAltCondB := StringReplace( (copy(linha,auxPos1 + 5)),' ','',[rfReplaceAll]);

                                 end;

                               auxPos1 := 0;

                             end;


                             if Pos('CrimpHeightInsulation=',linha) > 0 then
                             begin
                               auxPos1 := Pos('TRUE,',linha);
                               vAltIsolA := '';
                               vAltIsolB := '';

                                if auxPos1 > 0 then
                                 begin

                                     //se o terminal da OP foi encontrado na linha do texto
                                    if (Pos(pTermA,linha) > 0 ) and (pTermA <> '') then
                                        vAltIsolA := StringReplace( (copy(linha,auxPos1 + 5)),' ','',[rfReplaceAll])

                                    else if (Pos(pTermB,linha) > 0 ) and (pTermB <> '') then
                                        vAltIsolB := StringReplace( (copy(linha,auxPos1 + 5)),' ','',[rfReplaceAll]);


                                 end;

                               auxPos1 := 0;

                             end;


                             if Pos('PullOffForce=',linha) > 0 then
                             begin
                               auxPos1 := Pos('TRUE,',linha);

                                if auxPos1 > 0 then
                                 begin

                                     //se o terminal da OP foi encontrado na linha do texto
                                    if (Pos(pTermA,linha) > 0 ) and (pTermA <> '') then
                                        vTracaoA := StringReplace( (copy(linha,auxPos1 + 5)),' ','',[rfReplaceAll])

                                    else if (Pos(pTermB,linha) > 0 ) and (pTermB <> '') then
                                        vTracaoB := StringReplace( (copy(linha,auxPos1 + 5)),' ','',[rfReplaceAll]);


                                 end;

                               auxPos1 := 0;


                             end;



                          //F_MeasureData := False;
                        end; //mesurement data
                        DISABLED: 22.11.2016}




                         {*** FINISHING ****}

                       //21.11.2016
                       { if Pos('[ProductionStarted]',linha) > 0 then
                           begin
                            F_ProductionStart := True;
                             //SHOWMESSAGE('[**ProductionStarted] -> '+vCheckOP);
                           end
                         else if linha = '' then
                          F_ProductionStart := False;



                         if F_ProductionStart  then
                          begin
                             vChkFinishOP := '';
                             if (LowerCase(Copy(linha,1,4)) = 'job=') then
                               begin
                                 vChkFinishOP := Copy(linha,5);
                                 vChkFinishOP := Copy(vChkFinishOP,1,Pos(',',vChkFinishOP)-1);
                               end;

                             //se OP indicada = OP ProductionStarted, finaliza busca
                             if (vChkFinishOP = pOp) then
                                break
                             else
                               vChkFinishOP := '';

                          end;
                          }



                    end; //if F_OP_MATCH then


                      {*** FINISHING ****}
                          //21.11.2016

                        if Pos('[ProductionStarted]',linha) > 0 then
                           begin
                            F_ProductionStart := True;

                           end
                         else if linha = '' then
                          F_ProductionStart := False;



                         if F_ProductionStart  then
                          begin

                            if Pos('UserName',linha) > 0 then
                              vUser := Copy(linha,10);

                             vChkFinishOP := '';
                             if (LowerCase(Copy(linha,1,4)) = 'job=') then
                               begin
                                 vChkFinishOP := Copy(linha,5);
                                 vChkFinishOP := Copy(vChkFinishOP,1,Pos(',',vChkFinishOP)-1);
                               end;

                             //se OP indicada = OP ProductionStarted, finaliza busca
                             if (vChkFinishOP = pOp) then
                                break
                             else
                               vChkFinishOP := '';

                          end;




                       if Pos('[ProductionTerminated]',linha) > 0 then
                           begin
                            F_ProductionFim := True;

                           end
                         else if linha = '' then
                          F_ProductionFim := False;



                          



             Application.ProcessMessages;
           end;//while txt



          {GRAVAÇÃO DOS DADOS OBTIDOS}

           if vChkFinishOP <> '' then
            begin


                                   //vChkFinishOP
              setControlOPSYMK(StrToInt(pOp),pMaquina,vAltCondA,vAltCondB,vAltIsolA,vAltIsolB,vTracaoA,vTracaoB,vScanTermA,vScanTermB,vScanCabo,'');

              getControlOP_dados(pMaquina); //adoQyConvertFunc

              if vScanCabo = '' then
                vScanCabo := adoQyConvertFunc.FieldByName('NF_CABO').AsString;

              if (vScanTermA = '') and (pTermA <> '') then
                 vScanTermA := adoQyConvertFunc.FieldByName('NF_TERM_A').AsString;

              if (vScanTermB = '') and (pTermB <> '') then
                 vScanTermB := adoQyConvertFunc.FieldByName('NF_TERM_B').AsString;



               adoQyConvertFunc.Close;
               adoQyConvertFunc.SQL.Clear;
               adoQyConvertFunc.SQL.Text := 'update DADOS_RELAT_CORTE set '+
               ' [NF_CABO]            = '+QuotedStr(vScanCabo) +
               ',[NF_TERM_A]          = '+QuotedStr(vScanTermA) +
               ',[NF_TERM_B]          = '+QuotedStr(vScanTermB) +
               ',[REGISTRO_OPERADOR]  = '+QuotedStr(vUser)+
               ' where ORDERID = '+pOp;  //vChkFinishOP
               adoQyConvertFunc.ExecSQL;

              //
               F_Path1 := True;


             
            end;




       finally
         CloseFile(Lista);

        // geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' Erro ARQUIVO.INI [1] OP: '+pOp,'LOG_ERRO_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );

       end;


    end; // If FileExists


   except// on e:exception do //retirar e:exception
   geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' Erro ARQUIVO.INI [1] OP: '+pOp ,'LOG_ERRO_TESTE_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );


   end;

    {**}
     {se não encontrou a OP no caminho 1, tenta localizá-la no caminho 2}
  IF (vChkFinishOP = '') and (F_Path1 = False) THEN
  begin


   try


     If FileExists( Caminhoarq2 ) Then
     Begin


       try
          AssignFile(Lista,Caminhoarq2);
          Reset(Lista); // Abre o arquivo para leitura;
           //ShowMessage(Caminhoarq);

           While not eof(Lista) do
            begin


              Readln(Lista,linha);


            // ShowMessage(Caminhoarq);
              if Pos('[MaterialScan]',linha) > 0 then
                 begin
                  F_Scan := True;

                 end
              else if linha = '' then
                 begin
                   F_Scan := False ;
                   //Continue;
                 end;

               {se tag "MaterialScan" encontrada}
               if F_Scan then
                begin



                  if LowerCase( Copy(linha,1,6)  )= 'block=' then
                    begin



                      if pos('TRUE',linha) > 0 then
                        begin
                         vBlock := '';
                             {obtem dados leitura cabo}
                            if pos('CABO',linha) > 0 then
                               begin
                                //vBlock := Copy(linha,7);
                                //ex: Block= "MC39CABO", TRUE, "Q179217+4300+377077+"
                                 vScanCabo := '';
                                 auxStr := StringReplace( (Copy(linha, pos('TRUE,',linha)+5 )),' ','',[rfReplaceAll]);  // string length "TRUE," = 5
                                 auxStr := StringReplace(auxStr,'"','',[rfReplaceAll]);

                                 vauxStr1 := Copy(auxStr,1,pos('+',auxStr)-1); //**Q179217
                                 vauxStr2 := Copy(auxStr,pos('+',auxStr)+1); //4300+377077+
                                 auxStr := vauxStr2;
                                 vauxStr2 := Copy(vauxStr2,1,Pos('+',vauxStr2)-1 );//**4300

                                 vauxStr3 := Copy(auxStr,pos('+',auxStr)+1 );//377077+
                                 vauxStr3 := Copy(vauxStr3,1,pos('+',vauxStr3)-1);//**377077

                                 vScanCabo :=  vauxStr3;
                                 auxStr := '';

                               end;

                              {obtem dados leitura Terminal A}
                            if pos( vMCTag+'P1',linha) > 0 then
                              begin
                                //ex: Block= "MC39P1", TRUE, "14500389+2855", "Q1433+4000+377713+"

                                VScanTermA:= '';


                                AuxPos1 := Pos(pTermA,linha );

                                if auxPos1 > 0 then
                                 begin
                                  // 14500389+2855", "Q1433+4000+377713+"
                                  // "Q1433+4000+377713+"
                                   auxStr := Copy(linha,auxPos1);
                                   auxStr := Copy(auxStr,Pos('"',auxStr)+2);
                                   auxStr := StringReplace(auxStr,'"','',[rfReplaceAll]);
                                   auxStr := StringReplace(auxStr,' ','',[rfReplaceAll]); //Q1433+4000+377713

                                   vauxStr1 := Copy(auxStr,1,pos('+',auxStr)-1);//**Q1433
                                   vauxStr2 := Copy(auxStr,pos('+',auxStr)+1); //4000+377713+
                                   auxStr := vauxStr2;
                                   vauxStr2 := Copy(vauxStr2,1,Pos('+',vauxStr2)-1 );//**4000

                                   vauxStr3 := Copy(auxStr,pos('+',auxStr)+1 );//377713+
                                   vauxStr3 := Copy(vauxStr3,1,pos('+',vauxStr3)-1);//3377713

                                   vScanTermA:=  vauxStr3;
                                 end;


                                 auxStr := '';

                               end;

                               {obtem dados leitura Terminal B}
                            if pos( vMCTag+'P2',linha) > 0 then
                              begin
                                //ex: Block= "MC39P2", TRUE, "14500389+2855", "Q1433+4000+377713+"

                                 vScanTermB := '';
                                 AuxPos1 := Pos(pTermB,linha );

                                if auxPos1 > 0 then
                                 begin
                                  // 14500389+2855", "Q1433+4000+377713+"
                                  // "Q1433+4000+377713+"
                                   auxStr := Copy(linha,auxPos1);
                                   auxStr := Copy(auxStr,Pos('"',auxStr)+2);
                                   auxStr := StringReplace(auxStr,'"','',[rfReplaceAll]);
                                   auxStr := StringReplace(auxStr,' ','',[rfReplaceAll]);

                                   vauxStr1 := Copy(auxStr,1,pos('+',auxStr)-1);//**Q1433
                                   vauxStr2 := Copy(auxStr,pos('+',auxStr)+1); //4000+377713+
                                   auxStr := vauxStr2;
                                   vauxStr2 := Copy(vauxStr2,1,Pos('+',vauxStr2)-1 );//**4000

                                   vauxStr3 := Copy(auxStr,pos('+',auxStr)+1 );//377713+
                                   vauxStr3 := Copy(vauxStr3,1,pos('+',vauxStr3)-1);//3377713
                                   
                                   vScanTermB:=  vauxStr3;
                                 end;

                                 auxStr := '';

                               end;



                        end;


                      //F_Scan := False;

                    end; //if "Block"


                 end; //if F_SCAN




                    if Pos('[LearnStarted]',linha) > 0 then
                    begin
                      F_LearnStart := True;

                    end
                    else if linha = '' then
                     begin
                      F_LearnStart := False;
                       //Continue;
                     end;




                     if F_LearnStart then
                      begin
                        //Job=17177363, 3947
                         // SHOWMESSAGE('LEARN: '+linha);
                          if LowerCase(Copy(linha,1,4)) = 'job=' then
                            begin
                              vCheckOP := Copy(linha,5 );
                              vCheckOP := Copy(vCheckOP,1,Pos(',',vCheckOP)-1);
                             //SHOWMESSAGE('LEARN: '+linha);
                            end;


                       // SHOWMESSAGE('LEARN: '+linha+'  pOp <> vCheckOP '+pOp+' <> '+vCheckOP);
                        if pOp <> vCheckOP then
                          begin
                          F_OP_MATCH := False;;
                          //Continue;

                          end
                        else
                          begin

                            F_OP_MATCH := True;
                            F_LearnStart := False;
                          end;

                      end;



                  {se OP localizada na arquivo}

                   if F_OP_MATCH then
                    begin

                     {*DISABLED: 22.10.2016 - obtentção através da tabela "Status_Prod"

                        Obter medidas iniciais
                       if Pos('[MeasurementData]',linha) > 0 then
                        begin
                         F_MeasureData := True;
                         //Continue;
                        end
                       else if linha = '' then
                       F_MeasureData := False;



                       if F_MeasureData then
                        begin

                         //WireLength=FASE3   050FP -W, TRUE, 1650
                         //CrimpHeight=FASE3   050FP -W, 14500389, TRUE, 1.19
                         //CrimpHeightInsulation=FASE3   050FP -W, 14500389, TRUE, 3.68
                         //PullOffForce=FASE3   050FP -W, 14500389, TRUE, 111.9
                            //**WireLength=FASE5   050FW -OR, TRUE, 735
                           if Pos('WireLength=',linha) > 0 then
                             begin
                               auxPos1 := Pos('TRUE,',linha); // string length "TRUE," = 5

                                if auxPos1 > 0 then
                                 begin
                                   vCompCabo := StringReplace( (copy(linha,auxPos1 + 5)),' ','',[rfReplaceAll]);
                                 end;

                               auxPos1 := 0;


                             end;

                             if Pos('CrimpHeight=',linha) > 0 then
                             begin
                               auxPos1 := Pos('TRUE,',linha); // string length "TRUE," = 5
                               vAltCondA := '';
                               vAltCondB := '';

                                if auxPos1 > 0 then
                                 begin
                                     //se o terminal da OP foi encontrado na linha do texto
                                    if (Pos(pTermA,linha) > 0 ) and (pTermA <> '') then
                                        vAltCondA := StringReplace( (copy(linha,auxPos1 + 5)),' ','',[rfReplaceAll])

                                    else if (Pos(pTermB,linha) > 0 ) and (pTermB <> '') then
                                        vAltCondB := StringReplace( (copy(linha,auxPos1 + 5)),' ','',[rfReplaceAll]);

                                 end;

                               auxPos1 := 0;

                             end;


                             if Pos('CrimpHeightInsulation=',linha) > 0 then
                             begin
                               auxPos1 := Pos('TRUE,',linha);
                               vAltIsolA := '';
                               vAltIsolB := '';

                                if auxPos1 > 0 then
                                 begin

                                     //se o terminal da OP foi encontrado na linha do texto
                                    if (Pos(pTermA,linha) > 0 ) and (pTermA <> '') then
                                        vAltIsolA := StringReplace( (copy(linha,auxPos1 + 5)),' ','',[rfReplaceAll])

                                    else if (Pos(pTermB,linha) > 0 ) and (pTermB <> '') then
                                        vAltIsolB := StringReplace( (copy(linha,auxPos1 + 5)),' ','',[rfReplaceAll]);


                                 end;

                               auxPos1 := 0;

                             end;


                             if Pos('PullOffForce=',linha) > 0 then
                             begin
                               auxPos1 := Pos('TRUE,',linha);

                                if auxPos1 > 0 then
                                 begin

                                     //se o terminal da OP foi encontrado na linha do texto
                                    if (Pos(pTermA,linha) > 0 ) and (pTermA <> '') then
                                        vTracaoA := StringReplace( (copy(linha,auxPos1 + 5)),' ','',[rfReplaceAll])

                                    else if (Pos(pTermB,linha) > 0 ) and (pTermB <> '') then
                                        vTracaoB := StringReplace( (copy(linha,auxPos1 + 5)),' ','',[rfReplaceAll]);


                                 end;

                               auxPos1 := 0;


                             end;



                          //F_MeasureData := False;
                        end; //mesurement data
                       DISABLED: 22.10.2016* }



                    end; //if F_OP_MATCH then



                      {*** FINISHING ****}
                       //alteração 22.11.2016 -> Anteriormente estava dentro de "if F_OP_MATCH then"

                         if Pos('[ProductionStarted]',linha) > 0 then
                           begin
                            F_ProductionStart := True;
                             //SHOWMESSAGE('[**ProductionStarted] -> '+vCheckOP);
                           end
                         else if linha = '' then
                          F_ProductionStart := False;



                         if F_ProductionStart  then
                          begin

                             if Pos('UserName',linha) > 0 then
                              vUser :=  Copy(linha,10);


                             vChkFinishOP := '';
                             if (LowerCase(Copy(linha,1,4)) = 'job=') then
                               begin
                                 vChkFinishOP := Copy(linha,5);
                                 vChkFinishOP := Copy(vChkFinishOP,1,Pos(',',vChkFinishOP)-1);
                               end;

                             {se OP indicada = OP ProductionStarted, finaliza busca}
                             if (vChkFinishOP = pOp) then
                                break
                             else
                               vChkFinishOP := '';

                          end;
             


             Application.ProcessMessages;
           end;//while txt



          {GRAVAÇÃO DOS DADOS OBTIDOS}

           if vChkFinishOP <> '' then
            begin



             setControlOPSYMK(StrToInt(vChkFinishOP),pMaquina,vAltCondA,vAltCondB,vAltIsolA,vAltIsolB,vTracaoA,vTracaoB,vScanTermA,vScanTermB,vScanCabo,'');

              getControlOP_dados(pMaquina); //adoQyConvertFunc

              if vScanCabo = '' then
                vScanCabo := adoQyConvertFunc.FieldByName('NF_CABO').AsString;

              if (vScanTermA = '') and (pTermA = '') then
                 vScanTermA := adoQyConvertFunc.FieldByName('NF_TERM_A').AsString;

              if (vScanTermB = '') and (pTermB = '') then
                 vScanTermB := adoQyConvertFunc.FieldByName('NF_TERM_B').AsString;



               adoQyConvertFunc.Close;
               adoQyConvertFunc.SQL.Clear;
               adoQyConvertFunc.SQL.Text := 'update DADOS_RELAT_CORTE set '+
               ' [NF_CABO]            = '+QuotedStr(vScanCabo) +
               ',[NF_TERM_A]          = '+QuotedStr(vScanTermA) +
               ',[NF_TERM_B]          = '+QuotedStr(vScanTermB) +
               ',[REGISTRO_OPERADOR]  = '+QuotedStr(vUser)+
               ' where ORDERID = '+pOp;
               adoQyConvertFunc.ExecSQL;

              // ' [ALT_COND_A_INICIAL] = '+QuotedStr(vAltCondA) +
              // ',[ALT_ISOL_A_INICIAL] = '+QuotedStr(vAltIsolA) +
              // ',[ALT_ISOL_B_INICIAL] = '+QuotedStr(vAltIsolB) +
              // ',[ALT_COND_B_INICIAL] = '+QuotedStr(vAltCondB) +
              // ',[TRACAO_A_INICIAL]   = '+QuotedStr(vTracaoA) +
              // ',[TRACAO_B_INICIAL]   = '+QuotedStr(vTracaoB) +
              // ',[COMPR_CABO_INICIAL] = '+QuotedStr(vCompCabo) +






            end;




       finally
         CloseFile(Lista);

       end;


     end; // If FileExists


   except //on e:exception do // Retirar: "on e:exception do"

    geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' Erro ARQUIVO.INI [2] OP: '+pOp,'LOG_ERRO_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );

   end;


  end;






end;


function Tdm.GetBitolaFromDescCabo(pCabo: string): string;
var str1,str2 : string;
 strFloat : Real;
begin

  str1 := Copy(StringReplace(pCabo,' ','',[rfReplaceAll]),6,3);


  str1 := getJustNumbers(str1);

  strFloat := (StrToFloat(str1)/100);

  str2 := StringReplace(FormatFloat('0.00',strFloat),',','.',[rfReplaceAll])  ;


  Result := str2;

end;

procedure Tdm.GetDadosProxOP(pMachine: string);
begin
 adoQyTopNextOP.Close;
 adoQyTopNextOP.Parameters.ParamByName('pMaq').Value := pMachine;
 adoQyTopNextOP.Open;

end;

function Tdm.getDadosRelatCorte(pOP: integer): integer;
begin



   adoQyDadosRelat.Close;
   adoQyDadosRelat.SQL.Clear;
   adoQyDadosRelat.SQL.Add('select * from dados_relat_corte with (nolock) where OrderId = :pOP ');
   adoQyDadosRelat.Parameters.ParamByName('pOP').Value := pOP;
   adoQyDadosRelat.Open;


   Result := adoQyDadosRelat.FieldByName('OrderId').AsInteger;

end;

function Tdm.getJustNumbers(pText: string): string;
var i: integer;
 vAux : string;
begin

 Result := '';
 vAux := '';

 for I := 0 to Length(pText) - 1 do
  begin

    if pText[i] in ['0'..'9'] then
      vAux := vAux + pText[i];


  end;
   
   if vAux = '' then
     vAux := '0';

   Result := vAux;




end;

function Tdm.GetOPsAgrupadasPend(pOpAtual: integer): string;
var f_OP,f_lim : word;
   vAuxOP : integer;
   vOpsAgreg : string;
begin

 f_OP := 1;
 vOpsAgreg := '';
 vAuxOP := pOpAtual;
 f_lim := 0;

 while f_OP > 0 do
  begin



      adoQyConvertFunc.SQL.Clear;
      adoQyConvertFunc.SQL.Add('select ORDERID from dados_relat_corte where input_op_link = :pOP ');
      adoQyConvertFunc.SQL.Add('and input_ok <> ''S'' ');
      adoQyConvertFunc.Parameters.ParamByName('pOP').Value := vAuxOP;
      adoQyConvertFunc.Open;

      f_OP := adoQyConvertFunc.RecordCount;

      if f_OP >= 1 then
       begin

         vAuxOP := adoQyConvertFunc.FieldByName('ORDERID').AsInteger;

         if vOpsAgreg = '' then
             vOpsAgreg := IntToStr(adoQyConvertFunc.FieldByName('ORDERID').AsInteger)
         else
             vOpsAgreg := vOpsAgreg +'-'+IntToStr(adoQyConvertFunc.FieldByName('ORDERID').AsInteger);

       end;


    f_lim :=  f_lim + 1;

    //limite de segurança para erros no loop
    if f_lim > 4 then
     f_OP := 0;

  end;


   Result := vOpsAgreg;



end;


procedure Tdm.updateSenhaLib1(pPass: string);
begin

  adoQyConvertFunc.Close;
  adoQyConvertFunc.SQL.Clear;
  adoQyConvertFunc.SQL.Add('UPDATE symk_config SET passw_lib1 = :pPassw ');
  adoQyConvertFunc.Parameters.ParamByName('pPassw').Value := pPass;
  adoQyConvertFunc.ExecSQL;



end;


function Tdm.getSenhaLib1: string;
begin

  adoQyConvertFunc.Close;
  adoQyConvertFunc.SQL.Clear;
  adoQyConvertFunc.SQL.Add('SELECT passw_lib1 FROM symk_config ');
  adoQyConvertFunc.Open;

  Result := adoQyConvertFunc.FieldByName('passw_lib1').AsString;



end;

function Tdm.GetToleranciaTermSpecif(pTerm, pBitola, pEspecif : string): string;
var str1,str2,str3,aux,vfield : string;
begin




  adoQyTopnetFunc.Close;
  adoQyTopnetFunc.SQL.Clear;
  adoQyTopnetFunc.SQL.Add('SELECT * FROM [Terminal] WHERE UserId = :pTerm ');
  adoQyTopnetFunc.Parameters.ParamByName('pTerm').Value := pTerm;
  adoQyTopnetFunc.Open;

  if  adoQyTopnetFunc.RecordCount = 0 then
   begin
     Application.MessageBox(pchar('Terminal: '+pTerm+' não localizado!'),'Atenção',MB_OK+MB_ICONWARNING);

   end;


   aux := 'crossSectionValue="'+StringReplace(pBitola,',','.',[rfReplaceAll])+'">' ;

   if pEspecif = 'ALT_COND' then  //CrimpHeightsSpecification
    begin

       vfield := adoQyTopnetFunc.FieldByName('CrimpHeightsSpecification').AsString;
      // <CrimpHeights><CrimpHeight crossSectionUnit="mm²" crossSectionValue="0.75"><Value>1.05</Value></CrimpHeight><CrimpHeight crossSectionUnit="mm²" crossSectionValue="0.50"><Value>0.93</Value></CrimpHeight></CrimpHeights>
        str1 := copy(vfield,pos(aux,vfield) );
        str2 := copy(str1,1,pos('</CrimpHeight>',str1)-1);

        if Pos('<Tolerance>',str2) = 0 then
          str3 := '0'
        else
          str3 := copy(str2,(pos('<Tolerance>',str2)+ length('<Tolerance>')),4 );
    end

   else if pEspecif = 'ALT_ISOL' then  //CrimpHeightsInsulationSpecification
    begin

     vfield := adoQyTopnetFunc.FieldByName('CrimpHeightsInsulationSpecification').AsString;

     str1 := copy(vfield,pos(aux,vfield) );
     str2 := copy(str1,1,pos('</CrimpHeightInsulation>',str1)-1);

      if Pos('<Tolerance>',str2) = 0 then
         str3 := '0'
      else
         str3 := copy(str2,(pos('<Tolerance>',str2)+ length('<Tolerance>')),4 );

    end

   else if pEspecif = 'TRACAO' then  //PullOffForcesSpecification
    begin

     //vfield := adoQyConvertFunc.FieldByName('PullOffForcesSpecification').AsString;

    end
   else
    begin
      Application.MessageBox(pchar('Valor inválido para parâmetro "pEspecif"!Informar: "ALT_COND" ou "ALT_ISOL" '),'Atenção',MB_OK+MB_ICONWARNING);
    end;


    Result := str3;


 end;

function Tdm.GetValueTermSpecif(pTerm, pBitola, pEspecif: string): string;
var str1,str2,str3,aux,vfield : string;
begin

 
  adoQyTopnetFunc.Close;
  adoQyTopnetFunc.SQL.Clear;
  adoQyTopnetFunc.SQL.Add('SELECT * FROM [Terminal] WHERE UserId = :pTerm ');
  adoQyTopnetFunc.Parameters.ParamByName('pTerm').Value := pTerm;
  adoQyTopnetFunc.Open;

  if  adoQyTopnetFunc.RecordCount = 0 then
   begin
     Application.MessageBox(pchar('Terminal: '+pTerm+' não localizado!'),'Atenção',MB_OK+MB_ICONWARNING);

   end;


   aux := 'crossSectionValue="'+StringReplace(pBitola,',','.',[rfReplaceAll])+'">' ;

   if pEspecif = 'ALT_COND' then  //CrimpHeightsSpecification
    begin

       vfield := adoQyTopnetFunc.FieldByName('CrimpHeightsSpecification').AsString;

        str1 := copy(vfield,pos(aux,vfield) );
        str2 := copy(str1,1,pos('</CrimpHeight>',str1)-1);
        str3 := copy(str2,(pos('<Value>',str2)+ length('<Value>')+1),pos('</Value>',str2)-1 );
    end

   else if pEspecif = 'ALT_ISOL' then  //CrimpHeightsInsulationSpecification
    begin

     vfield := adoQyTopnetFunc.FieldByName('CrimpHeightsInsulationSpecification').AsString;

     str1 := copy(vfield,pos(aux,vfield) );
     str2 := copy(str1,1,pos('</CrimpHeightInsulation>',str1)-1);
     str3 := copy(str2,(pos('<Value>',str2)+ length('<Value>')+1),pos('</Value>',str2)-1 );

    end

   else if pEspecif = 'TRACAO' then  //PullOffForcesSpecification
    begin

     vfield := adoQyTopnetFunc.FieldByName('PullOffForcesSpecification').AsString;
     str2 := copy(str1,1,pos('</PulloffForce>',str1)-1);
     str3 := copy(str2,(pos('<Value>',str2)+ length('<Value>')+1),pos('</Value>',str2)-1 );

    end
   else
    begin
      Application.MessageBox(pchar('Valor inválido para parâmetro "pEspecif"!Informar: "ALT_COND" , "ALT_ISOL" ou "TRACAO" '),'Atenção',MB_OK+MB_ICONWARNING);
    end;


    Result := str3;

end;

procedure Tdm.ReplicaDadosMedOp(pOP: string);
begin

 
  adoQyConvertFunc.Close;
  adoQyConvertFunc.SQL.Clear;
  adoQyConvertFunc.SQL.Add('select * from [Dados_Relat_Corte] where input_op_link = :pOP ');
  adoQyConvertFunc.Parameters.ParamByName('pOP').Value := pOP;
  adoQyConvertFunc.Open;

  if adoQyConvertFunc.RecordCount > 0 then
   begin

      adoQyConvertFunc2.Close;
      adoQyConvertFunc2.SQL.Clear;
      adoQyConvertFunc2.SQL.Text := 'update [COMPR_OBTIDO] = '+QuotedStr(adoQyConvertFunc.FieldByName('COMPR_OBTIDO').AsString)+',[NF_CABO]='+QuotedStr(adoQyConvertFunc.FieldByName('NF_CABO').AsString)+
      ',[COD_MA_A]='+QuotedStr(adoQyConvertFunc.FieldByName('COD_MA_A').AsString)+',[NF_TERM_A]='+QuotedStr(adoQyConvertFunc.FieldByName('NF_TERM_A').AsString)+
      ',[ALT_COND_A_OBTIDO]='+QuotedStr(adoQyConvertFunc.FieldByName('ALT_COND_A_OBTIDO').AsString)+',[ALT_ISOL_A_OBTIDO]='+QuotedStr(adoQyConvertFunc.FieldByName('ALT_ISOL_A_OBTIDO').AsString)+
      ',[FORCA_TRACAO_A_OBTIDO]='+QuotedStr(adoQyConvertFunc.FieldByName('FORCA_TRACAO_A_OBTIDO').AsString)+',[COD_MA_B]='+QuotedStr(adoQyConvertFunc.FieldByName('COD_MA_B').AsString)+
      ',[NF_TERM_B]='+QuotedStr(adoQyConvertFunc.FieldByName('NF_TERM_B').AsString)+',[ALT_COND_B_OBTIDO]='+QuotedStr(adoQyConvertFunc.FieldByName('ALT_COND_B_OBTIDO').AsString)+
      ',[ALT_ISOL_B_OBTIDO]='+QuotedStr(adoQyConvertFunc.FieldByName('ALT_ISOL_B_OBTIDO').AsString)+',[FORCA_TRACAO_B_OBTIDO]='+QuotedStr(adoQyConvertFunc.FieldByName('COMPR_OBTIDO').AsString)+
      ',[REGISTRO_OPERADOR]='+QuotedStr(adoQyConvertFunc.FieldByName('REGISTRO_OPERADOR').AsString)+',[TRACAO_RETOMA_TRAB_A]='+QuotedStr(adoQyConvertFunc.FieldByName('COMPR_OBTIDO').AsString)+
      ',[ALT_COND_RETOMA_TRAB_A]='+QuotedStr(adoQyConvertFunc.FieldByName('ALT_COND_RETOMA_TRAB_A').AsString)+',[ALT_COND_RETOMA_TRAB_B]='+QuotedStr(adoQyConvertFunc.FieldByName('COMPR_OBTIDO').AsString)+
      ',[ALT_ISOL_RETOMA_TRAB_A]='+QuotedStr(adoQyConvertFunc.FieldByName('ALT_ISOL_RETOMA_TRAB_A').AsString)+',[ALT_ISOL_RETOMA_TRAB_B]='+QuotedStr(adoQyConvertFunc.FieldByName('COMPR_OBTIDO').AsString)+
      ',[TRACAO_RETOMA_TRAB_B]='+QuotedStr(adoQyConvertFunc.FieldByName('COMPR_OBTIDO').AsString)+',[TRACAO_A_QUALIDADE]='+QuotedStr(adoQyConvertFunc.FieldByName('COMPR_OBTIDO').AsString)+
      ',[TRACAO_B_QUALIDADE]='+QuotedStr(adoQyConvertFunc.FieldByName('COMPR_OBTIDO').AsString)+',[ALT_COND_A_QUALIDADE]='+QuotedStr(adoQyConvertFunc.FieldByName('COMPR_OBTIDO').AsString)+
      ',[ALT_COND_B_QUALIDADE]='+QuotedStr(adoQyConvertFunc.FieldByName('COMPR_OBTIDO').AsString)+',[ALT_ISOL_A_QUALIDADE]='+QuotedStr(adoQyConvertFunc.FieldByName('COMPR_OBTIDO').AsString)+
      ',[ALT_ISOL_B_QUALIDADE]='+QuotedStr(adoQyConvertFunc.FieldByName('COMPR_OBTIDO').AsString)+',[REGISTRO_INSP_QUALIDADE]='+QuotedStr(adoQyConvertFunc.FieldByName('COMPR_OBTIDO').AsString)+
      ',[ALT_COND_A_INICIAL]='+QuotedStr(adoQyConvertFunc.FieldByName('COMPR_OBTIDO').AsString)+',[ALT_ISOL_A_INICIAL]='+QuotedStr(adoQyConvertFunc.FieldByName('COMPR_OBTIDO').AsString)+
      ',[ALT_ISOL_B_INICIAL]='+QuotedStr(adoQyConvertFunc.FieldByName('COMPR_OBTIDO').AsString)+',[ALT_COND_B_INICIAL]='+QuotedStr(adoQyConvertFunc.FieldByName('COMPR_OBTIDO').AsString)+
      ',[TRACAO_A_INICIAL]='+QuotedStr(adoQyConvertFunc.FieldByName('COMPR_OBTIDO').AsString)+',[TRACAO_B_INICIAL]='+QuotedStr(adoQyConvertFunc.FieldByName('COMPR_OBTIDO').AsString)+
      ',[COMPR_CABO_INICIAL]='+QuotedStr(adoQyConvertFunc.FieldByName('COMPR_OBTIDO').AsString)+
      ' where OrderId = '+QuotedStr(pOP);
      adoQyConvertFunc2.ExecSQL;



   end;






end;

procedure Tdm.setControlOPSYMK(pOP: Integer; pMaq,AltCA, AltCB,
  AltIA, AltIB, TA, TB, NFA, NFB,NFC, PObs: string);
begin

  try

    if not adoTBLControlOP.Active then
       adoTBLControlOP.Open;

  if adoTBLControlOP.Locate('MaquinaCorte',pMaq,[]) then
    begin

      adoTBLControlOP.Edit;
      adoTBLControlOPDataOperacao.AsDateTime := now;
      adoTBLControlOPOp_Iniciada.AsInteger := pOP;

      if AltCA <> '' then
      adoTBLControlOPALT_COND_A_INICIAL.AsString := AltCA;
      if AltCB <> '' then
      adoTBLControlOPALT_COND_B_INICIAL.AsString := AltCB;
      if AltIA <> '' then
      adoTBLControlOPALT_ISOL_A_INICIAL.AsString := AltIA;
      if AltIB <> '' then
      adoTBLControlOPALT_ISOL_B_INICIAL.AsString := AltIB;
      if TA <> '' then
      adoTBLControlOPTRACAO_A_INICIAL.AsString := TA;
      if TB <> '' then
      adoTBLControlOPTRACAO_B_INICIAL.AsString := TB;
      if NFA <> '' then
      adoTBLControlOPNF_TERM_A.AsString := NFA;
      if NFB <> '' then
      adoTBLControlOPNF_TERM_B.AsString := NFB;
      if NFC <> '' then
      adoTBLControlOPNF_CABO.AsString := NFC;

      adoTBLControlOP.Post;

    end
  else
    begin

      adoTBLControlOP.Insert;
      adoTBLControlOPMaquinaCorte.AsString := pMaq;
      adoTBLControlOPDataOperacao.AsDateTime := now;
      adoTBLControlOPOp_Iniciada.AsInteger := pOP;

      if AltCA <> '' then
      adoTBLControlOPALT_COND_A_INICIAL.AsString := AltCA;
      if AltCB <> '' then
      adoTBLControlOPALT_COND_B_INICIAL.AsString := AltCB;
      if AltIA <> '' then
      adoTBLControlOPALT_ISOL_A_INICIAL.AsString := AltIA;
      if AltIB <> '' then
      adoTBLControlOPALT_ISOL_B_INICIAL.AsString := AltIB;
      if TA <> '' then
      adoTBLControlOPTRACAO_A_INICIAL.AsString := TA;
      if TB <> '' then
      adoTBLControlOPTRACAO_B_INICIAL.AsString := TB;
      if NFA <> '' then
      adoTBLControlOPNF_TERM_A.AsString := NFA;
      if NFB <> '' then
      adoTBLControlOPNF_TERM_B.AsString := NFB;
      if NFC <> '' then
      adoTBLControlOPNF_CABO.AsString := NFC;

      adoTBLControlOP.Post;



    end;


  except
   geraLog(FormatDateTime('dd.mm.yy hh:nn:ss', Now)+' Erro [setControlOPSYMK] OP: '+IntToStr(pOp),'LOG_ERRO_'+FormatDateTime('dd.mm.yyyy',now)+'.txt','C:\KOMAXSYSTEM' );

  end;
   
end;




procedure Tdm.setControlOP_IniProx(pOP, pOP_Prox, pOP_Last: Integer; pMaq,
  pCirc, pCirc_Prox: string);
begin

  if not adoTBLControlOP.Active then
    adoTBLControlOP.Open;

  if adoTBLControlOP.Locate('MaquinaCorte',pMaq,[]) then
   begin

     adoTBLControlOP.Edit;

     adoTBLControlOPDataOperacao.AsDateTime := Now;

     if pOP <> 0 then
     adoTBLControlOPOp_Iniciada.AsInteger := pOP;
     if pOP_Prox <> 0 then
     adoTBLControlOPOp_Proxima.AsInteger := pOP_Prox;
     if pOP_Last <> 0 then
     adoTBLControlOPOp_Anterior.AsInteger := pOP_Last;

     if pCirc <> '' then
      adoTBLControlOPCircuito_Iniciado.AsString := pCirc;
     if pCirc_Prox <> '' then
     adoTBLControlOPCircuito_Proximo.AsString := pCirc_Prox;


     adoTBLControlOP.Post;



   end
  else
   begin

     adoTBLControlOP.Insert;
     adoTBLControlOPDataOperacao.AsDateTime := Now;
     adoTBLControlOPMaquinaCorte.AsString := pMaq;

     if pOP <> 0 then
     adoTBLControlOPOp_Iniciada.AsInteger := pOP;
     if pOP_Prox <> 0 then
     adoTBLControlOPOp_Proxima.AsInteger := pOP_Prox;
     if pOP_Last <> 0 then
     adoTBLControlOPOp_Anterior.AsInteger := pOP_Last;

     if pCirc <> '' then
      adoTBLControlOPCircuito_Iniciado.AsString := pCirc;
     if pCirc_Prox <> '' then
     adoTBLControlOPCircuito_Proximo.AsString := pCirc_Prox;


     adoTBLControlOP.Post;


   end;



end;

procedure Tdm.setStatusTabSP(pOP : Integer; pStatus : String);
begin

 adoQyConvertFunc.Close;
 adoQyConvertFunc.SQL.Clear;
 adoQyConvertFunc.SQL.Add(' UPDATE status_prod SET status = :pST,data_prod = :pDT,hora_prod = :pHr ');
 adoQyConvertFunc.SQL.Add('  WHERE OrderID = :pOP ');
 adoQyConvertFunc.Parameters.ParamByName('pST').Value := pStatus;
 adoQyConvertFunc.Parameters.ParamByName('pDT').Value := FormatDateTime('dd/mm/yyyy', Now);
 adoQyConvertFunc.Parameters.ParamByName('pHr').Value := FormatDateTime('hh:nn:ss',Time);
 adoQyConvertFunc.ExecSQL;

  

end;



function Tdm.validaAndGetDadosLogin(pReg, pSenha,pAcesso: string): boolean;
begin

 adoQyConvertFunc.Close;
 adoQyConvertFunc.SQL.Clear;
 adoQyConvertFunc.SQL.Add('select * from usuarios where Reg =:pReg and Password = :pPass ');
 adoQyConvertFunc.SQL.Add(' and T_Acesso=:pAcc ');
 adoQyConvertFunc.Parameters.ParamByName('pReg').Value := pReg;
 adoQyConvertFunc.Parameters.ParamByName('pPass').Value := pSenha;
 adoQyConvertFunc.Parameters.ParamByName('pAcc').Value := pAcesso;
 adoQyConvertFunc.Open;

 if adoQyConvertFunc.RecordCount > 0 then
    Result := True
 else
    Result := False;


end;

end.
