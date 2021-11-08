unit GIRIS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ActnMan, ActnCtrls, ActnMenus, ActnList,
  XPStyleActnCtrls, ImgList, ExtCtrls, RzStatus, RzPanel, RzBckgnd,
  StdCtrls, RzButton,IniFiles, cxGraphics, dxSkinsCore, dxSkinsDefaultPainters,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  RzLabel, Buttons,ShellAPI,Winsock, ComCtrls, Grids, DBGrids, DB, DBAccess, Ora,
  dxSkinscxPCPainter, cxPC, System.Actions, System.ImageList{,VirtualUI_SDK,VirtualUI_Settings,VirtualUI_AutoRun};

type


  TFRMGIRIS = class(TForm)
    ImageList1: TImageList;
    menubar: TActionMainMenuBar;
    MENU: TActionManager;
    Action6: TAction;
    ImageList2: TImageList;
    Action7: TAction;
    Action8: TAction;
    Action9: TAction;
    Action24: TAction;
    PageControl1: TPageControl;
    Action1: TAction;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    function BUYUKHARF(HARF:CHAR):Char;
    procedure RzToolButton4Click(Sender: TObject);
    procedure RzToolButton5Click(Sender: TObject);
    procedure Action9Execute(Sender: TObject);
    procedure Action8Execute(Sender: TObject);
    procedure Action7Execute(Sender: TObject);
    Function GetIPAddress():String;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure Action24Execute(Sender: TObject);
    function TNSNAMEOKU: string;
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    USR,PSW,SRV,KUL,SIF,NOB_KONTROL,MAAS_KONTROL,SYS_KONT,NOBET_TIP:string;

    CONST VERSIYON:INTEGER=24;
  end;

var
  FRMGIRIS: TFRMGIRIS;

implementation
 USES DATALAR,
    UNOBBIRIM, UNOBPERSONEL, UNOBEPUANTAJ, Unobet_kont,uper_gir_cik,
  UMESAI_KAYDIRMA, Login,login_settings;
{$R *.dfm}

procedure TFRMGIRIS.FormActivate(Sender: TObject);

begin



DATA.QHASTANE_BILGI.Open;

if VERSIYON<DATA.QHASTANE_BILGI.FieldByName('PER_NOB_VER').AsInteger then
BEGIN
  Showmessage('Program Versiyonunuz Eskitir Lütfen Güncelleyerek Tekrar Açýnýz');
  Application.Terminate;
END;

 Caption:='PERSONEL NÖBET    Versiyon :'+ inttostr(DATA.QHASTANE_BILGI.FieldByName('PER_NOB_VER').AsInteger);





DATA.QUSER_KONTROL.Close;
DATA.QUSER_KONTROL.Params[0].AsString:=KUL;
data.QUSER_KONTROL.Params[1].AsString:=SIF;
DATA.QUSER_KONTROL.Open;


if DATA.QUSER_KONTROL.FieldByName('MAAS_KONTROL').AsString='X' then
FRMGIRIS.MAAS_KONTROL:='X' ELSE FRMGIRIS.MAAS_KONTROL:=' ' ;


if DATA.QUSER_KONTROL.FieldByName('NOB_KONTROL').AsString='X' then
NOB_KONTROL:='X' ELSE NOB_KONTROL:=' ';


 if (DATa.QUSER_KONTROL.FieldByName('SYSTEM').AsString='X') OR
 (dATa.QUSER_KONTROL.FieldByName('SYSTEM').AsString<>NULL) then
 SYS_KONT:='X' else SYS_KONT:=' ';


NOBET_TIP:= DATa.QUSER_KONTROL.FieldByName('NOB_TIPI').AsString;


  DATA.QUSER_KONTROL.Close;




 if MAAS_KONTROL='X' then
   menubar.ActionClient.Items[3].Visible:=true
   else
   menubar.ActionClient.Items[3].Visible:=false;

 if NOB_KONTROL='X' then
  menubar.ActionClient.Items[2].Visible:=true
  ELSE
  menubar.ActionClient.Items[2].Visible:=FALSE;




end;

procedure TFRMGIRIS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//      TRY
//      WinExec(pchar('EVRAKTAKIP.exe'+' '+KUL+' '+SIF),SW_SHOWNORMAL);
//      EXCEPT
//      EXIT;
//      END;
//     Application.Terminate;
 //    VirtualUI.Stop;
     Action:=caFree;
end;

