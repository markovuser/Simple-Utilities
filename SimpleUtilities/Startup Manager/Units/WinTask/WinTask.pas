(* Delphi interface to Windows Task Scheduler 2.0

  © Dr. J. Rathlev, D-24222 Schwentinental (kontakt(a)rathlev-home.de)

  The contents of this file may be used under the terms of the
  Mozilla Public License ("MPL") or
  GNU Lesser General Public License Version 2 or later (the "LGPL")

  Software distributed under this License is distributed on an "AS IS" basis,
  WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
  the specific language governing rights and limitations under the License.

  Vers. 1.0 - Oct. 2017
  Vers. 1.6 - September 2019
  Vers. 2.0 - January 2022
  Vers. 2.1 - March 2023 -  Repetition trigger fixed
  Vers. 2.2 - March 2023 - structure of WinTask redesigned (separate settings object)
  last modified: March 2023
*)

Unit WinTask;

Interface

Uses
  Winapi.Windows, System.Classes, System.Contnrs, TaskSchedApi, System.TimeSpan;

Const
  BitMask: Array[1..16] Of word = (1, 2, 4, 8, $10, $20, $40, $80, $100, $200, $400, $800, $1000, $2000, $4000, $8000);
  NotAvailOnXp = $20001322;

Type
  TWinTaskStatus = (tsUnknown, tsReady, tsQueued, tsRunning, tsDisabled);

  TWinTaskCompatibility = (tcAT, tcXP, tcVista, tcWin7, tcWin10);

  TMultipleInstances = (miParallel, miQueue, miIgnoreNew, miStopExisting);

  TWinTaskActionType = (taExec, taCom, taMail, taMessage);

  TWinTaskTriggerType = (ttEvent, ttTime, ttDaily, ttWeekly, ttMonthly, ttMonthlyDow, ttIdle, ttRegistration, ttBoot, ttLogon, ttSessionStateChange, ttCustom);

  TLogonType = (ltNone, ltPassword, ltS4U, ltToken, ltGroup, ltService, ltTokenPassword);

  TWinServiceState = (ssUnknown, // Just fill the value 0
    ssStopped, // SERVICE_STOPPED
    ssStartPending, // SERVICE_START_PENDING
    ssStopPending, // SERVICE_STOP_PENDING
    ssRunning, // SERVICE_RUNNING
    ssContinuePending, // SERVICE_CONTINUE_PENDING
    ssPausePending, // SERVICE_PAUSE_PENDING
    ssPaused); // SERVICE_PAUSED

  TTimeInfo = Record
    DateTime: TDateTime;
    TimeZone: boolean;
    // TimeZoneOffset : integer; // time zone offset in minutes
  End;

  TWinTask = Class;

  TWinTaskSettings = Class;

  TWinTaskAction = Class(TCollectionItem)
  Private
    pAction: IAction;
    FActionType: TWinTaskActionType;
    Function GetActionType: TWinTaskActionType;
    Function GetActionTypeAsString: String;
    Function GetId: String;
    Procedure SetId(Const Value: String);
  Public
    Destructor Destroy; Override;
    Procedure SetTaskAction(Const Value: IAction);
    Property ActionType: TWinTaskActionType Read GetActionType;
    Property ActionTypeAsString: String Read GetActionTypeAsString;
    Property Id: String Read GetId Write SetId;
    Property TaskAction: IAction Read pAction;
  End;

  TWinTaskExecAction = Class(TWinTaskAction)
  Private
    Function GetPath: String;
    Procedure SetPath(Const Value: String);
    Function GetArguments: String;
    Procedure SetArguments(Const Value: String);
    Function GetWorkingDirectory: String;
    Procedure SetWorkingDirectory(Const Value: String);
  Public
    Property ApplicationPath: String Read GetPath Write SetPath;
    Property Arguments: String Read GetArguments Write SetArguments;
    Property WorkingDirectory: String Read GetWorkingDirectory Write SetWorkingDirectory;
  End;

  TWinTaskComHandlerAction = Class(TWinTaskAction)
  Private
    Function GetClassId: String;
    Procedure SetClassId(Const Value: String);
    Function GetData: String;
    Procedure SetData(Const Value: String);
  Public
    Property ClassId: String Read GetClassId Write SetClassId;
    Property Data: String Read GetData Write SetData;
  End;

  TWinTaskMailAction = Class(TWinTaskAction)
  Private
    Function GetServer: String;
    Function GetSubject: String;
    Function GetTo: String;
    Function GetCc: String;
    Function GetBcc: String;
    Function GetReplyTo: String;
    Function GetFrom: String;
    Function GetBody: String;
    // function GetHeaderFields
    // function GetAttachments
  Public
    // property Attachments: PSafeArray read GetAttachments write SetAttachments;
    Property Bcc: String Read GetBcc; // write SetBcc;
    Property Body: String Read GetBody; // write SetBody;
    Property Cc: String Read GetCc; // write SetCc;
    Property From: String Read GetFrom; // write SetFrom;
    // property HeaderFields: ITaskNamedValueCollection read GetHeaderFields write SetHeaderFields;
    Property ReplyTo: String Read GetReplyTo; // write SetReplyTo;
    Property Server: String Read GetServer; // write SetServer;
    Property Subject: String Read GetSubject; // write SetSubject;
    Property To_: String Read GetTo; // write SetTo;
  End;

  TWinTaskMessageAction = Class(TWinTaskAction)
  Private
    Function GetTitle: String;
    Procedure SetTitle(Const Value: String);
    Function GetMessageBody: String;
    Procedure SetMessageBody(Const Value: String);
  Public
    Property Title: String Read GetTitle Write SetTitle;
    Property MessageBody: String Read GetMessageBody Write SetMessageBody;
  End;

  TWinTaskActions = Class(TCollection)
  Private
    FTask: TWinTask;
    Function GetItem(Index: Integer): TWinTaskAction;
    Procedure SetItem(Index: Integer; Value: TWinTaskAction);
  Public
    Constructor Create(ATask: TWinTask);
    Function New(AActionType: TWinTaskActionType): TWinTaskAction;
    Function Add(AAction: IAction): TWinTaskAction; Overload;
    Procedure ClearAll;
    Procedure Remove(AIndex: Integer);
    Property Items[Index: Integer]: TWinTaskAction Read GetItem Write SetItem;
  End;

  TWinTaskTrigger = Class(TCollectionItem)
  Private
    pTrigger: ITrigger;
    FTriggerType: TWinTaskTriggerType;
    FTimeZone: boolean;
    FTimeOffset: Integer; // time zone offset in minutes

    Function GetDaysOfWeek: Integer;
    Procedure SetDaysOfWeek(Value: Integer);
    Function GetWeeksInterval: Integer;
    Procedure SetWeeksInterval(Value: Integer);
    Function GetWeeksOfMonth: Integer;
    Procedure SetWeeksOfMonth(Value: Integer);
    Function GetDaysOfMonth: Integer;
    Procedure SetDaysOfMonth(Value: Integer);
    Function GetMonthsOfYear: Integer;
    Procedure SetMonthsOfYear(Value: Integer);
    Function GetRunOnLastDayOfMonth: boolean;
    Procedure SetRunOnLastDayOfMonth(Value: boolean);
    Function GetRunOnLastWeekOfMonth: boolean;
    Procedure SetRunOnLastWeekOfMonth(Value: boolean);
    Function GetDaysInterval: SmallInt;
    Procedure SetDaysInterval(Value: SmallInt);
    Function GetDelay: cardinal; // time in seconds
    Procedure SetDelay(Value: cardinal);
    Function GetStopAtDurationEnd: boolean;
    Procedure SetStopAtDurationEnd(Value: boolean);
    Function GetDuration: cardinal; // time in seconds
    Procedure SetDuration(Value: cardinal);
    Function GetExecutionTimeLimit: cardinal; // time in seconds
    Procedure SetExecutionTimeLimit(Value: cardinal);
    Function GetEndTime: TDateTime;
    Procedure SetEndTime(Value: TDateTime);
    Function GetEnabled: boolean;
    Procedure SetEnabled(Value: boolean);
    Function GetId: String;
    Procedure SetId(Const Value: String);
    Function GetLogonUserId: String;
    Procedure SetLogonUserId(Const Value: String);
    Function GetInterval: cardinal; // time in seconds
    Procedure SetInterval(Value: cardinal);
    Function GetRandomDelay: cardinal; // time in seconds
    Procedure SetRandomDelay(Value: cardinal);
    Function GetStartTime: TDateTime;
    Procedure SetStartTime(Value: TDateTime);
    Function GetSubscription: String;
    Procedure SetSubscription(Const Value: String);
    Function GetTriggerType: TWinTaskTriggerType;
    Function GetTriggerTypeAsString: String;
    Function GetTriggerString: String;
  Public
    Constructor Create(Collection: TCollection);
    Destructor Destroy; Override;
    Procedure SetTaskTrigger(Const Value: ITrigger);
    Procedure SetToDefault(Const AUserId: String);
    // property Repetition: IRepetitionPattern read GetRepetition write Set_Repetition;
    Property Delay: cardinal Read GetDelay Write SetDelay;
    Property DaysInterval: SmallInt Read GetDaysInterval Write SetDaysInterval;
    Property DaysOfMonth: Integer Read GetDaysOfMonth Write SetDaysOfMonth;
    Property DaysOfWeek: Integer Read GetDaysOfWeek Write SetDaysOfWeek;
    Property StopAtDurationEnd: boolean Read GetStopAtDurationEnd Write SetStopAtDurationEnd;
    Property Duration: cardinal Read GetDuration Write SetDuration;
    Property ExecutionTimeLimit: cardinal Read GetExecutionTimeLimit Write SetExecutionTimeLimit;
    Property EndTime: TDateTime Read GetEndTime Write SetEndTime;
    Property Enabled: boolean Read GetEnabled Write SetEnabled;
    Property Id: String Read GetId Write SetId;
    Property Interval: cardinal Read GetInterval Write SetInterval;
    Property LogonUserId: String Read GetLogonUserId Write SetLogonUserId;
    Property MonthsOfYear: Integer Read GetMonthsOfYear Write SetMonthsOfYear;
    Property RandomDelay: cardinal Read GetRandomDelay Write SetRandomDelay;
    Property RunOnLastDayOfMonth: boolean Read GetRunOnLastDayOfMonth Write SetRunOnLastDayOfMonth;
    Property RunOnLastWeekOfMonth: boolean Read GetRunOnLastWeekOfMonth Write SetRunOnLastWeekOfMonth;
    Property StartTime: TDateTime Read GetStartTime Write SetStartTime;
    Property Subscription: String Read GetSubscription Write SetSubscription;
    Property TaskTrigger: ITrigger Read pTrigger;
    Property TriggerType: TWinTaskTriggerType Read GetTriggerType;
    Property TriggerTypeAsString: String Read GetTriggerTypeAsString;
    Property TriggerString: String Read GetTriggerString;
    Property UseTimeZone: boolean Read FTimeZone Write FTimeZone;
    Property WeeksInterval: Integer Read GetWeeksInterval Write SetWeeksInterval;
    Property WeeksOfMonth: Integer Read GetWeeksOfMonth Write SetWeeksOfMonth;
  End;

  TWinTaskTriggers = Class(TCollection)
  Private
    FTask: TWinTask;
    Function GetItem(Index: Integer): TWinTaskTrigger;
    Procedure SetItem(Index: Integer; Value: TWinTaskTrigger);
  Public
    Constructor Create(ATask: TWinTask);
    Function New(ATriggerType: TWinTaskTriggerType): TWinTaskTrigger;
    Function Add(ATrigger: ITrigger): TWinTaskTrigger; Overload;
    Procedure ClearAll;
    Procedure Remove(AIndex: Integer);
    Property Items[Index: Integer]: TWinTaskTrigger Read GetItem Write SetItem;
  End;

  TWinTaskIdleSettings = Class(TObject)
  Private
    pIdleSettings: IIdleSettings;
    Function GetIdleDuration: cardinal;
    Procedure SetIdleDuration(Value: cardinal);
    Function GetRestartOnIdle: boolean;
    Procedure SetRestartOnIdle(Value: boolean);
    Function GetStopOnIdleEnd: boolean;
    Procedure SetStopOnIdleEnd(Value: boolean);
    Function GetWaitTimeout: cardinal;
    Procedure SetWaitTimeout(Value: cardinal);
  Public
    Constructor Create(AIdleSettings: IIdleSettings);
    Property IdleDuration: cardinal Read GetIdleDuration Write SetIdleDuration;
    // time in seconds
    Property RestartOnIdle: boolean Read GetRestartOnIdle Write SetRestartOnIdle;
    Property StopOnIdleEnd: boolean Read GetStopOnIdleEnd Write SetStopOnIdleEnd;
    Property WaitTimeout: cardinal Read GetWaitTimeout Write SetWaitTimeout;
    // time in seconds
  End;

  TWinTaskSettings = Class(TObject)
  Private
    pSettings: ITaskSettings;
    FIdleSettings: TWinTaskIdleSettings;
    Function GetAllowDemandStart: boolean;
    Procedure SetAllowDemandStart(Value: boolean);
    Function GetAllowHardTerminate: boolean;
    Procedure SetAllowHardTerminate(Value: boolean);
    Function GetCompatibility: TWinTaskCompatibility;
    Procedure SetCompatibility(Value: TWinTaskCompatibility);
    Function GetDeleteExpiredTaskAfter: Integer; // time in hours
    Procedure SetDeleteExpiredTaskAfter(Const Value: Integer);
    Function GetExecutionTimeLimit: cardinal; // time in hours
    Procedure SetExecutionTimeLimit(Const Value: cardinal);
    Function GetHidden: boolean;
    Procedure SetHidden(Value: boolean);
    Function GetMultipleInstances: TMultipleInstances;
    Procedure SetMultipleInstances(Value: TMultipleInstances);
    Function GetDisallowOnBatteries: boolean;
    Procedure SetDisallowOnBatteries(Value: boolean);
    Function GetPriority: TThreadPriority;
    Procedure SetPriority(Value: TThreadPriority);
    Function GetRestartCount: cardinal;
    Procedure SetRestartCount(Value: cardinal);
    Function GetRestartInterval: cardinal;
    Procedure SetRestartInterval(Value: cardinal);
    Function GetRunIfMissed: boolean;
    Procedure SetRunIfMissed(Value: boolean);
    Function GetRunOnlyIfIdle: boolean;
    Procedure SetRunOnlyIfIdle(Value: boolean);
    Function GetRunOnlyIfNetwork: boolean;
    Procedure SetRunOnlyIfNetwork(Value: boolean);
    Function GetStopOnBatteries: boolean;
    Procedure SetStopOnBatteries(Value: boolean);
    Function GetWakeToRun: boolean;
    Procedure SetWakeToRun(Value: boolean);
  Public
    Constructor Create(Const ASettings: ITaskSettings);
    Property AllowDemandStart: boolean Read GetAllowDemandStart Write SetAllowDemandStart;
    Property AllowHardTerminate: boolean Read GetAllowHardTerminate Write SetAllowHardTerminate;
    Property Compatibility: TWinTaskCompatibility Read GetCompatibility Write SetCompatibility;
    Property DeleteExpiredTaskAfter: Integer Read GetDeleteExpiredTaskAfter Write SetDeleteExpiredTaskAfter;
    Property DisallowOnBatteries: boolean Read GetDisallowOnBatteries Write SetDisallowOnBatteries;
    Property ExecutionTimeLimit: cardinal Read GetExecutionTimeLimit Write SetExecutionTimeLimit;
    Property Hidden: boolean Read GetHidden Write SetHidden;
    Property IdleSettings: TWinTaskIdleSettings Read FIdleSettings;
    Property MultipleInstances: TMultipleInstances Read GetMultipleInstances Write SetMultipleInstances;
    // NetworkSettings
    Property Priority: TThreadPriority Read GetPriority Write SetPriority;
    Property RestartCount: cardinal Read GetRestartCount Write SetRestartCount;
    Property RestartInterval: cardinal Read GetRestartInterval Write SetRestartInterval; // time in minutes
    Property RunIfMissed: boolean Read GetRunIfMissed Write SetRunIfMissed;
    Property RunOnlyIfIdle: boolean Read GetRunOnlyIfIdle Write SetRunOnlyIfIdle;
    Property RunOnlyIfNetwork: boolean Read GetRunOnlyIfNetwork Write SetRunOnlyIfNetwork;
    Property StopOnBatteries: boolean Read GetStopOnBatteries Write SetStopOnBatteries;
    Property WakeToRun: boolean Read GetWakeToRun Write SetWakeToRun;
  End;

  TWinTask = Class(TObject)
  Private
    pDefinition: ITaskDefinition;
    FData: TMemoryStream;
    FActions: TWinTaskActions;
    FSelectedAction: Integer;
    FTriggers: TWinTaskTriggers;
    FSettings: TWinTaskSettings;
    Function GetAuthor: String;
    Procedure SetAuthor(Const Value: String);
    Function GetCompatibilityAsString: String;
    Function GetData: String;
    Procedure SetData(Const Value: String);
    Function GetDate: TDateTime;
    Function GetDateAsString: String;
    Procedure SetDate(Value: TDateTime);
    Function GetDescription: String;
    Procedure SetDescription(Const Value: String);
    Function GetDocumentation: String;
    Procedure SetDocumentation(Const Value: String);
    Function GetDisplayName: String;
    Procedure SetDisplayName(Const Value: String);
    Function GetGroupId: String;
    Procedure SetGroupId(Const Value: String);
    Function GetId: String;
    Procedure SetId(Const Value: String);
    Function GetUserId: String;
    Procedure SetUserId(Const Value: String);
    Function GetLogonType: TLogonType;
    Procedure SetLogonType(Value: TLogonType);
    Function GetRunLevel: boolean;
    Procedure SetRunLevel(Value: boolean);
    Function GetAction(Index: Integer): TWinTaskAction;
    Function GetActionCount: Integer;
    Function GetTrigger(Index: Integer): TWinTaskTrigger;
    Function GetTriggerCount: Integer;
  Public
    Constructor Create(Const ADefinition: ITaskDefinition);
    Destructor Destroy; Override;
    Function NewAction(AActionType: TWinTaskActionType): TWinTaskAction;
    Function DeleteAction(AIndex: Integer): boolean;
    Function NewTrigger(ATriggerType: TWinTaskTriggerType): TWinTaskTrigger;
    Function DeleteTrigger(AIndex: Integer): boolean;
    Procedure Refresh;
    Function IndexOfApp(Const AppFilter: String): Integer;
    Function IndexOfNextExecAction(FromIndex: Integer = 0): Integer;
    Property Actions[Index: Integer]: TWinTaskAction Read GetAction;
    Property ActionCount: Integer Read GetActionCount;
    Property Author: String Read GetAuthor Write SetAuthor;
    Property CompatibilityAsString: String Read GetCompatibilityAsString;
    Property Date: TDateTime Read GetDate Write SetDate;
    Property DateAsString: String Read GetDateAsString;
    Property Description: String Read GetDescription Write SetDescription;
    Property DisplayName: String Read GetDisplayName Write SetDisplayName;
    Property Documentation: String Read GetDocumentation Write SetDocumentation;
    Property GroupId: String Read GetGroupId Write SetGroupId;
    Property Id: String Read GetId Write SetId;
    Property LogonType: TLogonType Read GetLogonType Write SetLogonType;
    Property HighestRunLevel: boolean Read GetRunLevel Write SetRunLevel;
    Property SelectedAction: Integer Read FSelectedAction;
    Property Settings: TWinTaskSettings Read FSettings;
    Property Triggers[Index: Integer]: TWinTaskTrigger Read GetTrigger;
    Property TriggerCount: Integer Read GetTriggerCount;
    Property UserData: String Read GetData Write SetData;
    Property UserId: String Read GetUserId Write SetUserId;
  End;

  TWinRegisteredTask = Class(TObject)
  Private
    pRegisteredTask: IRegisteredTask;
    FTaskName: String;
    FIndex: Integer;
    FTask: TWinTask;
    Function GetEnabled: boolean;
    Procedure SetEnabled(Value: boolean);
    Function GetTaskResult: Integer;
    Function GetLastRunTime: TDateTime;
    Function GetLastRunTimeAsString: String;
    Function GetNextRunTime: TDateTime;
    Function GetNextRunTimeAsString: String;
    Function GetNumberOfMissedRuns: Integer;
    Function GetPath: String;
    Function GetStatus: TWinTaskStatus;
    Function GetStatusAsString: String;
  Public
    Constructor Create(Const ARegisteredTask: IRegisteredTask);
    Destructor Destroy; Override;
    Procedure Refresh;
    Procedure Run;
    Procedure Stop;
    Function IndexOfApp(Const AppFilter: String): Integer;
    Property Definition: TWinTask Read FTask;
    Property Enabled: boolean Read GetEnabled Write SetEnabled;
    Property LastResult: Integer Read GetTaskResult;
    Property LastRunTime: TDateTime Read GetLastRunTime;
    Property LastRunTimeAsString: String Read GetLastRunTimeAsString;
    Property NextRunTime: TDateTime Read GetNextRunTime;
    Property NextRunTimeAsString: String Read GetNextRunTimeAsString;
    Property NumberOfMissedRuns: Integer Read GetNumberOfMissedRuns;
    Property Path: String Read GetPath;
    Property Status: TWinTaskStatus Read GetStatus;
    Property StatusAsString: String Read GetStatusAsString;
    Property TaskIndex: Integer Read FIndex Write FIndex;
    Property TaskName: String Read FTaskName;
  End;

  TWinTaskList = Class(TObjectList);

  TWinTaskFolderList = Class(TObjectList);

  TWinTaskSubFolder = Class(TObject)
  Private
    pTaskFolder: ITaskFolder;
    Function GetName: String;
    Function GetPath: String;
  Public
    Constructor Create(Const ATaskFolder: ITaskFolder);
    Destructor Destroy; Override;
    Property Name: String Read GetName;
    Property Path: String Read GetPath;
  End;

  TWinTaskFolder = Class(TObject)
  Private
    pRootFolder: ITaskFolder;
    pTaskCollection: IRegisteredTaskCollection;
    pTaskFolderCollection: ITaskFolderCollection;
    FNumTasks, FNumFolders: LONG;
    FTasks: TWinTaskList;
    FFolders: TWinTaskFolderList;
    FErrMsg: String;
    FErrorCode: cardinal;
    Function GetName: String;
    Function GetPath: String;
    Function GetTask(Index: Integer): TWinRegisteredTask;
    Function GetFolder(Index: Integer): TWinTaskSubFolder;
  Public
    Constructor Create(ARootFolder: ITaskFolder);
    Destructor Destroy; Override;
    Function Refresh: HResult;
    Function DeleteTask(Const TaskName: String): boolean;
    Function IndexOfTask(Const TaskName: String): Integer;
    Function RegisterTask(Const TaskName: String; ATask: TWinTask; Username, Password: String): Integer;
    Function IndexOfFolder(Const FolderName: String): Integer;
    Function CreateFolder(Const AName: String): Integer;
    Function DeleteFolder(Const AName: String): boolean;
    Property ErrorCode: cardinal Read FErrorCode;
    Property ErrorMessage: String Read FErrMsg;
    Property FolderName: String Read GetName;
    Property FolderPath: String Read GetPath;
    Property Folders[Index: Integer]: TWinTaskSubFolder Read GetFolder;
    Property FolderCount: Integer Read FNumFolders;
    Property NumberOfTasks: Integer Read FNumTasks;
    Property Tasks[Index: Integer]: TWinRegisteredTask Read GetTask;
    Property TaskCount: Integer Read FNumTasks;
  End;

  // TWinTaskScheduler = class (TObject)
  TWinTaskScheduler = Class(TObject)
  Private
    pService: ITaskService;
    FFolder: String;
    FTaskFolder: TWinTaskFolder;
    FResult: HResult;
    Procedure SetFolder(Const AFolder: String);
  Protected
  Public
    Constructor Create;
    Destructor Destroy; Override;
    Function Init: HResult;
    Function Refresh: HResult;
    Function NewTask: TWinTask;
    Property Path: String Read FFolder Write SetFolder;
    Property TaskFolder: TWinTaskFolder Read FTaskFolder;
  Public
    Class Function IsRunning: boolean;
  End;

