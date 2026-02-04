Unit Unit_Base;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellApi, ComCtrls, Registry, Spin, Menus, ImgList,
  pngimage, Winsock, ActiveX, ComObj, WinInet, StrUtils, ExtCtrls, IniFiles,
  System.ImageList, Vcl.Buttons, WindowsDarkMode, Translation, Vcl.Mask, IdHTTP,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdSSLOpenSSL,
  ClipBrd, ShlObj, WinSvc, Vcl.WinXCtrls, System.UITypes, Math,FileInfoUtils;

Type
  RealIPThread = Class(TThread) // Поток установки медиа данных
  Private
  Protected
    Procedure Execute; Override;
  End;

Type
  RepairThread = Class(TThread) // Поток установки медиа данных
  Private
  Protected
    Procedure Execute; Override;
  End;

Type
  SMBThread = Class(TThread) // Поток установки медиа данных
  Private
  Protected
    Procedure Execute; Override;
  End;

Type
  SMBThreadDisable = Class(TThread) // Поток установки медиа данных
  Private
  Protected
    Procedure Execute; Override;
  End;

Const
  MAX_ADAPTER_NAME_LENGTH = 256;
  MAX_ADAPTER_DESCRIPTION_LENGTH = 128;
  MAX_ADAPTER_ADDRESS_LENGTH = 8;
  IPHelper = 'iphlpapi.dll';

  // Типы адаптеров
  MIB_IF_TYPE_OTHER = 1;
  MIB_IF_TYPE_ETHERNET = 6;
  MIB_IF_TYPE_TOKENRING = 9;
  MIB_IF_TYPE_FDDI = 15;
  MIB_IF_TYPE_PPP = 23;
  MIB_IF_TYPE_LOOPBACK = 24;
  MIB_IF_TYPE_SLIP = 28;

Type
  IP_ADDRESS_STRING = Record
    S: Array[0..15] Of Char;
  End;

  IP_MASK_STRING = IP_ADDRESS_STRING;

  PIP_MASK_STRING = ^IP_MASK_STRING;

  PIP_ADDR_STRING = ^IP_ADDR_STRING;

  IP_ADDR_STRING = Record
    Next: PIP_ADDR_STRING;
    IpAddress: IP_ADDRESS_STRING;
    IpMask: IP_MASK_STRING;
    Context: DWORD;
  End;

  time_t = Longint;

  PIP_ADAPTER_INFO = ^IP_ADAPTER_INFO;

  IP_ADAPTER_INFO = Record
    Next: PIP_ADAPTER_INFO;
    ComboIndex: DWORD;
    AdapterName: Array[0..MAX_ADAPTER_NAME_LENGTH + 3] Of ansiChar;
    Description: Array[0..MAX_ADAPTER_DESCRIPTION_LENGTH + 3] Of ansiChar;
    AddressLength: UINT;
    Address: Array[0..MAX_ADAPTER_ADDRESS_LENGTH - 1] Of BYTE;
    Index: DWORD;
    Type_: UINT;
    DhcpEnabled: UINT;
    CurrentIpAddress: PIP_ADDR_STRING;
    IpAddressList: IP_ADDR_STRING;
    GatewayList: IP_ADDR_STRING;
    DhcpServer: IP_ADDR_STRING;
    HaveWins: BOOL;
    PrimaryWinsServer: IP_ADDR_STRING;
    SecondaryWinsServer: IP_ADDR_STRING;
    LeaseObtained: time_t;
    LeaseExpires: time_t;
  End;

Type
  TWmMoving = Record
    Msg: Cardinal;
    fwSide: Cardinal;
    lpRect: PRect;
    Result: Integer;
  End;

Type
  PMIB_IPFORWARDROW = ^MIB_IPFORWARDROW;

  MIB_IPFORWARDROW = Record
    dwForwardDest: DWORD;
    dwForwardMask: DWORD;
    dwForwardPolicy: DWORD;
    dwForwardNextHop: DWORD;
    dwForwardIfIndex: DWORD;
    dwForwardType: DWORD;
    dwForwardProto: DWORD;
    dwForwardAge: DWORD;
    dwForwardNextHopAS: DWORD;
    dwForwardMetric1: DWORD;
    dwForwardMetric2: DWORD;
    dwForwardMetric3: DWORD;
    dwForwardMetric4: DWORD;
    dwForwardMetric5: DWORD;
  End;

  PMIB_IPFORWARDTABLE = ^MIB_IPFORWARDTABLE;

  MIB_IPFORWARDTABLE = Record
    dwNumEntries: DWORD;
    table: Array[0..255] Of MIB_IPFORWARDROW;
  End;

