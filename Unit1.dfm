object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1050#1083#1102#1095#1080
  ClientHeight = 586
  ClientWidth = 878
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 878
    Height = 586
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object MainMenu1: TMainMenu
    Left = 480
    Top = 88
    object N1: TMenuItem
      Caption = #1054#1089#1085#1086#1074#1085#1099#1077
      object N9: TMenuItem
        Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1086#1090#1095#1077#1090#1072
        OnClick = N9Click
      end
      object pdf1: TMenuItem
        Caption = #1069#1077#1089#1087#1086#1088#1090' '#1074' pdf'
        OnClick = pdf1Click
      end
      object N10: TMenuItem
        Caption = #1042#1099#1093#1086#1076
      end
    end
    object N2: TMenuItem
      Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      object N4: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        OnClick = N6Click
      end
      object N8: TMenuItem
        Caption = #1055#1086#1080#1089#1082
        OnClick = N8Click
      end
    end
    object N7: TMenuItem
      Caption = #1060#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100
      OnClick = N7Click
    end
    object N11: TMenuItem
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      OnClick = N11Click
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'LockingMode=Normal'
      'DriverID=SQLite')
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    LoginPrompt = False
    Left = 480
    Top = 232
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'Select * from keys')
    Left = 520
    Top = 336
  end
  object DataSource1: TDataSource
    DataSet = FDQuery2
    Left = 432
    Top = 312
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT k.id,k.keyOrganization,k.DateStart,k.DateEnd,o.name,k.isB' +
        'locked from keys k INNER JOIN organization o ON k.idOrganization' +
        ' = o.id')
    Left = 168
    Top = 296
    object FDQuery2id: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQuery2keyOrganization: TWideMemoField
      FieldName = 'keyOrganization'
      Origin = 'keyOrganization'
      Required = True
      BlobType = ftWideMemo
      DisplayValue = dvFull
    end
    object FDQuery2DateStart: TWideMemoField
      FieldName = 'DateStart'
      Origin = 'DateStart'
      Required = True
      BlobType = ftWideMemo
      DisplayValue = dvFull
    end
    object FDQuery2DateEnd: TWideMemoField
      FieldName = 'DateEnd'
      Origin = 'DateEnd'
      Required = True
      BlobType = ftWideMemo
      DisplayValue = dvFull
    end
    object FDQuery2name: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'name'
      Origin = 'name'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftWideMemo
      DisplayValue = dvFull
    end
    object FDQuery2isBlocked: TIntegerField
      FieldName = 'isBlocked'
      Origin = 'isBlocked'
    end
  end
end