Function GetDefaultCompatibility: TWinTaskCompatibility;

Function GetServiceStatusByName(Const AServer, AServiceName: String): TWinServiceState;

Function CreateWinTaskScheduler(Var TaskSchedule: TWinTaskScheduler): HResult;

Implementation

Uses
  System.SysUtils, System.Win.ComObj, System.DateUtils, System.Math, System.StrUtils, Winapi.ActiveX,
  Winapi.WinSvc, System.Variants, WinTaskConsts;

Var
  TaskStateNames: Array[TWinTaskStatus] Of pointer = (@rsTrgUnknown, @rsTrgReady, @rsTrgQueued, @rsTrgRunning, @rsTrgDisabled);
  TaskActionNames: Array[TWinTaskActionType] Of pointer = (@rsTrgActionExec, @rsTragActionCom, @rsTragActionMail, @rsTragActionMsg);
  TaskTriggerDescriptions: Array[TWinTaskTriggerType] Of pointer = (@rsTrgTypeEvent, @rsTrgTypeTime, @rsTrgTypeDaily, @rsTrgTypeWeekly, @rsTrgTypeMonthly, @rsTrgTypeMonthly, @rsTrgTypeIdle, @rsTrgTypeRegister, @rsTrgTypeStartup, @rsTrgTypeLogon, @rsTrgTypeStateChg, @rsTrgTypeCustom);
  TaskWeeksOfMonthList: Array[1..5] Of pointer = (@rsTrgFirst, @rsTrgSecond, @rsTrgThird, @rsTrgFourth, @rsTrgLast);
  CompatibilityNames: Array[TWinTaskCompatibility] Of pointer = (@rsCompAT, @rsXP, @rsVista, @rsWin7, @rsWin10);
  TaskFlags: Array[TLogonType] Of LongWord = (TASK_LOGON_NONE, TASK_LOGON_PASSWORD, TASK_LOGON_S4U, TASK_LOGON_INTERACTIVE_TOKEN, TASK_LOGON_GROUP, TASK_LOGON_SERVICE_ACCOUNT, TASK_LOGON_INTERACTIVE_TOKEN_OR_PASSWORD);
  ActionTypes: Array[TWinTaskActionType] Of LongWord = (TASK_ACTION_EXEC, TASK_ACTION_COM_HANDLER, TASK_ACTION_SEND_EMAIL, TASK_ACTION_SHOW_MESSAGE);
  TriggerTypes: Array[TWinTaskTriggerType] Of LongWord = (TASK_TRIGGER_EVENT, TASK_TRIGGER_TIME, TASK_TRIGGER_DAILY, TASK_TRIGGER_WEEKLY, TASK_TRIGGER_MONTHLY, TASK_TRIGGER_MONTHLYDOW, TASK_TRIGGER_IDLE, TASK_TRIGGER_REGISTRATION, TASK_TRIGGER_BOOT, TASK_TRIGGER_LOGON, TASK_TRIGGER_SESSION_STATE_CHANGE, TASK_TRIGGER_CUSTOM_TRIGGER_01);
  Compatibilities: Array[TWinTaskCompatibility] Of LongWord = (TASK_COMPATIBILITY_AT, TASK_COMPATIBILITY_V1, TASK_COMPATIBILITY_V2, TASK_COMPATIBILITY_V2_1, TASK_COMPATIBILITY_V2_2);
  TaskInstancesPolicies: Array[TMultipleInstances] Of LongWord = (TASK_INSTANCES_PARALLEL, TASK_INSTANCES_QUEUE, TASK_INSTANCES_IGNORE_NEW, TASK_INSTANCES_STOP_EXISTING);
  Priorities: Array[TThreadPriority] Of Integer = (10, 9, 7, 5, 3, 1, 0);

  { --------------------------------------------------------------- }
  // Format without raising an exception on errors
