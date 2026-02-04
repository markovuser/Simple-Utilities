unit Unit_ExlPath;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, CommCtrl,
  Controls, Forms, Dialogs, pngimage, ExtCtrls,
  ComCtrls, StdCtrls, Menus, IniFiles;

type
  TListView = class(ComCtrls.TListView)
  protected
    procedure WMVScroll(var Message: TWMVScroll); message WM_VSCROLL;
  end;

type
  TForm2 = class(TForm)
    TabControl4: TTabControl;
    Button1: TButton;
    TabOption: TTabControl;
    PageControl1: TPageControl;
    PopupMenu3: TPopupMenu;
    MenuItem4: TMenuItem;
    N23: TMenuItem;
    MenuItem7: TMenuItem;
    N15: TMenuItem;
    ListView2: TListView;
    procedure Button1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure LoadNastr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit_Base;

procedure TListView.WMVScroll(var Message: TWMVScroll);
begin
  TWinControl(Self).DefaultHandler(Message);
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  Form2.Close;
end;

procedure AddExl(Path, Description: string; EChecked: boolean; List: TListView);
var
  ListItem: TListItem;
begin
  ListItem := List.Items.Add;
  with ListItem do
  begin
    Caption := Path;
    SubItems.Add(Description);
    Checked := EChecked;
    Application.ProcessMessages;
  end;
end;

procedure TForm2.LoadNastr;
var
  Ini: TMemIniFile;
  Count, l: Integer;
begin
  try
    Ini := TMemIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Data\' +
      Application.Title + '.ini');

    Count := Ini.ReadInteger('ExclusionReg', 'Count', 0);
    for l := 1 to Count do
      AddExl(Ini.readString('ExclusionReg', 'Reg' + IntToStr(l - 1), ''),
        Ini.readString('ExclusionReg', 'D' + IntToStr(l - 1), ''),
        Ini.ReadBool('ExclusionReg', 'CH' + IntToStr(l - 1), false), ListView2);
    Application.ProcessMessages;
    Ini.Free;
  except
  end;
end;

procedure TForm2.MenuItem4Click(Sender: TObject);
begin
  form1.SaveNastr;
end;

procedure TForm2.MenuItem7Click(Sender: TObject);
begin
  try
    while Form2.ListView2.Items.Count > 0 do
    begin
      if Form2.ListView2.Items[0].Checked = true then
      begin
        Form2.ListView2.Items[0].Delete;
      end;
    end;
  except
  end;
end;

procedure TForm2.N15Click(Sender: TObject);
begin
  if Form2.ListView2.ItemIndex = -1 then
    Exit;
  try
    if Form2.ListView2.Selected <> nil then
    begin
      Form2.ListView2.DeleteSelected;
    end;
  except
  end;
end;

procedure TForm2.N2Click(Sender: TObject);
begin
  form1.SaveNastr;
end;

end.
