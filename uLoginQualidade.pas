unit uLoginQualidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFLoginAutorizaQualidade = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    EdSenha: TEdit;
    EdRegistro: TEdit;
    procedure EdSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdRegistroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtCancelarClick(Sender: TObject);
    procedure EdRegistroKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
                 // Procedure para form não passar das extremidades da tela
  public
    { Public declarations }
  end;

var
  FLoginAutorizaQualidade: TFLoginAutorizaQualidade;

implementation

uses  UInfParMedicao, uDM;

{$R *.dfm}




procedure TFLoginAutorizaQualidade.BtCancelarClick(Sender: TObject);

  begin
    Close;
  end;

procedure TFLoginAutorizaQualidade.EdRegistroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  if Key = VK_RETURN then
  begin

    EdSenha.SetFocus;
  end;


end;

procedure TFLoginAutorizaQualidade.EdRegistroKeyPress(Sender: TObject;
  var Key: Char);

  begin
    if not (Key in['0'..'9']) then Key:= #0                        // Campo só aceita números
  end;

procedure TFLoginAutorizaQualidade.EdSenhaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var vReg,vSenha : string;

begin

  if Key = VK_RETURN then
  begin

     vReg := EdRegistro.Text;
     vSenha := EdSenha.Text;

     with DM do
     begin
     

       if validaAndGetDadosLogin(vReg,vSenha,'Qualidade') then
         begin

            if adoQyConvertFunc.FieldByName('T_Acesso').AsString = 'Qualidade' then
              begin

                F_MOTIVO_INPUT := 'Q';
                F_REG_INSP_QUAL := vReg;

                Self.Hide;
                if frmInfParMedicao = nil then
                Application.CreateForm(TfrmInfParMedicao,frmInfParMedicao);

                frmInfParMedicao.ShowModal;

              end

            else
              begin

               Application.MessageBox('Não é um usuário da "Qualidade"!','Atenção',MB_OK+MB_ICONWARNING );
               Exit;

              end;







         end
       else
         begin
           Application.MessageBox('Usuário Inválido!','Atenção',MB_OK+MB_ICONWARNING );
           Exit;
         end;



     end;
    
      Close;

  end;



end;

procedure TFLoginAutorizaQualidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FLoginAutorizaQualidade := nil;
end;

end.
