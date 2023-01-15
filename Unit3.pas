unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXPickers;

type
  TForm3 = class(TForm)
    key: TEdit;
    Organisation: TComboBox;
    DateStart: TDatePicker;
    DateEnd: TDatePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    add: TButton;
    Button1: TButton;
    procedure addClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  id:integer;

implementation
uses unit1;

{$R *.dfm}
function blocked(a:TCheckBox):Integer ;
begin
if a.Checked=True then blocked:= 1
  else blocked:=0;
end;
procedure TForm3.addClick(Sender: TObject);
var block,idOrg:integer;
begin
Form1.FDQuery1.SQL.Clear;

idOrg:=integer(Organisation.Items.Objects[Organisation.ItemIndex]);
if Form1.FDConnection1.Connected then
begin
Form1.FDQuery1.SQL.Clear();
  Form1.FDQuery1.SQL.Add('INSERT INTO `keys` (keyOrganization, DateStart, DateEnd, idOrganization, isBlocked) ');
  Form1.FDQuery1.SQL.Add('VALUES ('''+key.Text+''','''+
  FormatDateTime('dd.mm.yyyy',DateStart.Date)+''', '''+FormatDateTime('dd.mm.yyyy',DateEnd.Date)+''', '+IntToSTR(idOrg)+', '+ IntToStr(blocked(CheckBox1))+')');
  Form1.FDQuery1.ExecSQL(true);
  //Form1.FDQuery2.ApplyUpdates(-1);
  Form1.FDQuery2.Refresh();
   end;
close;
end;

procedure TForm3.Button1Click(Sender: TObject);
var a:integer;
begin
a:=integer(Organisation.Items.Objects[Organisation.ItemIndex]);
 Form1.FDQuery1.SQL.Clear();
   Form1.FDQuery1.SQL.Add('UPDATE `keys` SET `keyOrganization`='''+key.Text+''',`DateStart`='''+FormatDateTime('dd/mm/yyyy',DateStart.Date)+''',`DateEnd`='''+FormatDateTime('dd/mm/yyyy',DateEnd.Date)+''',`idOrganization`='''+IntToStr(a)+''',`isBlocked`='''+IntToStr(blocked(CheckBox1))+''' WHERE id = '+IntTostr(id));
   Form1.FDQuery1.ExecSQL(true);
 //  Form1.FDQuery2.ApplyUpdates(-1);
   Form1.FDQuery2.Refresh();
close;

end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
id:=-1;
end;

procedure TForm3.FormCreate(Sender: TObject);
var i:integer;
begin
if id = -1 then
begin
key.Text:='';
Organisation.Items.Clear;
CheckBox1.Checked:=false;
Organisation.Text:='';
end;
i:=0;
    Form1.FDQuery1.SQL.Clear();
    Form1.FdQuery1.SQL.Add('SELECT * FROM `organization`');
    Form1.FDQuery1.Open();
while not Form1.FDQuery1.eof do
begin
Organisation.Items.AddObject(Form1.FDQuery1.FieldValues['name'],Pointer(StrToInt(Form1.FDQuery1.FieldValues['id'])));
   Form1.FDQuery1.next;
    Inc(i);
end;
  Form1.FDQuery1.SQL.Clear;
  Form1.FDQuery1.Close;
end;

end.
