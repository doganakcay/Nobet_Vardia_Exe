program PER_NOBET;

uses
  Forms,
  GIRIS in 'GIRIS.pas' {FRMGIRIS},
  DATALAR in 'DATALAR.pas' {data: TDataModule},
  UNOBBIRIM in 'UNOBBIRIM.pas' {FRM_NOBET_BIRIMI},
  UNOBPERSONEL in 'UNOBPERSONEL.pas' {FRMNOB_PERSONEL},
  UNOBEPUANTAJ in 'UNOBEPUANTAJ.pas' {FRMNOBET_PUANTAJ},
  UNOBETPUANTAJMAAS in 'UNOBETPUANTAJMAAS.pas' {FRMPUANTAJMAAS},
  Utumnobet in 'Utumnobet.pas' {FRMTUMNOBET},
  UUCRETBILGI in 'UUCRETBILGI.pas' {FRMUCRETBILGI},
  Unobet_kont in 'Unobet_kont.pas' {frmnobet_kontrol},
  UNobDegisikligi in 'UNobDegisikligi.pas' {Form1},
  uper_gir_cik in 'uper_gir_cik.pas' {frmgiris_cikis},
  UMESAI_KAYDIRMA in 'UMESAI_KAYDIRMA.pas' {frmMesaiKaydirma},
  Nobet_ayrinti in 'Nobet_ayrinti.pas' {FRMNob_ayrinti},
  Login in 'Login.pas' {frmLogin},
  login_settings in 'login_settings.pas' {Form_loginSettings},
  uHizSunumAlani in 'uHizSunumAlani.pas' {frmHizSunumAlani};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFRMGIRIS, FRMGIRIS);
  Application.CreateForm(Tdata, data);
  Application.CreateForm(TFRMTUMNOBET, FRMTUMNOBET);
  Application.CreateForm(TFRMUCRETBILGI, FRMUCRETBILGI);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmMesaiKaydirma, frmMesaiKaydirma);
  Application.CreateForm(Tfrmgiris_cikis, frmgiris_cikis);
  Application.CreateForm(TfrmHizSunumAlani, frmHizSunumAlani);
  //Application.CreateForm(TForm_loginSettings, Form_loginSettings);
  //Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