procedure TFRMGIRIS.FormCreate(Sender: TObject);
begin
  if not Assigned(Data) then
    Application.CreateForm(Tdata, data);

//    if Assigned(Form_loginSettings) then
//    Application.CreateForm(TForm_loginSettings, Form_loginSettings);

  frmLogin := TfrmLogin.Create(APPLICATION);
  frmLogin.ShowModal;

  Left := 0;
  Top := 0;
  Height := SCREEN.Height - 30;
  Width := screen.Width;

end;

procedure TFRMGIRIS.FormDestroy(Sender: TObject);
begin
FRMGIRIS:=NIL;
end;

function TFRMGIRIS.GetIPAddress: String;
type
  pu_long = ^u_long;
//var
//  varTWSAData : TWSAData;
//  varPHostEnt : PHostEnt;
//  varTInAddr : TInAddr;
//  namebuf : Array[0..255] of PAnsiChar;

begin
//  If WSAStartup($101,varTWSAData) <> 0 Then
//  Result := '0'
//  Else Begin
//    gethostname(namebuf,sizeof(namebuf));
//    varPHostEnt := gethostbyname(namebuf);
//    varTInAddr.S_addr := u_long(pu_long(varPHostEnt^.h_addr_list^)^);
//    Result := inet_ntoa(varTInAddr);
//  End;
//  WSACleanup;

end;

procedure TFRMGIRIS.RzBitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TFRMGIRIS.RzToolButton4Click(Sender: TObject);
begin
close;
end;

procedure TFRMGIRIS.RzToolButton5Click(Sender: TObject);
begin
showmessage('bu modül kaldýrýldý');
end;

function TFRMGIRIS.TNSNAMEOKU: string;
var
a:TMemo;
I:INTEGER;
X,XHOST,XPORT,XSID:STRING;
 begin
 a:=TMemo.Create(FRMGIRIS);
 A.Parent:=FRMGIRIS;
 X:='';
 if FileExists('C:\orant\NET80\ADMIN\TNSNAMES.ORA') then
 begin
 a.Lines.LoadFromFile('C:\orant\NET80\ADMIN\TNSNAMES.ORA');
  for I := 0 to A.Lines.Count - 1 do
    BEGIN
       X:=X+' '+a.lines[i];
      
    END;
 end;

a.Free;
x:=UpperCase(x);
x:=copy(x,pos('HOST',X),length(x))  ;
X:=TRIM(copy(x,pos('=',X)+1,length(x))) ;
XHOST:=TRIM(COPY(X,1,POS(')',X)-1));
X:=COPY(X,POS('PORT',X),LENGTH(X));
X:=COPY(X,POS('=',X)+1,LENGTH(X));
XPORT:=TRIM(COPY(X,1,POS(')',X)-1));

X:=COPY(X,POS('SID',X),LENGTH(X));
X:=COPY(X,POS('=',X)+1,LENGTH(X));
XSID:=TRIM(COPY(X,1,POS(')',X)-1));



 RESULT :=XHOST+':'+XPORT+':'+XSID;

end;

procedure TFRMGIRIS.Action1Execute(Sender: TObject);
var
frmMesaiKaydirma:TfrmMesaiKaydirma;
begin
if not Assigned(frmMesaiKaydirma) then
begin
  Application.CreateForm(tfrmMesaiKaydirma,frmMesaiKaydirma);
end;
frmMesaiKaydirma:=TfrmMesaiKaydirma.Create(Application);
frmMesaiKaydirma.ManualDock(PageControl1);
frmMesaiKaydirma.Show;
PageControl1.ActivePageIndex:=PageControl1.PageCount-1;

end;

procedure TFRMGIRIS.Action24Execute(Sender: TObject);
var
frmgiris_cikis:Tfrmgiris_cikis;
  I: Integer;
  XINDEXS:INTEGER;
begin
XINDEXS:=-1;
if not Assigned(frmnobet_kontrol) then
begin
 Application.CreateForm(Tfrmnobet_kontrol,frmnobet_kontrol);
end;

for I := 0 to PageControl1.PageCount-1 do
  begin
    if PageControl1.Pages[i].Tag=1004 then
    begin
      XINDEXS:=PageControl1.Pages[i].PageIndex;
    end;
  end;
        if  XINDEXS=-1then
        begin
            //frmnobet_kontrol.ShowModal;
            frmgiris_cikis:=Tfrmgiris_cikis.Create(Application);
            frmgiris_cikis.ManualDock(PageControl1);
            frmgiris_cikis.Show;
            PageControl1.ActivePageIndex:=PageControl1.PageCount-1;
            PageControl1.ActivePage.Tag:=1004;
            PageControl1.ActivePage.ImageIndex:=85
        end else
        begin
             PageControl1.ActivePageIndex:=XINDEXS;
        end;

