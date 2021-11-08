unit login_settings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm_loginSettings = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edt_Kul: TEdit;
    Edt_Sif: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    edt_yeni_sif: TEdit;
    Label4: TLabel;
    edt_Yeni_sif_tek: TEdit;
    SpeedButton1: TSpeedButton;
    lbl_mesaj: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_loginSettings: TForm_loginSettings;

implementation

uses
  DATALAR, GIRIS,login;

{$R *.dfm}

procedure TForm_loginSettings.Button1Click(Sender: TObject);
begin

FRMGIRIS.SRV:='10.42.112.3:1521:orcl';

data.akgun.Username:='HBYS';
data.AKGUN.Password:='nzz8637cPF00';
data.AKGUN.Server:='10.42.112.3:1521:orcl';

DATA.AKGUN.Open;



DATA.QUSER_KONTROL.Close;
DATA.QUSER_KONTROL.Params[0].AsString:=Edt_kul.Text;
data.QUSER_KONTROL.Params[1].AsString:=Edt_sif.Text;
DATA.QUSER_KONTROL.Open;

 lbl_mesaj.Caption:='';
  if DATA.QUSER_KONTROL.RecordCount = 0 then
  begin
    lbl_mesaj.Caption := 'Kullanýcý adý veya Þifre Yanlýþ Girdiniz';
    //AKGUN.Options.DateFormat:='DD-MON-RR'  ;
    //AKGUN.Options.DateLanguage:='AMERICAN';
    data.AKGUN.Close;

  end
  else
  begin
    if edt_yeni_sif.Text=edt_Yeni_sif_tek.Text then
    begin
      with data.qsql do
      begin
       SQL.Text:='update local_user t set t.pass=:pass where t.user_id=:user_id';
       Params[0].AsString:=edt_yeni_sif.Text;
       Params[1].AsString:=edt_Kul.Text;
       Execute;
      end;
      data.AKGUN.Commit;

    end else
    begin
      lbl_mesaj.Caption := 'Þifreler bir biri ile uyuþmuyor';
    end;

    FRMGIRIS.KUL := Edt_kul.Text;
    frmGIRIS.SIF := edt_yeni_sif.Text;
    FRMGIRIS.USR:=data.AKGUN.Username;
    FRMGIRIS.PSW:=data.AKGUN.Password;


    close;
  end;

   frmlogin.Close;
end;

procedure TForm_loginSettings.Button2Click(Sender: TObject);
begin
close;
end;

procedure TForm_loginSettings.SpeedButton1Click(Sender: TObject);
begin

  if Edt_Sif.PasswordChar = #0 then
  begin
    Edt_Sif.PasswordChar := '*';
    edt_yeni_sif.PasswordChar:='*';
    edt_Yeni_sif_tek.PasswordChar:='*';
  end
  else
  begin
    Edt_Sif.PasswordChar := #0;
    edt_yeni_sif.PasswordChar:=#0;
    edt_Yeni_sif_tek.PasswordChar:=#0;
  end;
end;

end.