Function TryFormat(Const AFormat: String; Const Args: Array Of Const): String;
Begin
  Try
    Result := Format(AFormat, Args);
  Except
    On E: Exception Do
      Result := rsFormatError + AFormat;
  End;
End;

{ ------------------------------------------------------------------- }
Function GetServiceStatusByName(Const AServer, AServiceName: String): TWinServiceState;
Var
  ServiceHandle, SCMHandle: DWORD;
  SCMAccess, Access: DWORD;
  ServiceStatus: TServiceStatus;
{$IFDEF Trace}
Const
  WinServiceStates: Array[0..7] Of String = ('Unknown',
    // Just fill the value 0
    'Stopped', // SERVICE_STOPPED
    'StartPending', // SERVICE_START_PENDING
    'StopPending', // SERVICE_STOP_PENDING
    'Running', // SERVICE_RUNNING
    'ContinuePending', // SERVICE_CONTINUE_PENDING
    'PausePending', // SERVICE_PAUSE_PENDING
    'Paused'); // SERVICE_PAUSED
{$ENDIF}
Begin
  Result := ssUnknown;
  SCMAccess := SC_MANAGER_CONNECT Or SC_MANAGER_ENUMERATE_SERVICE Or SC_MANAGER_QUERY_LOCK_STATUS;
  Access := SERVICE_INTERROGATE Or GENERIC_READ;
  SCMHandle := OpenSCManager(PChar(AServer), Nil, SCMAccess);
  If SCMHandle <> 0 Then
  Begin
    Try
      ServiceHandle := OpenService(SCMHandle, PChar(AServiceName), Access);
      If ServiceHandle <> 0 Then
      Begin
        Try
          ZeroMemory(@ServiceStatus, SizeOf(ServiceStatus));
          If QueryServiceStatus(ServiceHandle, ServiceStatus) Then
          Begin
            Result := TWinServiceState(ServiceStatus.dwCurrentState);
{$IFDEF Trace}
            // WriteDebugLog(TryFormat('Status of service "%s": %s',[AServiceName,WinServiceStates[ServiceStatus.dwCurrentState]]));
{$ENDIF}
          End;
        Finally
          CloseServiceHandle(ServiceHandle);
        End;
      End
{$IFDEF Trace}
      // else WriteDebugLog(TryFormat('Error opening service "%s" - ',[AServiceName])+SysErrorMessage(GetLastError));
{$ENDIF}
    Finally
      CloseServiceHandle(SCMHandle);
    End;
  End
{$IFDEF Trace}
  // else WriteDebugLog('Error opening service mananger - '+SysErrorMessage(GetLastError));
{$ENDIF}
End;

{ ------------------------------------------------------------------- }
// Read number (word) between next non numerical character,
Function ReadNextValue(Var sTime: String): word;
Var
  n, k, v: Integer;
Const
  Numbers: TSysCharSet = ['0'..'9'];
Begin
  If length(sTime) > 0 Then
  Begin
    n := 1;
    While (n <= length(sTime)) And Not CharInSet(sTime[n], Numbers) Do
      inc(n);
    k := n;
    While (k <= length(sTime)) And CharInSet(sTime[k], Numbers) Do
      inc(k);
    If TryStrToInt(copy(sTime, n, k - n), v) Then
      Result := v
    Else
      Result := 0;
    Delete(sTime, 1, k - 1);
  End
  Else
    Result := 0;
End;

Function GetUnitNumber(Const sOne, sMany: String; n: Integer): String;
Begin
  If n = 1 Then
    Result := TryFormat(sOne, [n])
  Else
    Result := TryFormat(sMany, [n]);
End;

// Convert boundary string to TDateTime
Function BoundaryToTimeInfo(Boundary: String): TTimeInfo;
Var
  y, m, d, h, n, s: Integer;
Begin
  With Result Do
  Begin
    DateTime := 0;
    TimeZone := false;
  End;
  If length(Boundary) = 0 Then
    Exit;
  y := ReadNextValue(Boundary);
  m := ReadNextValue(Boundary);
  d := ReadNextValue(Boundary);
  h := ReadNextValue(Boundary);
  n := ReadNextValue(Boundary);
  s := ReadNextValue(Boundary);
  Try
    Result.DateTime := EncodeDateTime(y, m, d, h, n, s, 0);
  Except
    Exit;
  End;
  If (length(Boundary) > 0) Then
  Begin // offset
    Result.TimeZone := true;
    // if Boundary[1]='Z' then Result.TimeZoneOffset:=0
    // Result:=Result-TTimeZone.Local.UtcOffset.TotalMinutes/MinsPerDay
    // else with Result do begin
    // minus:=Boundary[1]='-';
    // h:=ReadNextValue(Boundary);
    // n:=ReadNextValue(Boundary);
    // TimeZoneOffset:=h*MinsPerHour+n;
    // if minus then TimeZoneOffset:=-TimeZoneOffset;
    // end;
    // if TTimeZone.Local.IsDaylightTime(Now) then Result:=Result+OneHour;
  End
  Else
    With Result Do
    Begin
      TimeZone := false; // TimeZoneOffset:=0;
    End;
End;

Function BoundaryToDateTime(Const Boundary: String): TDateTime;
Begin
  Result := BoundaryToTimeInfo(Boundary).DateTime;
End;

Function DateTimeToBoundary(Value: TDateTime; UseTimeZone: boolean): String;
Var
  m: double;
Begin
  If Value < 1 Then
    Result := ''
  Else
  Begin
    Result := FormatDateTime('yyyy-mm-dd"T"hh:nn:ss', Value);
    If UseTimeZone Then
    Begin
      m := TTimeZone.Local.UtcOffset.TotalMinutes;
      If IsZero(m) Then
        Result := Result + 'Z'
      Else
      Begin
        If m < 0 Then
          Result := Result + '-'
        Else
          Result := Result + '+';
        Result := Result + FormatDateTime('hh:nn', abs(m) / MinsPerDay);
      End;
    End;
  End;
End;

Function DateTimeToText(DateTime: TDateTime): String;
// only values from 2000-01-01
Begin
  If DateTime < EncodeDate(2000, 1, 1) Then
    Result := ''
  Else
    Result := DateTimeToStr(DateTime);
