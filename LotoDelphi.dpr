program LotoDelphi;

uses
  System.StartUpCopy,
  FMX.Forms,
  Principal in 'Principal.pas' {FLotoDelphi},
  LogoGen in 'LogoGen.pas',
  data in 'data.pas' {dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFLotoDelphi, FLotoDelphi);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
