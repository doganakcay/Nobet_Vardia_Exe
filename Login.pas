unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edt_Kul: TEdit;
    Edt_Sif: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Label3: TLabel;
    Button2: TButton;
    BitBtn1: TBitBtn;
    SpeedButton1: TSpeedButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  GIRIS, DATALAR, login_settings;

{$R *.dfm}

procedure TfrmLogin.BitBtn1Click(Sender: TObject);
begin

   Form_loginSettings:=TForm_loginSettings.Create(Application);
   Form_loginSettings.ShowModal;


end;

procedure TfrmLogin.Button1Click(Sender: TObject);
begin


//doðum evi
//

//
 //test
//FRMGIRIS.KUL:='60058070332';
//frmGIRIS.SIF:='1234';
////
FRMGIRIS.SRV:='10.42.112.3:1521:orcl';

data.akgun.Username:='HBYS';
data.AKGUN.Password:='nzz8637cPF00';
data.AKGUN.Server:='10.42.112.3:1521:orcl';

DATA.AKGUN.Open;



DATA.QUSER_KONTROL.Close;
DATA.QUSER_KONTROL.Params[0].AsString:=Edt_kul.Text;
data.QUSER_KONTROL.Params[1].AsString:=Edt_sif.Text;
DATA.QUSER_KONTROL.Open;

 label3.Caption:='';
  if DATA.QUSER_KONTROL.RecordCount = 0 then
  begin
    label3.Caption := 'Kullanýcý adý veya Þifre Yanlýþ Girdiniz';
    //AKGUN.Options.DateFormat:='DD-MON-RR'  ;
    //AKGUN.Options.DateLanguage:='AMERICAN';
    data.AKGUN.Close;

  end
  else
  begin
    FRMGIRIS.KUL := Edt_kul.Text;
    frmGIRIS.SIF := Edt_sif.Text;
    FRMGIRIS.USR:=data.AKGUN.Username;
    FRMGIRIS.PSW:=data.AKGUN.Password;

    close;
  end;








 //numune

//
//// ////test
////FRMGIRIS.KUL:='41332709896';  //taner ümütlü
////frmGIRIS.SIF:='2000';
////FRMGIRIS.KUL:='13091336668';// ibrahim kürkcü
////frmGIRIS.SIF:='1234';
//FRMGIRIS.KUL:='24788250488';// ECZANE kürkcü
//frmGIRIS.SIF:='1234';

/////
//FRMGIRIS.SRV:='10.42.184.111:1521:ORCL';
//akgun.Username:='HBYS';
//AKGUN.Password:='26a46iPF4m';
//AKGUN.Server:='10.42.184.111:1521:ORCL';
////
////AKGUN.Options.DateFormat:='DD-MON-RR'  ;
////AKGUN.Options.DateLanguage:='AMERICAN';
//
//FRMGIRIS.USR:=AKGUN.Username;
//FRMGIRIS.PSW:=AKGUN.Password;


///EREGLI


 ////test
//FRMGIRIS.KUL:='48817447700';
//frmGIRIS.SIF:='7127731';
//
//FRMGIRIS.SRV:='10.42.192.196:1521:sby1';
//
//akgun.Username:='HBYS';
//AKGUN.Password:='1q2w3e4r*';
//AKGUN.Server:='10.42.192.196:1521:sby2';
//
//AKGUN.Options.DateFormat:='DD.MM.YYYY'  ;
//AKGUN.Options.DateLanguage:='TURKISH';
//
//FRMGIRIS.USR:=AKGUN.Username;
//FRMGIRIS.PSW:=AKGUN.Password;


//BEYHEKÝM DH

//
// //test
////FRMGIRIS.KUL:='60058070332';
////frmGIRIS.SIF:='1234';
////
//FRMGIRIS.SRV:='10.42.208.101:1521:orcl';
//
//akgun.Username:='HBYS';
//AKGUN.Password:='pf0c5aubrw';
//AKGUN.Server:='10.42.208.101:1521:orcl';
////
////AKGUN.Options.DateFormat:='DD-MON-RR'  ;
////AKGUN.Options.DateLanguage:='AMERICAN';
////
//
//FRMGIRIS.USR:=AKGUN.Username;
//FRMGIRIS.PSW:=AKGUN.Password;


end;

procedure TfrmLogin.Button2Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DATA.QUSER_KONTROL.RecordCount = 0 then
  begin
    application.Terminate;
  end
  else
  begin
    close;
  end;
end;

procedure TfrmLogin.SpeedButton1Click(Sender: TObject);
begin

if Edt_Sif.PasswordChar=#0 then
Edt_Sif.PasswordChar:='*'
else Edt_Sif.PasswordChar:=#0;

end;

end.