End;

Function GetDefaultCompatibility: TWinTaskCompatibility;
Begin
  If (Win32Platform < VER_PLATFORM_WIN32_NT) Then
    Result := tcAT
  Else
  Begin
    If (Win32MajorVersion = 5) Then
      Result := tcXP
    Else If (Win32MajorVersion < 10) Then
    Begin
      If (Win32MinorVersion = 0) Then
        Result := tcVista
      Else
        Result := tcWin7
    End
    Else
      Result := tcWin10;
  End;
End;

Function TimeStringToSeconds(TimeString: String): cardinal;
Var
  n: word;
Begin
  Result := 0;
  If AnsiStartsText('P', TimeString) Then
  Begin
    Delete(TimeString, 1, 1);
    If AnsiStartsText('T', TimeString) Then
    Begin // time
      Repeat
        n := ReadNextValue(TimeString);
        If AnsiStartsText('H', TimeString) Then
          Result := Result + SecsPerHour * n;
        If AnsiStartsText('M', TimeString) Then
          Result := Result + SecsPerMin * n;
        If AnsiStartsText('S', TimeString) Then
          Result := Result + n;
        If length(TimeString) > 0 Then
          Delete(TimeString, 1, 1);
      Until length(TimeString) = 0;
    End
    Else
    Begin // days
      n := ReadNextValue(TimeString);
      If AnsiStartsText('D', TimeString) Then
        Result := Result + SecsPerDay * n;
    End;
  End
End;

Function SecondsToTimeString(Seconds: cardinal): String;
Var
  h, m, s: word;
Begin
  If Seconds = 0 Then
    Result := ''
  Else If Seconds >= SecsPerDay Then
    Result := 'P' + IntToStr(Seconds Div SecsPerDay) + 'D'
  Else
  Begin
    Result := 'PT';
    DivMod(Seconds, SecsPerHour, h, m);
    DivMod(m, SecsPerMin, m, s);
    If h > 0 Then
      Result := Result + IntToStr(h) + 'H';
    If m > 0 Then
      Result := Result + IntToStr(m) + 'M';
    If s > 0 Then
      Result := Result + IntToStr(s) + 'S';
  End;
End;

{ ------------------------------------------------------------------- }
Destructor TWinTaskAction.Destroy;
Begin
  pAction := Nil;
  Inherited Destroy;
End;

Procedure TWinTaskAction.SetTaskAction(Const Value: IAction);
Begin
  pAction := Value;
  FActionType := GetActionType;
  // if length(Id)=0 then SetId('Action'+IntToStr(Index+1));
End;

Function TWinTaskAction.GetActionType: TWinTaskActionType;
Begin
  Case pAction.type_ Of
    TASK_ACTION_COM_HANDLER:
      Result := taCom;
    TASK_ACTION_SEND_EMAIL:
      Result := taMail;
    TASK_ACTION_SHOW_MESSAGE:
      Result := taMessage;
  Else
    Result := taExec; // TASK_ACTION_EXEC
  End;
End;

Function TWinTaskAction.GetActionTypeAsString: String;
Begin
  Result := LoadResString(TaskActionNames[ActionType]);
End;

Function TWinTaskAction.GetId: String;
Begin
  Result := pAction.Id;
End;

Procedure TWinTaskAction.SetId(Const Value: String);
Begin
  pAction.Id := Value;
End;

{ ------------------------------------------------------------------- }
Function TWinTaskExecAction.GetPath: String;

  Function DequotedCmdStr(Const s: String; AQuote: Char): String;
  Begin
    Result := AnsiDequotedStr(s, '"');
    If (length(Result) = 0) And (length(s) > 2) And (s[1] = AQuote) And (s[length(s)] = AQuote) Then
    Begin
      Result := AnsiDequotedStr(AnsiQuotedStr(copy(s, 2, length(s) - 2), AQuote), AQuote);
    End;
  End;

Begin
  Result := DequotedCmdStr((pAction As IExecAction).Path, '"');
  // Result:=AnsiDequotedStr((pAction as IExecAction).Path,'"');
End;

Procedure TWinTaskExecAction.SetPath(Const Value: String);
Begin
  (pAction As IExecAction).Path := Value;
End;

Function TWinTaskExecAction.GetArguments: String;
Begin
  Result := (pAction As IExecAction).Arguments;
End;

Procedure TWinTaskExecAction.SetArguments(Const Value: String);
Begin
  (pAction As IExecAction).Arguments := Value;
End;

Function TWinTaskExecAction.GetWorkingDirectory: String;
Begin
  Result := (pAction As IExecAction).WorkingDirectory;
End;

Procedure TWinTaskExecAction.SetWorkingDirectory(Const Value: String);
Begin
  (pAction As IExecAction).WorkingDirectory := Value;
End;

{ ------------------------------------------------------------------- }
Function TWinTaskComHandlerAction.GetClassId: String;
Begin
  Result := (pAction As IComHandlerAction).ClassId;
End;

Procedure TWinTaskComHandlerAction.SetClassId(Const Value: String);
Begin
  (pAction As IComHandlerAction).ClassId := Value;
End;

Function TWinTaskComHandlerAction.GetData: String;
Begin
  Result := (pAction As IComHandlerAction).Data;
End;

Procedure TWinTaskComHandlerAction.SetData(Const Value: String);
Begin
  (pAction As IComHandlerAction).Data := Value;
End;

{ ------------------------------------------------------------------- }
Function TWinTaskMailAction.GetServer: String;
Begin
  Result := (pAction As IEMailAction).Server;
End;

Function TWinTaskMailAction.GetSubject: String;
Begin
  Result := (pAction As IEMailAction).Subject;
End;

Function TWinTaskMailAction.GetTo: String;
Begin
  Result := (pAction As IEMailAction).To_;
End;

Function TWinTaskMailAction.GetCc: String;
Begin
  Result := (pAction As IEMailAction).Cc;
End;

Function TWinTaskMailAction.GetBcc: String;
Begin
  Result := (pAction As IEMailAction).Bcc;
End;

Function TWinTaskMailAction.GetReplyTo: String;
Begin
  Result := (pAction As IEMailAction).ReplyTo;
End;

Function TWinTaskMailAction.GetFrom: String;
Begin
  Result := (pAction As IEMailAction).From;
End;

Function TWinTaskMailAction.GetBody: String;
Begin
  Result := (pAction As IEMailAction).Body;
End;

// function TWinTaskMailAction.GetHeaderFields
// function TWinTaskMailAction.GetAttachments

{ ------------------------------------------------------------------- }
Function TWinTaskMessageAction.GetTitle: String;
Begin
  Result := (pAction As IShowMessageAction).Title;
End;

Procedure TWinTaskMessageAction.SetTitle(Const Value: String);
Begin
  (pAction As IShowMessageAction).Title := Value;
End;

Function TWinTaskMessageAction.GetMessageBody: String;
Begin
  Result := (pAction As IShowMessageAction).MessageBody;
End;

Procedure TWinTaskMessageAction.SetMessageBody(Const Value: String);
Begin
  (pAction As IShowMessageAction).MessageBody := Value;
End;

{ ------------------------------------------------------------------- }
Constructor TWinTaskActions.Create(ATask: TWinTask);
Begin
  Inherited Create(TWinTaskAction);
  FTask := ATask;
End;

Function TWinTaskActions.GetItem(Index: Integer): TWinTaskAction;
Begin
  Result := TWinTaskAction(Inherited GetItem(Index));
End;

Procedure TWinTaskActions.SetItem(Index: Integer; Value: TWinTaskAction);
Begin
  Inherited SetItem(Index, Value);
End;

Function TWinTaskActions.New(AActionType: TWinTaskActionType): TWinTaskAction;
Begin
  Result := TWinTaskAction(Add);
  Result.SetTaskAction(FTask.pDefinition.Actions.Create(ActionTypes[AActionType]));
End;

Function TWinTaskActions.Add(AAction: IAction): TWinTaskAction;
Begin
  Result := TWinTaskAction(Add);
  Result.SetTaskAction(AAction);
End;

Procedure TWinTaskActions.ClearAll;
Begin
  FTask.pDefinition.Actions.Clear;
  Clear;
End;

Procedure TWinTaskActions.Remove(AIndex: Integer);
Begin
  FTask.pDefinition.Actions.Remove(AIndex);
  Delete(AIndex);
End;

{ ------------------------------------------------------------------- }
Constructor TWinTaskTrigger.Create(Collection: TCollection);
Begin
  Inherited Create(Collection);
  FTimeZone := false;
  FTimeOffset := 0;
End;

Destructor TWinTaskTrigger.Destroy;
Begin
  pTrigger := Nil;
  Inherited Destroy;
End;

Procedure TWinTaskTrigger.SetToDefault(Const AUserId: String);
Begin
  StartTime := Now;
  SetLogonUserId(AUserId); // required for ttLogon
  // EndTime:=Now+DaysInAYear(YearOf(Now));
  // Interval:=SecsPerHour;
  // Duration:=SecsPerDay;
  // ExecutionTimeLimit:=3*SecsPerDay;
  // case TriggerType of
  // ttDaily : begin
  // RandomDelay:=SecsPerHour;
  // end;
  // end;
End;

Procedure TWinTaskTrigger.SetTaskTrigger(Const Value: ITrigger);
Begin
  pTrigger := Value;
  FTriggerType := GetTriggerType;
  // if length(Id)=0 then SetId('Trigger'+IntToStr(Index+1));
  FTimeZone := BoundaryToTimeInfo(pTrigger.StartBoundary).TimeZone;
End;

Function TWinTaskTrigger.GetDaysOfWeek: Integer;
Begin
  If FTriggerType = ttWeekly Then
    Result := IWeeklyTrigger(pTrigger).DaysOfWeek
  Else If FTriggerType = ttMonthlyDow Then
    Result := IMonthlyDowTrigger(pTrigger).DaysOfWeek
  Else
    Result := 0;
End;

Procedure TWinTaskTrigger.SetDaysOfWeek(Value: Integer);
Begin
  If (Value > 0) And (Value < $80) Then
  Begin
    If FTriggerType = ttWeekly Then
      IWeeklyTrigger(pTrigger).DaysOfWeek := Value
    Else If FTriggerType = ttMonthlyDow Then
      IMonthlyDowTrigger(pTrigger).DaysOfWeek := Value;
  End;
End;

Function TWinTaskTrigger.GetWeeksInterval: Integer;
Begin
  If FTriggerType = ttWeekly Then
    Result := IWeeklyTrigger(pTrigger).WeeksInterval
  Else
    Result := 0;
End;

Procedure TWinTaskTrigger.SetWeeksInterval(Value: Integer);
Begin
  If (Value > 0) And (FTriggerType = ttWeekly) Then
    IWeeklyTrigger(pTrigger).WeeksInterval := Value;
End;

Function TWinTaskTrigger.GetWeeksOfMonth: Integer;
Begin
  If FTriggerType = ttMonthlyDow Then
  Begin
    // Note: Get_WeeksOfMonth does not return $10 (16) for last week in month
    // use Get_RunOnLastWeekOfMonth instead as workaround
    Result := IMonthlyDowTrigger(pTrigger).WeeksOfMonth;
    If RunOnLastWeekOfMonth Then
      Result := Result Or $10;
  End
  Else
    Result := 0;
End;