end;

procedure TFRMGIRIS.Action7Execute(Sender: TObject);
 var
 frmpuantaj:TFRMNOBET_PUANTAJ;
  I: Integer;
  XINDEXS:INTEGER;
begin
XINDEXS:=-1;
if NOT Assigned(FRMNOBET_PUANTAJ) then
BEGIN
  Application.CreateForm(TFRMNOBET_PUANTAJ,FRMNOBET_PUANTAJ);
END;
for I := 0 to PageControl1.PageCount-1 do
begin
        if PageControl1.Pages[i].Tag=1001 then
        begin
          XINDEXS:=PageControl1.Pages[i].PageIndex;
        end;


end;
        if XINDEXS=-1 then
        begin
        //FRMNOBET_PUANTAJ.ShowModal;
          frmpuantaj:=TFRMNOBET_PUANTAJ.Create(Application);
          frmpuantaj.ManualDock(PageControl1);
          frmpuantaj.Show;
          PageControl1.ActivePageIndex:=PageControl1.PageCount-1;
          PageControl1.ActivePage.Tag:=1001;
          PageControl1.ActivePage.ImageIndex:=524;

        end else
        begin
          PageControl1.ActivePageIndex:=XINDEXS;
        end;
end;

procedure TFRMGIRIS.Action8Execute(Sender: TObject);
var
frmbirimpersonel:TFRMNOB_PERSONEL;
XINDEXS,i:integer;

begin
 XINDEXS:=-1;
if not Assigned(FRMNOB_PERSONEL) then
begin
  Application.CreateForm(TFRMNOB_PERSONEL,FRMNOB_PERSONEL);
end;

for I := 0 to PageControl1.PageCount-1 do
begin
        if PageControl1.Pages[i].Tag=1002 then
        begin
          XINDEXS:=PageControl1.Pages[i].PageIndex;
        end;

end;
        if XINDEXS=-1 then
        begin
          frmbirimpersonel:=TFRMNOB_PERSONEL.Create(Application);
          frmbirimpersonel.ManualDock(PageControl1);
          frmbirimpersonel.Show;
          PageControl1.ActivePageIndex:=PageControl1.PageCount-1;
          PageControl1.ActivePage.Tag:=1002;
          PageControl1.ActivePage.ImageIndex:=19;
        end else
        begin
          PageControl1.ActivePageIndex:=XINDEXS
        end;
 // FRMNOB_PERSONEL.ShowModal;
end;

procedure TFRMGIRIS.Action9Execute(Sender: TObject);
var
frm_birim:TFRM_NOBET_BIRIMI;
XINDEXS,i:integer;
begin
 XINDEXS:=-1;

if FRMGIRIS.SYS_KONT<>'X' then
BEGIN
Showmessage('Yetkiniz bulunmamaktadýr !');
 EXIT;
END;

if not Assigned(FRM_NOBET_BIRIMI) then
begin
 Application.CreateForm(TFRM_NOBET_BIRIMI,FRM_NOBET_BIRIMI);
end;
for I := 0 to PageControl1.PageCount-1 do
begin
        if PageControl1.Pages[i].Tag=1003 then
        begin
          XINDEXS:=PageControl1.Pages[i].PageIndex;
        end;

end;

        if XINDEXS=-1 then
        begin
          //FRM_NOBET_BIRIMI.ShowModal;
           frm_birim:=TFRM_NOBET_BIRIMI.Create(Application);
           frm_birim.ManualDock(PageControl1);
           frm_birim.Show;
           PageControl1.ActivePageIndex:=PageControl1.PageCount-1;
           PageControl1.ActivePage.Tag:=1003;
           PageControl1.ActivePage.ImageIndex:=32;
        end else
        begin
          PageControl1.ActivePageIndex:=XINDEXS
        end;

end;

function TFRMGIRIS.BUYUKHARF(HARF: CHAR): Char;
begin
case HARF of
      'ý': Result:='I';
      'i': Result:='Ý';
      'ö': Result:='Ö';
      'þ': Result:='Þ';
      'ð': Result:='Ð';
      'ç': Result:='Ç';
      'ü': Result:='Ü';
      else
      Result:=UpCase(HARF);
end;

end;
end.
