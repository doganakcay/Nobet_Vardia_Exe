object FRMNob_ayrinti: TFRMNob_ayrinti
  Left = 0
  Top = 0
  Caption = 'Nobet ayr'#305'nt'#305
  ClientHeight = 820
  ClientWidth = 1303
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 1303
    Height = 43
    Align = alTop
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 43
    Width = 1303
    Height = 777
    Align = alClient
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 145
      Height = 775
      Align = alLeft
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 146
      Top = 1
      Width = 1156
      Height = 775
      Align = alClient
      TabOrder = 1
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 1154
        Height = 41
        Align = alTop
        TabOrder = 0
        object Edit1: TEdit
          Left = 16
          Top = 4
          Width = 305
          Height = 27
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 0
        end
        object Button2: TButton
          Left = 327
          Top = 4
          Width = 75
          Height = 25
          Caption = 'EKLE/'#199'IKART'
          TabOrder = 1
          OnClick = Button2Click
        end
        object Button1: TButton
          Left = 408
          Top = 4
          Width = 75
          Height = 25
          Caption = 'Yazd'#305'r'
          TabOrder = 2
          OnClick = Button1Click
        end
      end
      object cxGrid1: TcxGrid
        Left = 1
        Top = 42
        Width = 1154
        Height = 732
        Align = alClient
        TabOrder = 1
        object cxGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsgrid
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          Styles.StyleSheet = GridTableViewStyleSheetSlate
          object cxGrid1DBTableView1GUN: TcxGridDBColumn
            DataBinding.FieldName = 'GUN'
          end
          object cxGrid1DBTableView1PERSONEL: TcxGridDBColumn
            DataBinding.FieldName = 'PERSONEL'
            Width = 215
          end
          object cxGrid1DBTableView1KONUM: TcxGridDBColumn
            DataBinding.FieldName = 'KONUM'
          end
          object cxGrid1DBTableView1ACIKLAMA: TcxGridDBColumn
            DataBinding.FieldName = 'ACIKLAMA'
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
  end
  object qpersonel: TOraQuery
    Session = data.AKGUN
    SQL.Strings = (
      
        'select p.personel_adi || '#39' '#39' || p.soyadi adi, to_char(p.tc_kimli' +
        'k_no) tc'
      
        '  from nobet_per_puantaj_cetveli t, per_personel p, nobet_per_sa' +
        'ati s'
      ' where p.tc_kimlik_no = to_char(t.tc)'
      '   and s.sira_no = t.g1'
      '   and s.saat > 0'
      '   and t.birim:=xbirim')
    Left = 218
    Top = 392
  end
  object dspersonel: TDataSource
    DataSet = qpersonel
    Left = 186
    Top = 408
  end
  object qtarih: TOraQuery
    Session = data.AKGUN
    SQL.Strings = (
      'select '
      'to_char(( to_date('#39'12.2019'#39','#39'mm.yyyy'#39'))-1+level,'#39'dd'#39') guns,'
      '(to_date(:tar1, '#39'mm.yyyy'#39') - 1) + level gun'
      '  from dual'
      'connect by level <= (last_day(to_date(:tar1, '#39'mm.yyyy'#39')) + 1) -'
      '           (to_date(:tar1, '#39'mm.yyyy'#39'))'
      'order by guns desc')
    Left = 210
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tar1'
        Value = nil
      end>
  end
  object dstarih: TDataSource
    DataSet = qtarih
    Left = 178
    Top = 464
  end
  object OraSQL1: TOraSQL
    SQL.Strings = (
      
        'INSERT  INTO NOBET_AYRITI_KONUM(NOB_AYRINTI_ID,TARIH,BIRIM,TC,KO' +
        'NUM1)VALUES'
      '(NOBET_AYRINTI_KONUM_SQ.NEXTVAL,:TARIH,:BIRIM,:TC,:KONUM1)')
    Left = 624
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TARIH'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'BIRIM'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'TC'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'KONUM1'
        Value = nil
      end>
  end
  object QSORGU: TOraQuery
    Session = data.AKGUN
    Left = 658
    Top = 113
  end
  object QGRID: TOraQuery
    SQL.Strings = (
      'SELECT TRH.GUN,'
      
        '       REPLACE(wm_concat(P.PERSONEL_ADI || '#39' '#39' || P.SOYADI),'#39','#39',' +
        'CHR(10)) PERSONEL,'
      '       AK.KONUM1 KONUM,'
      '       NB.ACIKLAMA'
      
        '  FROM (select to_char((to_date(:TAR, '#39'mm.yyyy'#39')) - 1 + level, '#39 +
        'dd'#39') guns,'
      '               (to_date(:TAR, '#39'mm.yyyy'#39')) - 1 + level gun'
      '          from dual'
      
        '        connect by level <= (last_day(to_date(:TAR, '#39'mm.yyyy'#39')) ' +
        '+ 1) -'
      '                   (to_date(:TAR, '#39'mm.yyyy'#39'))) TRH'
      '  LEFT JOIN NOBET_AYRITI_KONUM AK'
      '    ON AK.TARIH = TRH.GUN AND AK.BIRIM=:XBIRIM'
      '  LEFT JOIN PER_PERSONEL P'
      '    ON P.TC_KIMLIK_NO = TO_CHAR(AK.TC)'
      '  LEFT JOIN NOBET_BIRIMLERI NB'
      '    ON NB.BIRIM = AK.BIRIM'
      ' '
      ' GROUP BY TRH.GUN, NB.ACIKLAMA,AK.KONUM1'
      ' ORDER BY TRH.GUN')
    Left = 168
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TAR'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'XBIRIM'
        Value = nil
      end>
  end
  object dsgrid: TDataSource
    DataSet = QGRID
    Left = 200
    Top = 112
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 56
    Top = 120
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13154717
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14933198
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13154717
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 9928789
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4276545
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13154717
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 9928789
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13154717
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = 9928789
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 9928789
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object GridTableViewStyleSheetSlate: TcxGridTableViewStyleSheet
      Caption = 'Slate'
      Styles.Content = cxStyle1
      Styles.ContentEven = cxStyle2
      Styles.ContentOdd = cxStyle3
      Styles.Footer = cxStyle4
      Styles.Group = cxStyle5
      Styles.GroupByBox = cxStyle6
      Styles.Header = cxStyle7
      Styles.Inactive = cxStyle8
      Styles.Indicator = cxStyle9
      Styles.Preview = cxStyle10
      Styles.Selection = cxStyle11
      BuiltIn = True
    end
  end
  object frxReport1: TfrxReport
    Version = '6.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Varsay'#305'lan'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43824.630225567100000000
    ReportOptions.LastChange = 43824.630225567100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 712
    Top = 176
    Datasets = <
      item
        DataSet = frxDBrapor
        DataSetName = 'frxDBrapor'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 41.574830000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object frxDBraporACIKLAMA: TfrxMemoView
          AllowVectorExport = True
          Top = 6.000000000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataSet = frxDBrapor
          DataSetName = 'frxDBrapor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBrapor."ACIKLAMA"] N'#246'bet Yeri Ayr'#305'nt'#305)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object DBCross1: TfrxDBCrossView
        AllowVectorExport = True
        ShiftMode = smWhenOverlapped
        Left = 15.118120000000000000
        Top = 79.370130000000000000
        Width = 155.000000000000000000
        Height = 106.000000000000000000
        DownThenAcross = True
        RepeatHeaders = False
        ShowColumnTotal = False
        ShowRowTotal = False
        CellFields.Strings = (
          'PERSONEL')
        ColumnFields.Strings = (
          'KONUM')
        DataSet = frxDBrapor
        DataSetName = 'frxDBrapor'
        RowFields.Strings = (
          'GUN')
        Memos = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574
          662D3822207374616E64616C6F6E653D226E6F223F3E3C63726F73733E3C6365
          6C6C6D656D6F733E3C546672784D656D6F5669657720416C6C6F77566563746F
          724578706F72743D225472756522204C6566743D2238312C3131383132222054
          6F703D223134332C3337303133222057696474683D2236392220486569676874
          3D22323222205265737472696374696F6E733D2232342220416C6C6F77457870
          72657373696F6E733D2246616C73652220466F6E742E436861727365743D2231
          2220466F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D39
          2220466F6E742E4E616D653D22417269616C2220466F6E742E5374796C653D22
          3022204672616D652E436F6C6F723D22313637373732313522204672616D652E
          5479703D223135222046696C6C2E4261636B436F6C6F723D2231353739303332
          302220476170583D22332220476170593D22332220506172656E74466F6E743D
          2246616C7365222056416C69676E3D22766143656E7465722220546578743D22
          30222F3E3C546672784D656D6F5669657720416C6C6F77566563746F72457870
          6F72743D225472756522204C6566743D2238312220546F703D22363622205769
          6474683D22363322204865696768743D22323222205265737472696374696F6E
          733D2232342220416C6C6F7745787072657373696F6E733D2246616C73652220
          466F6E742E436861727365743D22312220466F6E742E436F6C6F723D22302220
          466F6E742E4865696768743D222D31332220466F6E742E4E616D653D22417269
          616C2220466F6E742E5374796C653D223022204672616D652E436F6C6F723D22
          313637373732313522204672616D652E5479703D223135222046696C6C2E4261
          636B436F6C6F723D2231353739303332302220476170583D2233222047617059
          3D2233222048416C69676E3D22686152696768742220506172656E74466F6E74
          3D2246616C7365222056416C69676E3D22766143656E7465722220546578743D
          22222F3E3C546672784D656D6F5669657720416C6C6F77566563746F72457870
          6F72743D225472756522204C6566743D223133362220546F703D223434222057
          696474683D22383122204865696768743D22323222205265737472696374696F
          6E733D2232342220416C6C6F7745787072657373696F6E733D2246616C736522
          20466F6E742E436861727365743D22312220466F6E742E436F6C6F723D223022
          20466F6E742E4865696768743D222D31332220466F6E742E4E616D653D224172
          69616C2220466F6E742E5374796C653D223022204672616D652E436F6C6F723D
          22313637373732313522204672616D652E5479703D223135222046696C6C2E42
          61636B436F6C6F723D2231353739303332302220476170583D22332220476170
          593D2233222048416C69676E3D22686152696768742220506172656E74466F6E
          743D2246616C7365222056416C69676E3D22766143656E746572222054657874
          3D22222F3E3C546672784D656D6F5669657720416C6C6F77566563746F724578
          706F72743D225472756522204C6566743D223134342220546F703D2236362220
          57696474683D22383122204865696768743D2232322220526573747269637469
          6F6E733D2232342220416C6C6F7745787072657373696F6E733D2246616C7365
          2220466F6E742E436861727365743D22312220466F6E742E436F6C6F723D2230
          2220466F6E742E4865696768743D222D31332220466F6E742E4E616D653D2241
          7269616C2220466F6E742E5374796C653D223022204672616D652E436F6C6F72
          3D22313637373732313522204672616D652E5479703D223135222046696C6C2E
          4261636B436F6C6F723D2231353739303332302220476170583D223322204761
          70593D2233222048416C69676E3D22686152696768742220506172656E74466F
          6E743D2246616C7365222056416C69676E3D22766143656E7465722220546578
          743D22222F3E3C2F63656C6C6D656D6F733E3C63656C6C6865616465726D656D
          6F733E3C546672784D656D6F5669657720416C6C6F77566563746F724578706F
          72743D225472756522204C6566743D22302220546F703D223022205769647468
          3D223022204865696768743D223022205265737472696374696F6E733D223822
          20416C6C6F7745787072657373696F6E733D2246616C73652220466F6E742E43
          6861727365743D22312220466F6E742E436F6C6F723D22302220466F6E742E48
          65696768743D222D31332220466F6E742E4E616D653D22417269616C2220466F
          6E742E5374796C653D223022204672616D652E436F6C6F723D22313637373732
          313522204672616D652E5479703D223135222046696C6C2E4261636B436F6C6F
          723D2231343231313238382220476170583D22332220476170593D2233222050
          6172656E74466F6E743D2246616C7365222056416C69676E3D22766143656E74
          65722220546578743D22504552534F4E454C222F3E3C546672784D656D6F5669
          657720416C6C6F77566563746F724578706F72743D225472756522204C656674
          3D22302220546F703D2230222057696474683D223022204865696768743D2230
          22205265737472696374696F6E733D22382220416C6C6F774578707265737369
          6F6E733D2246616C73652220466F6E742E436861727365743D22312220466F6E
          742E436F6C6F723D22302220466F6E742E4865696768743D222D31332220466F
          6E742E4E616D653D22417269616C2220466F6E742E5374796C653D2230222046
          72616D652E436F6C6F723D22313637373732313522204672616D652E5479703D
          223135222046696C6C2E4261636B436F6C6F723D223134323131323838222047
          6170583D22332220476170593D22332220506172656E74466F6E743D2246616C
          7365222056416C69676E3D22766143656E7465722220546578743D2250455253
          4F4E454C222F3E3C2F63656C6C6865616465726D656D6F733E3C636F6C756D6E
          6D656D6F733E3C546672784D656D6F5669657720416C6C6F77566563746F7245
          78706F72743D225472756522204C6566743D2238312C31313831322220546F70
          3D223132312C3337303133222057696474683D22363922204865696768743D22
          323222205265737472696374696F6E733D2232342220416C6C6F774578707265
          7373696F6E733D2246616C73652220466F6E742E436861727365743D22312220
          466F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D313322
          20466F6E742E4E616D653D22417269616C2220466F6E742E5374796C653D2230
          22204672616D652E436F6C6F723D22313637373732313522204672616D652E54
          79703D223135222046696C6C2E4261636B436F6C6F723D223134323131323838
          2220476170583D22332220476170593D22332220506172656E74466F6E743D22
          46616C7365222056416C69676E3D22766143656E7465722220546578743D2222
          2F3E3C2F636F6C756D6E6D656D6F733E3C636F6C756D6E746F74616C6D656D6F
          733E3C546672784D656D6F5669657720416C6C6F77566563746F724578706F72
          743D225472756522204C6566743D223133362220546F703D2232322220576964
          74683D22383122204865696768743D22323222205265737472696374696F6E73
          3D2238222056697369626C653D2246616C73652220416C6C6F77457870726573
          73696F6E733D2246616C73652220466F6E742E436861727365743D2231222046
          6F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D31332220
          466F6E742E4E616D653D22417269616C2220466F6E742E5374796C653D223122
          204672616D652E436F6C6F723D22313637373732313522204672616D652E5479
          703D223135222046696C6C2E4261636B436F6C6F723D22313432313132383822
          20476170583D22332220476170593D2233222048416C69676E3D22686143656E
          7465722220506172656E74466F6E743D2246616C7365222056416C69676E3D22
          766143656E7465722220546578743D224772616E6420546F74616C222F3E3C2F
          636F6C756D6E746F74616C6D656D6F733E3C636F726E65726D656D6F733E3C54
          6672784D656D6F5669657720416C6C6F77566563746F724578706F72743D2254
          72756522204C6566743D2233352C31313831322220546F703D2239392C333730
          3133222057696474683D22343622204865696768743D22323222205265737472
          696374696F6E733D22382220416C6C6F7745787072657373696F6E733D224661
          6C73652220466F6E742E436861727365743D22312220466F6E742E436F6C6F72
          3D22302220466F6E742E4865696768743D222D31332220466F6E742E4E616D65
          3D22417269616C2220466F6E742E5374796C653D223022204672616D652E436F
          6C6F723D22313637373732313522204672616D652E5479703D22313522204669
          6C6C2E4261636B436F6C6F723D2231343231313238382220476170583D223322
          20476170593D2233222048416C69676E3D22686143656E746572222050617265
          6E74466F6E743D2246616C7365222056416C69676E3D22766143656E74657222
          20546578743D22222F3E3C546672784D656D6F5669657720416C6C6F77566563
          746F724578706F72743D225472756522204C6566743D2238312C313138313222
          20546F703D2239392C3337303133222057696474683D22363922204865696768
          743D22323222205265737472696374696F6E733D22382220416C6C6F77457870
          72657373696F6E733D2246616C73652220466F6E742E436861727365743D2231
          2220466F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D31
          332220466F6E742E4E616D653D22417269616C2220466F6E742E5374796C653D
          223022204672616D652E436F6C6F723D22313637373732313522204672616D65
          2E5479703D223135222046696C6C2E4261636B436F6C6F723D22313432313132
          38382220476170583D22332220476170593D2233222048416C69676E3D226861
          43656E7465722220506172656E74466F6E743D2246616C7365222056416C6967
          6E3D22766143656E7465722220546578743D224E6F6265742059657269222F3E
          3C546672784D656D6F5669657720416C6C6F77566563746F724578706F72743D
          225472756522204C6566743D22302220546F703D2230222057696474683D2230
          22204865696768743D223022205265737472696374696F6E733D223822205669
          7369626C653D2246616C73652220416C6C6F7745787072657373696F6E733D22
          46616C73652220466F6E742E436861727365743D22312220466F6E742E436F6C
          6F723D22302220466F6E742E4865696768743D222D31332220466F6E742E4E61
          6D653D22417269616C2220466F6E742E5374796C653D223022204672616D652E
          436F6C6F723D22313637373732313522204672616D652E5479703D2231352220
          46696C6C2E4261636B436F6C6F723D2231343231313238382220476170583D22
          332220476170593D2233222048416C69676E3D22686143656E74657222205061
          72656E74466F6E743D2246616C7365222056416C69676E3D22766143656E7465
          722220546578743D22222F3E3C546672784D656D6F5669657720416C6C6F7756
          6563746F724578706F72743D225472756522204C6566743D2233352C31313831
          322220546F703D223132312C3337303133222057696474683D22343622204865
          696768743D22323222205265737472696374696F6E733D22382220416C6C6F77
          45787072657373696F6E733D2246616C73652220466F6E742E43686172736574
          3D22312220466F6E742E436F6C6F723D22302220466F6E742E4865696768743D
          222D31332220466F6E742E4E616D653D22417269616C2220466F6E742E537479
          6C653D223022204672616D652E436F6C6F723D22313637373732313522204672
          616D652E5479703D223135222046696C6C2E4261636B436F6C6F723D22313432
          31313238382220476170583D22332220476170593D22332220506172656E7446
          6F6E743D2246616C7365222056416C69676E3D22766143656E74657222205465
          78743D225441524948222F3E3C2F636F726E65726D656D6F733E3C726F776D65
          6D6F733E3C546672784D656D6F5669657720416C6C6F77566563746F72457870
          6F72743D225472756522204C6566743D2233352C31313831322220546F703D22
          3134332C3337303133222057696474683D22343622204865696768743D223232
          22205265737472696374696F6E733D2232342220416C6C6F7745787072657373
          696F6E733D2246616C73652220466F6E742E436861727365743D22312220466F
          6E742E436F6C6F723D22302220466F6E742E4865696768743D222D3133222046
          6F6E742E4E616D653D22417269616C2220466F6E742E5374796C653D22302220
          4672616D652E436F6C6F723D22313637373732313522204672616D652E547970
          3D223135222046696C6C2E4261636B436F6C6F723D2231343231313238382220
          476170583D22332220476170593D2233222048416C69676E3D22686143656E74
          65722220506172656E74466F6E743D2246616C7365222056416C69676E3D2276
          6143656E7465722220546578743D22222F3E3C2F726F776D656D6F733E3C726F
          77746F74616C6D656D6F733E3C546672784D656D6F5669657720416C6C6F7756
          6563746F724578706F72743D225472756522204C6566743D22302220546F703D
          223636222057696474683D22383122204865696768743D223232222052657374
          72696374696F6E733D2238222056697369626C653D2246616C73652220416C6C
          6F7745787072657373696F6E733D2246616C73652220466F6E742E4368617273
          65743D22312220466F6E742E436F6C6F723D22302220466F6E742E4865696768
          743D222D31332220466F6E742E4E616D653D22417269616C2220466F6E742E53
          74796C653D223122204672616D652E436F6C6F723D2231363737373231352220
          4672616D652E5479703D223135222046696C6C2E4261636B436F6C6F723D2231
          343231313238382220476170583D22332220476170593D2233222048416C6967
          6E3D22686143656E7465722220506172656E74466F6E743D2246616C73652220
          56416C69676E3D22766143656E7465722220546578743D224772616E6420546F
          74616C222F3E3C2F726F77746F74616C6D656D6F733E3C63656C6C66756E6374
          696F6E733E3C6974656D20302F3E3C2F63656C6C66756E6374696F6E733E3C63
          6F6C756D6E736F72743E3C6974656D20302F3E3C2F636F6C756D6E736F72743E
          3C726F77736F72743E3C6974656D20302F3E3C2F726F77736F72743E3C2F6372
          6F73733E}
      end
    end
  end
  object frxDBrapor: TfrxDBDataset
    UserName = 'frxDBrapor'
    CloseDataSource = False
    DataSet = qrapor
    BCDToCurrency = False
    Left = 664
    Top = 176
  end
  object qrapor: TOraQuery
    SQL.Strings = (
      '/*SELECT TRH.GUN,'
      '       P.PERSONEL_ADI || '#39' '#39' || P.SOYADI PERSONEL,'
      '       AK.KONUM1 KONUM,'
      '       NB.ACIKLAMA'
      
        '  FROM (select to_char((to_date('#39'01.2020'#39', '#39'mm.yyyy'#39')) - 1 + lev' +
        'el, '#39'dd'#39') guns,'
      '               (to_date('#39'01.2020'#39', '#39'mm.yyyy'#39')) - 1 + level gun'
      '          from dual'
      
        '        connect by level <= (last_day(to_date('#39'01.2020'#39', '#39'mm.yyy' +
        'y'#39')) + 1) -'
      '                   (to_date('#39'01.2020'#39', '#39'mm.yyyy'#39'))) TRH'
      '  LEFT JOIN NOBET_AYRITI_KONUM AK'
      '    ON AK.TARIH = TRH.GUN AND AK.BIRIM=1014'
      '  LEFT JOIN PER_PERSONEL P'
      '    ON P.TC_KIMLIK_NO = TO_CHAR(AK.TC)'
      '  LEFT JOIN NOBET_BIRIMLERI NB'
      '    ON NB.BIRIM = AK.BIRIM'
      ' '
      ''
      ' ORDER BY TRH.GUN*/'
      ''
      'SELECT TRH.GUN,'
      '       P.PERSONEL_ADI || '#39' '#39' || P.SOYADI PERSONEL,'
      '       AK.KONUM1 KONUM,'
      '       NB.ACIKLAMA'
      
        '  FROM (select to_char((to_date(:TAR, '#39'mm.yyyy'#39')) - 1 + level, '#39 +
        'dd'#39') guns,'
      '               (to_date(:TAR, '#39'mm.yyyy'#39')) - 1 + level gun'
      '          from dual'
      
        '        connect by level <= (last_day(to_date(:TAR, '#39'mm.yyyy'#39')) ' +
        '+ 1) -'
      '                   (to_date(:TAR, '#39'mm.yyyy'#39'))) TRH'
      '  LEFT JOIN NOBET_AYRITI_KONUM AK'
      '    ON AK.TARIH = TRH.GUN AND AK.BIRIM=:XBIRIM'
      '  LEFT JOIN PER_PERSONEL P'
      '    ON P.TC_KIMLIK_NO = TO_CHAR(AK.TC)'
      '  LEFT JOIN NOBET_BIRIMLERI NB'
      '    ON NB.BIRIM = AK.BIRIM'
      ''
      ' ORDER BY TRH.GUN')
    Active = True
    Left = 176
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TAR'
        Value = Null
      end
      item
        DataType = ftUnknown
        Name = 'XBIRIM'
        Value = Null
      end>
  end
  object DataSource1: TDataSource
    DataSet = qrapor
    Left = 216
    Top = 144
  end
  object frxCrossObject1: TfrxCrossObject
    Left = 768
  end
end