Procedure TWinTaskTrigger.SetWeeksOfMonth(Value: Integer);
Begin
  If (Value > 0) And (Value < $20) And (FTriggerType = ttMonthlyDow) Then
    // Note: Set_WeeksOfMonth can handle $10 (16) for last week in month
    IMonthlyDowTrigger(pTrigger).WeeksOfMonth := Value;
End;

Function TWinTaskTrigger.GetDaysOfMonth: Integer;
Begin
  If FTriggerType = ttMonthly Then
    Result := IMonthlyTrigger(pTrigger).DaysOfMonth
  Else
    Result := 0;
End;

Procedure TWinTaskTrigger.SetDaysOfMonth(Value: Integer);
Begin
  If (Value > 0) And (FTriggerType = ttMonthly) Then
    IMonthlyTrigger(pTrigger).DaysOfMonth := Value;
End;

Function TWinTaskTrigger.GetMonthsOfYear: Integer;
Begin
  If FTriggerType = ttMonthly Then
    Result := IMonthlyTrigger(pTrigger).MonthsOfYear
  Else If FTriggerType = ttMonthlyDow Then
    Result := IMonthlyDowTrigger(pTrigger).MonthsOfYear
  Else
    Result := 0;
End;

Procedure TWinTaskTrigger.SetMonthsOfYear(Value: Integer);
Begin
  If (Value > 0) And (Value < $1000) Then
  Begin
    If FTriggerType = ttMonthly Then
      IMonthlyTrigger(pTrigger).MonthsOfYear := Value
    Else If FTriggerType = ttMonthlyDow Then
      IMonthlyDowTrigger(pTrigger).MonthsOfYear := Value;
  End;
End;

Function TWinTaskTrigger.GetRunOnLastDayOfMonth: boolean;
Begin
  If FTriggerType = ttMonthly Then
    Result := IMonthlyTrigger(pTrigger).RunOnLastDayOfMonth
  Else
    Result := false;
End;

Procedure TWinTaskTrigger.SetRunOnLastDayOfMonth(Value: boolean);
Begin
  If FTriggerType = ttMonthly Then
    IMonthlyTrigger(pTrigger).RunOnLastDayOfMonth := Value;
End;

Function TWinTaskTrigger.GetRunOnLastWeekOfMonth: boolean;
Begin
  If FTriggerType = ttMonthlyDow Then
    Result := IMonthlyDowTrigger(pTrigger).RunOnLastWeekOfMonth
  Else
    Result := false;
End;

Procedure TWinTaskTrigger.SetRunOnLastWeekOfMonth(Value: boolean);
Begin
  If FTriggerType = ttMonthlyDow Then
    IMonthlyDowTrigger(pTrigger).RunOnLastWeekOfMonth := Value
End;

Function TWinTaskTrigger.GetRandomDelay: cardinal; // time in seconds
Begin
  Case FTriggerType Of
    ttTime:
      Result := TimeStringToSeconds(ITimeTrigger(pTrigger).RandomDelay);
    ttDaily:
      Result := TimeStringToSeconds(IDailyTrigger(pTrigger).RandomDelay);
    ttWeekly:
      Result := TimeStringToSeconds(IWeeklyTrigger(pTrigger).RandomDelay);
    ttMonthly:
      Result := TimeStringToSeconds(IMonthlyTrigger(pTrigger).RandomDelay);
    ttMonthlyDow:
      Result := TimeStringToSeconds(IMonthlyDowTrigger(pTrigger).RandomDelay);
  Else
    Result := 0;
  End;
End;

Procedure TWinTaskTrigger.SetRandomDelay(Value: cardinal);
Var
  st: String;
Begin
  st := SecondsToTimeString(Value);
  Case FTriggerType Of
    ttTime:
      ITimeTrigger(pTrigger).RandomDelay := st;
    ttDaily:
      IDailyTrigger(pTrigger).RandomDelay := st;
    ttWeekly:
      IWeeklyTrigger(pTrigger).RandomDelay := st;
    ttMonthly:
      IMonthlyTrigger(pTrigger).RandomDelay := st;
    ttMonthlyDow:
      IMonthlyDowTrigger(pTrigger).RandomDelay := st;
  End;
End;

Function TWinTaskTrigger.GetDaysInterval: SmallInt;
Begin
  If FTriggerType = ttDaily Then
    Result := IDailyTrigger(pTrigger).DaysInterval
  Else
    Result := 0;
End;

Procedure TWinTaskTrigger.SetDaysInterval(Value: SmallInt);
Begin
  If (Value > 0) And (FTriggerType = ttDaily) Then
    IDailyTrigger(pTrigger).DaysInterval := Value;
End;

Function TWinTaskTrigger.GetDelay: cardinal; // time in seconds
Begin
  Case FTriggerType Of
    ttBoot:
      Result := TimeStringToSeconds(IBootTrigger(pTrigger).Delay);
    ttLogon:
      Result := TimeStringToSeconds(ILogonTrigger(pTrigger).Delay);
    ttEvent:
      Result := TimeStringToSeconds(IEventTrigger(pTrigger).Delay);
  Else
    Result := 0;
  End;
End;

Procedure TWinTaskTrigger.SetDelay(Value: cardinal);
Var
  st: String;
Begin
  st := SecondsToTimeString(Value);
  Case FTriggerType Of
    ttBoot:
      IBootTrigger(pTrigger).Delay := st;
    ttLogon:
      ILogonTrigger(pTrigger).Delay := st;
    ttEvent:
      IEventTrigger(pTrigger).Delay := st;
  End;
End;

Function TWinTaskTrigger.GetStopAtDurationEnd: boolean;
Begin
  Result := pTrigger.Repetition.StopAtDurationEnd;
End;

Procedure TWinTaskTrigger.SetStopAtDurationEnd(Value: boolean);
Begin
  pTrigger.Repetition.StopAtDurationEnd := Value;
End;

Function TWinTaskTrigger.GetDuration: cardinal; // time in seconds
Begin
  Result := TimeStringToSeconds(pTrigger.Repetition.Duration);
End;

Procedure TWinTaskTrigger.SetDuration(Value: cardinal);
Begin
  pTrigger.Repetition.Duration := SecondsToTimeString(Value);
End;

Function TWinTaskTrigger.GetInterval: cardinal; // time in seconds
Begin
  Result := TimeStringToSeconds(pTrigger.Repetition.Interval);
End;

Procedure TWinTaskTrigger.SetInterval(Value: cardinal);
Begin
  pTrigger.Repetition.Interval := SecondsToTimeString(Value);
End;

Function TWinTaskTrigger.GetExecutionTimeLimit: cardinal; // time in seconds
Begin
  Result := TimeStringToSeconds(pTrigger.ExecutionTimeLimit);
End;

Procedure TWinTaskTrigger.SetExecutionTimeLimit(Value: cardinal);
Begin
  pTrigger.ExecutionTimeLimit := SecondsToTimeString(Value);
End;

Function TWinTaskTrigger.GetEndTime: TDateTime;
Begin
  Result := BoundaryToDateTime(pTrigger.EndBoundary);
End;

Procedure TWinTaskTrigger.SetEndTime(Value: TDateTime);
Begin
  pTrigger.EndBoundary := DateTimeToBoundary(Value, FTimeZone);
End;

Function TWinTaskTrigger.GetEnabled: boolean;
Begin
  Result := pTrigger.Enabled;
End;

Procedure TWinTaskTrigger.SetEnabled(Value: boolean);
Begin
  pTrigger.Enabled := Value;
End;

Function TWinTaskTrigger.GetId: String;
Begin
  Result := pTrigger.Id;
End;

Procedure TWinTaskTrigger.SetId(Const Value: String);
Begin
  pTrigger.Id := Value;
End;

Function TWinTaskTrigger.GetStartTime: TDateTime;
Begin
  Result := BoundaryToDateTime(pTrigger.StartBoundary);
End;

Procedure TWinTaskTrigger.SetStartTime(Value: TDateTime);
Begin
  pTrigger.StartBoundary := DateTimeToBoundary(Value, FTimeZone);
End;

Function TWinTaskTrigger.GetLogonUserId: String;
Begin
  If FTriggerType = ttLogon Then
    Result := ILogonTrigger(pTrigger).UserId
  Else
    Result := '';
End;

Procedure TWinTaskTrigger.SetLogonUserId(Const Value: String);
Begin
  If FTriggerType = ttLogon Then
    ILogonTrigger(pTrigger).UserId := Value;
End;

Function TWinTaskTrigger.GetSubscription: String;
Begin
  If FTriggerType = ttEvent Then
    Result := IEventTrigger(pTrigger).Subscription
  Else
    Result := '';
End;

Procedure TWinTaskTrigger.SetSubscription(Const Value: String);
Begin
  If FTriggerType = ttEvent Then
    IEventTrigger(pTrigger).Subscription := Value;
End;

Function TWinTaskTrigger.GetTriggerType: TWinTaskTriggerType;
Begin
  Case pTrigger.type_ Of
    TASK_TRIGGER_EVENT:
      Result := ttEvent;
    TASK_TRIGGER_TIME:
      Result := ttTime;
    TASK_TRIGGER_DAILY:
      Result := ttDaily;
    TASK_TRIGGER_WEEKLY:
      Result := ttWeekly;
    TASK_TRIGGER_MONTHLY:
      Result := ttMonthly;
    TASK_TRIGGER_MONTHLYDOW:
      Result := ttMonthlyDow;
    TASK_TRIGGER_IDLE:
      Result := ttIdle;
    TASK_TRIGGER_REGISTRATION:
      Result := ttRegistration;
    TASK_TRIGGER_BOOT:
      Result := ttBoot;
    TASK_TRIGGER_LOGON:
      Result := ttLogon;
    TASK_TRIGGER_SESSION_STATE_CHANGE:
      Result := ttSessionStateChange;
  Else
    Result := ttCustom; // TASK_TRIGGER_CUSTOM_TRIGGER_01
  End;
End;

Function TWinTaskTrigger.GetTriggerTypeAsString: String;
Begin
  Result := LoadResString(TaskTriggerDescriptions[TriggerType]);
End;

Function TWinTaskTrigger.GetTriggerString: String;
Var
  dt, dd: TDateTime;
  nr, nd: cardinal;

  Function GetWeekdayList(Days: Integer): String;
  Var
    i: Integer;
  Begin
    Result := '';
    For i := 1 To 7 Do
    Begin
      If Days And 1 <> 0 Then
      Begin
        If length(Result) > 0 Then
          Result := Result + ', ';
        Result := Result + FormatSettings.LongDayNames[i];
      End;
      Days := Days Shr 1;
    End;
  End;

  Function WeeksOfMonthList(Weeks: Integer): String;
  Var
    i: Integer;
  Begin
    Result := '';
    For i := 1 To 5 Do
    Begin
      If Weeks And 1 <> 0 Then
      Begin
        If length(Result) > 0 Then
          Result := Result + ', ';
        Result := Result + LoadResString(TaskWeeksOfMonthList[i]);
      End;
      Weeks := Weeks Shr 1;
    End;
  End;

  Function GetMonthDayList(Days: Integer): String;
  Var
    i: Integer;
  Begin
    Result := '';
    For i := 1 To 32 Do
    Begin
      If Days And 1 <> 0 Then
      Begin
        If length(Result) > 0 Then
          Result := Result + ', ';
        If i = 32 Then
          Result := Result + rsTrgLast
        Else
          Result := Result + IntToStr(i);
      End;
      Days := Days Shr 1;
    End;
  End;

  Function GetMonthList(Months: Integer): String;
  Var
    i: Integer;
  Begin
    Result := '';
    For i := 1 To 12 Do
    Begin
      If Months And 1 <> 0 Then
      Begin
        If length(Result) > 0 Then
          Result := Result + ', ';
        Result := Result + FormatSettings.LongMonthNames[i];
      End;
      Months := Months Shr 1;
    End;
  End;

  Function FormatSecondsToTimeString(Seconds: cardinal): String;
  Var
    h, m, s: word;
  Begin
    If Seconds >= SecsPerDay Then
      Result := GetUnitNumber(rsTrgEveryDay, rsTrgEveryDays, Seconds Div SecsPerDay)
    Else
    Begin
      DivMod(Seconds, SecsPerHour, h, m);
      DivMod(m, SecsPerMin, m, s);
      If h > 0 Then
        Result := GetUnitNumber(rsTrgEveryHour, rsTrgEveryHours, h)
      Else If m > 0 Then
        Result := GetUnitNumber(rsTrgEveryMin, rsTrgEveryMins, m)
      Else
        Result := GetUnitNumber(rsTrgEverySec, rsTrgEverySecs, s);
    End;
  End;

  Function TimeToStr(dt: TDateTime): String;
  // replacement for routine from sysutils
  Begin
    Result := FormatDateTime('hh:nn', dt);
  End;

