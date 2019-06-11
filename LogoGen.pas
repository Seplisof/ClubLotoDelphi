unit LogoGen;

interface

uses
  System.Classes, System.SysUtils;

type
  TSorteo = class
  public
    Fecha: TDate;
    Numeros: TStringList;
    Complementario: String;
    Excluidos: TStringList;

    constructor Create;
    destructor Destroy; override;
    procedure Inventar;
    procedure Excluir( sNumero: String );
  end;

implementation

//Como podemos ver en la clase los números inventados y los excluidos los voy a
//meter en un StringList. El constructor de la clase TSorteo va a crear ambos StringList:
constructor TSorteo.Create;
begin
  Numeros := TStringList.Create;
  Excluidos := TStringList.Create;
end;

//Y el destructor los liberará de memoria:

destructor TSorteo.Destroy;
begin
  Excluidos.Free;
  Numeros.Free;
end;

//Nuestra clase TSorteo también va a incluir un método para excluir del sorteo el número que queramos:

procedure TSorteo.Excluir( sNumero: String );
begin
  // Antes de excluirlo comprobamos si ya lo esta
  if Excluidos.IndexOf( sNumero ) = -1 then
    Excluidos.Add( sNumero );
end;

//Y aquí tenemos la función que se inventa el sorteo evitando los excluidos:

procedure TSorteo.Inventar;
var
  Bombo: TStringList;
  i, iPos1, iPos2: Integer;
  sNumero, sBola: String;

function CompletarCodigo(const sCodigo: string; const iDigitos: Integer): string;
begin
    Result := StringOfChar('0', iDigitos - Length(sCodigo)) + sCodigo;
end;

begin
  // Metemos las 38 bolas en el bombo
  Bombo := TStringList.Create;
  Numeros.Clear;

  for i := 1 to 38 do
  begin
    sNumero := CompletarCodigo( IntToStr( i ), 2 );

    if Excluidos.IndexOf( sNumero ) = -1 then
      Bombo.Add( sNumero );
  end;

  // Agitamos las bolas con el método de la burbuja
  if Bombo.Count > 0 then
    for i := 1 to 10000 + Random( 10000 ) do
    begin
      // Nos inventamos dos posiciones distintas en el bombo
      iPos1 := Random( Bombo.Count );
      iPos2 := Random( Bombo.Count );

      if ( iPos1 >= 0 ) and ( iPos1 <= 38 ) and ( iPos2 >= 0 ) and ( iPos2 <= 38 ) then
      begin
        // Intercambiamos las bolas en esas dos posiciones inventadas
        sBola := Bombo[iPos1];
        Bombo[iPos1] := Bombo[iPos2];
        Bombo[iPos2] := sBola;
      end;
    end;

  // Vamos sacando las 6 bolas al azar + complementario
  for i := 0 to 6 do
  begin
    if Bombo.Count > 0 then
      iPos1 := Random( Bombo.Count )
    else
      iPos1 := -1;

    if ( iPos1 >= 0 ) and ( iPos1 <= 38 ) then
      sBola := Bombo[iPos1]
    else
      sBola := '';

    // ¿Es el complementario?
    if i = 6 then
      // Lo sacamos aparte
      Complementario := sBola
    else
      // Lo metemos en la lista de números
      Numeros.Add( sBola );

    // Sacamos la bola extraida del bombo
    if ( iPos1 >= 0 ) and ( iPos1 <= 38 ) and ( Bombo.Count > 0 ) then
      Bombo.Delete( iPos1 );
  end;

  // Ordenamos los 6 números
  Numeros.Sort;

  Bombo.Free;
end;


end.
