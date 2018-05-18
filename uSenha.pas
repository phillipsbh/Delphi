unit uSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, sSkinProvider, sSkinManager;

type
  TfrmSenha = class(TForm)
    meSenha: TMaskEdit;
    Label1: TLabel;
    edLogin: TEdit;
    Label2: TLabel;
    procedure edLoginKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure meSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSenha: TfrmSenha;

implementation

uses uDM;

{$R *.dfm}

procedure TfrmSenha.edLoginKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_RETURN then
meSenha.SetFocus;
end;

procedure TfrmSenha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
frmSenha:=nil;
end;

procedure TfrmSenha.FormShow(Sender: TObject);
begin

 dm.f_AllowClose := False;
 edLogin.SetFocus;

end;

procedure TfrmSenha.meSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var acesso,login:string;
begin

 if Key = VK_RETURN then
  begin

   with dm do
    begin


      {valor numérico (teclado telefonico) para SDBPM }
       if validaAndGetDadosLogin(edLogin.Text,meSenha.Text,'SYMK') then//   edPass.Text = '73276' then
         begin
          dm.f_AllowClose := TRUE;

         end
       else
         begin
          dm.f_AllowClose := FALSE;
          edLogin.Text:='';
          meSenha.Text:='';
          edLogin.SetFocus;
          //Abort;
         end;


     Close;


    end; //with dm3

  end; // if key

 end;

end.