Begin
  dt := BoundaryToDateTime(pTrigger.StartBoundary); // 2016-12-19T16:55:00
  dd := DateOf(dt);
  dt := TimeOf(dt);
  Case pTrigger.type_ Of
    // TASK_TRIGGER_EVENT:
    TASK_TRIGGER_TIME:
      Result := TryFormat(rsTrgOnce, [TimeToStr(dt), DateToStr(dd)]);
    TASK_TRIGGER_DAILY:
      With pTrigger As IDailyTrigger Do
      Begin
        If DaysInterval > 1 Then
        Begin
          Result := TryFormat(rsTrgRDailyAt, [TimeToStr(dt), DaysInterval]);
          If length(Repetition.Interval) > 0 Then
          Begin
            nr := TimeStringToSeconds(Repetition.Interval);
            nd := TimeStringToSeconds(Repetition.Duration);
            Result := Result + TryFormat(rsTrgRepeat, [FormatSecondsToTimeString(nr), FormatSecondsToTimeString(nd)]);
          End;
        End
        Else
          Result := TryFormat(rsTrgDailyAt, [TimeToStr(dt)]);
      End;
    TASK_TRIGGER_WEEKLY:
      With pTrigger As IWeeklyTrigger Do
      Begin
        If WeeksInterval > 1 Then
          Result := TryFormat(rsTrgRWeekly, [TimeToStr(dt), GetWeekdayList(DaysOfWeek), WeeksInterval, DateToStr(dd)])
        Else
          Result := TryFormat(rsTrgWeekly, [TimeToStr(dt), GetWeekdayList(DaysOfWeek), DateToStr(dd)]);
        // Result:=TryFormat(,[])
      End;
    TASK_TRIGGER_MONTHLY:
      With pTrigger As IMonthlyTrigger Do
      Begin
        Result := TryFormat(rsTrgMonthly, [TimeToStr(dt), GetMonthDayList(DaysOfMonth), GetMonthList(MonthsOfYear), DateToStr(dd)])
      End;
    TASK_TRIGGER_MONTHLYDOW:
      With pTrigger As IMonthlyDowTrigger Do
      Begin
        Result := TryFormat(rsTrgDMonthly, [WeeksOfMonthList(GetWeeksOfMonth), GetWeekdayList(DaysOfWeek), GetMonthList(MonthsOfYear), DateToStr(dd)])
      End;
    TASK_TRIGGER_IDLE:
      Result := rsTrgIdle;
    TASK_TRIGGER_REGISTRATION:
      Result := rsTrgRegistration;
    TASK_TRIGGER_BOOT:
      Begin
        Result := rsTrgStartup;
        If StartTime >= 1 Then
          Result := Result + TryFormat(rsTrgEventTime, [TimeToStr(dt), DateToStr(dd)]);
      End;
    TASK_TRIGGER_LOGON:
      Begin
        If length(LogonUserId) = 0 Then
          Result := rsTrgAnyLogon
        Else
          Result := TryFormat(rsTrgLogon, [LogonUserId]);
        If StartTime >= 1 Then
          Result := Result + TryFormat(rsTrgEventTime, [TimeToStr(dt), DateToStr(dd)]);
      End;
    TASK_TRIGGER_EVENT:
      Begin
        Result := rsTrgEvent;
        If StartTime >= 1 Then
          Result := Result + TryFormat(rsTrgEventTime, [TimeToStr(dt), DateToStr(dd)]);
      End;
    // TASK_TRIGGER_SESSION_STATE_CHANGE = $0000000B;
    // TASK_TRIGGER_CUSTOM_: '+TRIGGER_01 = $0000000C;
  Else
    Result := rsTrgUnknown;
  End;
End;

{ ------------------------------------------------------------------- }
Constructor TWinTaskTriggers.Create(ATask: TWinTask);
Begin
  Inherited Create(TWinTaskTrigger);
  FTask := ATask;
End;

Function TWinTaskTriggers.GetItem(Index: Integer): TWinTaskTrigger;
Begin
  Result := TWinTaskTrigger(Inherited GetItem(Index));
End;

Procedure TWinTaskTriggers.SetItem(Index: Integer; Value: TWinTaskTrigger);
Begin
  Inherited SetItem(Index, Value);
End;

Function TWinTaskTriggers.New(ATriggerType: TWinTaskTriggerType): TWinTaskTrigger;
Begin
  Result := TWinTaskTrigger(Add);
  Result.SetTaskTrigger(FTask.pDefinition.Triggers.Create(TriggerTypes[ATriggerType]));
End;

Function TWinTaskTriggers.Add(ATrigger: ITrigger): TWinTaskTrigger;
Begin
  Result := TWinTaskTrigger(Add);
  Result.SetTaskTrigger(ATrigger);
End;

Procedure TWinTaskTriggers.ClearAll;
Begin
  FTask.pDefinition.Triggers.Clear;
  Clear;
End;

Procedure TWinTaskTriggers.Remove(AIndex: Integer);
Begin
  FTask.pDefinition.Triggers.Remove(AIndex + 1);
  Delete(AIndex);
End;

{ ------------------------------------------------------------------- }
Constructor TWinTaskIdleSettings.Create(AIdleSettings: IIdleSettings);
Begin
  Inherited Create;
  pIdleSettings := AIdleSettings;
End;

Function TWinTaskIdleSettings.GetIdleDuration: cardinal;
Begin
  Result := TimeStringToSeconds(pIdleSettings.IdleDuration);
End;

Procedure TWinTaskIdleSettings.SetIdleDuration(Value: cardinal);
Begin
  pIdleSettings.IdleDuration := SecondsToTimeString(Value);
End;

Function TWinTaskIdleSettings.GetRestartOnIdle: boolean;
Begin
  Result := pIdleSettings.RestartOnIdle;
End;

Procedure TWinTaskIdleSettings.SetRestartOnIdle(Value: boolean);
Begin
  pIdleSettings.RestartOnIdle := Value;
End;

Function TWinTaskIdleSettings.GetStopOnIdleEnd: boolean;
Begin
  Result := pIdleSettings.StopOnIdleEnd;
End;

Procedure TWinTaskIdleSettings.SetStopOnIdleEnd(Value: boolean);
Begin
  pIdleSettings.StopOnIdleEnd := Value;
End;

Function TWinTaskIdleSettings.GetWaitTimeout: cardinal;
Begin
  Result := TimeStringToSeconds(pIdleSettings.WaitTimeout);
End;

Procedure TWinTaskIdleSettings.SetWaitTimeout(Value: cardinal);
Begin
  pIdleSettings.WaitTimeout := SecondsToTimeString(Value);
End;

{ ------------------------------------------------------------------- }
Constructor TWinTaskSettings.Create(Const ASettings: ITaskSettings);
Begin
  Inherited Create;
  pSettings := ASettings;
  FIdleSettings := TWinTaskIdleSettings.Create(pSettings.IdleSettings);
End;

Function TWinTaskSettings.GetAllowDemandStart: boolean;
Begin
  Result := pSettings.AllowDemandStart;
End;

Procedure TWinTaskSettings.SetAllowDemandStart(Value: boolean);
Begin
  pSettings.AllowDemandStart := Value;
End;

Function TWinTaskSettings.GetAllowHardTerminate: boolean;
Begin
  Result := pSettings.AllowHardTerminate;
End;

Procedure TWinTaskSettings.SetAllowHardTerminate(Value: boolean);
Begin
  pSettings.AllowHardTerminate := Value;
End;

Function TWinTaskSettings.GetCompatibility: TWinTaskCompatibility;
Begin
  Case pSettings.Compatibility Of
    TASK_COMPATIBILITY_AT:
      Result := tcAT;
    TASK_COMPATIBILITY_V1:
      Result := tcXP;
    TASK_COMPATIBILITY_V2:
      Result := tcVista; // default value for new task
    TASK_COMPATIBILITY_V2_1:
      Result := tcWin7;
  Else
    Result := tcWin10;
  End;
End;

Procedure TWinTaskSettings.SetCompatibility(Value: TWinTaskCompatibility);
Begin
  pSettings.Compatibility := Compatibilities[Value];
End;

// DeleteExpiredTaskAfter = -1  disabled
// =  0  immediate
// >  0  number of hours
Function TWinTaskSettings.GetDeleteExpiredTaskAfter: Integer;
Var
  s: String;
Begin
  s := pSettings.DeleteExpiredTaskAfter;
  If length(s) > 0 Then
    Result := TimeStringToSeconds(s) Div SecsPerHour
  Else
    Result := -1;
End;

Procedure TWinTaskSettings.SetDeleteExpiredTaskAfter(Const Value: Integer);
Var
  s: String;
Begin
  If Value < 0 Then
    s := ''
  Else If Value = 0 Then
    s := 'PT0S'
  Else
    s := SecondsToTimeString(Value * SecsPerHour);
  pSettings.DeleteExpiredTaskAfter := s;
End;

Function TWinTaskSettings.GetExecutionTimeLimit: cardinal; // time in hours
Begin
  Result := TimeStringToSeconds(pSettings.ExecutionTimeLimit) Div SecsPerHour;
End;

Procedure TWinTaskSettings.SetExecutionTimeLimit(Const Value: cardinal);
Begin
  pSettings.ExecutionTimeLimit := SecondsToTimeString(Value * SecsPerHour);
End;

Function TWinTaskSettings.GetRunIfMissed: boolean;
Begin
  Result := pSettings.StartWhenAvailable;
End;

Procedure TWinTaskSettings.SetRunIfMissed(Value: boolean);
Begin
  pSettings.StartWhenAvailable := Value;
End;

Function TWinTaskSettings.GetRunOnlyIfIdle: boolean;
Begin
  Result := pSettings.RunOnlyIfIdle;
End;

Procedure TWinTaskSettings.SetRunOnlyIfIdle(Value: boolean);
Begin
  pSettings.RunOnlyIfIdle := Value;
End;

Function TWinTaskSettings.GetRunOnlyIfNetwork: boolean;
Begin
  Result := pSettings.RunOnlyIfNetworkAvailable;
End;

Procedure TWinTaskSettings.SetRunOnlyIfNetwork(Value: boolean);
Begin
  pSettings.RunOnlyIfNetworkAvailable := Value;
