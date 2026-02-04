(* Resource strings for WinTask

  © Dr. J. Rathlev, D-24222 Schwentinental (kontakt(a)rathlev-home.de)

  The contents of this file may be used under the terms of the
  Mozilla Public License ("MPL") or
  GNU Lesser General Public License Version 2 or later (the "LGPL")

  Software distributed under this License is distributed on an "AS IS" basis,
  WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
  the specific language governing rights and limitations under the License.

  Vers. 1.0 - Oct. 2017
  last modified: Vers. 1.3 - Jan. 2018
*)

unit WinTaskConsts;

interface

resourcestring
  rsFormatError = 'Формат ошибки: ';

  rsTrgUnknown = 'Неизвестно'; // Unbekannt
  rsTrgReady = 'Готов'; // Bereit
  rsTrgQueued = 'В очереди'; // In Warteschlange
  rsTrgRunning = 'Запущен'; // Wird ausgefьhrt
  rsTrgDisabled = 'Выключен'; // Deaktiviert

  rsTrgActionExec = 'Запустить программу'; // Programm starten
  rsTragActionCom = 'Обработчик файлов';
  rsTragActionMail = 'Отправить письмо'; // E-Mail senden
  rsTragActionMsg = 'Отображение сообщения'; // Meldung anzeigen

  rsTrgTypeEvent = 'На мероприятии'; // Bei einem Ereignis
  rsTrgTypeTime = 'Один раз'; // Einmal
  rsTrgTypeDaily = 'Ежедневно'; // Tдglich
  rsTrgTypeWeekly = 'Еженедельно'; // Wцchentlich
  rsTrgTypeMonthly = 'Ежемесячно'; // Monatlich
  rsTrgTypeIdle = 'На холостом ходу'; // Im Leerlauf
  rsTrgTypeRegister = 'При создании/изменении задачи';
  // Bei Aufgabenerstellung/-дnderung
  rsTrgTypeStartup = 'При запуске'; // Beim Start
  rsTrgTypeLogon = 'При входе в систему'; // Bei Anmeldung
  rsTrgTypeStateChg = 'При изменении состояния сеанса';
  rsTrgTypeCustom = 'Пользовательский триггер';

  rsTrgFirst = 'Первый'; // Ersten
  rsTrgSecond = 'Второй'; // Zweiten
  rsTrgThird = 'Третий'; // Dritten
  rsTrgFourth = 'Четвертый'; // Vierten
  rsTrgFifth = 'Пятый'; // Fьnften
  rsTrgLast = 'Последний'; // Letzten

  rsTrgSec = 'секунда'; // Sekunde
  rsTrgSecs = 'секунды'; // Sekunden
  rsTrgEverySec = 'каждую секунду'; // jede Sekunde
  rsTrgEverySecs = 'каждую %u секунду'; // alle %u Sekunden
  rsTrgMin = 'минута'; // Minute
  rsTrgMins = 'минуты'; // Minuten
  rsTrgEveryMin = 'каждую минуту'; // jede Minute
  rsTrgEveryMins = 'каждые %u минут'; // alle %u Minuten
  rsTrgHour = 'час'; // Stunde
  rsTrgHours = 'часы'; // Stunden
  rsTrgEveryHour = 'каждый час'; // jede Stunde
  rsTrgEveryHours = 'каждый %u час'; // alle %u Stunden
  rsTrgDay = 'день'; // Tag
  rsTrgDays = '%u дни'; // Tage
  rsTrgEveryDay = 'каждый день'; // jeden Tag
  rsTrgEveryDays = 'каждый %u день'; // alle %u Tage
  rsTrgOnce = 'В %0:s на %1:s'; // Um %0:s am %1:s

  rsTrgDailyAt = 'Каждый день в %s'; // Jeden Tag um %s
  rsTrgRDailyAt = 'В %0:s каждые %1:u дней'; // Um %0:s alle %1:u Tage
  rsTrgWeekly = 'В %0:s каждую %1:s каждой недели, начиная с %2:s';
  // Wцchentlich um %0:s jeden %1:s, beginnend mit dem %2:s
  rsTrgRWeekly = 'В %0:s каждые %1:s каждых %2:u недель, начиная с %3:s';
  // Um %0:s jeden %1:s alle %2:u Wochen, beginnend mit dem %3:s
  rsTrgMonthly = 'В %0:s на %1:s из %2:s, начиная с %3:s';
  // Um %0:s am %1:s %2:s, beginnend mit dem %3:s
  rsTrgDMonthly = 'Запускается на %0:s %1:s, каждый %2:s начинается с %3:s.';
  // Wird am %0:s %1:s jeden %2:s beginnend mit dem %3:s ausgefьhrt
  rsTrgAnyLogon = 'При входе любого пользователя';
  rsTrgLogon = 'При входе в систему %s'; // Bei Anmeldung eines Benutzers
  rsTrgStartup = 'При запуске системы'; // Beim Systemstart
  rsTrgIdle = 'Когда компьютер простаивает'; // Wenn der Computer inaktiv ist
  rsTrgEvent = 'На мероприятии'; // Bei einem Ereignis
  rsTrgEventTime = ', начиная с %0:s в %1:s';

  rsTrgRegistration = 'Когда задача создается или изменяется';
  // Bei Aufgabenerstellung oder -дnderung

  rsTrgRepeat = ' - После срабатывания повторяйте каждые %0:s в течение %1:s.';
  // Nach Auslцsung alle %0:s fьr die Dauer von %1:s wiederholen

  rsCompAT = 'устарел';
  rsXP = 'Windows XP';
  rsVista = 'Windows Vista';
  rsWin7 = 'Windows 7';
  rsWin10 = 'Windows 10';

implementation

end.
