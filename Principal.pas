unit Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.Edit, FMX.Objects,
  FMX.DateTimeCtrls, FMX.ListBox, FMX.TabControl, FMX.DialogService;

type
  TFLotoDelphi = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox21: TCheckBox;
    CheckBox22: TCheckBox;
    CheckBox23: TCheckBox;
    CheckBox24: TCheckBox;
    CheckBox25: TCheckBox;
    CheckBox26: TCheckBox;
    CheckBox27: TCheckBox;
    CheckBox28: TCheckBox;
    CheckBox29: TCheckBox;
    CheckBox30: TCheckBox;
    CheckBox31: TCheckBox;
    CheckBox32: TCheckBox;
    CheckBox33: TCheckBox;
    CheckBox34: TCheckBox;
    CheckBox35: TCheckBox;
    CheckBox36: TCheckBox;
    CheckBox37: TCheckBox;
    CheckBox38: TCheckBox;
    Circle1: TCircle;
    Edit01: TLabel;
    Circle2: TCircle;
    Edit02: TLabel;
    Circle3: TCircle;
    Edit03: TLabel;
    Circle4: TCircle;
    Edit04: TLabel;
    Circle5: TCircle;
    Edit05: TLabel;
    Circle6: TCircle;
    Edit06: TLabel;
    Circle7: TCircle;
    Edita1: TLabel;
    Circle8: TCircle;
    Edita2: TLabel;
    Circle9: TCircle;
    Edita3: TLabel;
    Circle10: TCircle;
    Edita4: TLabel;
    Circle11: TCircle;
    Edita5: TLabel;
    Circle12: TCircle;
    Edita6: TLabel;
    Circle13: TCircle;
    Editb1: TLabel;
    Circle14: TCircle;
    Editb2: TLabel;
    Circle15: TCircle;
    Editb3: TLabel;
    Circle16: TCircle;
    Editb4: TLabel;
    Circle17: TCircle;
    Editb5: TLabel;
    Circle18: TCircle;
    Editb6: TLabel;
    Circle19: TCircle;
    Editc1: TLabel;
    Circle20: TCircle;
    Editc2: TLabel;
    Circle21: TCircle;
    Editc3: TLabel;
    Circle22: TCircle;
    Editc4: TLabel;
    Circle23: TCircle;
    Editc5: TLabel;
    Circle24: TCircle;
    Editc6: TLabel;
    Circle25: TCircle;
    Edit07: TLabel;
    Circle26: TCircle;
    Edita7: TLabel;
    Circle27: TCircle;
    Editb7: TLabel;
    Circle28: TCircle;
    Editc7: TLabel;
    Button2: TButton;
    Text2: TText;
    ToolBar1: TToolBar;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    Text1: TText;
    Sorteo_no: TComboBox;
    GroupBox1: TGroupBox;
    Text4: TText;
    DateEdit1: TDateEdit;
    GroupBox2: TGroupBox;
    Rank1: TEdit;
    Rank2: TEdit;
    Rank4: TEdit;
    Rank3: TEdit;
    Rank6: TEdit;
    Rank5: TEdit;
    Memo1: TMemo;
    Text5: TText;
    Button3: TButton;
    Memo2: TMemo;
    GroupBox3: TGroupBox;
    Button4: TButton;
    Button5: TButton;
    ckBap: TCheckBox;
    StyleBook1: TStyleBook;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Sorteo_noChange(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ckBapClick(Sender: TObject);
  private
    { Private declarations }
    procedure inventarSorteo;
    procedure GuardarSorteo;
    procedure BuscarSorteo;
    procedure LimpiarSorteo;
  public
    { Public declarations }
  end;

var
  FLotoDelphi: TFLotoDelphi;
  Seleccion : TStringList;
  Sorteo    : string;

implementation

uses LogoGen, data;

{$R *.fmx}

{ TForm2 }

procedure TFLotoDelphi.BuscarSorteo;
var llenarv : Tstringlist;
begin
 llenarv := Tstringlist.Create;
 LimpiarSorteo;
 sorteo := sorteo_no.Items[sorteo_no.ItemIndex];
 with dm.SorteoTable do
   try
     Active := true;
     Filter := ' sorteo_no = '+sorteo;
     Filtered := true;

     DateEdit1.Datetime := fieldbyname('fecha').AsDateTime;

     llenarv.CommaText := fieldbyname('Ranking').Text;
     if llenarv.CommaText <> '' then
       begin
        Rank1.Text:= llenarv[0];
        Rank2.Text:= llenarv[1];
        Rank3.Text:= llenarv[2];
        Rank4.Text:= llenarv[3];
        Rank5.Text:= llenarv[4];
        Rank6.Text:= llenarv[5];
       end;

     llenarv.CommaText := fieldbyname('Sort1').Text;
     if llenarv.CommaText <> '' then
       begin
        Edit01.Text:= llenarv[0];
        Edit02.Text:= llenarv[1];
        Edit03.Text:= llenarv[2];
        Edit04.Text:= llenarv[3];
        Edit05.Text:= llenarv[4];
        Edit06.Text:= llenarv[5];
        Edit07.Text:= llenarv[6];
       end;

     llenarv.CommaText := fieldbyname('Sort2').Text;
     if llenarv.CommaText <> '' then
      begin
       Edita1.Text:= llenarv[0];
       Edita2.Text:= llenarv[1];
       Edita3.Text:= llenarv[2];
       Edita4.Text:= llenarv[3];
       Edita5.Text:= llenarv[4];
       Edita6.Text:= llenarv[5];
       Edita7.Text:= llenarv[6];
      end;

     llenarv.CommaText := fieldbyname('Sort3').Text;
     if llenarv.CommaText <> '' then
      begin
       Editb1.Text:= llenarv[0];
       Editb2.Text:= llenarv[1];
       Editb3.Text:= llenarv[2];
       Editb4.Text:= llenarv[3];
       Editb5.Text:= llenarv[4];
       Editb6.Text:= llenarv[5];
       Editb7.Text:= llenarv[6];
      end;

     llenarv.CommaText := fieldbyname('Sort4').Text;
     if llenarv.CommaText <> '' then
      begin
       Editc1.Text:= llenarv[0];
       Editc2.Text:= llenarv[1];
       Editc3.Text:= llenarv[2];
       Editc4.Text:= llenarv[3];
       Editc5.Text:= llenarv[4];
       Editc6.Text:= llenarv[5];
       Editc7.Text:= llenarv[6];
      end;
     memo1.lines.add(fieldbyname('excluidos').text);

   finally
    llenarv.free;
    dm.SorteoTable.Close;
   end;

end;

procedure TFLotoDelphi.Button1Click(Sender: TObject);
begin
  inventarSorteo;
end;

procedure TFLotoDelphi.Button3Click(Sender: TObject);
begin
   GuardarSorteo;
end;

procedure TFLotoDelphi.Button4Click(Sender: TObject);
begin
  BuscarSorteo;
end;

procedure TFLotoDelphi.Button5Click(Sender: TObject);
begin
  LimpiarSorteo;
end;

procedure TFLotoDelphi.CheckBox1Click(Sender: TObject);
var sel : string;
begin
   sel := Tcheckbox(sender).Text;
   seleccion.Delimiter:= ',';
   seleccion.StrictDelimiter:= TRUE;

 if Tcheckbox(sender).IsPressed then
   begin
    if seleccion.IndexOf( sel ) = -1 then
       seleccion.Add(sel)
      else
       seleccion.Delete(seleccion.IndexOf( sel ));
   end;
   seleccion.Sort;
     memo1.Lines.Clear;
    if ckBap.IsChecked then
      memo1.Lines.Add(memo2.Lines.Text)
     else
      memo1.Lines.Add(seleccion.DelimitedText);

end;

procedure TFLotoDelphi.ckBapClick(Sender: TObject);
begin
   memo1.Lines.Clear;
   memo1.Lines.Add(memo2.Lines.Text);
end;

procedure TFLotoDelphi.FormCreate(Sender: TObject);
begin
  Limpiarsorteo;
end;

procedure TFLotoDelphi.GuardarSorteo;
var i: Integer;
   editav, editbv, editcv, editv, rankv : Tstringlist;
   change : string;
begin
  rankv  := Tstringlist.Create;
  editav := Tstringlist.Create;
  editbv := Tstringlist.Create;
  editcv := Tstringlist.Create;
  editv  := Tstringlist.Create;
  sorteo := sorteo_no.Items[sorteo_no.ItemIndex];
  change := 'append';
 for i := 0 to ComponentCount -1 do
   begin
    if Components[i] is TEdit then
      if TEdit(Components[i]).Text <> '' then
       if copy(TEdit(Components[i]).Name,1,4) = 'Rank' then
          rankv.Add(TEdit(Components[i]).Text );
   if Components[i] is TLabel then
      if TLabel(Components[i]).Text <> '' then
        if copy(TLabel(Components[i]).Name,1,5) = 'Editb' then
           editbv.Add(TLabel(Components[i]).Text )
           else
        if copy(TLabel(Components[i]).Name,1,5) = 'Edita' then
           editav.Add(TLabel(Components[i]).Text )
          else
        if copy(TLabel(Components[i]).Name,1,5) = 'Editc' then
           editcv.Add(TLabel(Components[i]).Text )
          else
        if copy(TLabel(Components[i]).Name,1,5) = 'Edit0' then
           editv.Add(TLabel(Components[i]).Text );

   end;
 dm.SorteoTable.Active := true;
 dm.SorteoTable.Filter := ' sorteo_no = '+sorteo;
 dm.SorteoTable.Filtered := true;

 if dm.SorteoTable.RecordCount > 0 then
   TDialogService.MessageDialog('Quiere reemplazar el Sorteo '+sorteo+'?', TMsgDlgType.mtInformation,
   [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], TMsgDlgBtn.mbNo, 0,
   procedure(const AResult: TModalResult)
    begin
      case AResult of
       mrYes : change := 'edit';
       mrNo  :  change := 'nada';
      end;
    end );

if rankv.Text = '' then
   rankv.Text := Editv.Text;

 if change <> 'nada' then
 with dm.SorteoTable do
  try
   if change='edit' then
       Edit
     else
      begin
       Append;
       FieldByName('sorteo_no').Value := sorteo_no.Items[sorteo_no.ItemIndex];
      end;
   FieldByName('fecha').Value := dateedit1.Date;
   FieldByName('Ranking').Value   := Rankv.DelimitedText;
   FieldByName('Sort1').Value     := Editv.DelimitedText;
   FieldByName('Sort2').Value     := Editav.DelimitedText;
   FieldByName('Sort3').Value     := Editbv.DelimitedText;
   FieldByName('Sort4').Value     := Editcv.DelimitedText;
   FieldByName('Excluidos').Value := Memo1.Lines.Text;
  finally
   Post;
  end;

   rankv.Free;
   Editv.Free;
   Editav.Free;
   Editbv.Free;
   Editcv.Free;

end;

procedure TFLotoDelphi.inventarSorteo;
var S: TSorteo;
  excluirv : Tstringlist;
  i: Integer;
begin
  Randomize;
  excluirv := Tstringlist.Create;
  S := TSorteo.Create;
  excluirv.CommaText := memo1.Lines.Text;
  for i := 0 to excluirv.Count -1 do
    S.Excluir(excluirv[i]);

  S.Inventar;
  Edit01.Text:= S.Numeros[0];
  Edit02.Text:= S.Numeros[1];
  Edit03.Text:= S.Numeros[2];
  Edit04.Text:= S.Numeros[3];
  Edit05.Text:= S.Numeros[4];
  Edit06.Text:= S.Numeros[5];
  Edit07.Text:= (Random(9) + 1).ToString;

  S.Inventar;
  Edita1.Text:= S.Numeros[0];
  Edita2.Text:= S.Numeros[1];
  Edita3.Text:= S.Numeros[2];
  Edita4.Text:= S.Numeros[3];
  Edita5.Text:= S.Numeros[4];
  Edita6.Text:= S.Numeros[5];
  Edita7.Text:= (Random(9) + 1).ToString;

  S.Inventar;
  Editb1.Text:= S.Numeros[0];
  Editb2.Text:= S.Numeros[1];
  Editb3.Text:= S.Numeros[2];
  Editb4.Text:= S.Numeros[3];
  Editb5.Text:= S.Numeros[4];
  Editb6.Text:= S.Numeros[5];
  Editb7.Text:= (Random(9) + 1).ToString;

  S.Inventar;
  Editc1.Text:= S.Numeros[0];
  Editc2.Text:= S.Numeros[1];
  Editc3.Text:= S.Numeros[2];
  Editc4.Text:= S.Numeros[3];
  Editc5.Text:= S.Numeros[4];
  Editc6.Text:= S.Numeros[5];
  Editc7.Text:= (Random(9) + 1).ToString;

  S.Free;
end;

procedure TFLotoDelphi.LimpiarSorteo;
var i: integer;
begin
   for i := 0 to componentCount -1 do
   if Components[i] is TEdit then
     TEdit(Components[i]).Text := ''
    else
   if Components[i] is TLabel then
     TLabel(Components[i]).Text := '';

   Sorteo_no.Items.Add('950');
   Seleccion := TStringList.Create;
   memo1.Lines.Clear;
end;

procedure TFLotoDelphi.Sorteo_noChange(Sender: TObject);
begin
 sorteo := sorteo_no.Items[sorteo_no.ItemIndex];
 dm.SorteoTable.Active := true;
 dm.SorteoTable.Filter := ' sorteo_no = '+sorteo;
 dm.SorteoTable.Filtered := true;
end;

end.
