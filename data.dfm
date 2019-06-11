object dm: Tdm
  OldCreateOrder = False
  Height = 360
  Width = 400
  object LotodbConnection: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    LoginPrompt = False
    BeforeConnect = LotodbConnectionBeforeConnect
    Left = 158
    Top = 49
  end
  object SorteoTable: TFDQuery
    Connection = LotodbConnection
    SQL.Strings = (
      'SELECT * FROM sorteo')
    Left = 78
    Top = 123
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 232
    Top = 120
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 88
    Top = 200
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 240
    Top = 200
  end
end
