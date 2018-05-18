unit uPassFechar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask;

type
  TfrmPassFechar = class(TForm)
    Label1: TLabel;
    edPass: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edPassKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPassFechar: TfrmPassFechar;

implementation

uses uPrincipal, uDM;

{$R *.dfm}

procedure TfrmPassFechar.edPassKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var pSenha : string;
begin

  dm.f_AllowClose := False;

  pSenha := dm.getSenhaLib1;

  if pSenha = '' then
   pSenha := '79652017';

  if Key = VK_RETURN then
   begin
        {valor numérico (teclado telefonico) para SDBPM }
     if edPass.Text = pSenha then
       begin
        dm.f_AllowClose := TRUE;
        //frmPrincipal := nil;
        //frmPrincipal.Close;
       end
     else
       begin
        dm.f_AllowClose := FALSE;
        //Abort;
       end;

    Close;
   end;



end;

procedure TfrmPassFechar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
frmPassFechar := nil;
end;

procedure TfrmPassFechar.FormShow(Sender: TObject);
begin

   SetWindowPos(Self.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE or SWP_NOACTIVATE ); //or SWP_NOACTIVATE

   SendMessage(Self.Handle,WM_ACTIVATE,0,0);
   BringWindowToTop(Self.Handle);

   edPass.SetFocus;
  


end;

end.
