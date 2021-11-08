object data: Tdata
  OldCreateOrder = False
  Height = 240
  Width = 451
  object AKGUN: TOraSession
    Options.Charset = 'TR8MSWIN1254'
    Options.Direct = True
    Username = 'HBYS'
    Server = '10.42.112.3:1521:orcl'
    Connected = True
    LoginPrompt = False
    AfterConnect = AKGUNAfterConnect
    BeforeConnect = AKGUNBeforeConnect
    Left = 16
    Top = 8
    EncryptedPassword = '91FF85FF85FFC7FFC9FFCCFFC8FF9CFFAFFFB9FFCFFFCFFF'
  end
  object QPERSONEL: TOraQuery
    Session = AKGUN
    SQL.Strings = (
      
        '/*SELECT T.ADI||'#39' '#39'||T.SOYADI ADI FROM KT_PERSONEL T WHERE T.SIC' +
        'ILDE_GORUNSUN IS NOT NULL'
      'ORDER BY ADI*/'
      
        'select T.PERSONEL_ADI || '#39' '#39' || T.SOYADI || CHR(10) || T.TC_KIML' +
        'IK_NO ADI,/*T.TC_KIMLIK_NO*/ P.SIRA_NO TC'
      '  from PER_PERSONEL t'
      ' --WHERE NVL(T.ISTEN_AYRILDI, '#39'F'#39') <> '#39'T'#39)
    Left = 144
    Top = 24
  end
  object QNOB_BIRIM1: TOraQuery
    SQLInsert.Strings = (
      'INSERT INTO NOBET_BIRIMLERI'
      
        '  (BIRIM, ACIKLAMA, NOBET_SORUMLUSU, RISKLI, AKTIF, AKGUN_ID, SI' +
        'FRE, BIRIM_TIPI, ICAP)'
      'VALUES'
      
        '  (:BIRIM, :ACIKLAMA, :NOBET_SORUMLUSU, :RISKLI, :AKTIF, :AKGUN_' +
        'ID, :SIFRE, :BIRIM_TIPI, :ICAP)')
    SQLDelete.Strings = (
      'DELETE FROM NOBET_BIRIMLERI'
      'WHERE'
      '  BIRIM = :Old_BIRIM')
    SQLUpdate.Strings = (
      'UPDATE NOBET_BIRIMLERI'
      'SET'
      
        '  BIRIM = :BIRIM, ACIKLAMA = :ACIKLAMA, NOBET_SORUMLUSU = :NOBET' +
        '_SORUMLUSU, RISKLI = :RISKLI, AKTIF = :AKTIF, AKGUN_ID = :AKGUN_' +
        'ID, SIFRE = :SIFRE, BIRIM_TIPI = :BIRIM_TIPI, ICAP = :ICAP'
      'WHERE'
      '  BIRIM = :Old_BIRIM')
    SQLLock.Strings = (
      'SELECT * FROM NOBET_BIRIMLERI'
      'WHERE'
      '  BIRIM = :Old_BIRIM'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT NOBET_BIRIMLERI.BIRIM, NOBET_BIRIMLERI.ACIKLAMA, NOBET_BI' +
        'RIMLERI.NOBET_SORUMLUSU, NOBET_BIRIMLERI.RISKLI, NOBET_BIRIMLERI' +
        '.AKTIF, NOBET_BIRIMLERI.AKGUN_ID, NOBET_BIRIMLERI.SIFRE, NOBET_B' +
        'IRIMLERI.BIRIM_TIPI, NOBET_BIRIMLERI.ICAP FROM NOBET_BIRIMLERI'
      'WHERE'
      '  BIRIM = :BIRIM')
    Session = AKGUN
    SQL.Strings = (
      'select * from nobet_birimleri t WHERE 1=1 %s ORDER BY 1')
    Left = 72
    Top = 64
  end
  object EKSIKGUNKONTROL: TOraStoredProc
    StoredProcName = 'NOBET_EKSIK_GUN_KONTROL'
    Session = AKGUN
    SQL.Strings = (
      'begin'
      '  NOBET_EKSIK_GUN_KONTROL;'
      'end;')
    Left = 152
    Top = 88
    CommandStoredProcName = 'NOBET_EKSIK_GUN_KONTROL:0'
  end
  object LOOPKISI10: TOraQuery
    Session = AKGUN
    SQL.Strings = (
      
        'select P.PERSONEL_ADI || '#39' '#39' || P.SOYADI ADI, P.TC_KIMLIK_NO USE' +
        'R_ID'
      '  from PER_PERSONEL P'
      
        ' WHERE p.tc_kimlik_no is not null /*NVL(P.ISTEN_AYRILDI, '#39'F'#39') <>' +
        ' '#39'T'#39'*/'
      ' ORDER BY P.PERSONEL_ADI, P.SOYADI')
    Left = 56
    Top = 112
  end
  object QKONTROL: TOraQuery
    Session = AKGUN
    SQL.Strings = (
      
        'SELECT T.PROGKOD,T.USERKOD FROM SU_HBYS_PROG T WHERE T.USERKOD=:' +
        'USR'
      'AND T.PROGKOD='#39'HBYS23'#39)
    Left = 40
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'USR'
        Value = Null
      end>
  end
  object QUSER_KONTROL: TOraQuery
    Session = AKGUN
    SQL.Strings = (
      
        'select * from LOCAL_USER t WHERE 1=1 AND T.USER_ID=:XUSER AND T.' +
        'PASS=:XPASS')
    Left = 120
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'XUSER'
        Value = Null
      end
      item
        DataType = ftUnknown
        Name = 'XPASS'
        Value = Null
      end>
  end
  object QHASTANE_BILGI: TOraQuery
    Session = AKGUN
    SQL.Strings = (
      'select t.* from HASTANE_BILGI t')
    Left = 216
    Top = 24
  end
  object DBMS_APPLICATION: TOraStoredProc
    StoredProcName = 'sys.dbms_application_info.set_module'
    Session = AKGUN
    SQL.Strings = (
      'begin'
      
        '  sys.dbms_application_info.set_module(:MODULE_NAME, :ACTION_NAM' +
        'E);'
      'end;')
    Left = 256
    Top = 88
    ParamData = <
      item
        DataType = ftString
        Name = 'MODULE_NAME'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'ACTION_NAME'
        ParamType = ptInput
        Value = nil
      end>
    CommandStoredProcName = 'sys.dbms_application_info.set_module:0'
  end
  object ConnectDialog1: TConnectDialog
    Caption = 'Ba'#287'lan'
    ConnectButton = 'Ba'#287'lan'
    CancelButton = 'Vazge'#231
    Server.Caption = 'Sunucu'
    Server.Visible = True
    Server.Order = 1
    UserName.Caption = 'Kullan'#305'c'#305' Ad'#305
    UserName.Visible = True
    UserName.Order = 2
    Password.Caption = #350'ifre'
    Password.Visible = True
    Password.Order = 3
    Home.Caption = 'Home Name'
    Home.Visible = False
    Home.Order = 0
    Direct.Caption = 'Direct'
    Direct.Visible = False
    Direct.Order = 6
    Schema.Caption = 'Schema'
    Schema.Visible = False
    Schema.Order = 4
    Role.Caption = 'Connect Mode'
    Role.Visible = False
    Role.Order = 5
    LabelSet = lsCustom
    Left = 344
    Top = 56
  end
  object qsql: TOraSQL
    Session = AKGUN
    Left = 296
    Top = 24
  end
end
