unit data;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.UI, System.IOUtils,
  FireDAC.Stan.StorageBin;

type
  Tdm = class(TDataModule)
    LotodbConnection: TFDConnection;
    SorteoTable: TFDQuery;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure LotodbConnectionBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure Tdm.LotodbConnectionBeforeConnect(Sender: TObject);
begin
  LotodbConnection.Params.Values['Database'] := 'E:\Embarcadero\LotoDelphi.1\database\database.sdb';
  {$IF DEFINED(ANDROID)}
  LotodbConnection.Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'database.sdb');
  {$ENDIF}

end;

end.