End;

Function TWinTaskSettings.GetHidden: boolean;
Begin
  Result := pSettings.Hidden;
End;

Procedure TWinTaskSettings.SetHidden(Value: boolean);
Begin
  pSettings.Hidden := Value;
End;

Function TWinTaskSettings.GetMultipleInstances: TMultipleInstances;
Begin
  Case pSettings.MultipleInstances Of
    TASK_INSTANCES_QUEUE:
      Result := miQueue;
    TASK_INSTANCES_IGNORE_NEW:
      Result := miIgnoreNew;
    TASK_INSTANCES_STOP_EXISTING:
      Result := miStopExisting;
  Else
    Result := miParallel;
  End;
End;

Function TWinTaskSettings.GetPriority: TThreadPriority;
Begin
  Case pSettings.Priority Of
    0:
      Result := tpTimeCritical;
    1:
      Result := tpHighest;
    2, 3:
      Result := tpHigher;
    7, 8:
      Result := tpLower;
    9:
      Result := tpLowest;
    10:
      Result := tpIdle;
  Else
    Result := tpNormal;
  End;
End;

Procedure TWinTaskSettings.SetPriority(Value: TThreadPriority);
Begin
  pSettings.Priority := Priorities[Value];
End;

Function TWinTaskSettings.GetRestartCount: cardinal;
Begin
  Result := pSettings.RestartCount;
End;

Procedure TWinTaskSettings.SetRestartCount(Value: cardinal);
Begin
  pSettings.RestartCount := Value;
End;

Function TWinTaskSettings.GetRestartInterval: cardinal;
Begin
  Result := TimeStringToSeconds(pSettings.RestartInterval) Div 60;
End;

Procedure TWinTaskSettings.SetRestartInterval(Value: cardinal);
Begin
  pSettings.RestartInterval := SecondsToTimeString(Value * 60);
End;

Function TWinTaskSettings.GetWakeToRun: boolean;
Begin
  Result := pSettings.WakeToRun;
End;

Procedure TWinTaskSettings.SetWakeToRun(Value: boolean);
Begin
  pSettings.WakeToRun := Value;
End;

Procedure TWinTaskSettings.SetMultipleInstances(Value: TMultipleInstances);
Begin
  pSettings.MultipleInstances := TaskInstancesPolicies[Value];
End;

Function TWinTaskSettings.GetDisallowOnBatteries: boolean;
Begin
  Result := pSettings.DisallowStartIfOnBatteries;
End;

Procedure TWinTaskSettings.SetDisallowOnBatteries(Value: boolean);
Begin
  pSettings.DisallowStartIfOnBatteries := Value;
End;

Function TWinTaskSettings.GetStopOnBatteries: boolean;
Begin
  Result := pSettings.StopIfGoingOnBatteries;
End;

Procedure TWinTaskSettings.SetStopOnBatteries(Value: boolean);
Begin
  pSettings.StopIfGoingOnBatteries := Value;
End;

{ ------------------------------------------------------------------- }
Constructor TWinTask.Create(Const ADefinition: ITaskDefinition);
Begin
  Inherited Create;
  pDefinition := ADefinition;
  FSettings := TWinTaskSettings.Create(pDefinition.Settings);
  FData := TMemoryStream.Create;
  FActions := TWinTaskActions.Create(Self);
  FTriggers := TWinTaskTriggers.Create(Self);
  FSelectedAction := -1;
End;

Destructor TWinTask.Destroy;
Begin
  FreeAndNil(FSettings);
  FreeAndNil(FTriggers);
  FreeAndNil(FActions);
  FreeAndNil(FData);
  pDefinition := Nil;
  Inherited Destroy;
End;

Function TWinTask.GetAuthor: String;
Begin
  Result := pDefinition.RegistrationInfo.Author;
End;

Procedure TWinTask.SetAuthor(Const Value: String);
Begin
  pDefinition.RegistrationInfo.Author := Value;
End;

Function TWinTask.GetCompatibilityAsString: String;
Begin
  Result := LoadResString(CompatibilityNames[FSettings.Compatibility]);
End;

Function TWinTask.GetData: String;
Begin
  Result := pDefinition.Data;
End;

Procedure TWinTask.SetData(Const Value: String);
Begin
  pDefinition.Data := Value;
End;

Function TWinTask.GetDate: TDateTime;
Begin
  Result := BoundaryToDateTime(pDefinition.RegistrationInfo.Date);
End;

Function TWinTask.GetDateAsString: String;
Begin
  Result := DateTimeToText(GetDate);
End;

Procedure TWinTask.SetDate(Value: TDateTime);
Begin
  pDefinition.RegistrationInfo.Date := DateTimeToBoundary(Value, false);
End;

Function TWinTask.GetDescription: String;
Begin
  Result := pDefinition.RegistrationInfo.Description;
End;

Procedure TWinTask.SetDescription(Const Value: String);
Begin
  pDefinition.RegistrationInfo.Description := Value;
End;

Function TWinTask.GetDocumentation: String;
Begin
  Result := pDefinition.RegistrationInfo.Documentation;
End;

Procedure TWinTask.SetDocumentation(Const Value: String);
Begin
  pDefinition.RegistrationInfo.Documentation := Value;
End;

Function TWinTask.GetDisplayName: String;
Begin
  Result := pDefinition.Principal.DisplayName;
End;

Procedure TWinTask.SetDisplayName(Const Value: String);
Begin
  pDefinition.Principal.DisplayName := Value;
End;

Function TWinTask.GetGroupId: String;
Begin
  Result := pDefinition.Principal.GroupId;
End;

Procedure TWinTask.SetGroupId(Const Value: String);
Begin
  pDefinition.Principal.GroupId := Value;
End;

Function TWinTask.GetId: String;
Begin
  Result := pDefinition.Principal.Id;
End;

Procedure TWinTask.SetId(Const Value: String);
Begin
  pDefinition.Principal.Id := Value;
End;

Function TWinTask.GetUserId: String;
Begin
  Result := pDefinition.Principal.UserId;
End;

Procedure TWinTask.SetUserId(Const Value: String);
Begin
  pDefinition.Principal.UserId := Value;
End;

Function TWinTask.GetLogonType: TLogonType;
Begin
  Case pDefinition.Principal.LogonType Of
    TASK_LOGON_NONE:
      Result := ltNone;
    TASK_LOGON_PASSWORD:
      Result := ltPassword;
    TASK_LOGON_S4U:
      Result := ltS4U;
    TASK_LOGON_INTERACTIVE_TOKEN:
      Result := ltToken;
    TASK_LOGON_GROUP:
      Result := ltGroup;
    TASK_LOGON_SERVICE_ACCOUNT:
      Result := ltService;
    TASK_LOGON_INTERACTIVE_TOKEN_OR_PASSWORD:
      Result := ltTokenPassword;
  Else
    Result := ltNone;
  End;
End;

Procedure TWinTask.SetLogonType(Value: TLogonType);
Begin
  pDefinition.Principal.LogonType := TaskFlags[Value];
End;

Function TWinTask.GetRunLevel: boolean;
Begin
  Result := pDefinition.Principal.RunLevel = TASK_RUNLEVEL_HIGHEST;
End;

Procedure TWinTask.SetRunLevel(Value: boolean);
Begin
  With pDefinition.Principal Do
    If Value Then
      RunLevel := TASK_RUNLEVEL_HIGHEST
    Else
      RunLevel := TASK_RUNLEVEL_LUA;
End;

Function TWinTask.GetAction(Index: Integer): TWinTaskAction;
Begin
  Result := TWinTaskAction(FActions.Items[Index]);
End;

Function TWinTask.GetActionCount: Integer;
Begin
  Result := FActions.Count;
End;

Function TWinTask.GetTrigger(Index: Integer): TWinTaskTrigger;
Begin
  Result := TWinTaskTrigger(FTriggers.Items[Index]);
End;

Function TWinTask.GetTriggerCount: Integer;
Begin
  Result := FTriggers.Count;
End;

Function TWinTask.NewAction(AActionType: TWinTaskActionType): TWinTaskAction;
Begin
  Result := FActions.New(AActionType);
  FSelectedAction := Result.Index;
End;

Function TWinTask.DeleteAction(AIndex: Integer): boolean;
Begin
  Result := true;
  If (AIndex >= 0) And (AIndex < ActionCount) Then
  Begin
    Try
      FActions.Remove(AIndex);
    Except
      Result := false;
    End;
  End;
End;

Function TWinTask.NewTrigger(ATriggerType: TWinTaskTriggerType): TWinTaskTrigger;
Begin
  Result := FTriggers.New(ATriggerType);
  Result.SetToDefault(UserId);
End;

Function TWinTask.DeleteTrigger(AIndex: Integer): boolean;
Begin
  Result := true;
  If (AIndex >= 0) And (AIndex < TriggerCount) Then
  Begin
    Try
      FTriggers.Remove(AIndex);
    Except
      Result := false;
    End;
  End;
End;

Procedure TWinTask.Refresh;
Var
  i: word;
Begin
  FTriggers.Clear;
  FActions.Clear;
  With pDefinition.Triggers Do
    For i := 1 To Count Do
      FTriggers.Add(Item[i]);
  With pDefinition.Actions Do
    For i := 1 To Count Do
      FActions.Add(Item[i]);
End;

Function TWinTask.IndexOfApp(Const AppFilter: String): Integer;
Begin
  For Result := 0 To ActionCount - 1 Do
    If (Actions[Result].ActionType = taExec) And AnsiEndsText(AppFilter, TWinTaskExecAction(Actions[Result]).ApplicationPath) Then
      Break;
  If Result >= ActionCount Then
    Result := -1;
  FSelectedAction := Result;
End;

Function TWinTask.IndexOfNextExecAction(FromIndex: Integer): Integer;
Begin
  For Result := FromIndex To ActionCount - 1 Do
    If Actions[Result].ActionType = taExec Then
      Break;
  If Result >= ActionCount Then
    Result := -1;
  FSelectedAction := Result;
End;

{ ------------------------------------------------------------------- }
Constructor TWinTaskSubFolder.Create(Const ATaskFolder: ITaskFolder);
Begin
  Inherited Create;
  pTaskFolder := ATaskFolder;
End;

Destructor TWinTaskSubFolder.Destroy;
Begin
  pTaskFolder := Nil;
  Inherited Destroy;
End;

Function TWinTaskSubFolder.GetName: String;
Begin
  Result := pTaskFolder.Name;
End;

Function TWinTaskSubFolder.GetPath: String;
Begin
  Result := pTaskFolder.Path;
End;

{ ------------------------------------------------------------------- }
Constructor TWinRegisteredTask.Create(Const ARegisteredTask: IRegisteredTask);
Begin
  Inherited Create;
  pRegisteredTask := ARegisteredTask;
  FIndex := -1;
  FTaskName := pRegisteredTask.Name;
  FTask := TWinTask.Create(pRegisteredTask.Definition);
  FTask.Refresh;
End;

Destructor TWinRegisteredTask.Destroy;
Begin
  pRegisteredTask := Nil;
  FreeAndNil(FTask);
  Inherited Destroy;
End;

Procedure TWinRegisteredTask.Refresh;
Begin
  FTask.Refresh;
End;

Procedure TWinRegisteredTask.Run;
Begin
  pRegisteredTask.Run(VT_EMPTY)
End;

Procedure TWinRegisteredTask.Stop;
Begin
  pRegisteredTask.Stop(0);