Type
  TForm1 = Class(TForm)
    PageControl: TPageControl;
    TabUsefulCommands: TTabSheet;
    TabComButtons: TTabControl;
    ButtonMACAddress: TButton;
    TabControlNetwork1: TTabControl;
    TabNetworkProfiles: TTabSheet;
    TabNetworkProfilesButtons: TTabControl;
    TabNetworkProfilesView: TTabControl;
    UpdateNet: TButton;
    RenameNet: TButton;
    DeleteNet: TButton;
    ListViewNetworkProfiles: TListView;
    PopupMenuProfile: TPopupMenu;
    RenameProfilesMenu: TMenuItem;
    DelProfilesMenu: TMenuItem;
    EditProfilesMenu: TMenuItem;
    PublicMenu: TMenuItem;
    PrivateMenu: TMenuItem;
    USERName: TEdit;
    ComputerName: TEdit;
    PopupMenuGeneral: TPopupMenu;
    SpeedButton_GeneralMenu: TSpeedButton;
    TabControlPanelNetwork: TTabControl;
    ButtonNetworkProfiles: TButton;
    ButtonUsefulCommands: TButton;
    ImageList3: TImageList;
    PopupMenuLanguage: TPopupMenu;
    LangError: TMenuItem;
    LangName: TMenuItem;
    LangPass: TMenuItem;
    LangPrivate: TMenuItem;
    LangPublic: TMenuItem;
    LangAttention: TMenuItem;
    LangDelete: TMenuItem;
    LanfErrorName: TMenuItem;
    LangRename: TMenuItem;
    LangNetworkName: TMenuItem;
    TabProxy: TTabSheet;
    ButtonProxy: TButton;
    TabLOGCom: TTabControl;
    MemoLogCom: TMemo;
    DeleteNetAll: TButton;
    LangDeleteAllProfile: TMenuItem;
    StatusBarProfile: TStatusBar;
    LangElements: TMenuItem;
    N1: TMenuItem;
    DelSelectedProfilesMenu: TMenuItem;
    ProfilesCheclAllMenu: TMenuItem;
    ProfilesUnCheclAllMenu: TMenuItem;
    N4: TMenuItem;
    GroupBoxDNS: TGroupBox;
    LBAlternativeDNS: TLabel;
    LBPreferredDNS: TLabel;
    ButtonChangeDNS: TButton;
    CheckBoxEnableDNS: TCheckBox;
    EditAlternativeDNS: TEdit;
    EditPreferredDNS: TEdit;
    GroupBoxDNScheck: TGroupBox;
    LabelDNS1: TLabel;
    LabelDNS2: TLabel;
    ComboBoxDNS: TComboBox;
    ButtonPing: TButton;
    EditPreferredDNS1: TEdit;
    EditAlternativeDNS1: TEdit;
    ButtonCopyDNS: TButton;
    GroupBoxIP: TGroupBox;
    LBIPAddress: TLabel;
    LBSubnetMask: TLabel;
    LBMainGateway: TLabel;
    EditIPAddress: TEdit;
    EditSubnetMask: TEdit;
    EditMainGateway: TEdit;
    ButtonChangeIP: TButton;
    CheckBoxEnableDHCP: TCheckBox;
    GroupBoxNetwork: TGroupBox;
    ComboBoxEditInterfaces: TComboBox;
    EditInterfaces: TEdit;
    ButtonUpdate: TButton;
    EditTypeInterfaces: TEdit;
    TabControlNetwork: TTabControl;
    GroupBoxProxy: TGroupBox;
    LBScriptAddress: TLabel;
    LBMACAddress: TLabel;
    ButtonChangeProxy: TButton;
    CheckBoxScript: TCheckBox;
    EditMACAddress: TEdit;
    GroupBoxProxy1: TGroupBox;
    CheckBoxProxyServer: TCheckBox;
    EditProxyPort: TEdit;
    EditScriptAddress: TEdit;
    EditProxyAdress: TEdit;
    LBProxyPort: TLabel;
    LBProxyAdress: TLabel;
    ButtonChangeProxyAddress: TButton;
    LabelGetIP: TLabel;
    LangStop: TMenuItem;
    LangTestDNS: TMenuItem;
    IdHTTP1: TIdHTTP;
    TabTestDNS: TTabSheet;
    TabControl1: TTabControl;
    StatusBar1: TStatusBar;
    TabControlDNSList: TTabControl;
    ListViewDNS: TListView;
    StatusBar2: TStatusBar;
    ButtonTestDNS: TButton;
    PopupMenuTestDNS: TPopupMenu;
    MenuRefreshDNS: TMenuItem;
    N3: TMenuItem;
    MenuCopyDNS1: TMenuItem;
    MenuCopyDNS2: TMenuItem;
    MenuItem1: TMenuItem;
    MenuCopyDNS1DNS2: TMenuItem;
    ButtonDNS: TButton;
    EditNetIP: TEdit;
    LangOnlyWindows: TMenuItem;
    LangSMBON: TMenuItem;
    LangSMBOFF: TMenuItem;
    LangSuccessfully: TMenuItem;
    LangInsecureGuestLogins: TMenuItem;
    LangClientSecuritySignature: TMenuItem;
    LangServerSecuritySignature: TMenuItem;
    LangCheckDataSMB: TMenuItem;
    ButtonApplay: TButton;
    RadioGroup1: TRadioGroup;
    ActivityIndicator1: TActivityIndicator;
    LangRepairStart: TMenuItem;
    LangRepairEnd: TMenuItem;
    LangRestart: TMenuItem;
    GroupBoxSafely: TGroupBox;
    CheckBoxNetworkVisibility: TCheckBox;
    CheckBoxClearARPcache: TCheckBox;
    CheckBoxResetTCPIP: TCheckBox;
    CheckBoxFlushDNS: TCheckBox;
    GroupBoxPro: TGroupBox;
    CheckBoxResetProxy: TCheckBox;
    CheckBoxRepairWorkgroup: TCheckBox;
    CheckBoxResetFirewall: TCheckBox;
    CheckBoxRenewIP: TCheckBox;
    CheckBoxRestoreNetworkAdapters: TCheckBox;
    CheckBoxRebuildWMI: TCheckBox;
    RadioGroup2: TRadioGroup;
    MenuDeleteDNS: TMenuItem;
    N2: TMenuItem;
    MemoDNS: TMemo;
    MenuListDefault: TMenuItem;
    N5: TMenuItem;
    ButtonSMBAccess: TButton;
    ButtonSMBDenied: TButton;
    Procedure FormCreate(Sender: TObject);
    Procedure SaveNastr;
    Procedure LoadNastr;
    Procedure LoadNet;
    Procedure DeleteKey;
    Procedure PrivateProfiles;
    Procedure PublicProfiles;
    Procedure RenameProfile;
    Procedure CheckAllProfiles(Checked: boolean);
    Procedure Timer2Timer(Sender: TObject);
    Procedure ButtonMACAddressClick(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure UpdateNetClick(Sender: TObject);
    Procedure DeleteNetClick(Sender: TObject);
    Procedure TabNetworkProfilesShow(Sender: TObject);
    Procedure PublicMenuClick(Sender: TObject);
    Procedure PrivateMenuClick(Sender: TObject);
    Procedure RenameNetClick(Sender: TObject);
    Procedure RenameProfilesMenuClick(Sender: TObject);
    Procedure DelProfilesMenuClick(Sender: TObject);
    Procedure SpeedButton_GeneralMenuClick(Sender: TObject);
    Procedure PingDNS1Gen(Const Address: String; Retries, BufferSize: Word);
    Procedure PingDNS2Gen(Const Address: String; Retries, BufferSize: Word);
    Procedure PingThroughProxyMethod(Const Address: String; Retries: Integer);
    Procedure PingThroughProxyMethod2(Const Address: String; Retries: Integer);
    Procedure globload;
    Procedure CleanTranslationsLikeGlobload;
    Procedure SetProxy;
    Procedure LoadNetworkCards;
    Procedure TypeNet;
    Procedure LoadFiltersReload;
    Procedure GetTCPIPDNSAddresses;
    Function GetIP: String;
    Function GetMyRealIP: String;
    Procedure DeleteFromIniFile(DeletedIndex: Integer);
    Function GetSystemProxy(Out ProxyServer: String; Out ProxyPort: Integer; Out Enabled: boolean): boolean;
    Function detectIEProxyServerEnabled(): Integer;
    Procedure LoadDNS(Const AFilename: String);
    Procedure LoadDNSTest(Const AFilename: String);
    Function detectIEProxyServer(): String;
    Function detectIEProxyServerProxyAdress(): String;
    Function detectIEProxyServerProxyPort(): String;
    Procedure SetTCPIPDNSAddresses;
    Procedure UpdateNETOption;
    Function ExecuteCommand(Const Command: String): boolean;
    Procedure ButtonNetworkProfilesClick(Sender: TObject);
    Procedure ButtonUsefulCommandsClick(Sender: TObject);
    Procedure ButtonChangeProxyClick(Sender: TObject);
    Procedure ButtonProxyClick(Sender: TObject);
    Procedure ButtonChangeIPClick(Sender: TObject);
    Procedure ComboBoxEditInterfacesChange(Sender: TObject);
    Procedure ButtonChangeDNSClick(Sender: TObject);
    Procedure CheckBoxEnableDHCPClick(Sender: TObject);
    Procedure CheckBoxScriptClick(Sender: TObject);
    Procedure CheckBoxProxyServerClick(Sender: TObject);
    Procedure ComboBoxDNSChange(Sender: TObject);
    Procedure ButtonPingClick(Sender: TObject);
    Procedure EditIPAddressKeyPress(Sender: TObject; Var Key: Char);
    Procedure EditSubnetMaskKeyPress(Sender: TObject; Var Key: Char);
    Procedure EditMainGatewayKeyPress(Sender: TObject; Var Key: Char);
    Procedure DeleteNetAllClick(Sender: TObject);
    Procedure DelSelectedProfilesMenuClick(Sender: TObject);
    Procedure ProfilesCheclAllMenuClick(Sender: TObject);
    Procedure ProfilesUnCheclAllMenuClick(Sender: TObject);
    Procedure ButtonCopyDNSClick(Sender: TObject);
    Procedure CheckBoxEnableDNSClick(Sender: TObject);
    Procedure ButtonUpdateClick(Sender: TObject);
    Procedure ButtonChangeProxyAddressClick(Sender: TObject);
    Procedure ButtonTestDNSClick(Sender: TObject);
    Procedure LabelGetIPClick(Sender: TObject);
    Procedure MenuRefreshDNSClick(Sender: TObject);
    Procedure MenuCopyDNS1Click(Sender: TObject);
    Procedure MenuCopyDNS2Click(Sender: TObject);
    Procedure MenuCopyDNS1DNS2Click(Sender: TObject);
    Procedure ButtonDNSClick(Sender: TObject);
    Procedure EditNetIPClick(Sender: TObject);
    Function IsWindows10Or11: boolean;
    Function PortablePath: String;
    Function PortablePathDNS: String;
    Procedure ButtonApplayClick(Sender: TObject);
    Function RunCommand(Const Command, Params: String; Wait: boolean): boolean;
    Procedure FlushDNS;
    Procedure Log(Const Msg: String);
    Procedure ResetTCPIP;
    Procedure RenewIP;
    Procedure ResetFirewall;
    Procedure ResetProxy;
    Procedure RepairWorkgroup;
    Procedure RepairNetworkVisibility;
    Procedure RebuildWMI;
    Procedure RestoreNetworkAdapters;
    Procedure ClearARPcache;
    Procedure EditPreferredDNS1Click(Sender: TObject);
    Procedure EditAlternativeDNS1Click(Sender: TObject);
    Procedure EditPreferredDNSClick(Sender: TObject);
    Procedure EditAlternativeDNSClick(Sender: TObject);
    Procedure EditIPAddressClick(Sender: TObject);
    Procedure EditSubnetMaskClick(Sender: TObject);
    Procedure EditMainGatewayClick(Sender: TObject);
    Procedure MenuListDefaultClick(Sender: TObject);
    Procedure MenuDeleteDNSClick(Sender: TObject);
    Procedure ButtonSMBAccessClick(Sender: TObject);
    Procedure ButtonSMBDeniedClick(Sender: TObject);

  Private
    { Private declarations }
    Procedure WMMouseMove(Var Message: TWMMouseMove); Message WM_MOUSEMOVE;
    Procedure WMSettingChange(Var Message: TWMSettingChange); Message WM_SETTINGCHANGE;
    Procedure ExecuteAllCommands(Enable: boolean);
    Function ExecutePowerShellCommand(Const Command: String): boolean;

  Public
    { Public declarations }
  End;

Var
  Form1: TForm1;
  c1, c2: ttime;
  res: Double;
  ping1, ping2: String;
  stop: boolean;
  Portable: boolean;
  Thread: RealIPThread;
  ThreadRepair: RepairThread;
  ThreadSMB: SMBThread;
  ThreadSMBDisable: SMBThreadDisable;
  { S } Function GetAdaptersInfo(pAdapterInfo: PIP_ADAPTER_INFO; Var pOutBufLen: ULONG): DWORD; Stdcall; External IPHelper;

Implementation

{$R *.dfm}

Function TForm1.IsWindows10Or11: Boolean;
Begin
  Result := (TOSVersion.Major = 10) And (TOSVersion.Build >= 10240);
End;

Function TForm1.ExecuteCommand(Const Command: String): boolean;
Var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
Begin
  FillChar(StartupInfo, SizeOf(TStartupInfo), 0);
  StartupInfo.cb := SizeOf(TStartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := SW_HIDE;

  Result := CreateProcess(Nil, PChar('cmd.exe /C ' + Command), Nil, Nil, False, CREATE_NEW_CONSOLE Or NORMAL_PRIORITY_CLASS, Nil, Nil, StartupInfo, ProcessInfo);

  If Result Then
  Begin
    WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);
  End;
End;

Function VarArrayToStr(Const vArray: variant): String;

  Function _VarToStr(Const V: variant): String;
  Var
    Vt: Integer;
  Begin
    Vt := VarType(V);
    Case Vt Of
      varSmallint, varInteger:
        Result := IntToStr(Integer(V));
      varSingle, varDouble, varCurrency:
        Result := FloatToStr(Double(V));
      varDate:
        Result := VarToStr(V);
      varOleStr:
        Result := WideString(V);
      varBoolean:
        Result := VarToStr(V);
      varVariant:
        Result := VarToStr(variant(V));
      varByte:
        Result := Char(BYTE(V));
      varString:
        Result := String(V);
      varArray:
        Result := VarArrayToStr(variant(V));
    End;
  End;

Var
  i: Integer;
Begin
  Result := '';
  If (VarType(vArray) And varArray) = 0 Then
    Result := _VarToStr(vArray)
  Else
    For i := VarArrayLowBound(vArray, 1) To VarArrayHighBound(vArray, 1) Do
      If i = VarArrayLowBound(vArray, 1) Then
        Result := Result + _VarToStr(vArray[i])
      Else
        Result := Result; // +'|'+_VarToStr(vArray[i]);

  Result := Result;
End;

Procedure GetWin32_NetworkAdapterConfigurationInfo;
Const
  WbemUser = '';
  WbemPassword = '';
  WbemComputer = 'localhost';
  wbemFlagForwardOnly = $00000020;
Var
  FSWbemLocator: OLEVariant;
  FWMIService: OLEVariant;
  FWbemObjectSet: OLEVariant;
  FWbemObject: OLEVariant;
  oEnum: IEnumvariant;
  iValue: LongWord;
  // pAdapterInfo: PIP_ADAPTER_INFO;
  // AdapterInfo: IP_ADAPTER_INFO;
  // BufLen: DWORD;
Begin
  ;
  Form1.EditIPAddress.Text := '';
  Form1.EditSubnetMask.Text := '';
  Form1.EditMACAddress.Text := '';
  Form1.EditMainGateway.Text := '';
  FSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
  application.ProcessMessages;
  FWMIService := FSWbemLocator.ConnectServer(WbemComputer, '\root\cimv2', WbemUser, WbemPassword);
  application.ProcessMessages;
  FWbemObjectSet := FWMIService.ExecQuery('SELECT * FROM Win32_NetworkAdapterConfiguration Where IpEnabled=True', 'WQL', wbemFlagForwardOnly);
  application.ProcessMessages;
  oEnum := IUnknown(FWbemObjectSet._NewEnum) As IEnumvariant;
  application.ProcessMessages;
  While oEnum.Next(1, FWbemObject, iValue) = 0 Do
  Begin
    If VarIsNull(FWbemObject.IpAddress) Then
    Begin
      Form1.EditIPAddress.Text := '0.0.0.0';
    End;
    If Not VarIsNull(FWbemObject.IpAddress) Then
    Begin
      Form1.EditIPAddress.Text := (Format('%s', [VarArrayToStr(FWbemObject.IpAddress)]));
    End;
    application.ProcessMessages;
    If Not VarIsNull(FWbemObject.IPSubnet) Then
    Begin
      Form1.EditSubnetMask.Text := (Format('%s', [VarArrayToStr(FWbemObject.IPSubnet)]));
      application.ProcessMessages;
    End;
    If Not VarIsNull(FWbemObject.DhcpServer) Then
    Begin
      Form1.EditMainGateway.Text := (Format('%s', [String(FWbemObject.DhcpServer)]));
      application.ProcessMessages;
    End;
    If Not VarIsNull(FWbemObject.MACAddress) Then
    Begin
      Form1.EditMACAddress.Text := (Format('%s', [VarArrayToStr(FWbemObject.MACAddress)]));

      // Form1.EditMACAddress.Text := GetAdapterInfo(AnsiChar(AnsiString(Form1.ComboBox1.Text)));
      application.ProcessMessages;
    End;

    If VarIsNull(FWbemObject.MACAddress) Then
    Begin
      Form1.EditMACAddress.Text := '00:00:00:00:00:00';
      application.ProcessMessages;
    End;
    Form1.TypeNet;
    application.ProcessMessages;
    FWbemObject := Unassigned;
    application.ProcessMessages;
  End;
End;

Function SetPrivilege(privilegeName: String; Enable: boolean): boolean;
Var
  tpPrev, tp: TTokenPrivileges;
  token: THandle;
  dwRetLen: DWORD;
Begin
  Result := False;
  Try
    OpenProcessToken(GetCurrentProcess, TOKEN_ADJUST_PRIVILEGES Or TOKEN_QUERY, token);
      // пполучаем маркер безопасности процесс- токен
    tp.PrivilegeCount := 1;
    If LookupPrivilegeValue(Nil, PChar(privilegeName), tp.Privileges[0].LUID) Then
      // получаем идентификатор привилегии - LUID
    Begin
      If Enable Then
        tp.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED
        // устанавливаем атрибуты привилегии
      Else
        tp.Privileges[0].Attributes := 0;
      dwRetLen := 0;
      Result := AdjustTokenPrivileges(token, False, tp, SizeOf(tpPrev), tpPrev, dwRetLen);
        // включаем или отключаем привилегию
    End;
  Finally
    Try
      CloseHandle(token);
    Except
    End;
  End;
End;

Function GetUserFromWindows: String;
Var
  USERName: String;
  UserNameLen: DWORD;
Begin
  UserNameLen := 255;
  SetLength(USERName, UserNameLen);
  If GetUserName(PChar(USERName), UserNameLen) Then
    Result := Copy(USERName, 1, UserNameLen - 1)
  Else
    Result := 'Unknown';
End;

Function GetCompName: String;
Var
  Buffer: Array[0..Pred(MAX_COMPUTERNAME_LENGTH + 1)] Of Char;
  Size: Cardinal;
Begin
  Size := SizeOf(Buffer);
  Windows.GetComputerName(Buffer, Size);
  Result := Buffer;
End;

Function GetLocalComputerName(NameType: TComputerNameFormat = ComputerNameDnsHostname): WideString;
Var
  Len: DWORD;
Begin
  Len := 0;
  GetComputerNameEx(NameType, Nil, Len); // get length
  SetLength(Result, Len - 1);
  If Not GetComputerNameEx(NameType, PWideChar(Result), Len) Then
    RaiseLastOSError;
  // fix null at end
  Len := Length(Result);
  If (Len > 2) And (Result[Len] = #0) Then
    Result := Copy(Result, 1, Len - 1);
End;

Procedure TForm1.WMSettingChange(Var Message: TWMSettingChange);
Var
  Ini: TMemIniFile;
  ThemeAuto: boolean;
Begin
  Ini := TMemIniFile.Create(Form1.PortablePath);

  ThemeAuto := Ini.ReadBool('Option', 'ThemeAuto', False);
  If ThemeAuto = true Then
  Begin
    If DarkModeIsEnabled = true Then
    Begin
      SetSpecificThemeMode(true, 'Windows11 Modern Dark', 'Windows11 Modern Light');
      application.ProcessMessages;
    End;

    If DarkModeIsEnabled = False Then
    Begin
      SetSpecificThemeMode(true, 'Windows11 Modern Light', 'Windows11 Modern Dark');
      application.ProcessMessages;
    End;
  End;
  Ini.Free;
End;

Function GetMACAddressOfNetwordDrives(Var LstInfo: TMemo; Var LstMAC: TMemo): boolean;
Var
  TmpPointer, InterfaceInfo: PIP_ADAPTER_INFO;
  Len: ULONG;
  i: Integer;
  g: Integer;
  st: String;
Begin
  Result := False; // Устанавливаем значение по умолчанию
  g := 0;

  Try
    If GetAdaptersInfo(Nil, Len) = ERROR_BUFFER_OVERFLOW Then
    Begin
      GetMem(InterfaceInfo, Len);
      Try
        If GetAdaptersInfo(InterfaceInfo, Len) = ERROR_SUCCESS Then
        Begin
          TmpPointer := InterfaceInfo;
          Repeat
            st := '';
            For i := 0 To TmpPointer^.AddressLength - 1 Do
            Begin
              st := st + IntToHex(TmpPointer^.Address[i], 2);
              If Cardinal(i) < TmpPointer^.AddressLength - 1 Then
                st := st + '-';
            End;
            g := g + 1;
            LstMAC.Lines.Add(IntToStr(g));
            LstInfo.Lines.Add(String(TmpPointer^.Description));
            LstMAC.Lines.Add(st);
            LstInfo.Lines.Add(String(TmpPointer^.AdapterName));
            TmpPointer := TmpPointer.Next;
          Until TmpPointer = Nil;

          Result := true; // Успешное выполнение
        End;
      Finally
        FreeMem(InterfaceInfo); // Гарантированное освобождение памяти
      End;
    End;
  Except
    On E: Exception Do
    Begin
      // Можно добавить логирование ошибки здесь
      Result := False; // Явно устанавливаем False при ошибке
    End;
  End;
End;

Procedure TForm1.WMMouseMove(Var Message: TWMMouseMove);
Begin
  SpeedButton_GeneralMenu.AllowAllUp := true;
  SpeedButton_GeneralMenu.Down := False;
End;

Procedure TForm1.SpeedButton_GeneralMenuClick(Sender: TObject);
Var
  ButtonRight: TPoint;
Begin
  If (SpeedButton_GeneralMenu.AllowAllUp) Then
  Begin
    SpeedButton_GeneralMenu.AllowAllUp := False;
    SpeedButton_GeneralMenu.Down := true;
    Application.ProcessMessages;
    If Sender Is TControl Then
    Begin
      ButtonRight.X := SpeedButton_GeneralMenu.Left;
      ButtonRight.Y := SpeedButton_GeneralMenu.Top;
      ButtonRight := ClientToScreen(ButtonRight);
      PopupMenuGeneral.Popup(ButtonRight.X + SpeedButton_GeneralMenu.Width, ButtonRight.Y + SpeedButton_GeneralMenu.Height);
    End;
  End
  Else
  Begin
    SpeedButton_GeneralMenu.AllowAllUp := true;
    SpeedButton_GeneralMenu.Down := False;
    PopupMenuGeneral.CloseMenu;
    Application.ProcessMessages;
  End;
End;

Function GetAppDataRoamingPath: String;
Var
  Path: Array[0..MAX_PATH] Of Char;
Begin
  If SUCCEEDED(SHGetFolderPath(0, CSIDL_APPDATA, 0, 0, @Path[0])) Then
    Result := IncludeTrailingPathDelimiter(Path)
  Else
    Result := '';
End;

Function TForm1.PortablePath: String;
Begin
  If Portable Then
    Result := ExtractFilePath(ParamStr(0)) + 'Config\Option.ini'
  Else
    Result := IncludeTrailingPathDelimiter(GetAppDataRoamingPath) + IncludeTrailingPathDelimiter(getCompanyName(ParamStr(0))) + '\Simple Utilities\Config\Option.ini';
    //Result := ExtractFilePath(ParamStr(0)) + 'Config\Option.ini';
  // Создаем папку для конфига
  ForceDirectories(ExtractFilePath(Result));
End;

Function TForm1.PortablePathDNS: String;
Begin
  If Portable Then
    Result := ExtractFilePath(ParamStr(0)) + 'Config\dns.ini'
  Else
    Result := IncludeTrailingPathDelimiter(GetAppDataRoamingPath) + IncludeTrailingPathDelimiter(getCompanyName(ParamStr(0))) + '\Simple Utilities\Config\dns.ini';
    //Result := ExtractFilePath(ParamStr(0)) + 'Config\dns.ini';
  // Создаем папку для конфига
  ForceDirectories(ExtractFilePath(Result));
End;

Procedure TForm1.SaveNastr;
Var
  Ini: TMemIniFile;
Begin

  Ini := TMemIniFile.Create(Form1.PortablePath);

  Ini.WriteBool(application.Title, CheckBoxEnableDNS.Name, CheckBoxEnableDNS.Checked);

  Ini.WriteBool(application.Title, CheckBoxFlushDNS.Name, CheckBoxFlushDNS.Checked);
  Ini.WriteBool(application.Title, CheckBoxResetTCPIP.Name, CheckBoxResetTCPIP.Checked);
  Ini.WriteBool(application.Title, CheckBoxResetProxy.Name, CheckBoxResetProxy.Checked);
  Ini.WriteBool(application.Title, CheckBoxRebuildWMI.Name, CheckBoxRebuildWMI.Checked);
  Ini.WriteBool(application.Title, CheckBoxResetFirewall.Name, CheckBoxResetFirewall.Checked);
  Ini.WriteBool(application.Title, CheckBoxRepairWorkgroup.Name, CheckBoxRepairWorkgroup.Checked);
  Ini.WriteBool(application.Title, CheckBoxClearARPcache.Name, CheckBoxClearARPcache.Checked);
  Ini.WriteBool(application.Title, CheckBoxNetworkVisibility.Name, CheckBoxNetworkVisibility.Checked);
  Ini.WriteBool(application.Title, CheckBoxRestoreNetworkAdapters.Name, CheckBoxRestoreNetworkAdapters.Checked);
  Ini.WriteBool(application.Title, CheckBoxRenewIP.Name, CheckBoxRenewIP.Checked);

  If Form1.WindowState = wsMaximized Then
  Begin
    Ini.WriteString(application.Title, 'Window', 'wsMaximized');
  End;
  If Form1.WindowState <> wsMaximized Then
  Begin
    Ini.WriteString(application.Title, 'Window', 'wsNormal');
    Ini.WriteInteger(application.Title, 'Top', Form1.top);
    Ini.WriteInteger(application.Title, 'Left', Form1.left);
    Ini.WriteInteger(application.Title, 'Height', Form1.Height);
    Ini.WriteInteger(application.Title, 'Width', Form1.Width);
  End;
  Ini.UpdateFile;
  Ini.Free;

End;

Procedure TForm1.LoadNastr;
Var
  Ini: TMemIniFile;
  WindowCenter: boolean;
  ThemeAuto, ThemeLight, ThemeDark: boolean;
Begin
  Try
    Ini := TMemIniFile.Create(Form1.PortablePath);

    ThemeAuto := Ini.ReadBool('Option', 'ThemeAuto', False);
    If ThemeAuto = true Then
    Begin
      If DarkModeIsEnabled = true Then
      Begin
        SetSpecificThemeMode(true, 'Windows11 Modern Dark', 'Windows11 Modern Light');
        application.ProcessMessages;
      End;

      If DarkModeIsEnabled = False Then
      Begin
        SetSpecificThemeMode(true, 'Windows11 Modern Light', 'Windows11 Modern Dark');
        application.ProcessMessages;
      End;
    End;

    ThemeLight := Ini.ReadBool('Option', 'ThemeLight', False);
    If ThemeLight = true Then
    Begin
      SetSpecificThemeMode(true, 'Windows11 Modern Light', 'Windows11 Modern Dark');
      application.ProcessMessages;
    End;

    ThemeDark := Ini.ReadBool('Option', 'ThemeDark', False);
    If ThemeDark = true Then
    Begin
      SetSpecificThemeMode(true, 'Windows11 Modern Dark', 'Windows11 Modern Light');
      application.ProcessMessages;
    End;

    Form1.CheckBoxEnableDNS.Checked := Ini.ReadBool(application.Title, CheckBoxEnableDNS.Name, False);
    Form1.CheckBoxEnableDNSClick(self);
    Try
      CheckBoxFlushDNS.Checked := Ini.ReadBool(application.Title, CheckBoxFlushDNS.Name, False);
      CheckBoxResetTCPIP.Checked := Ini.ReadBool(application.Title, CheckBoxResetTCPIP.Name, False);
      CheckBoxResetProxy.Checked := Ini.ReadBool(application.Title, CheckBoxResetProxy.Name, False);
      CheckBoxRebuildWMI.Checked := Ini.ReadBool(application.Title, CheckBoxRebuildWMI.Name, False);
      CheckBoxResetFirewall.Checked := Ini.ReadBool(application.Title, CheckBoxResetFirewall.Name, False);
      CheckBoxRepairWorkgroup.Checked := Ini.ReadBool(application.Title, CheckBoxRepairWorkgroup.Name, False);
      CheckBoxClearARPcache.Checked := Ini.ReadBool(application.Title, CheckBoxClearARPcache.Name, False);
      CheckBoxNetworkVisibility.Checked := Ini.ReadBool(application.Title, CheckBoxNetworkVisibility.Name, False);
      CheckBoxRestoreNetworkAdapters.Checked := Ini.ReadBool(application.Title, CheckBoxRestoreNetworkAdapters.Name, False);
      CheckBoxRenewIP.Checked := Ini.ReadBool(application.Title, CheckBoxRenewIP.Name, False);
    Except
    End;

    WindowCenter := Ini.ReadBool('Position', 'WindowCenter', False);
    If WindowCenter = true Then
    Begin
      Form1.Position := poDesktopCenter;
    End;
    If WindowCenter = False Then
    Begin
      Form1.Position := poDesigned;
    End;
    If Ini.readString(application.Title, 'Window', '') = 'wsMaximized' Then
    Begin
      Form1.WindowState := wsMaximized;
    End;

    If Ini.readString(application.Title, 'Window', '') <> 'wsMaximized' Then
    Begin
      Form1.top := Ini.ReadInteger(application.Title, 'Top', Form1.top);
      Form1.left := Ini.ReadInteger(application.Title, 'Left', Form1.left);
    End;

    Ini.Free;
  Except
  End;
End;

Procedure TForm1.Timer2Timer(Sender: TObject);
Begin
  WindowState := wsnormal;
  show;
End;

Procedure TForm1.UpdateNetClick(Sender: TObject);
Begin
  LoadNet;
End;

Procedure TForm1.PublicMenuClick(Sender: TObject);
Begin
  If ListViewNetworkProfiles.ItemIndex = -1 Then
    Exit;
  PublicProfiles;
  LoadNet;
End;

Procedure TForm1.PrivateMenuClick(Sender: TObject);
Begin
  If ListViewNetworkProfiles.ItemIndex = -1 Then
    Exit;
  PrivateProfiles;
  LoadNet;
End;

Procedure TForm1.TabNetworkProfilesShow(Sender: TObject);
Begin
  LoadNet;
  USERName.Text := '';
  USERName.Text := GetUserFromWindows;
  ComputerName.Text := '';
  ComputerName.Text := GetLocalComputerName;
End;

Function GetMyIP: String;
Var
  xmlhttp: OLEVariant;
  S: Integer;
  temp: String;
Begin
  Result := emptystr;
  xmlhttp := CreateOleObject('Microsoft.XMLHTTP');
  Try
    xmlhttp.open('GET', 'http://www.findipinfo.com/', False);
    xmlhttp.SetRequestHeader('User-Agent', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3');
    xmlhttp.send(null);
  Except
    Exit;
  End;
  If (xmlhttp.status = 200) Then
    temp := trim(VarToStr(xmlhttp.responseText));
  xmlhttp := Unassigned;
  S := pos('Address Is:', temp);
  If S > 0 Then
    inc(S, 11)
  Else
    Exit;
  temp := Copy(temp, S, 30);
  S := pos('<', temp);
  If S = 0 Then
    Exit
  Else
    dec(S);
  Result := trim(Copy(temp, 1, S));
End;

Function TForm1.GetSystemProxy(Out ProxyServer: String; Out ProxyPort: Integer; Out Enabled: boolean): boolean;
Var
  Reg: TRegistry;
  ProxyStr: String;
  PosColon: Integer;
Begin
  Result := False;
  ProxyServer := '';
  ProxyPort := 0;
  Enabled := False;
  Reg := TRegistry.Create;
  Try
    Reg.RootKey := HKEY_CURRENT_USER;
    If Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Internet Settings', False) Then
    Begin
      Enabled := Reg.ReadInteger('ProxyEnable') = 1;
      If Enabled Then
      Begin
        ProxyStr := Reg.readString('ProxyServer');
        If ProxyStr <> '' Then
        Begin
          // Формат может быть "server:port" или "http=server:port;https=server:port;..."
          // Упрощенно: предположим, что первый server:port для HTTP
          PosColon := pos(':', ProxyStr);
          If PosColon > 0 Then
          Begin
            ProxyServer := Copy(ProxyStr, 1, PosColon - 1);
            ProxyPort := StrToIntDef(Copy(ProxyStr, PosColon + 1, Length(ProxyStr)), 8080);
            Result := true;
          End;
        End;
      End;
      Reg.CloseKey;
    End;
  Finally
    Reg.Free;
  End;
End;

Function TForm1.GetMyRealIP: String;
Var
  SSLIOHandler: TIdSSLIOHandlerSocketOpenSSL;
  ProxyServer: String;
  ProxyPort: Integer;
  ProxyEnabled: boolean;
Begin
  SSLIOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(Nil);
  SSLIOHandler.SSLOptions.Method := sslvTLSv1_2;
  SSLIOHandler.SSLOptions.SSLVersions := [sslvTLSv1_2];
  IdHTTP1.IOHandler := SSLIOHandler;
  If GetSystemProxy(ProxyServer, ProxyPort, ProxyEnabled) And ProxyEnabled Then
  Begin
    IdHTTP1.ProxyParams.ProxyServer := ProxyServer;
    IdHTTP1.ProxyParams.ProxyPort := ProxyPort;
  End;
  IdHTTP1.Request.UserAgent := 'Delphi WebDAV Client';
  IdHTTP1.HandleRedirects := true;
  IdHTTP1.Request.BasicAuthentication := true;
  application.ProcessMessages;
  Try
    Result := IdHTTP1.Get('https://ifconfig.me/ip');
    // Запрос к API для получения внешнего IP
    application.ProcessMessages;
  Except
    On E: Exception Do
      Result := GetIP;
  End;
  application.ProcessMessages;
End;

Procedure TForm1.UpdateNETOption;
Begin
  Try
    GetWin32_NetworkAdapterConfigurationInfo;
    EditScriptAddress.Text := detectIEProxyServer;
    ComboBoxEditInterfacesChange(self);
    GetTCPIPDNSAddresses;
    application.ProcessMessages;
    If EditScriptAddress.Text = '' Then
    Begin
      CheckBoxScript.Checked := False;
      CheckBoxScriptClick(self);
    End;
    If EditScriptAddress.Text <> '' Then
    Begin
      CheckBoxScript.Checked := true;
      CheckBoxScriptClick(self);
    End;

    EditProxyAdress.Text := detectIEProxyServerProxyAdress;
    EditProxyPort.Text := detectIEProxyServerProxyPort;

    If (detectIEProxyServerEnabled = 0) Then
    Begin
      CheckBoxProxyServer.Checked := False;
      CheckBoxProxyServerClick(self);
    End;

    If (detectIEProxyServerEnabled = 1) Then
    Begin
      CheckBoxProxyServer.Checked := true;
      CheckBoxProxyServerClick(self);
    End;
    application.ProcessMessages;
  Except
  End;
End;

Procedure TForm1.ButtonUpdateClick(Sender: TObject);
Begin
  UpdateNETOption;
End;

Procedure TForm1.ButtonCopyDNSClick(Sender: TObject);
Begin
  EditPreferredDNS.Text := EditPreferredDNS1.Text;
  EditAlternativeDNS.Text := EditAlternativeDNS1.Text;
End;

Procedure TForm1.ButtonDNSClick(Sender: TObject);
Begin
  Form1.PageControl.ActivePageIndex := 3;
  ButtonDNS.Font.Style := [fsBold];
  ButtonUsefulCommands.Font.Style := [];
  ButtonNetworkProfiles.Font.Style := [];
  ButtonProxy.Font.Style := [];
  application.ProcessMessages;
End;

Function GetStatusCodeStr(statusCode: Integer): String;
Begin
  Case statusCode Of
    0:
      Result := 'Success';
    11001:
      Result := 'Buffer Too Small';
    11002:
      Result := 'Destination Net Unreachable';
    11003:
      Result := 'Destination Host Unreachable';
    11004:
      Result := 'Destination Protocol Unreachable';
    11005:
      Result := 'Destination Port Unreachable';
    11006:
      Result := 'No Resources';
    11007:
      Result := 'Bad Option';
    11008:
      Result := 'Hardware Error';
    11009:
      Result := 'Packet Too Big';
    11010:
      Result := 'Request Timed Out';
    11011:
      Result := 'Bad Request';
    11012:
      Result := 'Bad Route';
    11013:
      Result := 'TimeToLive Expired Transit';
    11014:
      Result := 'TimeToLive Expired Reassembly';
    11015:
      Result := 'Parameter Problem';
    11016:
      Result := 'Source Quench';
    11017:
      Result := 'Option Too Big';
    11018:
      Result := 'Bad Destination';
    11032:
      Result := 'Negotiating IPSEC';
    11050:
      Result := 'General Failure'   Else
    Result := 'Unknow';
  End;
End;

Procedure PingDNS1(Const Address: String; Retries, BufferSize: Word);
Var
  FSWbemLocator: OLEVariant;
  FWMIService: OLEVariant;
  FWbemObjectSet: OLEVariant;
  FWbemObject: OLEVariant;
  oEnum: IEnumvariant;
  iValue: LongWord;
  i: Integer;
  PacketsReceived: Integer;
  Minimum: Integer;
  Maximum: Integer;
  Average: Integer;
Begin
  ;
  PacketsReceived := 0;
  Minimum := 0;
  Maximum := 0;
  Average := 0;
  FSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
  application.ProcessMessages;
  FWMIService := FSWbemLocator.ConnectServer('localhost', 'root\CIMV2', '', '');
  application.ProcessMessages;
  For i := 0 To Retries - 1 Do
  Begin
    FWbemObjectSet := FWMIService.ExecQuery(Format('SELECT * FROM Win32_PingStatus where Address=%s AND BufferSize=%d', [QuotedStr(Address), BufferSize]), 'WQL', 0);
    application.ProcessMessages;
    oEnum := IUnknown(FWbemObjectSet._NewEnum) As IEnumvariant;
    application.ProcessMessages;
    If oEnum.Next(1, FWbemObject, iValue) = 0 Then
    Begin
      If FWbemObject.statusCode = 0 Then
      Begin
        If (FWbemObject.ResponseTime = 0) Or (FWbemObject.ResponseTime < 0) Then
          Exit;
        If FWbemObject.ResponseTime > 0 Then
          Form1.LabelDNS1.Caption := Format('%s ms', [FWbemObject.ResponseTime])
        Else
          Form1.LabelDNS1.Caption := Format('%s ms', [FWbemObject.ResponseTime]);
        application.ProcessMessages;
        inc(PacketsReceived);
        application.ProcessMessages;
        If FWbemObject.ResponseTime > Maximum Then
          Maximum := FWbemObject.ResponseTime;
        application.ProcessMessages;
        If Minimum = 0 Then
          Minimum := Maximum;
        application.ProcessMessages;
        If FWbemObject.ResponseTime < Minimum Then
          Minimum := FWbemObject.ResponseTime;
        application.ProcessMessages;
        Average := Average + FWbemObject.ResponseTime;
        application.ProcessMessages;
      End
      Else If Not VarIsNull(FWbemObject.statusCode) Then
        Form1.LabelDNS1.Caption := Format('%s', [FWbemObject.ProtocolAddress, GetStatusCodeStr(FWbemObject.statusCode)])
      Else
        Form1.LabelDNS1.Caption := Format('%s', [Address, 'Error processing request']);
      application.ProcessMessages;
    End;
    FWbemObject := Unassigned;
    FWbemObjectSet := Unassigned;
    // Sleep(500);
  End;
  If PacketsReceived > 0 Then
  Begin

  End;
End;

Procedure PingDNS2(Const Address: String; Retries, BufferSize: Word);
Var
  FSWbemLocator: OLEVariant;
  FWMIService: OLEVariant;
  FWbemObjectSet: OLEVariant;
  FWbemObject: OLEVariant;
  oEnum: IEnumvariant;
  iValue: LongWord;
  i: Integer;
  PacketsReceived: Integer;
  Minimum: Integer;
  Maximum: Integer;
  Average: Integer;
Begin
  ;
  PacketsReceived := 0;
  Minimum := 0;
  Maximum := 0;
  Average := 0;
  FSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
  application.ProcessMessages;
  FWMIService := FSWbemLocator.ConnectServer('localhost', 'root\CIMV2', '', '');
  application.ProcessMessages;
  For i := 0 To Retries - 1 Do
  Begin
    FWbemObjectSet := FWMIService.ExecQuery(Format('SELECT * FROM Win32_PingStatus where Address=%s AND BufferSize=%d', [QuotedStr(Address), BufferSize]), 'WQL', 0);
    application.ProcessMessages;
    oEnum := IUnknown(FWbemObjectSet._NewEnum) As IEnumvariant;
    application.ProcessMessages;
    If oEnum.Next(1, FWbemObject, iValue) = 0 Then
    Begin
      If FWbemObject.statusCode = 0 Then
      Begin
        If (FWbemObject.ResponseTime = 0) Or (FWbemObject.ResponseTime < 0) Then
          Exit;
        If FWbemObject.ResponseTime > 0 Then
          Form1.LabelDNS2.Caption := Format('%s ms', [FWbemObject.ResponseTime])
        Else
          Form1.LabelDNS2.Caption := Format('%s ms', [FWbemObject.ResponseTime]);
        application.ProcessMessages;
        inc(PacketsReceived);
        application.ProcessMessages;
        If FWbemObject.ResponseTime > Maximum Then
          Maximum := FWbemObject.ResponseTime;
        application.ProcessMessages;
        If Minimum = 0 Then
          Minimum := Maximum;
        application.ProcessMessages;
        If FWbemObject.ResponseTime < Minimum Then
          Minimum := FWbemObject.ResponseTime;
        application.ProcessMessages;
        Average := Average + FWbemObject.ResponseTime;
        application.ProcessMessages;
      End
      Else If Not VarIsNull(FWbemObject.statusCode) Then
        Form1.LabelDNS2.Caption := Format('%s', [FWbemObject.ProtocolAddress, GetStatusCodeStr(FWbemObject.statusCode)])
      Else
        Form1.LabelDNS2.Caption := Format('%s', [Address, 'Error processing request']);
      application.ProcessMessages;
    End;
    FWbemObject := Unassigned;
    FWbemObjectSet := Unassigned;
    // Sleep(500);
  End;

  If PacketsReceived > 0 Then
  Begin

  End;
End;

Procedure TForm1.ButtonPingClick(Sender: TObject);
Begin
  TabProxy.Enabled := False;
  LabelDNS1.Caption := '';
  LabelDNS2.Caption := '';
  Try
    CoInitialize(Nil);
    Try
      PingDNS1(EditPreferredDNS1.Text, 4, 32);
      application.ProcessMessages;
      PingDNS2(EditAlternativeDNS1.Text, 4, 32);
      application.ProcessMessages;
    Finally
      CoUninitialize;
    End;
  Except
    On E: Exception Do
      Writeln(E.Classname, ':', E.Message);
  End;
  TabProxy.Enabled := true;
End;

Procedure TForm1.ButtonProxyClick(Sender: TObject);
Begin
  Form1.PageControl.ActivePageIndex := 2;
  ButtonUsefulCommands.Font.Style := [];
  ButtonNetworkProfiles.Font.Style := [];
  ButtonDNS.Font.Style := [];
  ButtonProxy.Font.Style := [fsBold];
  application.ProcessMessages;

End;

Procedure TForm1.ButtonSMBAccessClick(Sender: TObject);
Begin
  ThreadSMB := SMBThread.Create(False);
  ThreadSMB.FreeOnTerminate := true;
  ThreadSMB.Priority := tpNormal;
End;

Procedure TForm1.ButtonSMBDeniedClick(Sender: TObject);
Begin
  ThreadSMBDisable := SMBThreadDisable.Create(False);
  ThreadSMBDisable.FreeOnTerminate := true;
  ThreadSMBDisable.Priority := tpNormal;
End;

Procedure SMBThread.Execute;
Begin
  Form1.TabComButtons.Enabled := false;
  Form1.TabControlPanelNetwork.Enabled := false;
  ThreadSMB.FreeOnTerminate := true;
  Form1.ExecuteAllCommands(true);
  Form1.TabControlPanelNetwork.Enabled := true;
  Form1.TabComButtons.Enabled := true;
End;

Procedure SMBThreadDisable.Execute;
Begin
  Form1.TabComButtons.Enabled := false;
  Form1.TabControlPanelNetwork.Enabled := false;
  ThreadSMBDisable.FreeOnTerminate := true;
  Form1.ExecuteAllCommands(false);
  Form1.TabControlPanelNetwork.Enabled := true;
  Form1.TabComButtons.Enabled := true;
End;

Procedure TForm1.ButtonUsefulCommandsClick(Sender: TObject);
Begin
  Form1.PageControl.ActivePageIndex := 0;
  ButtonDNS.Font.Style := [];
  ButtonUsefulCommands.Font.Style := [fsBold];
  ButtonNetworkProfiles.Font.Style := [];
  ButtonProxy.Font.Style := [];
  application.ProcessMessages;
End;

Procedure TForm1.PingThroughProxyMethod(Const Address: String; Retries: Integer);
Var
  i: Integer;
  ResponseTime: Integer;
  StartTime: Cardinal;
  IdHTTP: TIdHTTP;
  IdSSLIOHandler: TIdSSLIOHandlerSocketOpenSSL;
  ProxyServer: String;
  ProxyPort: Integer;
  ProxyEnabled: Boolean;
  PacketsReceived: Integer;
  Minimum: Integer;
  Maximum: Integer;
Begin
  PacketsReceived := 0;
  Minimum := 0;
  Maximum := 0;

  // Получаем настройки прокси (уже есть, но для надежности)
  GetSystemProxy(ProxyServer, ProxyPort, ProxyEnabled);

  IdHTTP := TIdHTTP.Create(Nil);
  Try
    // Настройка SSL
    IdSSLIOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(IdHTTP);
    Try
      IdSSLIOHandler.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
      IdHTTP.IOHandler := IdSSLIOHandler;

      // Настройка прокси
      If ProxyEnabled And (ProxyServer <> '') Then
      Begin
        IdHTTP.ProxyParams.ProxyServer := ProxyServer;
        IdHTTP.ProxyParams.ProxyPort := ProxyPort;
      End;

      IdHTTP.Request.UserAgent := 'Mozilla/5.0';
      IdHTTP.HandleRedirects := True;
      IdHTTP.ReadTimeout := 5000;
      IdHTTP.ConnectTimeout := 5000;

      For i := 1 To Retries Do
      Begin
        If stop = true Then
          Exit;

        Try
          StartTime := GetTickCount;

          // Пробуем HTTPS, если не получится - HTTP
          Try
            IdHTTP.Get('https://' + Address);
          Except
            On E: Exception Do
            Begin
              // Если HTTPS не работает, пробуем HTTP
              IdHTTP.Get('http://' + Address);
            End;
          End;

          ResponseTime := GetTickCount - StartTime;

          // Обновляем статистику
          Inc(PacketsReceived);
          ping1 := Format('%d ms', [ResponseTime]);

          application.ProcessMessages;

          If ResponseTime > Maximum Then
            Maximum := ResponseTime;

          application.ProcessMessages;

          If Minimum = 0 Then
            Minimum := Maximum;

          application.ProcessMessages;

          If ResponseTime < Minimum Then
            Minimum := ResponseTime;

          application.ProcessMessages;

        Except
          On E: Exception Do
          Begin
            ping1 := Format(LangError.Caption + ' %s', [E.Message]);
            application.ProcessMessages;
          End;
        End;

        If i < Retries Then
          Sleep(1000);
      End;

    Finally
      IdSSLIOHandler.Free;
    End;
  Finally
    IdHTTP.Free;
  End;

  If PacketsReceived > 0 Then
  Begin

  End;
End;

Procedure TForm1.PingDNS1Gen(Const Address: String; Retries, BufferSize: Word);
Var
  FSWbemLocator: OLEVariant;
  FWMIService: OLEVariant;
  FWbemObjectSet: OLEVariant;
  FWbemObject: OLEVariant;
  oEnum: IEnumvariant;
  iValue: LongWord;
  i: Integer;
  PacketsReceived: Integer;
  Minimum: Integer;
  Maximum: Integer;
  Average: Integer;
  ProxyServer: String;
  ProxyPort: Integer;
  ProxyEnabled: Boolean;
Begin
  PacketsReceived := 0;
  Minimum := 0;
  Maximum := 0;
  Average := 0;

  // Проверяем наличие прокси
  GetSystemProxy(ProxyServer, ProxyPort, ProxyEnabled);

  // Если прокси включен, используем альтернативный метод
  If ProxyEnabled And (ProxyServer <> '') Then
  Begin
    PingThroughProxyMethod(Address, Retries);
    Exit;
  End;

  // Оригинальный код для работы без прокси
  FSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
  application.ProcessMessages;
  FWMIService := FSWbemLocator.ConnectServer('localhost', 'root\CIMV2', '', '');

  application.ProcessMessages;
  For i := 0 To Retries - 1 Do
  Begin
    If stop = true Then
      Exit;
    FWbemObjectSet := FWMIService.ExecQuery(Format('SELECT * FROM Win32_PingStatus where Address=%s AND BufferSize=%d', [QuotedStr(Address), BufferSize]), 'WQL', 0);
    application.ProcessMessages;
    oEnum := IUnknown(FWbemObjectSet._NewEnum) As IEnumvariant;
    application.ProcessMessages;
    If oEnum.Next(1, FWbemObject, iValue) = 0 Then
    Begin
      If FWbemObject.statusCode <> 0 Then
        Exit;

      If FWbemObject.statusCode = 0 Then
      Begin
        If (FWbemObject.ResponseTime = 0) Or (FWbemObject.ResponseTime < 0) Or (FWbemObject.ResponseTime > 500) Then
          Exit;

        If FWbemObject.ResponseTime > 0 Then
          ping1 := Format('%s ms', [FWbemObject.ResponseTime])
        Else
          ping1 := Format('%s ms', [FWbemObject.ResponseTime]);

        application.ProcessMessages;
        inc(PacketsReceived);
        application.ProcessMessages;
        If FWbemObject.ResponseTime > Maximum Then
          Maximum := FWbemObject.ResponseTime;
        application.ProcessMessages;
        If Minimum = 0 Then
          Minimum := Maximum;
        application.ProcessMessages;
        If FWbemObject.ResponseTime < Minimum Then
          Minimum := FWbemObject.ResponseTime;
        application.ProcessMessages;
        Average := Average + FWbemObject.ResponseTime;
        application.ProcessMessages;

      End
      Else If Not VarIsNull(FWbemObject.statusCode) Then
        ping1 := Format('%s', [FWbemObject.ProtocolAddress, GetStatusCodeStr(FWbemObject.statusCode)])
      Else
        ping1 := Format('%s', [Address, 'Error processing request']);
      application.ProcessMessages;
    End;
    FWbemObject := Unassigned;
    FWbemObjectSet := Unassigned;
    // Sleep(500);
  End;

  If PacketsReceived > 0 Then
  Begin

  End;
End;

Procedure TForm1.PingThroughProxyMethod2(Const Address: String; Retries: Integer);
Var
  i: Integer;
  ResponseTime: Integer;
  StartTime: Cardinal;
  IdHTTP: TIdHTTP;
  IdSSLIOHandler: TIdSSLIOHandlerSocketOpenSSL;
  ProxyServer: String;
  ProxyPort: Integer;
  ProxyEnabled: Boolean;
  PacketsReceived: Integer;
  Minimum: Integer;
  Maximum: Integer;
Begin
  PacketsReceived := 0;
  Minimum := 0;
  Maximum := 0;

  // Получаем настройки прокси
  GetSystemProxy(ProxyServer, ProxyPort, ProxyEnabled);

  IdHTTP := TIdHTTP.Create(Nil);
  Try
    // Настройка SSL
    IdSSLIOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(IdHTTP);
    Try
      IdSSLIOHandler.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
      IdHTTP.IOHandler := IdSSLIOHandler;

      // Настройка прокси
      If ProxyEnabled And (ProxyServer <> '') Then
      Begin
        IdHTTP.ProxyParams.ProxyServer := ProxyServer;
        IdHTTP.ProxyParams.ProxyPort := ProxyPort;
      End;

      IdHTTP.Request.UserAgent := 'Mozilla/5.0';
      IdHTTP.HandleRedirects := True;
      IdHTTP.ReadTimeout := 5000;
      IdHTTP.ConnectTimeout := 5000;

      For i := 1 To Retries Do
      Begin
        If stop = true Then
          Exit;

        Try
          StartTime := GetTickCount;

          // Пробуем HTTPS, если не получится - HTTP
          Try
            IdHTTP.Get('https://' + Address);
          Except
            On E: Exception Do
            Begin
              // Если HTTPS не работает, пробуем HTTP
              IdHTTP.Get('http://' + Address);
            End;
          End;

          ResponseTime := GetTickCount - StartTime;

          // Обновляем статистику для ping2
          Inc(PacketsReceived);
          ping2 := Format('%d ms', [ResponseTime]);

          application.ProcessMessages;

          If ResponseTime > Maximum Then
            Maximum := ResponseTime;

          application.ProcessMessages;

          If Minimum = 0 Then
            Minimum := Maximum;

          application.ProcessMessages;

          If ResponseTime < Minimum Then
            Minimum := ResponseTime;

          application.ProcessMessages;

        Except
          On E: Exception Do
          Begin
            ping2 := Format('Ошибка: %s', [E.Message]);
            application.ProcessMessages;
          End;
        End;

        If i < Retries Then
          Sleep(1000);
      End;

    Finally
      IdSSLIOHandler.Free;
    End;
  Finally
    IdHTTP.Free;
  End;

  If PacketsReceived > 0 Then
  Begin

  End;
End;

Procedure TForm1.PingDNS2Gen(Const Address: String; Retries, BufferSize: Word);
Var
  FSWbemLocator: OLEVariant;
  FWMIService: OLEVariant;
  FWbemObjectSet: OLEVariant;
  FWbemObject: OLEVariant;
  oEnum: IEnumvariant;
  iValue: LongWord;
  i: Integer;
  PacketsReceived: Integer;
  Minimum: Integer;
  Maximum: Integer;
  Average: Integer;
  ProxyServer: String;
  ProxyPort: Integer;
  ProxyEnabled: Boolean;
Begin
  PacketsReceived := 0;
  Minimum := 0;
  Maximum := 0;
  Average := 0;

  // Проверяем наличие прокси
  GetSystemProxy(ProxyServer, ProxyPort, ProxyEnabled);

  // Если прокси включен, используем альтернативный метод
  If ProxyEnabled And (ProxyServer <> '') Then
  Begin
    PingThroughProxyMethod2(Address, Retries);
    Exit;
  End;

  // Оригинальный код для работы без прокси
  FSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
  application.ProcessMessages;
  FWMIService := FSWbemLocator.ConnectServer('localhost', 'root\CIMV2', '', '');

  application.ProcessMessages;
  For i := 0 To Retries - 1 Do
  Begin
    If stop = true Then
      Exit;
    FWbemObjectSet := FWMIService.ExecQuery(Format('SELECT * FROM Win32_PingStatus where Address=%s AND BufferSize=%d', [QuotedStr(Address), BufferSize]), 'WQL', 0);
    application.ProcessMessages;
    oEnum := IUnknown(FWbemObjectSet._NewEnum) As IEnumvariant;
    application.ProcessMessages;
    If oEnum.Next(1, FWbemObject, iValue) = 0 Then
    Begin
      If FWbemObject.statusCode <> 0 Then
        Exit;

      If FWbemObject.statusCode = 0 Then
      Begin
        If (FWbemObject.ResponseTime = 0) Or (FWbemObject.ResponseTime < 0) Or (FWbemObject.ResponseTime > 500) Then
          Exit;

        If FWbemObject.ResponseTime > 0 Then
          ping2 := Format('%s ms', [FWbemObject.ResponseTime])
        Else
          ping2 := Format('%s ms', [FWbemObject.ResponseTime]);

        application.ProcessMessages;
        inc(PacketsReceived);
        application.ProcessMessages;

        If FWbemObject.ResponseTime > Maximum Then
          Maximum := FWbemObject.ResponseTime;
        application.ProcessMessages;

        If Minimum = 0 Then
          Minimum := Maximum;
        application.ProcessMessages;

        If FWbemObject.ResponseTime < Minimum Then
          Minimum := FWbemObject.ResponseTime;
        application.ProcessMessages;

        Average := Average + FWbemObject.ResponseTime;
        application.ProcessMessages;
      End
      Else If Not VarIsNull(FWbemObject.statusCode) Then
        ping2 := Format('%s', [FWbemObject.ProtocolAddress, GetStatusCodeStr(FWbemObject.statusCode)])
      Else
        ping2 := Format('%s', [Address, 'Error processing request']);
      application.ProcessMessages;
    End;
    FWbemObject := Unassigned;
    FWbemObjectSet := Unassigned;
  End;

  If PacketsReceived > 0 Then
  Begin

  End;
End;

Procedure TForm1.ButtonTestDNSClick(Sender: TObject);
Var
  Count: Integer;
Begin
  Case ButtonTestDNS.Tag Of
    0:
      Begin
        ButtonTestDNS.Tag := 1;
        ButtonTestDNS.Caption := Form1.LangStop.Caption;
        TabControlDNSList.Enabled := False;
        TabControlPanelNetwork.Enabled := False;
        stop := False;
        Try
          CoInitialize(Nil);
          Try
            For Count := 0 To ListViewDNS.Items.Count - 1 Do
            Begin
              ListViewDNS.Items[Count].SubItems[2] := '0';
              application.ProcessMessages;
              ListViewDNS.Items[Count].SubItems[3] := '0';
            End;

            For Count := 0 To ListViewDNS.Items.Count - 1 Do
            Begin
              If stop = true Then
                Exit;
              // showmessage(ListViewDNS.Items[Count].SubItems[0]);
              StatusBar1.Panels[0].Text := ListViewDNS.Items[Count].Caption;
              PingDNS1Gen(ListViewDNS.Items[Count].SubItems[0], 2, 32);
              application.ProcessMessages;
              ListViewDNS.Items[Count].SubItems[2] := ping1;
              application.ProcessMessages;
              PingDNS2Gen(ListViewDNS.Items[Count].SubItems[1], 2, 32);
              application.ProcessMessages;
              ListViewDNS.Items[Count].SubItems[3] := ping2;
              application.ProcessMessages;
              ListViewDNS.Items[Count].MakeVisible(true);
            End;
            application.ProcessMessages;
          Finally
            TabControlDNSList.Enabled := true;
            StatusBar1.Panels[0].Text := '';
            CoUninitialize;
          End;
        Except
          On E: Exception Do
            Writeln(E.Classname, ':', E.Message);
        End;
        stop := true;
        ButtonTestDNS.Tag := 0;
        ButtonTestDNS.Caption := Form1.LangTestDNS.Caption;
        TabControlPanelNetwork.Enabled := true;
      End;

    1:
      Begin
        stop := true;
        ButtonTestDNS.Tag := 0;
        ButtonTestDNS.Caption := Form1.LangTestDNS.Caption;
        TabControlPanelNetwork.Enabled := true;
      End;
  End;

End;

Procedure TForm1.ButtonMACAddressClick(Sender: TObject);
Begin
  TabComButtons.Enabled := False;
  Log(ButtonMACAddress.Caption);
  GetMACAddressOfNetwordDrives(MemoLogCom, MemoLogCom);
  MemoLogCom.Lines.Add('----------------------------------------');
  TabComButtons.Enabled := true;
End;

Function TForm1.GetIP: String;
Var
  WSAData: TWSAData;
  p: PHostEnt;
  Name: Array[0..255] Of AnsiChar;
Begin
  WSAStartup($0101, WSAData);
  gethostname(Name, 256);
  p := gethostbyname(Name);
  Result := String(inet_ntoa(PInAddr(p.H_ADDR_LIST^)^));
  WSACleanup;
End;

Function GetIpForwardTable(pIpForwardTable: PMIB_IPFORWARDTABLE; Var pdwSize: ULONG; bOrder: BOOL): DWORD; Stdcall; External 'IPHLPAPI.DLL';

Function TForm1.detectIEProxyServer(): String;
Begin
  With TRegistry.Create Do
  Try
    RootKey := HKEY_CURRENT_USER;
    If OpenKey('\Software\Microsoft\Windows\CurrentVersion\Internet Settings', False) Then
    Begin
      Try
        Result := readString('AutoConfigURL');
      Except
      End;
      CloseKey;
    End
    Else
      Result := '';
  Finally
    Free;
  End;
End;

Function CutOff(Const S: String): String;
Var
  k: Integer;
Begin
  k := pos(':', S);
  Result := Copy(S, 1, k - 1);
End;

Function TForm1.detectIEProxyServerEnabled(): Integer;
Var
  ProxyEnable: Integer;
Begin
  Result := 0; // Инициализация значения по умолчанию
  With TRegistry.Create Do
  Try
    RootKey := HKEY_CURRENT_USER;
    If OpenKey('\Software\Microsoft\Windows\CurrentVersion\Internet Settings', False) Then
    Begin
      If ValueExists('ProxyEnable') Then
      Begin
        ProxyEnable := ReadInteger('ProxyEnable');
        Result := ProxyEnable;
        CloseKey;
      End;
      // Если ValueExists = False, Result останется = 0
    End;
    // Если OpenKey = False, Result останется = 0
  Finally
    Free;
  End;
End;

Function TForm1.detectIEProxyServerProxyAdress(): String;
Begin
  With TRegistry.Create Do
  Try
    RootKey := HKEY_CURRENT_USER;
    If OpenKey('\Software\Microsoft\Windows\CurrentVersion\Internet Settings', False) Then
    Begin
      Result := CutOff(readString('ProxyServer'));
      CloseKey;
    End
    Else
      Result := '';
  Finally
    Free;
  End;
End;

Function TForm1.detectIEProxyServerProxyPort(): String;
Var
  S: String;
Begin
  With TRegistry.Create Do
  Try
    RootKey := HKEY_CURRENT_USER;
    If OpenKey('\Software\Microsoft\Windows\CurrentVersion\Internet Settings', False) Then
    Begin
      S := readString('ProxyServer');
      delete(S, 1, pos(':', S));
      Result := S;
      CloseKey;
    End
    Else
      Result := '';
  Finally
    Free;
  End;
End;

Procedure TForm1.SetProxy;
Var
  Reg: TRegistry;
Begin
  Reg := TRegistry.Create(KEY_WRITE);
  ;
  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Internet Settings', False);

  If (CheckBoxProxyServer.Checked = true) And (EditProxyAdress.Text <> '') And (EditProxyPort.Text <> '') Then
  Begin
    Reg.WriteString('ProxyServer', Form1.EditProxyAdress.Text + ':' + Form1.EditProxyPort.Text);
    Reg.WriteBool('ProxyEnable', CheckBoxScript.Checked);
  End;

  If CheckBoxProxyServer.Checked = False Then
  Begin
    Reg.WriteString('ProxyServer', Form1.EditProxyAdress.Text + ':' + Form1.EditProxyPort.Text);
    Reg.WriteBool('ProxyEnable', CheckBoxScript.Checked);
  End;

  If CheckBoxScript.Checked = False Then
  Begin
    Reg.WriteBool('ProxyEnable', CheckBoxScript.Checked);
    Reg.WriteString('AutoConfigURL', Form1.EditScriptAddress.Text);
  End;

  If CheckBoxScript.Checked = true Then
  Begin
    Reg.WriteBool('ProxyEnable', CheckBoxScript.Checked);
    Reg.WriteString('AutoConfigURL', Form1.EditScriptAddress.Text);
  End;

  Reg.CloseKey;
  Reg.Free;
  InternetSetOption(Nil, INTERNET_OPTION_SETTINGS_CHANGED, Nil, 0);
  application.ProcessMessages;
End;

Procedure TForm1.LoadNetworkCards;
Const
  sKey: String = '\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkCards';
Var
  i: Integer;
  Description, ServiceName: String;
  Reg: TRegistry;
  lName: TStringList;
Begin
  Try
    With Reg Do
    Begin
      Reg := TRegistry.Create(KEY_READ Or KEY_WOW64_64KEY Or KEY_WOW64_32KEY);
      Reg.Access := KEY_WOW64_64KEY Or KEY_ALL_ACCESS;
      lName := TStringList.Create;
      lName.Duplicates := dupIgnore;
      RootKey := HKEY_LOCAL_MACHINE;
      OpenKey(sKey, False);
      getkeynames(lName);
      CloseKey;
      Form1.ComboBoxEditInterfaces.Items.Clear;
      For i := 0 To lName.Count - 1 Do
      Begin
        If OpenKey(PChar(sKey + '\' + lName[i]), False) Then
        Begin
          Description := Reg.readString('Description');
          ServiceName := Reg.readString('ServiceName');
          Form1.ComboBoxEditInterfaces.Items.Add(Description);
          { Form1.ComboBoxEditInterfaces.ItemIndex := Form1.ComboBoxEditInterfaces.Items.IndexOf
            (Form1.Edit1.Text); }
          Form1.ComboBoxEditInterfaces.ItemIndex := 0;
          application.ProcessMessages;
        End;
      End;
    End;
    Reg.CloseKey;
    lName.Free;
    Reg.Free;
  Except
  End;
End;

Procedure TForm1.MenuCopyDNS1Click(Sender: TObject);
Begin
  Form1.EditPreferredDNS.Text := ListViewDNS.Selected.SubItems[0];
End;

Procedure TForm1.MenuCopyDNS1DNS2Click(Sender: TObject);
Begin
  Form1.EditPreferredDNS.Text := ListViewDNS.Selected.SubItems[0];
  Form1.EditAlternativeDNS.Text := ListViewDNS.Selected.SubItems[1];
End;

Procedure TForm1.MenuCopyDNS2Click(Sender: TObject);
Begin
  Form1.EditAlternativeDNS.Text := ListViewDNS.Selected.SubItems[1];
End;

Procedure TForm1.DeleteFromIniFile(DeletedIndex: Integer);
Var
  IniFile: TStringList;
  i, CurrentIndex: Integer;
Begin
  IniFile := TStringList.Create;
  Try
    // Загружаем файл
    IniFile.LoadFromFile(Form1.PortablePathDNS);

    // Пропускаем секцию [Ipv4_Default]
    CurrentIndex := 0;
    For i := 0 To IniFile.Count - 1 Do
    Begin
      // Пропускаем пустые строки и секции
      If (Trim(IniFile[i]) = '') Or (IniFile[i][1] = '[') Then
        Continue;

      // Если это строка с DNS и её индекс совпадает с удаляемым
      If CurrentIndex = DeletedIndex Then
      Begin
        IniFile.Delete(i); // Удаляем строку
        Break; // Выходим из цикла
      End;
      Inc(CurrentIndex);
    End;

    // Сохраняем изменения
    IniFile.SaveToFile(Form1.PortablePathDNS);

  Finally
    IniFile.Free;
  End;
End;

Procedure TForm1.MenuDeleteDNSClick(Sender: TObject);
Var
  Index: Integer;
Begin
  If ListViewDNS.Selected <> Nil Then
  Begin
    Index := ListViewDNS.Selected.Index;

    // Удаляем элемент
    ListViewDNS.Items.Delete(Index);
    DeleteFromIniFile(Index);

    // Если есть элементы, выделяем следующий
    If ListViewDNS.Items.Count > 0 Then
    Begin
      // Выделяем элемент на той же позиции или последний
      Index := Min(Index, ListViewDNS.Items.Count - 1);
      ListViewDNS.ItemIndex := Index;
      LoadDNS(Form1.PortablePathDNS);
      Application.ProcessMessages;
    End;
  End;
End;

Procedure TForm1.MenuListDefaultClick(Sender: TObject);
Begin
  Form1.MemoDNS.Lines.SaveToFile(Form1.PortablePathDNS, TEncoding.Unicode);
  LoadFiltersReload;
  LoadDNS(Form1.PortablePathDNS);
  Application.ProcessMessages;
End;

Procedure TForm1.MenuRefreshDNSClick(Sender: TObject);
Begin
  LoadFiltersReload;
End;

Procedure TForm1.GetTCPIPDNSAddresses;
Var
  Reg: TRegistry;
  NameServer: String;
  dns2: String;
  k: Integer;
Begin
  EditPreferredDNS.Text := '';
  EditAlternativeDNS.Text := '';
  Reg := TRegistry.Create(KEY_READ Or KEY_WOW64_64KEY Or KEY_WOW64_32KEY);
  Reg.Access := KEY_WOW64_64KEY Or KEY_ALL_ACCESS;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\' + Form1.EditInterfaces.Text, true);
  If Reg.ValueExists('NameServer') Then
    If Reg.GetDataType('NameServer') = rdstring Then
      NameServer := Reg.readString('NameServer');
  k := pos(',', NameServer);
  Form1.EditPreferredDNS.Text := Copy(NameServer, 1, k - 1);
  dns2 := NameServer;
  delete(dns2, 1, pos(',', dns2));
  Form1.EditAlternativeDNS.Text := dns2;
  If Reg.ValueExists('EnableDHCP') Then
    Form1.CheckBoxEnableDHCP.Checked := Not (Reg.ReadBool('EnableDHCP'));
  CheckBoxEnableDHCPClick(Nil);
  If NameServer = '' Then
  Begin
    CheckBoxEnableDNS.Checked := False;
    CheckBoxEnableDNSClick(Nil);
  End;
  If NameServer <> '' Then
  Begin
    CheckBoxEnableDNS.Checked := true;
    CheckBoxEnableDNSClick(Nil);
  End;
  Reg.CloseKey;
  Reg.Free;
End;

Procedure TForm1.ButtonChangeProxyAddressClick(Sender: TObject);
Begin
  SetProxy;
  application.ProcessMessages;
  EditScriptAddress.Text := detectIEProxyServer;
  EditProxyAdress.Text := detectIEProxyServerProxyAdress;
  EditProxyPort.Text := detectIEProxyServerProxyPort;
  application.ProcessMessages;
  ButtonProxyClick(Sender);
End;

Procedure TForm1.ButtonChangeProxyClick(Sender: TObject);
Begin
  SetProxy;
  application.ProcessMessages;
  EditScriptAddress.Text := detectIEProxyServer;
  EditProxyAdress.Text := detectIEProxyServerProxyAdress;
  EditProxyPort.Text := detectIEProxyServerProxyPort;
  application.ProcessMessages;
  ButtonProxyClick(Sender);
End;

Procedure SetStaticIpAddress(Const NetworkCard, IpAddress, Mask, GateWay: String);
Const
  WbemUser = '';
  WbemPassword = '';
  WbemComputer = 'localhost';
  wbemFlagForwardOnly = $00000020;
Var
  FSWbemLocator: OLEVariant;
  FWMIService: OLEVariant;
  FWbemObjectSet: OLEVariant;
  FWbemObject: OLEVariant;
  FOutParams: OLEVariant;
  vIpAddress: OLEVariant;
  vMask: OLEVariant;
  vGateWays: OLEVariant;
  oEnum: IEnumvariant;
  iValue: LongWord;
Begin
  FSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
  FWMIService := FSWbemLocator.ConnectServer(WbemComputer, 'root\CIMV2', WbemUser, WbemPassword);

  FWbemObjectSet := FWMIService.ExecQuery(Format('SELECT * FROM Win32_NetworkAdapterConfiguration Where Description="%s"', [NetworkCard]), 'WQL', wbemFlagForwardOnly);
  oEnum := IUnknown(FWbemObjectSet._NewEnum) As IEnumvariant;
  If oEnum.Next(1, FWbemObject, iValue) = 0 Then
  Begin
    vIpAddress := VarArrayCreate([0, 0], varVariant);
    vIpAddress[0] := IpAddress;
    vMask := VarArrayCreate([0, 0], varVariant);
    vMask[0] := Mask;
    FOutParams := FWbemObject.EnableStatic(vIpAddress, vMask);
    vGateWays := VarArrayCreate([0, 0], varVariant);
    vGateWays[0] := GateWay;
    FOutParams := FWbemObject.SetGateways(vGateWays);
    // 0 - Successful completion, no reboot required
    // 1 - Successful completion, reboot required
    showmessage(Format('ReturnValue  %s', [FOutParams]));
  End
  Else
    showmessage('Network card not found');
End;

Procedure TForm1.SetTCPIPDNSAddresses;
Var
  Reg: TRegistry;
Begin
  Reg := TRegistry.Create(KEY_WRITE Or KEY_WOW64_64KEY Or KEY_WOW64_32KEY);
  Reg.Access := KEY_WOW64_64KEY Or KEY_ALL_ACCESS;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\' + Form1.EditInterfaces.Text, true);
  If Form1.CheckBoxEnableDNS.Checked = False Then
  Begin
    Reg.DeleteValue('NameServer');
  End;

  If Form1.CheckBoxEnableDNS.Checked = true Then
  Begin
    If (Form1.EditPreferredDNS.Text = '') And (Form1.EditAlternativeDNS.Text = '') Then
    Begin
      Reg.DeleteValue('NameServer');
    End;
    If (Form1.EditPreferredDNS.Text <> '') Or (Form1.EditAlternativeDNS.Text <> '') Then
    Begin
      Reg.WriteString('NameServer', Form1.EditPreferredDNS.Text + ',' + Form1.EditAlternativeDNS.Text);
    End;
  End;

  Reg.CloseKey;
  Reg.Free;
End;

Procedure TForm1.ButtonChangeIPClick(Sender: TObject);
Begin
  SetStaticIpAddress(Form1.ComboBoxEditInterfaces.Text, EditIPAddress.Text, EditSubnetMask.Text, EditMainGateway.Text);
  application.ProcessMessages;
  GetWin32_NetworkAdapterConfigurationInfo;
  application.ProcessMessages;
  ButtonProxyClick(Sender);
End;

Procedure TForm1.ButtonNetworkProfilesClick(Sender: TObject);
Begin
  Form1.PageControl.ActivePageIndex := 1;
  ButtonUsefulCommands.Font.Style := [];
  ButtonNetworkProfiles.Font.Style := [fsBold];
  ButtonProxy.Font.Style := [];
  ButtonDNS.Font.Style := [];
  application.ProcessMessages;
  TabNetworkProfilesShow(Sender);
End;

Procedure TForm1.CheckBoxEnableDHCPClick(Sender: TObject);
Var
  Reg: TRegistry;
Begin
  If CheckBoxEnableDHCP.Checked = False Then
  Begin
    Reg := TRegistry.Create(KEY_READ Or KEY_WOW64_64KEY Or KEY_WOW64_32KEY);
    Reg.Access := KEY_WOW64_64KEY Or KEY_ALL_ACCESS;
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    Reg.OpenKey('SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\' + Form1.EditInterfaces.Text, true);
    If Reg.ValueExists('EnableDHCP') Then
      Reg.WriteBool('EnableDHCP', true);
    Reg.CloseKey;
    Reg.Free;
    ButtonChangeIP.Enabled := False;
    EditIPAddress.Enabled := False;
    EditSubnetMask.Enabled := False;
    EditMainGateway.Enabled := False;
  End;

  If CheckBoxEnableDHCP.Checked = true Then
  Begin
    Reg := TRegistry.Create(KEY_READ Or KEY_WOW64_64KEY Or KEY_WOW64_32KEY);
    Reg.Access := KEY_WOW64_64KEY Or KEY_ALL_ACCESS;
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    Reg.OpenKey('SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\' + Form1.EditInterfaces.Text, true);
    If Reg.ValueExists('EnableDHCP') Then
      Reg.WriteBool('EnableDHCP', False);
    Reg.CloseKey;
    Reg.Free;
    ButtonChangeIP.Enabled := true;
    EditIPAddress.Enabled := true;
    EditSubnetMask.Enabled := true;
    EditMainGateway.Enabled := true;
  End;
End;

Procedure TForm1.CheckBoxEnableDNSClick(Sender: TObject);
Begin
  If Form1.CheckBoxEnableDNS.Checked Then
  Begin
    Form1.EditPreferredDNS.Enabled := true;
    Form1.EditAlternativeDNS.Enabled := true;
  End;

  If Form1.CheckBoxEnableDNS.Checked = False Then
  Begin
    Form1.EditPreferredDNS.Enabled := False;
    Form1.EditAlternativeDNS.Enabled := False;
  End;

End;

Procedure TForm1.CheckBoxProxyServerClick(Sender: TObject);
Begin
  If Form1.CheckBoxProxyServer.Checked = true Then
  Begin
    EditProxyAdress.Enabled := true;
    EditProxyPort.Enabled := true;
    LBProxyAdress.Enabled := true;
    LBProxyPort.Enabled := true;
  End;
  If Form1.CheckBoxProxyServer.Checked = False Then
  Begin
    EditProxyAdress.Enabled := False;
    EditProxyPort.Enabled := False;
    LBProxyAdress.Enabled := False;
    LBProxyPort.Enabled := False;
  End;
End;

Procedure TForm1.CheckBoxScriptClick(Sender: TObject);
Begin
  If Form1.CheckBoxScript.Checked = true Then
  Begin
    EditScriptAddress.Enabled := true;
    LBScriptAddress.Enabled := true;
  End;
  If Form1.CheckBoxScript.Checked = False Then
  Begin
    EditScriptAddress.Enabled := False;
    LBScriptAddress.Enabled := False;
  End;
End;

Function TForm1.ExecutePowerShellCommand(Const Command: String): boolean;
Begin
  Result := true;
  Try
    // Выполняем команду PowerShell
    ShellExecute(0, 'open', 'powershell.exe', PChar('-Command "' + Command + '"'), Nil, SW_HIDE);

    // Пауза для выполнения команды
    Sleep(1500);

  Except
    On E: Exception Do
    Begin
      MemoLogCom.Lines.Add(LangError.Caption + ' ' + E.Message);
      Result := False;
    End;
  End;
End;

Procedure TForm1.ExecuteAllCommands(Enable: boolean);
Var
  Commands: TStringList;
  i: Integer;
  Success: boolean;
  StatusText: String;
Begin
  Form1.ActivityIndicator1.Visible := true;
  Form1.ActivityIndicator1.Animate := true;
  If Enable Then
    StatusText := LangSMBON.Caption
  Else
    StatusText := LangSMBOFF.Caption;

  Log(StatusText);
  application.ProcessMessages;

  Try
    // Создаем список команд для выполнения
    Commands := TStringList.Create;
    Try
      If Enable Then
      Begin
        // Команды для ВКЛЮЧЕНИЯ настроек
        Commands.Add('EnableInsecureGuestLogons|Set-SmbClientConfiguration -EnableInsecureGuestLogons $true -Force');
        Commands.Add('ClientSecuritySignature|Set-SmbClientConfiguration -RequireSecuritySignature $false -Force');
        Commands.Add('ServerSecuritySignature|Set-SmbServerConfiguration -RequireSecuritySignature $false -Force');
      End
      Else
      Begin
        // Команды для ВЫКЛЮЧЕНИЯ настроек (обратные)
        Commands.Add('EnableInsecureGuestLogons|Set-SmbClientConfiguration -EnableInsecureGuestLogons $false -Force');
        Commands.Add('ClientSecuritySignature|Set-SmbClientConfiguration -RequireSecuritySignature $true -Force');
        Commands.Add('ServerSecuritySignature|Set-SmbServerConfiguration -RequireSecuritySignature $true -Force');
      End;

      // Выполняем команды по очереди
      For i := 0 To Commands.Count - 1 Do
      Begin
        Var Parts := Commands[i].Split(['|']);
        If Length(Parts) = 2 Then
        Begin
          // Показываем какую настройку меняем
          Case i Of
            0:
              Log(LangInsecureGuestLogins.Caption);
            1:
              Log(LangClientSecuritySignature.Caption);
            2:
              Log(LangServerSecuritySignature.Caption);
          End;

          Success := ExecutePowerShellCommand(Parts[1]);

          If Success Then
            Log(LangSuccessfully.Caption)
          Else
            Log(LangError.Caption);
          application.ProcessMessages;
          Sleep(1000);
        End;
      End;

      // Финальное сообщение
      If Enable Then
        Form1.Log(Form1.LangSuccessfully.Caption)
      Else
        Form1.Log(Form1.LangSuccessfully.Caption);
      MemoLogCom.Lines.Add('----------------------------------------');
      application.ProcessMessages;
    Finally
      Commands.Free;
    End;

  Finally
    SendMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0);
  End;

  // Прокручиваем Memo вниз
  MemoLogCom.SelStart := Length(MemoLogCom.Text);
  Form1.ActivityIndicator1.Visible := False;
  Form1.ActivityIndicator1.Animate := False;
  application.ProcessMessages;
End;

Procedure TForm1.ComboBoxEditInterfacesChange(Sender: TObject);
Const
  sKey: String = '\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkCards';
Var
  i: Integer;
  Description, ServiceName: String;
  Reg: TRegistry;
  lName: TStringList;
Begin
  EditScriptAddress.Text := '';
  EditProxyAdress.Text := '';
  EditProxyPort.Text := '';
  With Reg Do
  Begin
    Reg := TRegistry.Create(KEY_READ Or KEY_WOW64_64KEY Or KEY_WOW64_32KEY);
    Reg.Access := KEY_WOW64_64KEY Or KEY_ALL_ACCESS;
    lName := TStringList.Create;
    lName.Duplicates := dupIgnore;
    RootKey := HKEY_LOCAL_MACHINE;
    OpenKey(sKey, False);
    getkeynames(lName);
    CloseKey;
    For i := 0 To lName.Count - 1 Do
    Begin
      If OpenKey(PChar(sKey + '\' + lName[i]), False) Then
      Begin
        Try
          Description := Reg.readString('Description');
          ServiceName := Reg.readString('ServiceName');
          If Form1.ComboBoxEditInterfaces.Text = Description Then
          Begin
            EditInterfaces.Text := ServiceName;
          End;
        Except
        End;

        application.ProcessMessages;
      End;
    End;
  End;
  Reg.CloseKey;
  lName.Free;
  Reg.Free;
  GetWin32_NetworkAdapterConfigurationInfo;
  EditScriptAddress.Text := detectIEProxyServer;
  EditProxyAdress.Text := detectIEProxyServerProxyAdress;
  EditProxyPort.Text := detectIEProxyServerProxyPort;
  // LoadNetworkCards;
  GetTCPIPDNSAddresses;
  application.ProcessMessages;
End;

Function IsIP(Const S: String): boolean;
Var
  i: Integer;
  DotCount: Integer;
  NumVal: Integer;
Begin
  Result := False;
  DotCount := 0;
  NumVal := 0;
  i := 1;

  // Пропускаем начальные пробелы
  While (i <= Length(S)) And (S[i] = ' ') Do
    inc(i);

  // Проверяем, не начинается ли строка с точки
  If (i <= Length(S)) And (S[i] = '.') Then
    Exit;

  While i <= Length(S) Do
  Begin
    If S[i] = '.' Then
    Begin
      inc(DotCount);
      If (DotCount > 3) Or (NumVal > 255) Then
        Exit;
      NumVal := 0;

      // Используем CharInSet вместо In
      If (i >= Length(S)) Or (Not CharInSet(S[i + 1], ['0'..'9'])) Then
        Exit;
    End
    Else If CharInSet(S[i], ['0'..'9']) Then  // Используем CharInSet здесь
      NumVal := NumVal * 10 + Ord(S[i]) - Ord('0')
    Else
    Begin
      // Пропускаем конечные пробелы
      While (i <= Length(S)) And (S[i] = ' ') Do
        inc(i);
      If i <= Length(S) Then
        Exit;
      break;
    End;
    inc(i);
  End;

  If (DotCount <> 3) Or (NumVal > 255) Then
    Exit;

  Result := true;
End;

Procedure TForm1.EditAlternativeDNS1Click(Sender: TObject);
Begin
  (Sender As TEdit).SelectAll;
End;

Procedure TForm1.EditAlternativeDNSClick(Sender: TObject);
Begin
  (Sender As TEdit).SelectAll;
End;

Procedure TForm1.EditIPAddressClick(Sender: TObject);
Begin
  (Sender As TEdit).SelectAll;
End;

Procedure TForm1.EditIPAddressKeyPress(Sender: TObject; Var Key: Char);
Begin
  If IsIP(EditIPAddress.Text) = False Then
  Begin
    EditIPAddress.Font.Style := [fsItalic];
  End;
  If IsIP(EditIPAddress.Text) = true Then
  Begin
    EditIPAddress.Font.Style := EditIPAddress.Font.Style - [fsItalic];
  End;
End;

Procedure TForm1.EditMainGatewayClick(Sender: TObject);
Begin
  (Sender As TEdit).SelectAll;
End;

Procedure TForm1.EditMainGatewayKeyPress(Sender: TObject; Var Key: Char);
Begin
  If IsIP(EditMainGateway.Text) = False Then
  Begin
    EditMainGateway.Font.Style := [fsItalic];
  End;
  If IsIP(EditMainGateway.Text) = true Then
  Begin
    EditMainGateway.Font.Style := EditMainGateway.Font.Style - [fsItalic];
  End;
End;

Procedure TForm1.EditNetIPClick(Sender: TObject);
Begin
  (Sender As TEdit).SelectAll;
End;

Procedure TForm1.EditPreferredDNS1Click(Sender: TObject);
Begin
  (Sender As TEdit).SelectAll;
End;

Procedure TForm1.EditPreferredDNSClick(Sender: TObject);
Begin
  (Sender As TEdit).SelectAll;
End;

Procedure TForm1.EditSubnetMaskClick(Sender: TObject);
Begin
  (Sender As TEdit).SelectAll;
End;

Procedure TForm1.EditSubnetMaskKeyPress(Sender: TObject; Var Key: Char);
Begin
  If IsIP(EditSubnetMask.Text) = False Then
  Begin
    EditSubnetMask.Font.Style := [fsItalic];
  End;
  If IsIP(EditSubnetMask.Text) = true Then
  Begin
    EditSubnetMask.Font.Style := EditSubnetMask.Font.Style - [fsItalic];
  End;
End;

Procedure TForm1.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  Form1.SaveNastr;
  application.ProcessMessages;
End;

Function EnableDebugPrivilege(Const Value: boolean): boolean;
Const
  SE_DEBUG_NAME = 'SeDebugPrivilege';
Var
  hToken: THandle;
  tp: TOKEN_PRIVILEGES;
  d: DWORD;
Begin
  Result := False;
  If OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES, hToken) Then
  Begin
    tp.PrivilegeCount := 1;
    LookupPrivilegeValue(Nil, SE_DEBUG_NAME, tp.Privileges[0].LUID);
    If Value Then
      tp.Privileges[0].Attributes := $00000002
    Else
      tp.Privileges[0].Attributes := $80000000;
    AdjustTokenPrivileges(hToken, False, tp, SizeOf(TOKEN_PRIVILEGES), Nil, d);
    If GetLastError = ERROR_SUCCESS Then
    Begin
      Result := true;
    End;
    CloseHandle(hToken);
  End;
End;

Procedure TForm1.Globload;
Var
  i: Integer;
  Internat: TTranslation;
  Ini: TMemIniFile;
  lang, lang_file: String;
Begin
  For i := 0 To Screen.FormCount - 1 Do
  Begin
    Ini := TMemIniFile.Create(Form1.PortablePath);
    lang := Ini.ReadString('Language', 'Language', '');
    lang_file := ExtractFilePath(ParamStr(0)) + 'Language\' + lang + '.ini';
    Ini.Free;
    Ini := TMemIniFile.Create(lang_file);
    If Ini.SectionExists(application.Title) Then // Используем конкретную секцию
    Begin
      Internat.Execute(Screen.Forms[i], application.Title); // Передаем имя секции
      Application.ProcessMessages;
    End;
    Ini.Free;
  End;
End;

Procedure TForm1.LabelGetIPClick(Sender: TObject);
Begin
  Thread := RealIPThread.Create(False);
  Thread.FreeOnTerminate := true;
  Thread.Priority := tpNormal;
End;

Procedure TForm1.LoadDNS(Const AFilename: String);
Var
  i: TIniFile;
  L: TStringList;
  X: Integer;
  n: String;
  V: String;
Begin
  i := TIniFile.Create(AFilename);
  Try
    L := TStringList.Create;
    Try
      ComboBoxDNS.Items.Clear;
      i.ReadSectionValues('Ipv4_Default', L);
      For X := 0 To L.Count - 1 Do
      Begin
        n := L.Names[X]; // The Name
        V := L.Values[n];
        ComboBoxDNS.Items.Add(n);
        Form1.ComboBoxDNS.ItemIndex := 0;
      End;
    Finally
      L.Free;
    End;
  Finally
    i.Free;
  End;
End;

Procedure TForm1.ComboBoxDNSChange(Sender: TObject);
Var
  p, p1: Integer;
  Ini: TIniFile;
  DNS: String;
Begin
  Ini := TIniFile.Create(PortablePathDNS);
  DNS := Ini.readString('Ipv4_Default', ComboBoxDNS.Text, '');
  EditPreferredDNS1.Text := Copy(DNS, 1, pos(',', DNS) - 1);
  p := pos(',', DNS);
  p1 := Length(DNS);
  If (p > 0) And (p < p1) Then
    EditAlternativeDNS1.Text := Copy(DNS, p + 1, p1 - p);
  Ini.Free;
End;

Procedure RealIPThread.Execute;
Begin
  Thread.FreeOnTerminate := true;
  Form1.EditNetIP.Text := '127.0.0.1';
  Form1.EditNetIP.Text := Form1.GetMyRealIP;
End;

Procedure TForm1.LoadDNSTest(Const AFilename: String);
Var
  i: TIniFile;
  L: TStringList;
  X: Integer;
  ListItem: TListItem;
  p, p1: Integer;
  DNS: String;
  Ini: TIniFile;
Begin
  i := TIniFile.Create(AFilename);
  Ini := TIniFile.Create(PortablePathDNS);
  Try
    L := TStringList.Create;
    Try
      i.ReadSectionValues('Ipv4_Default', L);
      For X := 0 To L.Count - 1 Do
      Begin
        ListItem := ListViewDNS.Items.Add;
        With ListItem Do
        Begin
          Caption := L.Names[X];
          DNS := Ini.readString('Ipv4_Default', L.Names[X], '');
          SubItems.Add(Copy(DNS, 1, pos(',', DNS) - 1));
          p := pos(',', DNS);
          p1 := Length(DNS);
          If (p > 0) And (p < p1) Then
            SubItems.Add(Copy(DNS, p + 1, p1 - p));
          SubItems.Add('0');
          SubItems.Add('0');
          application.ProcessMessages;
        End;
      End;
    Finally
      L.Free;
    End;
  Finally
    i.Free;
    Ini.Free;
  End;
End;

Procedure TForm1.LoadFiltersReload;
Var
  Ini: TMemIniFile;
Begin
  Ini := TMemIniFile.Create(Form1.PortablePathDNS);
  ListViewDNS.Clear;
  If FileExists(Form1.PortablePathDNS) Then
  Begin
    LoadDNSTest(Form1.PortablePathDNS);
    application.ProcessMessages;
  End;
  Ini.Free;
End;

Procedure TForm1.CleanTranslationsLikeGlobload;
Var
  i, j, k, m: Integer;
  Ini: TMemIniFile;
  Sections, Keys: TStringList;
  SearchRec: TSearchRec;
  FindResult: Integer;
  CompPath, FormName, CompName, PropName: String;
  FirstDot, SecondDot: Integer;
  FormExists, CompExists: Boolean;
  CurrentForm: TForm;
  CurrentComponent: TComponent;
  Modified: Boolean;
  IsDuplicate: Boolean;
  n: Integer;
  CompareKey, CompareFormName: String;
  CompareDotPos: Integer;
Begin
  // Создаем все формы проекта (если нужно)
  // CreateAllProjectForms;

  FindResult := FindFirst(ExtractFilePath(ParamStr(0)) + 'Language\*.ini', faAnyFile, SearchRec);
  If FindResult = 0 Then
  Begin
    Repeat
      If (SearchRec.Name <> '.') And (SearchRec.Name <> '..') Then
      Begin
        Ini := TMemIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Language\' + SearchRec.Name);
        Sections := TStringList.Create;
        Keys := TStringList.Create;
        Modified := False;

        Try
          Ini.ReadSections(Sections);

          For i := 0 To Sections.Count - 1 Do
          Begin
            If SameText(Sections[i], Application.Title) Then
            Begin
            // ========== ИСКЛЮЧАЕМ ЭТИ СЕКЦИИ ИЗ ОБРАБОТКИ ==========
              If SameText(Sections[i], 'Language information') Or SameText(Sections[i], 'DestDir') Then
                Continue; // Пропускаем эти секции полностью

              Ini.ReadSection(Sections[i], Keys);

            // Проходим по всем ключам в обратном порядке
              For j := Keys.Count - 1 Downto 0 Do
              Begin
                CompPath := Keys[j];
                FirstDot := Pos('.', CompPath);

                If FirstDot > 0 Then
                Begin
                  FormName := Copy(CompPath, 1, FirstDot - 1);
                  FormExists := False;
                  CompExists := False;

                // ==================== ПРОВЕРКА СУЩЕСТВОВАНИЯ КОМПОНЕНТА ====================
                // Проверяем ВСЕ формы в Screen
                  For k := 0 To Screen.FormCount - 1 Do
                  Begin
                    If SameText(Screen.Forms[k].Name, FormName) Then
                    Begin
                      FormExists := True;
                      CurrentForm := Screen.Forms[k];

                    // Извлекаем остаток пути после имени формы
                      CompName := Copy(CompPath, FirstDot + 1, Length(CompPath));
                      SecondDot := Pos('.', CompName);

                      If SecondDot > 0 Then
                      Begin
                      // Есть вложенный компонент: Form1.TrayIcon1.Hint
                        PropName := Copy(CompName, SecondDot + 1, Length(CompName));
                        CompName := Copy(CompName, 1, SecondDot - 1);

                      // Ищем компонент на форме
                        CurrentComponent := CurrentForm.FindComponent(CompName);

                      // Если не нашли через FindComponent, ищем вручную
                        If CurrentComponent = Nil Then
                        Begin
                          For m := 0 To CurrentForm.ComponentCount - 1 Do
                          Begin
                            If SameText(CurrentForm.Components[m].Name, CompName) Then
                            Begin
                              CurrentComponent := CurrentForm.Components[m];
                              Break;
                            End;
                          End;
                        End;

                        CompExists := (CurrentComponent <> Nil);
                      End
                      Else
                      Begin
                      // Нет второй точки - это свойство формы (Form1.Caption)
                        CompExists := True;
                      End;

                      Break; // Форма найдена, выходим из цикла
                    End;
                  End;

                // ==================== ПРОВЕРКА ДУБЛИКАТОВ ====================
                  IsDuplicate := False;
                // Проверяем предыдущие ключи на дубликаты (только внутри той же формы)
                  For n := 0 To j - 1 Do
                  Begin
                    CompareKey := Keys[n];
                    CompareDotPos := Pos('.', CompareKey);

                    If CompareDotPos > 0 Then
                    Begin
                      CompareFormName := Copy(CompareKey, 1, CompareDotPos - 1);

                    // Дубликатом считаем только если:
                    // 1. Имя формы совпадает
                    // 2. Полный путь совпадает (регистронезависимо)
                      If (SameText(FormName, CompareFormName)) And (SameText(CompPath, CompareKey)) Then
                      Begin
                        IsDuplicate := True;
                        Break;
                      End;
                    End;
                  End;

                // ==================== УДАЛЕНИЕ КЛЮЧА ====================
                // Удаляем если:
                // 1. Форма или компонент не существуют ИЛИ
                // 2. Найден дубликат в той же форме
                  If (Not (FormExists And CompExists)) Or IsDuplicate Then
                  Begin
                    Ini.DeleteKey(Sections[i], Keys[j]);
                    Modified := True;
                  End;
                End
                Else
                Begin
                // Некорректный формат - удаляем
                  Ini.DeleteKey(Sections[i], Keys[j]);
                  Modified := True;
                End;
              End;

            // Проверяем, не пустая ли секция после удаления
            // (кроме исключенных секций)
              If Not (SameText(Sections[i], 'Language information') Or SameText(Sections[i], 'DestDir')) Then
              Begin
                Ini.ReadSection(Sections[i], Keys);
                If Keys.Count = 0 Then
                Begin
                  Ini.EraseSection(Sections[i]);
                  Modified := True;
                End;
              End;
            End;

            If Modified Then
              Ini.UpdateFile;
          End;

        Finally
          Keys.Free;
          Sections.Free;
          Ini.Free;
        End;
      End;
    Until FindNext(SearchRec) <> 0;
    FindClose(SearchRec);
  End;
End;

Function GetApplicationBitness: String;
Begin
  {$IFDEF WIN64}
  Result := '(64-bit)';
  {$ELSE}
  Result := '(32-bit)';
  {$ENDIF}
End;

Procedure TForm1.FormCreate(Sender: TObject);
Begin
  portable := fileExists(ExtractFilePath(ParamStr(0)) + 'portable.ini');
  If portable = True Then
    Form1.Caption := Form1.Caption + ' ' + GetFileVersion(ParamStr(0)) + ' ' + GetApplicationBitness + ' Portable'
  Else
    Form1.Caption := Form1.Caption + ' ' + GetFileVersion(ParamStr(0)) + ' ' + GetApplicationBitness;
  LabelDNS1.Caption := '';
  LabelDNS2.Caption := '';
  LoadFiltersReload;
  application.ProcessMessages;
  Form1.LoadNastr;
  application.ProcessMessages;
  LoadNetworkCards;
  application.ProcessMessages;
  UpdateNETOption;
  application.ProcessMessages;
  LoadDNS(Form1.PortablePathDNS);
  ComboBoxDNSChange(Sender);
  application.ProcessMessages;
  TabNetworkProfiles.TabVisible := False;
  TabUsefulCommands.TabVisible := False;
  TabProxy.TabVisible := False;
  TabTestDNS.TabVisible := False;
  Form1.PageControl.ActivePage := TabProxy;
  ButtonProxyClick(Sender);
  application.ProcessMessages;
End;

Procedure TForm1.LoadNet;
Var
  i: Integer;
  keys: TStringList;
  Reg: TRegistry;
  ListItem: TListItem;
  // buf : array [1..256] of byte;
Begin
  Form1.StatusBarProfile.Panels[0].Text := LangElements.Caption + ' 0';
  ListViewNetworkProfiles.Clear;
  Reg := TRegistry.Create;
  keys := TStringList.Create;
  With Reg Do
  Begin
    Access := KEY_WOW64_64KEY Or KEY_ALL_ACCESS;
    RootKey := HKEY_LOCAL_MACHINE;
    OpenKey('\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Profiles', False);
    getkeynames(keys);
    // Memo4.Lines.Text := keys.Text;
    CloseKey;
    application.ProcessMessages;

    For i := 0 To keys.Count - 1 Do
      If Reg.OpenKey(PChar('\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Profiles' + '\' + keys[i]), False) Then
      Begin
        ListItem := Form1.ListViewNetworkProfiles.Items.Add;
        With ListItem Do
        Begin
          Caption := Format('%.2u', [Form1.ListViewNetworkProfiles.Items.Count]);
          SubItems.Add(Reg.readString('ProfileName'));
          // SubItems.Add(inttoStr(reg.ReadBinaryData('DateCreated', buf, sizeof(buf))));

          SubItems.Add(Reg.readString('Description'));
          If ReadInteger('Category') = 1 Then
          Begin
            SubItems.Add(LangPrivate.Caption);
          End;
          If ReadInteger('Category') = 0 Then
          Begin
            SubItems.Add(LangPublic.Caption);
          End;
          SubItems.Add('HKEY_LOCAL_MACHINE');
          SubItems.Add('\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Profiles' + '\' + keys[i]);
          Form1.StatusBarProfile.Panels[0].Text := LangElements.Caption + ' ' + IntToStr(Form1.ListViewNetworkProfiles.Items.Count);
          application.ProcessMessages;
          application.ProcessMessages;
        End;
      End;
    Try
      Form1.ListViewNetworkProfiles.Items[0].MakeVisible(true);
      Form1.ListViewNetworkProfiles.Items[0].Selected := true;
      Form1.ListViewNetworkProfiles.Items[0].Focused := true;
    Except
    End;
  End;
  Form1.StatusBarProfile.Panels[0].Text := LangElements.Caption + ' ' + IntToStr(Form1.ListViewNetworkProfiles.Items.Count);
  application.ProcessMessages;
  Reg.CloseKey;
  Reg.Free;
  keys.Free;

End;

// Тип подключения
Procedure TForm1.TypeNet;
Var
  Reg: TRegistry;
Begin
  Reg := TRegistry.Create;
  With Reg Do
  Begin
    Access := KEY_WOW64_64KEY Or KEY_ALL_ACCESS;
    RootKey := HKEY_LOCAL_MACHINE;
    OpenKey('\SYSTEM\CurrentControlSet\Control\Network\{4D36E972-E325-11CE-BFC1-08002BE10318}\' + EditInterfaces.Text + '\Connection', False);
    EditTypeInterfaces.Text := Reg.readString('Name');
  End;
  Reg.CloseKey;
  Reg.Free;
End;

Procedure TForm1.DeleteKey;
Var
  Reg: TRegistry;
Begin
  If ListViewNetworkProfiles.ItemIndex = -1 Then
    Exit;
  Reg := TRegistry.Create(KEY_WRITE Or KEY_WOW64_64KEY);
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.DeleteKey(ListViewNetworkProfiles.Selected.SubItems.Strings[4]);
  Reg.Free;
End;

Procedure TForm1.DeleteNetAllClick(Sender: TObject);
Var
  Msg: Integer;
  Reg: TRegistry;
Begin
  If ListViewNetworkProfiles.ItemIndex = -1 Then
    Exit;
  Msg := Messagebox(application.MainForm.Handle, PChar(LangDeleteAllProfile.Caption), PChar(LangAttention.Caption), mb_iconquestion Or mb_yesno);
  If Msg = idyes Then
  Begin
    Try
      While ListViewNetworkProfiles.Items.Count > 0 Do
      Begin
        { if ListViewNetworkProfiles.Items[0].Checked = True then
          begin }
        ListViewNetworkProfiles.Items.Item[0].MakeVisible(true);
        Reg := TRegistry.Create(KEY_WRITE Or KEY_WOW64_64KEY);
        Reg.RootKey := HKEY_LOCAL_MACHINE;
        Reg.DeleteKey(ListViewNetworkProfiles.Items[0].SubItems.Strings[4]);
        Reg.Free;
        ListViewNetworkProfiles.Items[0].delete;
        application.ProcessMessages;
        // end;
      End;
    Except
    End;

  End;
  LoadNet;
  application.ProcessMessages;
End;

Procedure TForm1.DeleteNetClick(Sender: TObject);
Var
  Msg: Integer;
Begin
  If ListViewNetworkProfiles.ItemIndex = -1 Then
    Exit;
  Msg := Messagebox(application.MainForm.Handle, PChar(LangDelete.Caption + ' [ ' + ListViewNetworkProfiles.Selected.SubItems.Strings[0] + ' ] ?'), PChar(LangAttention.Caption), mb_iconquestion Or mb_yesno);
  If Msg = idyes Then
  Begin
    DeleteKey;
  End;
  LoadNet;
  application.ProcessMessages;
End;

Procedure TForm1.DelSelectedProfilesMenuClick(Sender: TObject);
Var
  Msg, i: Integer;
  Reg: TRegistry;
Begin
  If ListViewNetworkProfiles.ItemIndex = -1 Then
    Exit;
  Msg := Messagebox(application.MainForm.Handle, PChar(LangDeleteAllProfile.Caption), PChar(LangAttention.Caption), mb_iconquestion Or mb_yesno);
  If Msg = idyes Then
  Begin
    Try
      For i := ListViewNetworkProfiles.Items.Count - 1 Downto 0 Do
      Begin
        If ListViewNetworkProfiles.Items[i].Checked = true Then
        Begin
          // ListViewNetworkProfiles.Items.Item[i].MakeVisible(True);
          Reg := TRegistry.Create(KEY_WRITE Or KEY_WOW64_64KEY);
          Reg.RootKey := HKEY_LOCAL_MACHINE;
          Reg.DeleteKey(ListViewNetworkProfiles.Items[i].SubItems.Strings[4]);
          Reg.Free;
          ListViewNetworkProfiles.Items[i].delete;
          // ListViewNetworkProfiles.Items.Delete(i);
          application.ProcessMessages;
        End;
      End;
    Except
    End;

  End;
  LoadNet;
  application.ProcessMessages;

End;

Procedure TForm1.DelProfilesMenuClick(Sender: TObject);
Var
  Msg: Integer;
Begin
  If ListViewNetworkProfiles.ItemIndex = -1 Then
    Exit;
  Msg := Messagebox(application.MainForm.Handle, PChar(LangDelete.Caption + ' [ ' + ListViewNetworkProfiles.Selected.SubItems.Strings[0] + ' ] ?'), PChar(LangAttention.Caption), mb_iconquestion Or mb_yesno);
  If Msg = idyes Then
  Begin
    DeleteKey;
  End;
  LoadNet;
  application.ProcessMessages;
End;

Procedure TForm1.PrivateProfiles;
Var
  Reg: TRegistry;
Begin
  Reg := TRegistry.Create(KEY_WRITE Or KEY_WOW64_64KEY);
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.Access := KEY_WOW64_64KEY Or KEY_WRITE;
  Reg.OpenKey(ListViewNetworkProfiles.Selected.SubItems.Strings[3] + ListViewNetworkProfiles.Selected.SubItems.Strings[4], False);
  Reg.WriteInteger('Category', 1);
  Reg.CloseKey;
  Reg.Free;
End;

Procedure TForm1.PublicProfiles;
Var
  Reg: TRegistry;
Begin
  Reg := TRegistry.Create(KEY_WRITE Or KEY_WOW64_64KEY);
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.Access := KEY_WOW64_64KEY Or KEY_WRITE;
  Reg.OpenKey(ListViewNetworkProfiles.Selected.SubItems.Strings[3] + ListViewNetworkProfiles.Selected.SubItems.Strings[4], False);
  Reg.WriteInteger('Category', 0);
  Reg.CloseKey;
  Reg.Free;
End;

Function GetDomainName: AnsiString;
Type
  WKSTA_INFO_100 = Record
    wki100_platform_id: Integer;
    wki100_computername: PWideChar;
    wki100_langroup: PWideChar;
    wki100_ver_major: Integer;
    wki100_ver_minor: Integer;
  End;

  WKSTA_USER_INFO_1 = Record
    wkui1_username: PAnsiChar;
    wkui1_logon_domain: PAnsiChar;
    wkui1_logon_server: PAnsiChar;
    wkui1_oth_domains: PAnsiChar;
  End;
Type
  // Win9X ANSI prototypes from RADMIN32.DLL and RLOCAL32.DLL
  TWin95_NetWkstaUserGetInfo = Function(Reserved: PAnsiChar; Level: Integer; Var BufPtr: pointer): Integer; Stdcall;

  TWin95_NetApiBufferFree = Function(BufPtr: pointer): Integer; Stdcall;

  // WinNT UNICODE equivalents from NETAPI32.DLL
  TWinNT_NetWkstaGetInfo = Function(ServerName: PWideChar; Level: Integer; Var BufPtr: pointer): Integer; Stdcall;

  TWinNT_NetApiBufferFree = Function(BufPtr: pointer): Integer; Stdcall;

  Function IsWinNT: boolean;
  Var
    VersionInfo: TOSVersionInfo;
  Begin
    VersionInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
    Result := GetVersionEx(VersionInfo);
    If Result Then
      Result := VersionInfo.dwPlatformID = VER_PLATFORM_WIN32_NT;
  End;

Var
  Win95_NetWkstaUserGetInfo: TWin95_NetWkstaUserGetInfo;
  Win95_NetApiBufferFree: TWin95_NetApiBufferFree;
  WinNT_NetWkstaGetInfo: TWinNT_NetWkstaGetInfo;
  WinNT_NetApiBufferFree: TWinNT_NetApiBufferFree;
  WSNT: ^WKSTA_INFO_100;
  WS95: ^WKSTA_USER_INFO_1;
  EC: DWORD;
  hNETAPI: THandle;
  TempWideStr: WideString;
Begin
  hNETAPI := 0;
  Try
    Result := '';

    If IsWinNT Then
    Begin
      hNETAPI := LoadLibrary('NETAPI32.DLL');
      If hNETAPI <> 0 Then
      Begin
        @WinNT_NetWkstaGetInfo := GetProcAddress(hNETAPI, 'NetWkstaGetInfo');
        @WinNT_NetApiBufferFree := GetProcAddress(hNETAPI, 'NetApiBufferFree');

        If Assigned(WinNT_NetWkstaGetInfo) And Assigned(WinNT_NetApiBufferFree) Then
        Begin
          EC := WinNT_NetWkstaGetInfo(Nil, 100, pointer(WSNT));
          If EC = 0 Then
          Begin
            // Правильное преобразование PWideChar в AnsiString
            TempWideStr := WSNT^.wki100_langroup;
            Result := AnsiString(TempWideStr);
            WinNT_NetApiBufferFree(pointer(WSNT));
          End;
        End;
      End;
    End
    Else
    Begin
      hNETAPI := LoadLibrary('RADMIN32.DLL');
      If hNETAPI <> 0 Then
      Begin
        @Win95_NetWkstaUserGetInfo := GetProcAddress(hNETAPI, 'NetWkstaUserGetInfo');
        @Win95_NetApiBufferFree := GetProcAddress(hNETAPI, 'NetApiBufferFree');

        If Assigned(Win95_NetWkstaUserGetInfo) And Assigned(Win95_NetApiBufferFree) Then
        Begin
          EC := Win95_NetWkstaUserGetInfo(Nil, 1, pointer(WS95));
          If EC = 0 Then
          Begin
            // PAnsiChar напрямую присваивается AnsiString
            Result := WS95^.wkui1_logon_domain;
            Win95_NetApiBufferFree(pointer(WS95));
          End;
        End;
      End;
    End;

  Finally
    If hNETAPI <> 0 Then
      FreeLibrary(hNETAPI);
  End;
End;

Procedure TForm1.RenameNetClick(Sender: TObject);
Begin
  RenameProfile;
End;

Procedure TForm1.RenameProfile;
Var
  InputString: String;
  Reg: TRegistry;
Begin
  If ListViewNetworkProfiles.ItemIndex = -1 Then
    Exit;
  InputString := Dialogs.InputBox(LangRename.Caption, LangNetworkName.Caption, ListViewNetworkProfiles.Selected.SubItems.Strings[0]);
  If (InputString = '') Or (InputString = ListViewNetworkProfiles.Selected.SubItems.Strings[0]) Then
  Begin
    showmessage(LanfErrorName.Caption);
  End;
  If (InputString <> '') And (InputString <> ListViewNetworkProfiles.Selected.SubItems.Strings[0]) Then
  Begin

    Reg := TRegistry.Create(KEY_WRITE Or KEY_WOW64_64KEY);
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    // Reg.Access := KEY_WOW64_32KEY or KEY_ALL_ACCESS;
    Reg.OpenKey(ListViewNetworkProfiles.Selected.SubItems.Strings[3] + ListViewNetworkProfiles.Selected.SubItems.Strings[4], true);
    Reg.WriteString('ProfileName', InputString);
    Reg.CloseKey;
    Reg.Free;

  End;
  LoadNet;
End;

Procedure TForm1.RenameProfilesMenuClick(Sender: TObject);
Begin
  RenameProfile;
End;

Procedure TForm1.CheckAllProfiles(Checked: boolean);
Var
  i, c: Integer;
Begin
  If Form1.ListViewNetworkProfiles.Items.Count = 0 Then
    Exit;
  c := Form1.ListViewNetworkProfiles.Items.Count - 1;
  For i := 0 To c Do
  Begin
    Form1.ListViewNetworkProfiles.Items[i].Checked := Checked;
  End;
End;

Procedure TForm1.ProfilesCheclAllMenuClick(Sender: TObject);
Begin
  CheckAllProfiles(true);
End;

Procedure TForm1.ProfilesUnCheclAllMenuClick(Sender: TObject);
Begin
  CheckAllProfiles(False);
End;

Function TForm1.RunCommand(Const Command, Params: String; Wait: boolean): boolean;
Var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
Begin
  Result := False;

  FillChar(StartupInfo, SizeOf(StartupInfo), 0);
  StartupInfo.cb := SizeOf(StartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := SW_HIDE;

  If CreateProcess(Nil, PChar(Command + ' ' + Params), Nil, Nil, False, CREATE_NEW_CONSOLE Or NORMAL_PRIORITY_CLASS, Nil, Nil, StartupInfo, ProcessInfo) Then
  Begin
    If Wait Then
    Begin
      WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
      CloseHandle(ProcessInfo.hProcess);
      CloseHandle(ProcessInfo.hThread);
    End;
    Result := true;
  End;
End;

Procedure TForm1.Log(Const Msg: String);
Begin
  MemoLogCom.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' + Msg);
  application.ProcessMessages;
End;

Procedure TForm1.FlushDNS;
Begin
  RunCommand('ipconfig', '/flushdns', true);
  RunCommand('ipconfig', '/registerdns', true);
  // Дополнительная очистка через службу DNS
  RunCommand('net', 'stop dnscache /y', true);
  Sleep(2000);
  RunCommand('net', 'start dnscache', true);
End;

Procedure TForm1.ResetTCPIP;
Begin
  // Сброс IP и DNS настроек
  RunCommand('netsh', 'int ip reset', true);
  RunCommand('netsh', 'int ipv4 reset', true);
  RunCommand('netsh', 'int ipv6 reset', true);
End;

Procedure TForm1.RenewIP;
Begin
  RunCommand('ipconfig', '/release', true);
  Sleep(3000);
  RunCommand('ipconfig', '/renew', true);
  RunCommand('ipconfig', '/all', true);
End;

Procedure TForm1.ResetFirewall;
Begin
  // Сброс к настройкам по умолчанию
  RunCommand('netsh', 'advfirewall reset', true);
  RunCommand('netsh', 'advfirewall set allprofiles state on', true);
  // Включение основных правил
  RunCommand('netsh', 'advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes', true);
  RunCommand('netsh', 'advfirewall firewall set rule group="Network Discovery" new enable=Yes', true);
End;

Procedure TForm1.ResetProxy;
Var
  Reg: TRegistry;
Begin
  Reg := TRegistry.Create;
  Try
    Reg.RootKey := HKEY_CURRENT_USER;
    If Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Internet Settings', true) Then
    Begin
      Reg.WriteInteger('ProxyEnable', 0);
      Reg.WriteString('ProxyServer', '');
      Reg.WriteString('ProxyOverride', '<local>');
      Reg.WriteInteger('AutoConfigURL', 0);
      Reg.CloseKey;
    End;
    // Для всех пользователей
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    Reg.Access := KEY_WOW64_64KEY Or KEY_ALL_ACCESS;
    If Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Internet Settings', true) Then
    Begin
      Reg.WriteInteger('ProxyEnable', 0);
      Reg.WriteString('ProxyServer', '');
      Reg.CloseKey;
    End;
  Finally
    Reg.Free;
  End;
End;

Procedure TForm1.RepairWorkgroup;
Var
  Reg: TRegistry;
Begin
  Reg := TRegistry.Create;
  Try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    Reg.Access := KEY_WOW64_64KEY Or KEY_ALL_ACCESS;
    // Настройки рабочей группы
    If Reg.OpenKey('SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters', true) Then
    Begin
      Reg.WriteInteger('restrictnullsessaccess', 0);
      Reg.WriteInteger('AutoShareServer', 1);
      Reg.WriteInteger('AutoShareWks', 1);
      Reg.CloseKey;
    End;
    // Настройки NetBIOS
    If Reg.OpenKey('SYSTEM\CurrentControlSet\Services\NetBT\Parameters\Interfaces', true) Then
    Begin
      Reg.WriteInteger('NetbiosOptions', 2);
      Reg.CloseKey;
    End;
  Finally
    Reg.Free;
  End;
End;

Procedure EnableNetworkDiscovery;
Var
  Reg: TRegistry;
Begin
  Reg := TRegistry.Create;
  Try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    Reg.Access := KEY_WOW64_64KEY Or KEY_ALL_ACCESS;
    // Включение NetBIOS over TCP/IP
    If Reg.OpenKey('SYSTEM\CurrentControlSet\Services\NetBT\Parameters\Interfaces', False) Then
    Begin
      Reg.WriteInteger('NetbiosOptions', 2);
      Reg.CloseKey;
    End;

    // Настройки общего доступа
    If Reg.OpenKey('SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters', true) Then
    Begin
      Reg.WriteInteger('restrictnullsessaccess', 0);
      Reg.WriteInteger('EnableSecuritySignature', 0);
      Reg.WriteInteger('requiresecuritysignature', 0);
      Reg.CloseKey;
    End;

    // Настройки браузера компьютеров
    If Reg.OpenKey('SYSTEM\CurrentControlSet\Services\Browser\Parameters', true) Then
    Begin
      Reg.WriteInteger('MaintainServerList', 1);
      Reg.WriteInteger('IsDomainMaster', 1);
      Reg.CloseKey;
    End;

  Finally
    Reg.Free;
  End;
End;

Function StartServiceByName(ServiceName: String): boolean;
Begin
  Result := ShellExecute(0, 'open', 'net', PChar('start "' + ServiceName + '"'), Nil, SW_HIDE) > 32;
  If Result Then
  Begin
    Sleep(2000);
  End
  Else
  Begin
  End;
End;

Procedure StartNetworkServices;
Const
  NetworkServices: Array[0..7] Of String = ('Browser',
    // Обозреватель компьютеров
    'FDResPub', // Публикатор ресурсов обнаружения функций
    'SSDPSRV', // Обнаружение SSDP
    'upnphost', // Узел универсальных PNP-устройств
    'Dnscache', // DNS-клиент
    'FDHost', // Хост поставщика обнаружения функций
    'LanmanServer', // Сервер
    'LanmanWorkstation' // Рабочая станция
    );
Var
  i: Integer;
Begin
  For i := 0 To High(NetworkServices) Do
  Begin
    StartServiceByName(NetworkServices[i]);
  End;
End;

Procedure ConfigureWindowsFirewall;
Var
  Reg: TRegistry;
Begin
  Reg := TRegistry.Create;
  Try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    Reg.Access := KEY_WOW64_64KEY Or KEY_ALL_ACCESS;
    // Разрешение NetBIOS
    If Reg.OpenKey('SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile', true) Then
    Begin
      Reg.WriteInteger('EnableFirewall', 0);
      Reg.WriteInteger('DisableNotifications', 1);
      Reg.CloseKey;
    End;

    If Reg.OpenKey('SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile', true) Then
    Begin
      Reg.WriteInteger('EnableFirewall', 0);
      Reg.WriteInteger('DisableNotifications', 1);
      Reg.CloseKey;
    End;

  Finally
    Reg.Free;
  End;
End;

Procedure TForm1.RepairNetworkVisibility;
Var
  Reg: TRegistry;
Begin
  Reg := TRegistry.Create;
  Try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    Reg.Access := KEY_WOW64_64KEY Or KEY_ALL_ACCESS;
    // Включение сетевого обнаружения
    If Reg.OpenKey('SYSTEM\CurrentControlSet\Services\FDResPub', true) Then
    Begin
      Reg.WriteInteger('Start', 2);
      Reg.CloseKey;
    End;
    If Reg.OpenKey('SYSTEM\CurrentControlSet\Services\SSDPSRV', true) Then
    Begin
      Reg.WriteInteger('Start', 2);
      Reg.CloseKey;
    End;
    If Reg.OpenKey('SYSTEM\CurrentControlSet\Services\upnphost', true) Then
    Begin
      Reg.WriteInteger('Start', 2);
      Reg.CloseKey;
    End;
    If Reg.OpenKey('SYSTEM\CurrentControlSet\Services\Dnscache\Parameters', true) Then
    Begin
      Reg.WriteInteger('EnableICMPRedirect', 1);
      Reg.CloseKey;
    End;

    // Включение устаревшего обнаружения
    If Reg.OpenKey('SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters', true) Then
    Begin
      Reg.WriteInteger('UseCachedCredentials', 1);
      Reg.WriteInteger('EnablePlainTextPassword', 1);
      Reg.CloseKey;
    End;
    EnableNetworkDiscovery;
    ConfigureWindowsFirewall;
    StartNetworkServices;
    // Запуск служб
    RunCommand('nbtstat', '-RR', False);

    // Отправляем сообщение об обновлении
    SendMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0);
    RunCommand('net', 'start FDResPub', False);
    RunCommand('net', 'start SSDPSRV', False);
    RunCommand('net', 'start upnphost', False);
    RunCommand('netsh', 'advfirewall firewall add rule name="NetBIOS Name Service" dir=in action=allow protocol=UDP localport=137', False);
    RunCommand('netsh', 'advfirewall firewall add rule name="NetBIOS Datagram Service" dir=in action=allow protocol=UDP localport=138', False);
    RunCommand('netsh', 'advfirewall firewall add rule name="NetBIOS Session Service" dir=in action=allow protocol=TCP localport=139', False);
    RunCommand('sc', 'config FDResPub start= auto', False);
    RunCommand('sc', 'start FDResPub', False);
    RunCommand('net', 'stop WlanSvc', False);
    Sleep(3000);
    RunCommand('net', 'start WlanSvc', False);
    RunCommand('net', 'start Wcmsvc', False);
  Finally
    Reg.Free;
  End;
End;

Procedure TForm1.RebuildWMI;
Begin
  // Остановка службы
  RunCommand('net', 'stop winmgmt /y', true);
  Sleep(3000);
  // Перестроение репозитория
  RunCommand('winmgmt', '/resetrepository', true);
  Sleep(2000);
  // Запуск службы
  RunCommand('net', 'start winmgmt', true);
End;

Procedure TForm1.RestoreNetworkAdapters;
Begin
  // Отключение и включение сетевых адаптеров
  RunCommand('devcon', 'disable *DEV_8168* *DEV_8169* *DEV_8136* *DEV_8137* *DEV_8139*', False);
  Sleep(3000);
  RunCommand('devcon', 'enable *DEV_8168* *DEV_8169* *DEV_8136* *DEV_8137* *DEV_8139*', False);
End;

Procedure TForm1.ClearARPcache;
Begin
  RunCommand('netsh', 'interface IP delete arpcache', true);
  RunCommand('arp', '-d', true);
End;

Procedure RepairThread.Execute;
Begin
  ThreadRepair.FreeOnTerminate := true;
  Form1.TabComButtons.Enabled := False;
  Form1.ActivityIndicator1.Visible := true;
  Form1.ActivityIndicator1.Animate := true;
  Form1.Log(Form1.LangRepairStart.Caption);
  If Form1.CheckBoxFlushDNS.Checked Then
  Begin
    Form1.Log(Form1.CheckBoxFlushDNS.Caption);
    Form1.FlushDNS;
    application.ProcessMessages;
    Form1.Log(Form1.LangSuccessfully.Caption);
  End;
  If Form1.CheckBoxClearARPcache.Checked Then
  Begin
    Form1.Log(Form1.CheckBoxClearARPcache.Caption);
    Form1.ClearARPcache;
    application.ProcessMessages;
    Form1.Log(Form1.LangSuccessfully.Caption);
  End;
  If Form1.CheckBoxResetTCPIP.Checked Then
  Begin
    Form1.Log(Form1.CheckBoxResetTCPIP.Caption);
    Form1.ResetTCPIP;
    application.ProcessMessages;
    Form1.Log(Form1.LangSuccessfully.Caption);
  End;
  If Form1.CheckBoxRenewIP.Checked Then
  Begin
    Form1.Log(Form1.CheckBoxRenewIP.Caption);
    Form1.RenewIP;
    application.ProcessMessages;
    Form1.Log(Form1.LangSuccessfully.Caption);
  End;
  If Form1.CheckBoxResetFirewall.Checked Then
  Begin
    Form1.Log(Form1.CheckBoxResetFirewall.Caption);
    Form1.ResetFirewall;
    application.ProcessMessages;
    Form1.Log(Form1.LangSuccessfully.Caption);
  End;
  If Form1.CheckBoxResetProxy.Checked Then
  Begin
    Form1.Log(Form1.CheckBoxResetProxy.Caption);
    Form1.ResetProxy;
    application.ProcessMessages;
    Form1.Log(Form1.LangSuccessfully.Caption);
  End;
  If Form1.CheckBoxRepairWorkgroup.Checked Then
  Begin
    Form1.Log(Form1.CheckBoxRepairWorkgroup.Caption);
    Form1.RepairWorkgroup;
    application.ProcessMessages;
    Form1.Log(Form1.LangSuccessfully.Caption);
  End;
  If Form1.CheckBoxNetworkVisibility.Checked Then
  Begin
    Form1.Log(Form1.CheckBoxNetworkVisibility.Caption);
    Form1.RepairNetworkVisibility;
    application.ProcessMessages;
    Form1.Log(Form1.LangSuccessfully.Caption);
  End;
  If Form1.CheckBoxRebuildWMI.Checked Then
  Begin
    Form1.Log(Form1.CheckBoxRebuildWMI.Caption);
    Form1.RebuildWMI;
    application.ProcessMessages;
    Form1.Log(Form1.LangSuccessfully.Caption);
  End;
  If Form1.CheckBoxRestoreNetworkAdapters.Checked Then
  Begin
    Form1.Log(Form1.CheckBoxRestoreNetworkAdapters.Caption);
    Form1.RestoreNetworkAdapters;
    application.ProcessMessages;
    Form1.Log(Form1.LangSuccessfully.Caption);
  End;
  Form1.Log(Form1.LangRepairEnd.Caption);
  Form1.Log(Form1.LangRestart.Caption);
  Form1.MemoLogCom.Lines.Add('----------------------------------------');
  Form1.ActivityIndicator1.Visible := False;
  Form1.ActivityIndicator1.Animate := False;
  Form1.TabComButtons.Enabled := true;
End;

Function HasCheckedCheckboxes(GroupBox: TGroupBox): boolean;
Var
  i: Integer;
Begin
  Result := False;
  For i := 0 To GroupBox.ControlCount - 1 Do
  Begin
    If (GroupBox.Controls[i] Is TCheckBox) And (TCheckBox(GroupBox.Controls[i]).Checked) Then
    Begin
      Result := true;
      Exit;
    End;
  End;
End;

Procedure TForm1.ButtonApplayClick(Sender: TObject);
Begin
  If HasCheckedCheckboxes(GroupBoxSafely) Or HasCheckedCheckboxes(GroupBoxPro) Then
  Begin
    TabComButtons.Enabled := false;
    ThreadRepair := RepairThread.Create(False);
    ThreadRepair.FreeOnTerminate := true;
    ThreadRepair.Priority := tpNormal;
    TabComButtons.Enabled := true;
  End;
End;

Procedure TForm1.ButtonChangeDNSClick(Sender: TObject);
Begin
  SetTCPIPDNSAddresses;
  GetTCPIPDNSAddresses;
End;

End.

