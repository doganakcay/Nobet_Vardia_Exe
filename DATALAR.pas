unit DATALAR;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBQuery, IBUpdateSQL,
  MemDS, DBAccess, Ora, IBStoredProc, IBSQL, OraTransaction, OdacVcl, OraCall;

type
  Tdata = class(TDataModule)
    QPERSONEL: TOraQuery;
    QNOB_BIRIM1: TOraQuery;
    EKSIKGUNKONTROL: TOraStoredProc;
    LOOPKISI10: TOraQuery;
    AKGUN: TOraSession;
    QKONTROL: TOraQuery;
    QUSER_KONTROL: TOraQuery;
    QHASTANE_BILGI: TOraQuery;
    DBMS_APPLICATION: TOraStoredProc;
    ConnectDialog1: TConnectDialog;
    qsql: TOraSQL;
    procedure AKGUNAfterConnect(Sender: TObject);
    procedure AKGUNBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    GIDENEVRAKSQL,GELENEVRAKSQL:string;
  end;

var
  data: Tdata;

implementation
USES GIRIS , Login;
{$R *.dfm}

procedure Tdata.AKGUNAfterConnect(Sender: TObject);
begin

DBMS_APPLICATION.Params[0].AsString:='PER_NOBET.EXE';
DBMS_APPLICATION.Params[1].AsString:='PERSONEL NOBETLERÝ';
DBMS_APPLICATION.Execute;



end;

procedure Tdata.AKGUNBeforeConnect(Sender: TObject);
begin


//doðum evi
//

//
 //test
//FRMGIRIS.KUL:='60058070332';
//frmGIRIS.SIF:='1234';
////
//FRMGIRIS.SRV:='10.42.112.3:1521:orcl';
//
//akgun.Username:='HBYS';
//AKGUN.Password:='nzz8637cPF00';
//AKGUN.Server:='10.42.112.3:1521:orcl';
//
////AKGUN.Options.DateFormat:='DD-MON-RR'  ;
////AKGUN.Options.DateLanguage:='AMERICAN';
//
//
//FRMGIRIS.USR:=AKGUN.Username;
//FRMGIRIS.PSW:=AKGUN.Password;


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

end.