End;

Function TWinRegisteredTask.GetTaskResult: Integer;
Begin
  Result := pRegisteredTask.LastTaskResult;
End;

Function TWinRegisteredTask.GetLastRunTime: TDateTime;
Begin
  Result := pRegisteredTask.LastRunTime;
End;

Function TWinRegisteredTask.GetLastRunTimeAsString: String;
Begin
  Result := DateTimeToText(LastRunTime);
End;

Function TWinRegisteredTask.GetNextRunTime: TDateTime;
Begin
  Result := pRegisteredTask.NextRunTime;
End;

Function TWinRegisteredTask.GetNextRunTimeAsString: String;
Begin
  Result := DateTimeToText(NextRunTime);
End;

Function TWinRegisteredTask.GetNumberOfMissedRuns: Integer;
Begin
  Result := pRegisteredTask.NumberOfMissedRuns;
End;

Function TWinRegisteredTask.GetPath: String;
Begin
  Result := AnsiDequotedStr(pRegisteredTask.Path, '"');
End;

Function TWinRegisteredTask.GetEnabled: boolean;
Begin
  Result := pRegisteredTask.Enabled;
End;

Procedure TWinRegisteredTask.SetEnabled(Value: boolean);
Begin
  pRegisteredTask.Enabled := Value;
End;

Function TWinRegisteredTask.GetStatus: TWinTaskStatus;
Begin
  Case pRegisteredTask.State Of
    TASK_STATE_DISABLED:
      Result := tsDisabled;
    TASK_STATE_QUEUED:
      Result := tsQueued;
    TASK_STATE_READY:
      Result := tsReady;
    TASK_STATE_RUNNING:
      Result := tsRunning;
  Else
    Result := tsUnknown;
  End;
End;

Function TWinRegisteredTask.GetStatusAsString: String;
Begin
  Result := LoadResString(TaskStateNames[Status]);
End;

Function TWinRegisteredTask.IndexOfApp(Const AppFilter: String): Integer;
Begin
  Result := FTask.IndexOfApp(AppFilter);
End;

{ ------------------------------------------------------------------- }
Constructor TWinTaskFolder.Create(ARootFolder: ITaskFolder);
Begin
  Inherited Create;
  FTasks := TWinTaskList.Create;
  FFolders := TWinTaskFolderList.Create;
  pRootFolder := ARootFolder;
  FErrMsg := '';
  FErrorCode := ERROR_SUCCESS;
End;

Destructor TWinTaskFolder.Destroy;
Begin
  FreeAndNil(FTasks);
  FreeAndNil(FFolders);
  pTaskCollection := Nil;
  pRootFolder := Nil;
  Inherited Destroy;
End;

Function TWinTaskFolder.GetName: String;
Begin
  Result := pRootFolder.Name;
  If Result = '\' Then
    Result := '';
End;

Function TWinTaskFolder.GetPath: String;
Begin
  Result := pRootFolder.Path;
End;

Function TWinTaskFolder.GetTask(Index: Integer): TWinRegisteredTask;
Begin
  Result := TWinRegisteredTask(FTasks.Items[Index]);
End;

Function TWinTaskFolder.GetFolder(Index: Integer): TWinTaskSubFolder;
Begin
  Result := TWinTaskSubFolder(FFolders.Items[Index]);
End;

Function TWinTaskFolder.Refresh: HResult;
Var
  i: Integer;
  ARegTask: TWinRegisteredTask;
  ATaskFolder: TWinTaskSubFolder;
Begin
  Try
    // Get the registered tasks in the folder.
    pTaskCollection := pRootFolder.GetTasks(0); // TASK_ENUM_HIDDEN
    FNumTasks := pTaskCollection.Count;
    FTasks.Clear;
    For i := 1 To FNumTasks Do
    Begin
      ARegTask := TWinRegisteredTask.Create(pTaskCollection.Item[i]);
      ARegTask.Refresh;
      ARegTask.TaskIndex := FTasks.Add(ARegTask);
    End;
    // Get the registered tasks in the folder.
    pTaskFolderCollection := pRootFolder.GetFolders(0);
    FNumFolders := pTaskFolderCollection.Count;
    FFolders.Clear;
    For i := 1 To FNumFolders Do
    Begin
      ATaskFolder := TWinTaskSubFolder.Create(pTaskFolderCollection.Item[i]);
      FFolders.Add(ATaskFolder);
    End;
    FErrorCode := ERROR_SUCCESS;
  Except
    On E: EOleSysError Do
      With E Do
      Begin
        FErrMsg := Message;
        FErrorCode := ErrorCode;
      End;
  End;
  Result := FErrorCode;
End;

Function TWinTaskFolder.IndexOfFolder(Const FolderName: String): Integer;
Begin
  For Result := 0 To FolderCount - 1 Do
    If AnsiSameText(Folders[Result].Name, FolderName) Then
      Exit;
  Result := -1;
End;

Function TWinTaskFolder.CreateFolder(Const AName: String): Integer;
Begin
  FErrMsg := '';
  FErrorCode := ERROR_SUCCESS;
  Try
    pRootFolder.CreateFolder(AName, '');
    If succeeded(Refresh) Then
      Result := IndexOfFolder(AName)
    Else
      Result := -1;
  Except
    On E: EOleSysError Do
      With E Do
      Begin
        FErrMsg := Message;
        FErrorCode := ErrorCode;
        Result := -1;
      End;
  End;
End;

Function TWinTaskFolder.DeleteFolder(Const AName: String): boolean;
Begin
  FErrMsg := '';
  FErrorCode := ERROR_SUCCESS;
  Try
    pRootFolder.DeleteFolder(AName, 0);
    Result := succeeded(Refresh);
  Except
    On E: EOleSysError Do
      With E Do
      Begin
        FErrMsg := Message;
        FErrorCode := ErrorCode;
        Result := false;
      End;
  End;
End;

Function TWinTaskFolder.IndexOfTask(Const TaskName: String): Integer;
Begin
  For Result := 0 To TaskCount - 1 Do
    If AnsiSameText(Tasks[Result].TaskName, TaskName) Then
      Exit;
  Result := -1;
End;

Function TWinTaskFolder.DeleteTask(Const TaskName: String): boolean;
Begin
  FErrMsg := '';
  FErrorCode := ERROR_SUCCESS;
  Try
    pRootFolder.DeleteTask(TaskName, 0);
    Result := succeeded(Refresh);
  Except
    On E: EOleSysError Do
      With E Do
      Begin
        FErrMsg := Message;
        FErrorCode := ErrorCode;
        Result := false;
      End;
  End;
End;

// Result >=0: Index of new task
// <0: Error - check ErrorCode and ErrorMessage
Function TWinTaskFolder.RegisterTask(Const TaskName: String; ATask: TWinTask; Username, Password: String): Integer;
Var
  pRegisteredTask: IRegisteredTask;
Begin
  Result := -1;
  FErrMsg := '';
  FErrorCode := NO_ERROR;
  If ATask.LogonType = ltToken Then
  Begin
    Username := '';
    Password := '';
  End
  Else If ATask.LogonType = ltService Then
    Password := ''; // run as SYSTEM
  Try
    pRegisteredTask := pRootFolder.RegisterTaskDefinition(TaskName, ATask.pDefinition, TASK_CREATE_OR_UPDATE, Username, Password, TaskFlags[ATask.LogonType], '');
    Refresh;
    Result := IndexOfTask(TaskName);
  Except
    On E: EOleSysError Do
      With E Do
      Begin
        FErrMsg := Message;
        FErrorCode := ErrorCode;
      End;
  End;
End;

{ ------------------------------------------------------------------- }
Constructor TWinTaskScheduler.Create;
Begin
  Inherited Create;
  // FResult:=CoInitialize(nil); //Ex(nil,COINIT_MULTITHREADED);
  // Create an instance of the Task Service.
  // CoCreateInstance(CLSID_TaskScheduler,nil,CLSCTX_INPROC_SERVER,IID_ITaskService,pService);
  FResult := CoInitializeSecurity(Nil, -1, Nil, Nil, RPC_C_AUTHN_LEVEL_PKT, RPC_C_IMP_LEVEL_IMPERSONATE, Nil, 0, Nil);
  If succeeded(FResult) Or (FResult = RPC_E_TOO_LATE) Then
  Begin
    Try
      // Create an instance of the Task Service.
      pService := CoTaskScheduler_.Create;
      // pService:=CreateComObject(CLSID_TaskScheduler) as ITaskService;
      FResult := ERROR_SUCCESS;
    Except
      On E: EOleSysError Do
        FResult := E.ErrorCode;
    End;
  End;
  FTaskFolder := Nil;
  FFolder := '\'; // set to root
End;

Destructor TWinTaskScheduler.Destroy;
Begin
  FreeAndNil(FTaskFolder);
  // pService:=nil;
  // CoUninitialize;
  Inherited Destroy;
End;

{ $O- }     // does not work with optimization ??
Function TWinTaskScheduler.Init: HResult;
Begin
  If succeeded(FResult) Then
  Begin
    // Connect to the local task service.
    Result := pService.Connect(Null, Null, Null, Null);
    // Null instead of '' required for Vista
    If succeeded(Result) Then
      Result := Refresh;
  End
  Else
    Result := FResult;
End;
{$O+}

Class Function TWinTaskScheduler.IsRunning: boolean;
Begin
  Result := GetServiceStatusByName('', 'schedule') = ssRunning;
End;

Procedure TWinTaskScheduler.SetFolder(Const AFolder: String);
Begin
  FFolder := AFolder;
  Refresh;
End;

Function TWinTaskScheduler.Refresh: HResult;
Begin
  Try
    // Get the pointer to the root task folder.
    If assigned(FTaskFolder) Then
      FTaskFolder.Free;
    FTaskFolder := TWinTaskFolder.Create(pService.GetFolder(FFolder));
    Result := FTaskFolder.Refresh;
  Except
    On E: EOleSysError Do
      Result := E.ErrorCode;
  End;
End;

Function TWinTaskScheduler.NewTask: TWinTask;
Begin
  Result := TWinTask.Create(pService.NewTask(0));
  Result.Settings.Compatibility := GetDefaultCompatibility;
  // appropriate to current system
End;

// function TWinTaskScheduler.Add (const TaskName: String) : TWinTask;
// var
// pRegisteredTask : IRegisteredTask;
// n     : integer;
// begin
// pRegisteredTask:=pService.NewTask(0);
// Result:=TWinTask.Create(pRegisteredTask.Name,pRegisteredTask);
// Result.Refresh;
// n:=FTasks.Add(Result);
// Result.TaskIndex:=n;
// end;
//

Function CreateWinTaskScheduler(Var TaskSchedule: TWinTaskScheduler): HResult;
Begin
  If Win32MajorVersion < 6 Then
    Result := NotAvailOnXp // WindowsXP or older
  Else If TWinTaskScheduler.IsRunning Then
  Begin
    Result := CoInitializeSecurity(Nil, -1, Nil, Nil, RPC_C_AUTHN_LEVEL_PKT, RPC_C_IMP_LEVEL_IMPERSONATE, Nil, 0, Nil);
    If succeeded(Result) Or (Result = RPC_E_TOO_LATE) Then
    Begin
      TaskSchedule := TWinTaskScheduler.Create;
      Result := TaskSchedule.Init;
    End;
  End
  Else
    Result := SCHED_E_SERVICE_NOT_RUNNING;
End;

End.

