unit Nobet_ayrinti;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, MemDS, DBAccess, Ora, StdCtrls, Buttons, ExtCtrls,
  cxGridStrs,cxFilterConsts,cxFilterControlStrs, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridTableView, cxGridCustomTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, frxClass, frxDBSet, frxCross,
  cxLookAndFeels, cxLookAndFeelPainters, cxNavigator, dxDateRanges;


type
  TFRMNob_ayrinti = class(TForm)
    qpersonel: TOraQuery;
    dspersonel: TDataSource;
    qtarih: TOraQuery;
    dstarih: TDataSource;
    GroupBox1: TGroupBox;
    Button2: TButton;
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Edit1: TEdit;
    OraSQL1: TOraSQL;
    QSORGU: TOraQuery;
    QGRID: TOraQuery;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dsgrid: TDataSource;
    cxGrid1DBTableView1GUN: TcxGridDBColumn;
    cxGrid1DBTableView1PERSONEL: TcxGridDBColumn;
    cxGrid1DBTableView1KONUM: TcxGridDBColumn;
    cxGrid1DBTableView1ACIKLAMA: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    GridTableViewStyleSheetSlate: TcxGridTableViewStyleSheet;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    frxReport1: TfrxReport;
    frxDBrapor: TfrxDBDataset;
    qrapor: TOraQuery;
    Button1: TButton;
    DataSource1: TDataSource;
    frxCrossObject1: TfrxCrossObject;
    procedure speed_clk(Sender: TObject);
    procedure speed_clk_kisi(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure nesne_olustur_trh;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
  AKTIF_GUN:STRING;
  AKTIF_KISI:string;
  xspbtn : array of TSpeedButton;
  xspbtn_kisi: array of TSpeedButton;
  birim:string;


  end;

var
  FRMNob_ayrinti: TFRMNob_ayrinti;

implementation

uses
  DATALAR;

{$R *.dfm}

procedure TFRMNob_ayrinti.Button1Click(Sender: TObject);
begin
qrapor.Close;
qrapor.Params[0].AsString:=QGRID.Params[0].AsString;
qrapor.Params[1].AsString:=QGRID.Params[1].AsString;
qrapor.Open;
frxReport1.ShowReport(true);
end;

procedure TFRMNob_ayrinti.Button2Click(Sender: TObject);
CONST
INSERT:STRING='INSERT  INTO NOBET_AYRITI_KONUM(NOB_AYRINTI_ID,TARIH,BIRIM,TC,KONUM1)VALUES (NOBET_AYRINTI_KONUM_SQ.NEXTVAL,:TARIH,:BIRIM,:TC,:KONUM1)';
SORGU:string='SELECT COUNT(*) TOPLAM FROM  NOBET_AYRITI_KONUM T WHERE T.TARIH=:TARIH AND T.BIRIM=:BIRIM AND T.TC=:TC AND T.KONUM1=:KONUM1' ;
Delete:string='DELETE  NOBET_AYRITI_KONUM T WHERE T.TARIH=:TARIH AND T.BIRIM=:BIRIM AND T.TC=:TC AND T.KONUM1=:KONUM1' ;

begin

if (AKTIF_GUN='') OR (AKTIF_KISI='') or (Edit1.Text='') then EXIT;
         QSORGU.SQL.Clear;
         QSORGU.SQL.Add(sorgu);
         QSORGU.ParamByName('TARIH').AsString:=Copy(AKTIF_GUN,7,2)+'.'+Copy(AKTIF_GUN,5,2)+'.'+Copy(AKTIF_GUN,1,4);
         QSORGU.ParamByName('TC').AsString:=AKTIF_KISI;
         QSORGU.ParamByName('BIRIM').AsString:=BIRIM;
         QSORGU.ParamByName('KONUM1').AsString:=Edit1.Text;
         QSORGU.Open;
         if QSORGU.FieldByName('TOPLAM').AsInteger=0 then
         BEGIN
             OraSQL1.SQL.Clear;
             OraSQL1.SQL.Add(insert);
             OraSQL1.ParamByName('TARIH').AsString:=Copy(AKTIF_GUN,7,2)+'.'+Copy(AKTIF_GUN,5,2)+'.'+Copy(AKTIF_GUN,1,4);
             OraSQL1.ParamByName('TC').AsString:=AKTIF_KISI;
             OraSQL1.ParamByName('BIRIM').AsString:=BIRIM;
             OraSQL1.ParamByName('KONUM1').AsString:=Edit1.Text;
             OraSQL1.Execute;
             DATA.AKGUN.Commit;
         end else
         BEGIN
             OraSQL1.SQL.Clear;
             OraSQL1.SQL.Add(DELETE);
             OraSQL1.ParamByName('TARIH').AsString:=Copy(AKTIF_GUN,7,2)+'.'+Copy(AKTIF_GUN,5,2)+'.'+Copy(AKTIF_GUN,1,4);
             OraSQL1.ParamByName('TC').AsString:=AKTIF_KISI;
             OraSQL1.ParamByName('BIRIM').AsString:=BIRIM;
             OraSQL1.ParamByName('KONUM1').AsString:=Edit1.Text;
             OraSQL1.Execute;
             DATA.AKGUN.Commit;

         END;
  QGRID.Refresh;
end;

procedure TFRMNob_ayrinti.FormActivate(Sender: TObject);
begin
nesne_olustur_trh;
end;

procedure TFRMNob_ayrinti.FormClose(Sender: TObject; var Action: TCloseAction);
Var
X         :Integer;
begin
 X:=0;
while componentcount<>x   do
begin
  If components[x] is Tspeedbutton then
  begin
    Tspeedbutton(components[x]).Free;

  end else
  begin
    x:=x+1;
  end;

end;

end;

procedure TFRMNob_ayrinti.FormCreate(Sender: TObject);
begin
//
//// uses cxGridStrs,cxFilterConsts,cxFilterControlStrs
//
////  scxGridRecursiveLevels = 'You cannot create recursive levels';
//  //cxSetResourceString(@scxGridRecursiveLevels, 'Yinelemeli seviyeler olu�turamazs�n�z');
////  scxGridDeletingConfirmationCaption = 'Confirm';
////  cxSetResourceString(@scxGridDeletingConfirmationCaption, 'Onayla');
////  scxGridDeletingFocusedConfirmationText = 'Delete record?';
//  //cxSetResourceString(@scxGridDeletingFocusedConfirmationText, 'Kay�t silinsin mi ?');
////  scxGridDeletingSelectedConfirmationText = 'Delete all selected records?';
//  //cxSetResourceString(@scxGridDeletingSelectedConfirmationText, 'Se�ili t�m kay�tlar silinsin mi ?');
////  scxGridNoDataInfoText = '<No data to display>';
//  cxSetResourceString(@scxGridNoDataInfoText, '<G�sterilecek kay�t yok>');
////  scxGridNewItemRowInfoText = 'Click here to add a new row';
//  cxSetResourceString(@scxGridNewItemRowInfoText, 'Yeni sat�r eklemek i�in buraya t�klay�n');
////  scxGridFilterIsEmpty = '<Filter is Empty>';
//  cxSetResourceString(@scxGridFilterIsEmpty, '<Filtre bo�>');
////  scxGridCustomizationFormCaption = 'Customization';
//  cxSetResourceString(@scxGridCustomizationFormCaption, '�zelle�tirme');
////  scxGridCustomizationFormColumnsPageCaption = 'Columns';
//  cxSetResourceString(@scxGridCustomizationFormColumnsPageCaption, 'S�tunlar');
////  scxGridGroupByBoxCaption = 'Drag a column header here to group by that column';
//  cxSetResourceString(@scxGridGroupByBoxCaption, 'Gruplamak istedi�iniz kolonu buraya s�r�kleyin');
////  scxGridFilterCustomizeButtonCaption = 'Customize...';
//  cxSetResourceString(@scxGridFilterCustomizeButtonCaption, '�zelle�tir');
////  scxGridColumnsQuickCustomizationHint = 'Click here to select visible columns';
//  cxSetResourceString(@scxGridColumnsQuickCustomizationHint, 'G�r�n�r s�tunlar� se�mek i�in t�klay�n');
////  scxGridCustomizationFormBandsPageCaption = 'Bands';
//  cxSetResourceString(@scxGridCustomizationFormBandsPageCaption, 'Bantlar');
////  scxGridBandsQuickCustomizationHint = 'Click here to select visible bands';
//  cxSetResourceString(@scxGridBandsQuickCustomizationHint, 'G�r�n�r bantlar� se�mek i�in t�klay�n');
////  scxGridCustomizationFormRowsPageCaption = 'Rows';
//  cxSetResourceString(@scxGridCustomizationFormRowsPageCaption, 'Sat�rlar');
////  scxGridConverterIntermediaryMissing = 'Missing an intermediary component!'#13#10'Please add a %s component to the form.';
//  cxSetResourceString(@scxGridConverterIntermediaryMissing, 'Bulunamayan arac� bile�en!'#13#10'L�tfen bir %s bile�eni forma ekleyin.');
////  scxGridConverterNotExistGrid = 'cxGrid does not exist';
//  cxSetResourceString(@scxGridConverterNotExistGrid, 'cxGrid yok');
////  scxGridConverterNotExistComponent = 'Component does not exist';
//  cxSetResourceString(@scxGridConverterNotExistComponent, 'Bile�en yok');
////  scxImportErrorCaption = 'Import error';
//  cxSetResourceString(@scxImportErrorCaption, '��e aktar�m hatas�');
////  scxNotExistGridView = 'Grid view does not exist';
//  cxSetResourceString(@scxNotExistGridView, 'Grid g�r�n�m� yok');
////  scxNotExistGridLevel = 'Active grid level does not exist';
// // cxSetResourceString(@scxNotExistGridLevel, 'Ge�erli grid seviyesi yok');
////  scxCantCreateExportOutputFile = 'Can''t create the export output file';
// // cxSetResourceString(@scxCantCreateExportOutputFile, 'D��a aktar�lacak dosya olu�turulam�yor');
////  cxSEditRepositoryExtLookupComboBoxItem = 'ExtLookupComboBox|Represents an ultra-advanced lookup using the QuantumGrid as its drop down control';
////  scxGridChartValueHintFormat = '%s for %s is %s'; // series display text, category, value
//
//{********************************************************************}
//{cxFilterConsts                                                      }
//{********************************************************************}
//
////  // base operators
////  cxSFilterOperatorEqual = 'equals';
//  cxSetResourceString(@cxSFilterOperatorEqual, 'e�it');
////  cxSFilterOperatorNotEqual = 'does not equal';
//  cxSetResourceString(@cxSFilterOperatorNotEqual, 'e�it de�il');
////  cxSFilterOperatorLess = 'is less than';
//  cxSetResourceString(@cxSFilterOperatorLess, 'k���k');
////  cxSFilterOperatorLessEqual = 'is less than or equal to';
//  cxSetResourceString(@cxSFilterOperatorLessEqual, 'k���k veya e�it');
////  cxSFilterOperatorGreater = 'is greater than';
//  cxSetResourceString(@cxSFilterOperatorGreater, 'b�y�k');
////  cxSFilterOperatorGreaterEqual = 'is greater than or equal to';
//  cxSetResourceString(@cxSFilterOperatorGreaterEqual, 'b�y�k veya e�it');
////  cxSFilterOperatorLike = 'like';
//  cxSetResourceString(@cxSFilterOperatorLike, 'i�erir');
////  cxSFilterOperatorNotLike = 'not like';
//  cxSetResourceString(@cxSFilterOperatorNotLike, 'i�ermez');
////  cxSFilterOperatorBetween = 'between';
//  cxSetResourceString(@cxSFilterOperatorBetween, 'aras�nda');
////  cxSFilterOperatorNotBetween = 'not between';
//  cxSetResourceString(@cxSFilterOperatorNotBetween, 'aras�nda de�il');
////  cxSFilterOperatorInList = 'in';
//  cxSetResourceString(@cxSFilterOperatorInList, 'i�inde olan');
////  cxSFilterOperatorNotInList = 'not in';
//  cxSetResourceString(@cxSFilterOperatorNotInList, 'i�inde olmayan');
////  cxSFilterOperatorYesterday = 'is yesterday';
//  cxSetResourceString(@cxSFilterOperatorYesterday, 'd�n');
////  cxSFilterOperatorToday = 'is today';
//  cxSetResourceString(@cxSFilterOperatorToday, 'bug�n');
////  cxSFilterOperatorTomorrow = 'is tomorrow';
//  cxSetResourceString(@cxSFilterOperatorTomorrow , 'yar�n');
////  cxSFilterOperatorLastWeek = 'is last week';
//  cxSetResourceString(@cxSFilterOperatorLastWeek, 'ge�en hafta');
////  cxSFilterOperatorLastMonth = 'is last month';
//  cxSetResourceString(@cxSFilterOperatorLastMonth, 'ge�en ay');
////  cxSFilterOperatorLastYear = 'is last year';
//  cxSetResourceString(@cxSFilterOperatorLastYear, 'ge�en sene');
////  cxSFilterOperatorThisWeek = 'is this week';
//  cxSetResourceString(@cxSFilterOperatorThisWeek, 'bu hafta');
////  cxSFilterOperatorThisMonth = 'is this month';
//  cxSetResourceString(@cxSFilterOperatorThisMonth, 'bu ay');
////  cxSFilterOperatorThisYear = 'is this year';
//  cxSetResourceString(@cxSFilterOperatorThisYear, 'bu sene');
////  cxSFilterOperatorNextWeek = 'is next week';
//  cxSetResourceString(@cxSFilterOperatorNextWeek, 'gelecek hafta');
////  cxSFilterOperatorNextMonth = 'is next month';
//  cxSetResourceString(@cxSFilterOperatorNextMonth, 'gelecek ay');
////  cxSFilterOperatorNextYear = 'is next year';
//  cxSetResourceString(@cxSFilterOperatorNextYear, 'gelecek sene');
////  cxSFilterAndCaption = 'and';
//  cxSetResourceString(@cxSFilterAndCaption, 've');
////  cxSFilterOrCaption = 'or';
//  cxSetResourceString(@cxSFilterOrCaption, 'veya');
////  cxSFilterNotCaption = 'not';
//  cxSetResourceString(@cxSFilterNotCaption, 'de�il');
////  cxSFilterBlankCaption = 'blank';
//  cxSetResourceString(@cxSFilterBlankCaption, 'bo�');
////  // derived
////  cxSFilterOperatorIsNull = 'is blank';
//  cxSetResourceString(@cxSFilterOperatorIsNull, 'bo�luk');
////  cxSFilterOperatorIsNotNull = 'is not blank';
//  cxSetResourceString(@cxSFilterOperatorIsNotNull, 'bo�luk de�il');
////  cxSFilterOperatorBeginsWith = 'begins with';
//  cxSetResourceString(@cxSFilterOperatorBeginsWith , 'ile ba�layan');
////  cxSFilterOperatorDoesNotBeginWith = 'does not begin with';
//  cxSetResourceString(@cxSFilterOperatorDoesNotBeginWith, 'ile ba�lamayan');
////  cxSFilterOperatorEndsWith = 'ends with';
//  cxSetResourceString(@cxSFilterOperatorEndsWith, 'ile biten');
////  cxSFilterOperatorDoesNotEndWith = 'does not end with';
//  cxSetResourceString(@cxSFilterOperatorDoesNotEndWith, 'ile bitmeyen');
////  cxSFilterOperatorContains = 'contains';
//  cxSetResourceString(@cxSFilterOperatorContains, 'i�eren');
////  cxSFilterOperatorDoesNotContain = 'does not contain';
//  cxSetResourceString(@cxSFilterOperatorDoesNotContain, 'i�ermeyen');
////  // filter listbox's values
////  cxSFilterBoxAllCaption = '(All)';
//  cxSetResourceString(@cxSFilterBoxAllCaption, 'Hepsi');
////  cxSFilterBoxCustomCaption = '(Custom...)';
//  cxSetResourceString(@cxSFilterBoxCustomCaption, '�zel...');
////  cxSFilterBoxBlanksCaption = '(Blanks)';
//  cxSetResourceString(@cxSFilterBoxBlanksCaption, '(Bo� olanlar)');
////  cxSFilterBoxNonBlanksCaption = '(NonBlanks)';
//  cxSetResourceString(@cxSFilterBoxNonBlanksCaption, '(Bo� olmayanlar)');
//
//{********************************************************************}
//{cxFilterControlStrs                                                 }
//{********************************************************************}
//
////  // cxFilterBoolOperator
////  cxSFilterBoolOperatorAnd = 'AND';        // all
//  cxSetResourceString(@cxSFilterBoolOperatorAnd, 'VE');
////  cxSFilterBoolOperatorOr = 'OR';          // any
//  cxSetResourceString(@cxSFilterBoolOperatorOr, 'VEYA');
////  cxSFilterBoolOperatorNotAnd = 'NOT AND'; // not all
//  cxSetResourceString(@cxSFilterBoolOperatorNotAnd, 'VE DE��L');
////  cxSFilterBoolOperatorNotOr = 'NOT OR';   // not any
//  cxSetResourceString(@cxSFilterBoolOperatorNotOr, 'VEYA DE��L');
////  //
////  cxSFilterRootButtonCaption = 'Filter';
//  cxSetResourceString(@cxSFilterRootButtonCaption, 'Filtre');
////  cxSFilterAddCondition = 'Add &Condition';
//  cxSetResourceString(@cxSFilterAddCondition, '&Ko�ul ekle');
////  cxSFilterAddGroup = 'Add &Group';
//  cxSetResourceString(@cxSFilterAddGroup, '&Grup ekle');
////  cxSFilterRemoveRow = '&Remove Row';
//  cxSetResourceString(@cxSFilterRemoveRow, '&Sat�r kald�r');
////  cxSFilterClearAll = 'Clear &All';
//  cxSetResourceString(@cxSFilterClearAll, 'Hepsini &temizle');
////  cxSFilterFooterAddCondition = 'press the button to add a new condition';
//  cxSetResourceString(@cxSFilterFooterAddCondition, 'yeni ko�ul eklemek i�in tu�a bas�n');
////  cxSFilterGroupCaption = 'applies to the following conditions';
//  cxSetResourceString(@cxSFilterGroupCaption, 'a�a��daki ko�ullar� uygulay�n');
////  cxSFilterRootGroupCaption = '<root>';
//  cxSetResourceString(@cxSFilterRootGroupCaption, '<k�k>');
////  cxSFilterControlNullString = '<empty>';
//  cxSetResourceString(@cxSFilterControlNullString, '<bo�>');
////  cxSFilterErrorBuilding = 'Can''t build filter from source';
//  cxSetResourceString(@cxSFilterErrorBuilding, 'Kaynaktan filtrelenemiyor');
////  //FilterDialog
////  cxSFilterDialogCaption = 'Custom Filter';
//  cxSetResourceString(@cxSFilterDialogCaption, '�zel filtre');
////  cxSFilterDialogInvalidValue = 'Invalid value';
//  cxSetResourceString(@cxSFilterDialogInvalidValue, 'Ge�ersiz de�er');
////  cxSFilterDialogUse = 'Use';
//  cxSetResourceString(@cxSFilterDialogUse, 'Kullan');
////  cxSFilterDialogSingleCharacter = 'to represent any single character';
//  cxSetResourceString(@cxSFilterDialogSingleCharacter, 'tek karakteri temsil etmek i�in');
////  cxSFilterDialogCharactersSeries = 'to represent any series of characters';
//  cxSetResourceString(@cxSFilterDialogCharactersSeries, 'pe� pe�e karakterleri temsil etmek i�in');
////  cxSFilterDialogOperationAnd = 'AND';
//  cxSetResourceString(@cxSFilterDialogOperationAnd, 'VE');
////  cxSFilterDialogOperationOr = 'OR';
//  cxSetResourceString(@cxSFilterDialogOperationOr, 'VEYA');
////  cxSFilterDialogRows = 'Show rows where:';
//  cxSetResourceString(@cxSFilterDialogRows, 'Sat�rlar� goster');
////
////  // FilterControlDialog
////  cxSFilterControlDialogCaption = 'Filter builder';
//  cxSetResourceString(@cxSFilterControlDialogCaption, 'Filtre haz�rlay�c�');
////  cxSFilterControlDialogNewFile = 'untitled.flt';
//  cxSetResourceString(@cxSFilterControlDialogNewFile, 'isimsiz.flt');
////  cxSFilterControlDialogOpenDialogCaption = 'Open an existing filter';
//  cxSetResourceString(@cxSFilterControlDialogOpenDialogCaption, 'Filtre a�');
////  cxSFilterControlDialogSaveDialogCaption = 'Save the active filter to file';
//  cxSetResourceString(@cxSFilterControlDialogSaveDialogCaption, 'Ge�erli filtreyi kaydet');
////  cxSFilterControlDialogActionSaveCaption = '&Save As...';
//  cxSetResourceString(@cxSFilterControlDialogActionSaveCaption, '&Farkl� kaydet');
////  cxSFilterControlDialogActionOpenCaption = '&Open...';
//  cxSetResourceString(@cxSFilterControlDialogActionOpenCaption, '&A�...');
////  cxSFilterControlDialogActionApplyCaption = '&Apply';
//  cxSetResourceString(@cxSFilterControlDialogActionApplyCaption, '&Uygula');
////  cxSFilterControlDialogActionOkCaption = 'OK';
//  cxSetResourceString(@cxSFilterControlDialogActionOkCaption, 'Tamam');
////  cxSFilterControlDialogActionCancelCaption = 'Cancel';
//  cxSetResourceString(@cxSFilterControlDialogActionCancelCaption, '�ptal');
////  cxSFilterControlDialogFileExt = 'flt';
////  cxSFilterControlDialogFileFilter = 'Filters (*.flt)|*.flt';
//  cxSetResourceString(@cxSFilterControlDialogFileFilter, 'Filtreler (*.flt)|*.flt');
end;

procedure TFRMNob_ayrinti.nesne_olustur_trh;
var

GBOX_BASLIK,gun:string;
i:Integer;
begin
try
if qtarih.RecordCount=0 then  Exit;
 DateTimeToString(GBOX_BASLIK,'MMMM YYYY',qtarih.FieldByName('gun').AsDateTime);
 GroupBox1.Caption:=GBOX_BASLIK;
 SetLength(xspbtn,qtarih.RecordCount);
 qtarih.First;
 i:=0;
   while not  qtarih.Eof do
   begin

   xspbtn[i]:=TSpeedButton.Create(self);
  // xspbtn[i].Top:=20;
   xspbtn[i].Width:=GroupBox1.Width-2;
   xspbtn[i].Parent:=Self.GroupBox1;
   xspbtn[i].GroupIndex:=1;
   DateTimeToString(gun,'yyyymmdd',qtarih.FieldByName('gun').AsDateTime);
   xspbtn[i].Tag:=StrToInt(gun);
   xspbtn[i].Caption:=qtarih.FieldByName('guns').AsString;
   xspbtn[i].Width:=35;
   xspbtn[i].Align:=alLeft;

   xspbtn[i].OnClick:=speed_clk;
   i:=i+1;
   qtarih.Next;
   end;

finally

end;



end;

procedure TFRMNob_ayrinti.speed_clk(Sender: TObject);
 var
tc:string;
i:Integer;
gun: string;
begin
TRY
AKTIF_GUN:=IntToStr((sender as TSpeedButton).Tag );
gun:=IntToStr(strtoint(Copy(AKTIF_GUN,7,2)));
qpersonel.Close;
qpersonel.SQL.Clear;

qpersonel.SQL.Add('select t.birim, p.personel_adi || '' '' || p.soyadi adi, to_char(p.tc_kimlik_no) tc '+
  'from nobet_per_puantaj_cetveli t, per_personel p, nobet_per_saati s   where p.tc_kimlik_no = to_char(t.tc) '+
  ' and s.sira_no = t.G'+gun+' and s.saat > 0   and t.tarih='''+copy(AKTIF_GUN,5,2)+'.'+Copy(AKTIF_GUN,1,4)+
  ''' and t.birim='+birim  );

qpersonel.Open;



if (qpersonel.Active=false) or (qpersonel.RecordCount=0) then  Exit;

 i:=0;
        while componentcount<>i   do
        begin
          If (components[i] is Tspeedbutton) and ((Components[i] as TSpeedButton).GroupIndex=55)  then
          begin
            Tspeedbutton(components[i]).Free;

 end else
          begin
            i:=i+1;
          end;

        end;

   SetLength(xspbtn_kisi,qpersonel.RecordCount);
   i:=0;
   qpersonel.First;
   while not qpersonel.Eof do
   begin
   xspbtn_kisi[i]:=TSpeedButton.Create(SELF);
   xspbtn_kisi[i].Width:=120;
   xspbtn_kisi[i].Parent:=Self.GroupBox2;
   xspbtn_kisi[i].GroupIndex:=55;
   GroupBox2.Caption:='PERSONEL';
   tc:=qpersonel.FieldByName('tc').AsString;
   xspbtn_kisi[i].Name:='A'+tc;
   xspbtn_kisi[i].Caption:=qpersonel.FieldByName('adi').AsString;
   xspbtn_kisi[i].Align:=alTop;
   xspbtn_kisi[i].OnClick:=speed_clk_kisi;
   i:=i+1;
   qpersonel.Next;

   end;
FINALLY

END;


end;

procedure TFRMNob_ayrinti.speed_clk_kisi(Sender: TObject);
begin
AKTIF_KISI:=Copy((Sender as TSpeedButton).NAME,2,11);
end;

end.
