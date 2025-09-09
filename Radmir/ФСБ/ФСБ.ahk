; Информация про пользователя

name := "Имя"
surname := "Фамилия"
department := "Отдел"
rank := "Звание"
alias := "Позывной"



; Остальные переменные для работы скрипта

infoState := false
organization := 0
playerId := "-1"
fakeName := ""



; Назначение клавиш и команд

Numpad0::Goto ВводId
Alt & Numpad0::Goto ОчиститьId
Ctrl & Numpad0::Goto ВводНика
Numpad1::Goto Приветствие
Alt & Numpad1::Goto УдостоверениеФСБ
Ctrl & Numpad1::Goto Нашивка
Numpad2::Goto ПросьбаОстановится
Alt & Numpad2::Goto РаботаФСБ
Ctrl & Numpad2::Goto ПросьбаДокументов
Numpad3::Goto НачатьПогоню
Alt & Numpad3::Goto Арест
Ctrl & Numpad3::Goto ОтменаАреста
Numpad4::Goto СнятьАксессуары
Alt & Numpad4::Goto Обыск
Ctrl & Numpad4::Goto ОбыскДокументов
Numpad5::Goto Фоторобот
Alt & Numpad5::Goto ЧеловекДокументы
Ctrl & Numpad5::Goto ЧеловекОтпечатки
Numpad6::Goto Розыск
Alt & Numpad6::Goto Штраф
Ctrl & Numpad6::Goto СнятьРозыск
Numpad7::Goto ВыкинутьИзАвто
Alt & Numpad7::Goto ПосадитьВАвто
Ctrl & Numpad7::Goto ВыломатьДверь
Numpad8::Goto ЗачитатьПрава
Alt & Numpad8::Goto ВызватьАдвоката
Ctrl & Numpad8::Goto ПосадитьЗаРешетку
Numpad9::Goto ОтследитьМестоположение
Alt & Numpad9::Goto Выговор
Ctrl & Numpad9::Goto Уволить
Alt & X::Goto ПолицейскийПланшет
Ctrl & X::Goto СписокРозыска
Alt & Ctrl::Goto ПереключитьАхк
Ctrl & 1::Goto ДопросМиранда
Ctrl & 2::Goto ДопросНачало
Ctrl & 3::Goto ДопросПродолжение
Ctrl & 4::Goto ДопросКонец

:?*:id=::
:?*:ид-ввод::
Goto ВводId

:?*:id0::
:?*:id-::
:?*:ид-::
Goto ОчиститьId

:?*:/ticket::
:?*:штраф-::
Goto Штраф

:?*:розыск-::
:?*:/su::
Goto Розыск

:?*:/cuff::
:?*:наручники-::
Goto Арест

:?*:/uncuff::
:?*:снять наручники-::
Goto ОтменаАреста

:?*:снять-акс::
Goto СнятьАксессуары

:?*:/wanted::
Goto СписокРозыска

:?*:/doc::
Goto УдостоверениеФСБ

:?*:/pg::
Goto НачатьПогоню

:?*:/ejectout::
Goto ВыкинутьИзАвто

:?*:/putpl::
Goto ПосадитьВАвто

:?*:/checkdocs::
Goto ОбыскДокументов

:?*:/search::
Goto Обыск

:?*:/setmark::
Goto ОтследитьМестоположение

:?*:/police_tablet::
Goto ПолицейскийПланшет

:?*:миранда::
Goto ЗачитатьПрава

:?*:адвокатааа::
Goto ВызватьАдвоката

:?*:фейк-ник::
:?*:fakename::
:?*:fakenick::
Goto ВводНика

:?*:допрос-мир::
Goto ДопросМиранда

:?*:допрос-начало::
Goto ДопросНачало

:?*:допрос-начало::
Goto ДопросНачало

:?*:допрос-прод::
Goto ДопросНачало

:?*:допрос-конец::
Goto ДопросНачало

Alt & 1::
if (organization=1) {
    Goto ПриветствиеМО
}
else if (organization=2) {
    Goto ПриветствиеМВД
}
else if (organization=3) {
    Goto ПриветствиеФСИН
}
else {
    OrgInfo("Вы не выбрали организацию!", "Red")
}
Return



; Функции для ФСБ

ВводId:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput, {F6}{!}Введите id игрока для дальнейшего взаимодействия:{Space}
Input, playerId, V I M, {RShift}
SendInput, {BS 150}{F6}
Return

ОчиститьId:
Sendinput,{Enter}
Sleep 500
playerId := "-1"
Return

ВводНика:
Sendinput,{Enter}
Sleep 500
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}{!}Введите ваше маскировочное имя:{Space}
Input, fakeName, V I M, {RShift}
SendInput, {BS 150}{F6}
Return

Приветствие:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput, {F6}Здравия желаю, вас беспокоит сотрудник Федеральной Службы Безопасности.{Enter}
Sleep 500
SendInput, {F6}/do На бронижелете висит нашивка: [ ФСБ | %department% | %rank% | %alias% ].{Enter}
Return

Нашивка:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput, {F6}/do На груди висит нашивка: [ ФСБ | %department% | %rank% | %alias% ].{Enter}
Return

УдостоверениеФСБ:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput, {F6}/do Удостовирение в нагрудном кармане.{Enter}
Sleep 1000 
SendInput, {F6}/me вынул удостовирение из кармана{Enter}
Sleep 1000 
SendInput, {F6}/do Удостоверение в руке.{Enter}
Sleep 1000 
SendInput, {F6}/me легким движением открыл нужную страницу{Enter}
Sleep 1000 
SendInput, {F6}/do Удостоверение перед глазами человека.{Enter}
Sleep 200
if (playerId = "-1") {
    SendInput, {F6}/doc{Space}
    Input, tempId, V I M, {Enter}
} else {
    Sleep 800
    SendInput, {F6}/doc %playerId%{Enter}
}
Sleep 100
SendInput, {Enter}
Sleep 1000 
SendInput, {F6}/me убрал удостоверение обратно в карман{Enter}
Return

ПросьбаОстановится:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
Sendinput, {F6}Гражданин, полажуйста оставитесь{!}{Enter}
Sleep 1000
Sendinput, {F6}Иначе сочту ваши действия как 8.4 УК{Enter}
Sleep 1000
SendInput, {F6}/do На груди висит нашивка: [ ФСБ | %department% | %rank% | %alias% ].{Enter}
return

РаботаФСБ:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
Sendinput, {F6}/s Всем стоять. {Enter}
Sleep 1000
Sendinput, {F6}/s Всем лечь на пол.{Enter}
Sleep 1000
Sendinput, {F6}/s Работает ФСБ. {Enter}
return

ПросьбаДокументов:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput, {F6} Предъявите, пожалуйста, Ваши документы, удостоверяющие Вашу личность.{Enter}
Sleep 1000
SendInput, {F6} За отказ от предоставления документов вы будете задержаны по статье 8.4.1 УК.{Enter}
Sleep 1000
SendInput, {F6} Такой-же случай произойдет если вы не предъявите документы в течении 30 секунд.{Enter}
Sleep 1000
SendInput, {F6} Если Вы убежите или попробуете это сделать я сочту это за 8.4 УК.{Enter}
return

НачатьПогоню:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
Sendinput, {F6}/do Рация на поясе.{Enter}
sleep 700
Sendinput, {F6}/me достал рацию{Enter}
sleep 700
Sendinput, {F6}/todo Зажав кнопку*Прием, это %alias%, преследую преступника.{Enter}
sleep 500
if (playerId = "-1") {
    SendInput, {F6}/pg{Space}
    Input, tempId, V I M, {Enter}
} else {
    Sleep 800
    SendInput, {F6}/pg %playerId%{Enter}
}
Return

Арест:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput {F6}/do Наручники свисают с пояса. {Enter}
Sleep 900
SendInput {F6}/me снял наручники с пояса{Enter}
Sleep 800
SendInput {F6}/do В руке наручники.{Enter}
Sleep 800
SendInput {F6}/me схватил человека за руку, затем заломил руку{Enter}
Sleep 700
SendInput {F6}/me заковал человека в наручники{Enter}
Sleep 700
SendInput, {F6}/do Процесс...{Enter}
Sleep 650
SendInput, {F6}/me начинает вести задержанного{Enter}
Sleep 200
if (playerId = "-1") {
    SendInput, {F6}/cuff{Space}
    Input, playerId, V I M, {Enter}
    Sleep 1000
    SendInput {F6}/escort %playerId%{Enter}
    playerId := "-1"
} else {
    SendInput {F6}/cuff %playerId%{Enter}
    Sleep 1000
    SendInput {F6}/escort %playerId%{Enter}
}
Return

ОтменаАреста:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput, {F6}/do Наручники на руках у человека.{Enter}
Sleep 500
SendInput, {F6}/me снял наручники с рук{Enter}
Sleep 500
SendInput, {F6}/do Наручники сняты.{Enter}
Sleep 800
SendInput, {F6}/me повесил наручники на пояс{Enter}
Sleep 800
SendInput, {F6}/do Наручники на поясе.{Enter}
Sleep 800
SendInput, {F6}/me взял человека за руку{Enter}
Sleep 800
SendInput, {F6}/me отпустил руки человеку{Enter}
Sleep 900
SendInput, {F6}/do Руки в свободном положение.{Enter}
Sleep 900
SendInput, {F6}/me перестал вести задержанного{Enter}
Sleep 200
if (playerId = "-1") {
    SendInput, {F6}/escort{Space}
    Input, playerId, V I M, {Enter}
    Sleep 1000
    SendInput {F6}/uncuff %playerId%{Enter}
    playerId := "-1"
} else {
    SendInput {F6}/escort %playerId%{Enter}
    Sleep 1000
    SendInput {F6}/uncuff %playerId%{Enter}
}
Return

СнятьАксессуары:
SendMessage, 0x50, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput, {F6}/do Маска на лице человека.{Enter}
sleep 800
SendInput, {F6}/me снял маску и другие аксессуары с лица человека{Enter}
sleep 800
SendInput, {F6}/anim 6 7{Enter}
sleep 800
SendInput, {F6}/do Маска снята.{Enter}
sleep 800
SendInput, {F6}/me положил маску в рюкзак с шевроном "ФСБ" {Enter}
sleep 800
SendInput, {F6}/do Лицо человека полностью видно.{Enter}
sleep 800
SendInput, {F6}/n /maskoff и /reset, не пропишешь - твои проблемы, я отыграл.{Enter}
Return

Обыск:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
Sendinput, {F6}Сейчас я проведу обыск, просьба не двигаться. {Enter}
Sleep 700
Sendinput, {F6}/me протянул руку в карман, затем взял Ордер {Enter}
Sleep 900
Sendinput, {F6}/do "Орден на обыск признан №2025г., Губернатором Нижегородской области".{Enter}
Sleep 900
SendInput, {F6}/me показал документ человеку напротив{Enter}
Sleep 700
SendInput, {F6}/do Перчатки с надписью "ФСБ" на руках.{Enter}
sleep 800
SendInput, {F6}/me начал ощупывать человека напротив{Enter}
sleep 800
SendInput, {F6}/do Верхняя часть осмотрена.{Enter}
sleep 800
SendInput, {F6}/me начал щупать в области ног{Enter}
sleep 800
SendInput, {F6}/do Нижняя часть осмотрена.{Enter}
sleep 800
SendInput, {F6}/me усмехнулся{Enter}
sleep 800
if (playerId = "-1") {
    SendInput, {F6}/search{Space}
    Input, tempId, V I M, {Enter}
} else {
    Sleep 800
    SendInput, {F6}/search %playerId%{Enter}
}
SendInput, {F6}{!}Найдено ли что-то? (да/нет):{Space}
Input, found, V I M, {RShift}
SendInput, {BS 150}{Enter}
if (found = "Да" or found = "да") {
    SendInput, {F6}Так так так... Что тут у нас?{Enter}
    sleep 800
    SendInput, {F6}/me нашупал подозрительный предмет{Enter}
    sleep 800
    SendInput, {F6}/me достал его из карманов подозреваемого{Enter}
    sleep 800
    SendInput, {F6}/do ZIP пакет в руках.{Enter}
    sleep 800
    SendInput, {F6}/me аккуратно убрал предмет в пакет{Enter}
    sleep 800
    SendInput, {F6}/me запечатал пакет и убрал в рюкзак{Enter}
    sleep 800
    SendInput, {F6}/do ZIP пакет в рюкзаке.{Enter}
}
Return

ОбыскДокументов:
SendMessage, 0x50, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput, {F6}Так, дружочек-пирожочек, где тут твои документы{Enter}
sleep 800
SendInput, {F6}/me начал общупывать карманы в поисках докуметов{Enter}
sleep 800
SendInput, {F6}/do Процесс...{Enter}
sleep 800
SendInput, {F6}/do Папка с документами найдена.{Enter}
sleep 800
SendInput, {F6}/me вытащил документы из карманов человека{Enter}
sleep 800
SendInput, {F6}/me открыл папку и начал изучать документы{Enter}
sleep 200
if (playerId = "-1") {
    SendInput, {F6}/checkdocs{Space}
    Input, tempId, V I M, {Enter}
} else {
    Sleep 800
    SendInput, {F6}/checkdocs %playerId%{Enter}
}
Return

Фоторобот:
SendMessage, 0x50, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput, {F6}/me движением рук достал из кармана Apple iPad Pro и стилус{Enter}
Sleep 850
SendInput, {F6}/do Apple iPad Pro и стилус в руках.{Enter}
Sleep 850
SendInput, {F6}/me движением пальц перешел во вкладку рисовать{Enter}
Sleep 850
SendInput, {F6}/me движением рук нарисовал фоторобот подозреваемого{Enter}
Sleep 850
SendInput, {F6}/me движением рук достал переходник и КПК из кармана{Enter}
Sleep 850
SendInput, {F6}/do Переходник и КПК в руках.{Enter}
Sleep 850
SendInput, {F6}/me движением рук подключил переходник к КПК и iPad{Enter}
Sleep 850
SendInput, {F6}/me движением пальц перекинул фоторобот подозреваемого в КПК {Enter}
Sleep 850
SendInput, {F6}/do Фоторобот подозреваемо находиться в КПК.{Enter}
Sleep 850
SendInput, {F6}/me движением пальц зашел в базу данных и перекинул фоторобот подозреваемого{Enter}
Sleep 850
SendInput, {F6}/me нажал кнопку поиск{Enter}
Sleep 850
SendInput, {F6}/do Через несколько секунд личность человека была установлена.{Enter}
Sleep 850
Return

ЧеловекДокументы:
SendMessage, 0x50, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput, {F6}/me достал КПК из заднего кармана{Enter}
Sleep 850
SendInput, {F6}/do КПК в руках.{Enter}
Sleep 850
SendInput, {F6}/me движением пальц перешел в базу данных{Enter}
Sleep 850
SendInput, {F6}/me начал вводить паспортные данные из документа{Enter}
Sleep 850
SendInput, {F6}/do Через несколько секунд нашел человека в базе данных.{Enter}
Return

ЧеловекОтпечатки:
SendMessage, 0x50, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput, {F6}/do Аппарат "CТОЛ" в кармане.{Enter}
Sleep 700
SendInput, {F6}/me резким движением достал Аппарат{Enter}
Sleep 700
SendInput, {F6}/do Аппарат "СТОЛ" в руке.{Enter}
Sleep 700
SendInput, {F6}/me резким движением потянул руку гражданина напротив и приложил его палец к аппарату{Enter}
Sleep 700
SendInput, {F6}/do Процесс сканирования начат.{Enter}
Sleep 700
SendInput, {F6}/do Процесс завершен.{Enter}
Sleep 700
SendInput, {F6}/do Личность установлена. {Enter}
Sleep 700
SendInput, {F6}/me достал КПК из кармана и ввел данные из аппарата{Enter}
Sleep 700
SendInput, {F6}/do Человек найден в базе данных. {Enter}
Return

Розыск:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput, {F6}/me перешел в вкладку "Розыск" в своем КПК{Enter}
Sleep 700
SendInput, {F6}/do Вкладка загружена.{Enter}
Sleep 700
SendInput, {F6}/me нажал кнопку "Объявить в розыск"{Enter}
Sleep 700
SendInput, {F6}/me ввел всю информацию про подозреваемого{Enter}
Sleep 700
SendInput, {F6}/do Человек объявлен в розыск.{Enter}
Sleep 700
if (playerId = "-1") {
    SendInput, {F6}/su{Space}
    Input, tempId, V I M, {Enter}
} else {
    Sleep 800
    SendInput, {F6}/su %playerId%{Space}
}
Return

Штраф:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput, {F6}/do КПК в руках.{enter}
Sleep 700
SendInput, {F6}/me нажал на пункт "выписать штраф в электронном виде"{enter}
Sleep 800
SendInput, {F6}/do Гражданину пришел штраф в приложении телефона.{enter}
Sleep 700
if (playerId = "-1") {
    SendInput, {F6}/ticket{Space}
    Input, tempId, V I M, {Enter}
} else {
    Sleep 800
    SendInput, {F6}/ticket %playerId%{Space}
}
Return

СнятьРозыск:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput, {F6}/me взял рацию в руки, затем зажал кнопку{Enter}
Sleep 900
SendInput, {F6}/do Кнопка зажата.{Enter}
Sleep 900
SendInput, {F6}/me сообщил данные подозреваемого диспетчеру{Enter}
Sleep 900
SendInput, {F6}/do Данные сообщены диспетчеру.{Enter}
Sleep 900
SendInput, {F6}/do Диспетчер: С подозреваемого снят розыск.{Enter}
Sleep 900
if (playerId = "-1") {
    SendInput, {F6}/clear{Space}
    Input, tempId, V I M, {Enter}
} else {
    Sleep 800
    SendInput, {F6}/clear %playerId%{Enter}
}
Return

ВыкинутьИзАвто:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput, {F6}/me разбил окно прикладом {Enter}
Sleep 700
SendInput, {F6}/do Окно разбито. {Enter}
Sleep 700
SendInput, {F6}/me открывает дверь{Enter}
Sleep 700
SendInput, {F6}/me вытащил подозреваемого из машины{Enter}
Sleep 700
if (playerId = "-1") {
    SendInput, {F6}/ejectout{Space}
    Input, tempId, V I M, {Enter}
} else {
    Sleep 800
    SendInput, {F6}/ejectout %playerId%{Enter}
}
Return

ПосадитьВАвто:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput, {F6}/me открыл дверь автомобиля{enter}
sleep 1000
SendInput, {F6}/do Дверь открыта.{enter}
sleep 1000
SendInput, {F6}/me пригнув голову преступника посадил его в автомобиль{enter}
sleep 1000
SendInput, {F6}/do Процесс...{enter}
Sleep 1000
SendInput, {F6}/me закрыл дверь{enter}
sleep 1000
SendInput, {F6}/do Дверь закрыта.{enter}
if (playerId = "-1") {
    SendInput, {F6}/putpl{Space}
    Input, tempId, V I M, {Enter}
} else {
    Sleep 800
    SendInput, {F6}/putpl %playerId%{Enter}
}
return

ВыломатьДверь:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput, {F6}/me начал выбивать дверь{Enter}
Sleep 700
SendInput, {F6}/do Процесс...{Enter}
Sleep 700
SendInput, {F6}/me выбивает дверь{Enter}
Sleep 700
SendInput, {F6}/break_door{Enter}
Return

ЗачитатьПрава:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput {F6}Вы имеете право хранить молчание.{enter}
sleep 1000
SendInput {F6}Всё, сказанное Вами, может и будет использовано против Вас в суде.{enter}
sleep 1000
SendInput {F6}Вы имеете право обжаловать мои действия в суде...{enter}
sleep 1000
SendInput {F6}или иных инстанциях если не согласны с нарушением.{enter}
sleep 1000
SendInput {F6}Так-же Вы имеете право на адвоката. Вам нужен адвокат?{enter}
Return

ВызватьАдвоката:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput, {F6}/do Рация на поясе.{Enter}
Sleep 700
SendInput, {F6}/me достал рацию{Enter}
Sleep 700
SendInput, {F6}/me зажал кнопку разговора{Enter}
Sleep 700
SendInput, {F6}/do Передал информацию в нужное место.{Enter}
Sleep 700
SendInput, {F6}/d [ФСБ] - [Пра-во] Нужен адвокат в  . Время на ответ: 5 минут.{Left 27}
Sleep 700
Input, tempId, V I M, {Enter}
Sleep 700
SendInput, {F6}/me отпустил кнопку и убрал рацию{Enter}
Sleep 700
SendInput, {F6}Ожидаем ответ в течении 5 минут, время пошло{Enter}
Sleep 700
SendInput, {F6}/me взглянул на часы и запомнил время{Enter}
Sleep 700
SendInput, {F6}/c 060{Enter}
Return

ПосадитьЗаРешетку:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput, {F6}/me открыл двери{Enter}
Sleep 1000
SendInput, {F6}/do Двери открыты.{Enter}
Sleep 1000
SendInput, {F6}/do Из здания вышли сотрудники.{Enter}
Sleep 1000
SendInput, {F6}/me передал преступника коллегам{Enter}
Sleep 1000
SendInput, {F6}/do Преступника увели.{Enter}
Sleep 200
if (playerId = "-1") {
    SendInput, {F6}/arrest{Space}
    Input, tempId, V I M, {Enter}
} else {
    Sleep 800
    SendInput, {F6}/arrest %playerId%{Enter}
}
Return

ОтследитьМестоположение:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
Sendinput, {F6}/do Рация на поясе.{Enter}
sleep 700
Sendinput, {F6}/me достал рацию{Enter}
sleep 700
Sendinput, {F6}/todo Зажав кнопку*Диспетчер, прием, это %alias%.{Enter}
sleep 500
SendInput, {F6}/todo Держа кнопку*Доложите пожалуйста информацию о преступнике.{Enter}
sleep 500
if (playerId = "-1") {
    SendInput, {F6}/setmark{Space}
    Input, tempId, V I M, {Enter}
} else {
    Sleep 800
    SendInput, {F6}/setmark %playerId%{Enter}
}
Return

Выговор:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput, {F6}/me достал КПК из кармана{Enter}
Sleep 1000
SendInput, {F6}/do КПК в руках.{Enter}
Sleep 1000
SendInput, {F6}/me ввел пароль от организации в которой работает нарушитель{Enter}
Sleep 1000
SendInput, {F6}/me нашел нужного человека в списке сотрудников{Enter}
Sleep 1000
SendInput, {F6}/do Открылась информация о сотруднике.{Enter}
Sleep 1000
SendInput, {F6}/me нажал кнопку "выговоры" и ввел нужную информацию{Enter}
Sleep 1000
SendInput, {F6}/do Выговор выписан.{Enter}
Sleep 200
if (playerId = "-1") {
    SendInput, {F6}/fwarn{Space}
    Input, tempId, V I M, {Enter}
} else {
    Sleep 800
    SendInput, {F6}/fwarn %playerId%
}
Return

Уволить:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput, {F6}/me достал КПК из кармана{Enter}
Sleep 1000
SendInput, {F6}/do КПК в руках.{Enter}
Sleep 1000
SendInput, {F6}/me ввел пароль от организации в которой работает нарушитель{Enter}
Sleep 1000
SendInput, {F6}/me нашел нужного человека в списке сотрудников{Enter}
Sleep 1000
SendInput, {F6}/do Открылась информация о сотруднике.{Enter}
Sleep 1000
SendInput, {F6}/me нажал кнопку "Уволить" и ввел нужную информацию{Enter}
Sleep 1000
SendInput, {F6}/do Сотрудник уволен.{Enter}
Sleep 200
if (playerId = "-1") {
    SendInput, {F6}/uninvite {Space}
    Input, tempId, V I M, {Enter}
} else {
    Sleep 800
    SendInput, {F6}/uninvite %playerId%
}
Return


ПолицейскийПланшет:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput, {F6}/do Полицейский планшет в кармане.{Enter}
Sleep 1000
SendInput, {F6}/me достал полицейский планшет из кармана и включил его{Enter}
Sleep 1000
SendInput, {F6}/me начал нажимать различные кнопки{Enter}
Sleep 1000
SendInput, {F6}/police_tablet{Enter}
Return

СписокРозыска:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput, {F6}/do КПК в кармане.{Enter}
Sleep 1000
SendInput, {F6}/me достал КПК из кармана{Enter}
Sleep 1000
SendInput, {F6}/do КПК в руке.{Enter}
Sleep 1000
SendInput, {F6}/do КПК выключен.{Enter}
Sleep 1000
SendInput, {F6}/me включил КПК{Enter}
Sleep 1000
SendInput, {F6}/do КПК включен.{Enter}
sleep 1000
SendInput, {F6}/me открыл список разыскиваемых{Enter}
Sleep 1000
SendInput, {F6}/do Смотрит в него.{Enter}
sleep 1000
SendInput, {F6}/wanted{Enter}
Return

НачатьПрослушку:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput, {F6}/do Наушники лежат на панели.{Enter}
Sleep 1000
SendInput, {F6}/me надел их на голову{Enter}
Sleep 1000
SendInput, {F6}/do Наушники надеты.{Enter}
Sleep 1000
SendInput, {F6}/me начал вводить что-то в компьютер{Enter}
Sleep 1000
SendInput, {F6}/do Процесс...{Enter}
Sleep 1000
SendInput, {F6}/do Прослушка подключена.{Enter}
sleep 1000
SendInput, {F6}/me %name% начал слушать разговор {Enter}
Return



; Допрос

ДопросМиранда:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput {F6}Перед началом сообщаю Вам о ваших правах:{enter}
sleep 1000
SendInput {F6}Вы имеете право хранить молчание.{enter}
sleep 1000
SendInput {F6}Всё, сказанное Вами, может и будет использовано против Вас в суде.{enter}
sleep 1000
SendInput {F6}Вы имеете право обжаловать мои действия в суде...{enter}
sleep 1000
SendInput {F6}или иных инстанциях если не согласны с нарушением.{enter}
sleep 1000
SendInput {F6}Так-же Вы имеете право на адвоката. Вам нужен адвокат?{enter}
Return

ДопросНачало:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput, {F6}Думаю можем приступать к допросу.{Enter}
Sleep 700
SendInput, {F6}Перед началом хочу Вас предупредить о том, что:{Enter}
Sleep 700
SendInput, {F6}Во-первых, ведется видеофиксация нашего разговора.{Enter}
Sleep 700
SendInput, {F6}Во-вторых, дачей ложных сведений Вы подставляете только себя.{Enter}
Sleep 700
SendInput, {F6}Итак, начнём{!} Ранее мною моя личность была обозначена.{Enter}
Sleep 700
SendInput, {F6}Теперь мне требуется полная информация о Вас, а именно:{Enter}
Sleep 700
SendInput, {F6}ФИО, звание, должность, место проживание, сколько вам лет{Enter}
Sleep 700
SendInput, {F6}И сколько вы проживаете в области?{Enter}
Return

ДопросПродолжение:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput, {F6}/do Чистый бланк допроса, находится на столе.{Enter}
Sleep 700
SendInput, {F6}/me ловким движением руки, подтягивает к себе бланк допроса, так-же ручку{Enter}
Sleep 700
SendInput, {F6}/do Ручка в руке.{Enter}
Sleep 700
SendInput, {F6}/do Бланк допроса на столе.{Enter}
Sleep 700
SendInput, {F6}/me начинает заполнять бланк{Enter}
Sleep 700
SendInput, {F6}/do Процесс...{Enter}
Sleep 700
SendInput, {F6}/todo Записав всю информацию*Отлично, переходим дальше.{Enter}
Return

ДопросКонец:
Sendinput,{Enter}
Sleep 500
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/me записал всю информацию о деле{Enter}
Sleep 700
SendInput, {F6}/do Папка на столе.{Enter}
Sleep 700
SendInput, {F6}/me закрыл папку с делом{Enter}
Sleep 700
SendInput, {F6}/do Папка закрыта.{Enter}
Sleep 700
SendInput, {F6}Хорошо, на этом мы закончим наш допрос.{Enter}
Sleep 700
SendInput, {F6}Мы выяснили все, что нам было необходимо.{Enter}
Sleep 700
SendInput, {F6}Наше решение:{Space}
Return



; Функции для МО

ПриветствиеМО:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}Здравия желаю, я - Сержант Армии %fakeName%{!} {Enter}
Sleep 500
SendInput, {F6}/do Удостоверение в кармане.{Enter}
Sleep 500
SendInput, {F6}/me засунул руку в карман{Enter}
Sleep 500
SendInput, {F6}/me взял удостоверение{Enter}
Sleep 500
SendInput, {F6}/do Удостоверение в руках.{Enter}
Sleep 800
SendInput, {F6}/me открыл удостоверение{Enter}
Sleep 800
SendInput, {F6}/do Удостоверение открыто.{Enter}
Sleep 800
SendInput, {F6}/me показал удостоверение человеку напротив{Enter}
Sleep 800
if (playerId = "-1") {
    SendInput, {F6}/doc{Space}
    Input, tempId, V I M, {Enter}
} else {
    Sleep 800
    SendInput, {F6}/doc %playerId%{Enter}
}
Sleep 500
SendInput, {F6}Цель прибытия на охраняемую территорию?{Enter}
Return

; Функции для МВД

ПриветствиеМВД:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}Здравия желаю, вас беспокоит сотрудник МВД, Сержант %fakeName%.{enter}
Sleep 150
SendInput, {F6}/do Удостоверение в кармане.{enter}
Sleep 150
SendInput, {F6}/me достал удостоверение из кармана и показал человеку напротив{enter}
Sleep 150
if (playerId = "-1") {
    SendInput, {F6}/doc{Space}
    Input, tempId, V I M, {Enter}
} else {
    Sleep 800
    SendInput, {F6}/doc %playerId%{Enter}
}
Sleep 400
SendInput, {F6}/me убрал удостоверение в корман{enter}
Sleep 150
SendInput, {F6}/do Удостоверение в кормане.{enter}
Sleep 150
SendInput, {F6}/do На бронижелете висит нашивка: [ МВД | Сержант | %fakeName% ].{enter}
Return

; Функции для ФСИН

ПриветствиеФСИН:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}Здравия желаю, Инспектор ФСИН - %fakeName%. {Enter}
Sleep, 800
SendInput, {F6}/me отдал воинское приветствие{Enter}
Sleep 900
SendInput, {F6}/anim 1 7{Enter}
Sleep 900
SendInput, {F6}/do В нагрудном кармане удостоверение личности.{Enter}
Sleep 900
SendInput, {F6}/me протянув руку к нагрудному карману, расстегнул нагрудный карман{Enter}
Sleep 900
SendInput, {F6}/do Нагрудный карман расстегнут.{Enter}
Sleep 900
SendInput, {F6}/me достал из нагрудного кармана удостоверение личности и предъявил его гражданину{Enter}
Sleep 900
if (playerId = "-1") {
    SendInput, {F6}/doc{Space}
    Input, tempId, V I M, {Enter}
} else {
    Sleep 800
    SendInput, {F6}/doc %playerId%{Enter}
}
Sleep 900
SendInput, {F6}/do В удостоверение личности написано: Инспектор{Enter}
Sleep 900
Return

; Доп. функции

ПереключитьАхк:
if (organization=0){
    organization := 1
    OrgInfo("AHK для МО","8F471E")
}
else if (organization=1){
    organization := 2
    OrgInfo("AHK для МВД","2E4EF0")
}
else if (organization=2){
    organization := 3
    OrgInfo("AHK для ФСИН","BABABA")
}
else if (organization=3){
    organization := 0
    OrgInfo("AHK для гос. отключено","FFFFFF")
}
Return


Alt & n::
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{F6}/n Откат.{Enter}
Return

Alt & f::
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{F6}/c 60{Enter}
Return

Ctrl & f::
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{F6}/c 60{Enter}
Sleep 2500
Sendinput,{F8}
Return



; Интерфейсы с подсказками

OrgInfo(text, textColor:="White") {
    Gui +LastFound +AlwaysOnTop -Caption +ToolWindow 

    SysGet, MonitorWorkArea, MonitorWorkArea

    Gui, Color, 000000
    Gui, Font, MS sans serif
    Gui, Font, cBlue
    Gui, Font, s25
    Gui, Add, Text, c%textColor%, %text%
    WinSet, TransColor, %CustomColor3% 250 

    Gui, Show, Hide
    WinGetPos,,, width, height
    yPos := MonitorWorkAreaBottom - height - 20
    xPos := MonitorWorkAreaRight - width - 20
    
    Gui, Show, x%xPos% y%yPos% NoActivate, window.
    Sleep 2000
    Gui, Destroy
}

ShowInfo(title, lines*) {
    global infoState
    if (infoState)
        return

    CustomColor3 := "202020"
    Gui, +LastFound +AlwaysOnTop -Caption +ToolWindow
    Gui, Color, %CustomColor3%
    WinSet, Transparent, 150

    SysGet, MonitorWorkArea, MonitorWorkArea
    MonitorWorkAreaRight -= 5

    Gui, Font, cWhite w25, MS Sans Serif

    Gui, Add, Text, cWhite,
    Gui, Add, Text, cWhite, %title%
    Gui, Add, Text, cWhite,
    for _, line in lines
        Gui, Add, Text, cWhite, %line%
    Gui, Add, Text, cWhite,

    Gui, Show, Hide
    WinGetPos,,, width, height
    yPos := (MonitorWorkAreaBottom - MonitorWorkAreaTop - height) // 2 + MonitorWorkAreaTop
    xPos := MonitorWorkAreaRight - width
    Gui, Show, x%xPos% y%yPos% NoActivate, window.

    infoState := true
}

DestroyInfo:
Gui, Destroy
infoState := false
return



; Горячие клавиши для показа информации

f10::
    ShowInfo("AHK для ФСБ"
        , "Данное АХК предназначено для удобства работы как отделу ОБК, так и ОБТ"
        , ""
        , "Скрипт включает в себя не только стандартные функции ФСБ, но и АХК других организаций."
        , "Поддерживается как ручной ввод id игрока, так и автоматический, который вы введете заранее. (Numpad0)"
        , "Можно нажимать как на Numpad, так и вводить текстовые команды в чат."
        , "Для доп. информации: https://github.com/Ilyuxadwa/AHKScripts/blob/main/Radmir/ФСБ/Info.md"
        , ""
        , "Благодарность за помощь в создании: German_Mackelly, Maximus_Petrov")
return

f9 & Numpad0::
    ShowInfo("Что делает Numpad0:"
        , "| N0: Ввод id игрока для дальнейших действий"
        , "| N0 + Alt: Очистить последнее введенное id (если хотите вводить вручную)"
        , "| N0 + Ctrl: Ввести ник маскировки (для использования ахк других орг.)")
return

f9 & Numpad1::
    ShowInfo("Что делает Numpad1:"
        , "| N1: Представится и показать нашивку ФСБ"
        , "| N1 + Alt: Показать удостоверение ФСБ"
        , "| N1 + Ctrl: Показать только нашивку")
return

f9 & Numpad2::
    ShowInfo("Что делает Numpad2:"
        , "| N2: Попросить остановится гражданина"
        , "| N2 + Alt: Оповестить о работе ФСБ"
        , "| N2 + Ctrl: Попросить документы у гражданина")
return

f9 & Numpad3::
    ShowInfo("Что делает Numpad3:"
        , "| N3: Начать погоню за нарушителем"
        , "| N3 + Alt: Надеть наручники + сопровождение"
        , "| N3 + Ctrl: снять наручники + сопровождение")
return

f9 & Numpad4::
    ShowInfo("Что делает Numpad4:"
        , "| N4: Снять маску и другие аксессуары"
        , "| N4 + Alt: Обыскать человека на котиков (в случае находки - введите «найдено» в чат)"
        , "| N4 + Ctrl: Найти документы в карманах человека")
return

f9 & Numpad5::
    ShowInfo("Что делает Numpad5:"
        , "| N5: Опознать человека по лицу"
        , "| N5 + Alt: Опознать человека по документам"
        , "| N5 + Ctrl: Опознать человека по отпечаткам пальцев")
return

f9 & Numpad6::
    ShowInfo("Что делает Numpad6:"
        , "| N6: Выдать розыск"
        , "| N6 + Alt: Выписать штраф"
        , "| N6 + Ctrl: Снять розыск")
return

f9 & Numpad7::
    ShowInfo("Что делает Numpad7:"
        , "| N7: Выкинуть из автомобиля"
        , "| N7 + Alt: Посадить в автомобиль"
        , "| N7 + Ctrl: Выломать дверь в дом")
return

f9 & Numpad8::
    ShowInfo("Что делает Numpad8:"
        , "| N8: Зачитать права"
        , "| N8 + Alt: Вызвать адвоката"
        , "| N8 + Ctrl: Посадить человека за решетку")
return

f9 & Numpad9::
    ShowInfo("Что делает Numpad9:"
        , "| N9: Отследить местоположение"
        , "| N9 + Alt: Выдать выговор"
        , "| N9 + Ctrl: Уволить человека")
return

f9 & x::
    ShowInfo("Что делает X:"
        , "| X + Alt: Открыть полицейский планшет"
        , "| X + Ctrl: Просмотреть список нарушителей в розыске")
return

f9 & 1::
    ShowInfo("Уголовный Кодекс. Страница 1/2:"
        , "| 1.1 Огнестрельное нападение на гражданское лицо - три звезды с изъятием лицензии на оружие."
        , "| 1.1.1 Нападение на гражданское лицо - две звезды"
        , "| 1.2 Огнестрельное нападение на государственного служащего - четыре звезды с изъятием лицензии на оружие."
        , "| 1.2.1 Нападение на государственного служащего - три звезды"
        , "| 1.3 Убийство гражданского лица - три звезды с изъятием лицензии на оружие."
        , "| 1.4 Убийство государственного служащего - четыре звезды с изъятием лицензии на оружие."
        , "| 1.5 Тяжкое убийство ... - пять звезд с изъятием лицензии на оружие."
        , "| 1.6 Угроза расправой гражданскому лицу, сотруднику МВД или членам его семьи - одна звезда"
        , "| 2.1 Угон автомобиля или иного транспорта без цели хищения - три звезды"
        , "| 2.2 Незаконное проникновение на чужую собственность - одна звезда"
        , "| 2.3 Отказ покинуть чужую собственность - одна звезда"
        , "| 2.4 Кража чужого имущества - пять звезд"
        , "| 2.5 Намеренная порча чужого имущества - одна звезда или штраф 10.000 рублей."
        , "| 3.1 Похищение человека - пять звезд"
        , "| 3.2 Клевета в публичном выступлении/СМИ/с должности - две звезды"
        , "| 3.3 Клевета с обвинением в преступлении - две звезды"
        , "| 3.4 Вымогательство имущества или денег - одна звезда или штраф 10.000 рублей."
        , "| 4.1 Терроризм - пять звезд"
        , "| 4.2 Захват или удержание заложника - пять звезд"
        , "| 4.3 Хулиганство - одна звезда"
        , "| 4.4 Отказ покинуть охраняемую территорию силовых структур - две звезды"
        , "| 4.5 Умышленное проникновение на закрытую территорию силовых структур - три звезды"
        , "| 4.5.1 Умышленное проникновение на закрытую территорию (с закрытой зоной) - три звезды"
        , "| 4.5.2 Неумышленное проникновение на охраняемую территорию силовых структур - одна звезда"
        , "| 4.5.3 Неумышленное проникновение на закрытую территорию - одна звезда")
return

f9 & 2::
    ShowInfo("Уголовный Кодекс. Страница 2/2:"
        , "| 4.6 Незаконные действия с оружием/боеприпасами/контрабандой - три звезды с изъятием лицензии на оружие."
        , "| 4.6.1 Ношение или использование оружия в людном месте - одна звезда"
        , "| 4.7 Побег из под стражи в тюрьме ФСИН - три звезды"
        , "| 4.7.1 Помощь при побеге заключенному из ФСИН - две звезды"
        , "| 5.1 Наркотики до 10 грамм (сбыт/перевозка/хранение) - три звезды"
        , "| 5.2 Наркотики свыше 10 грамм (сбыт/перевозка/хранение) - четыре звезды"
        , "| 5.3 Организация проституции или принуждение - три звезды"
        , "| 5.4 Половое сношение с насилием или угрозами - одна звезда"
        , "| 5.5 Сексуальное домогательство - одна звезда"
        , "| 5.6 Выращивание или производство наркотиков - четыре звезды"
        , "| 6.1 Разглашение гос. тайны - три звезды"
        , "| 6.2 Кража гос. собственности, имущества, материалов - четыре звезды"
        , "| 7.1 Превышение должностных полномочий - три звезды"
        , "| 7.2 Неисполнение приказа сотрудником органов правопорядка - две звезды"
        , "| 7.3 Самовольное присвоение полномочий должностного лица - две звезды"
        , "| 7.4 Получение взятки - три звезды"
        , "| 7.5 Дача или попытка дачи взятки - три звезды"
        , "| 7.6 Халатность - одна звезда"
        , "| 8.1 Провокация гос. служащего при исполнении на дороге - одна звезда с лишением прав на вождение."
        , "| 8.2 Подделка удостоверения/бейджика/документа - три звезды"
        , "| 8.3 Самоуправство - две звезды"
        , "| 8.4 Неповиновение законному требованию сотрудника полиции/военного - две звезды"
        , "| 8.4.1 Отказ от предъявления документов - одна звезда"
        , "| 8.5 Укрывательство преступника или улик - три звезды"
        , "| 8.6 Грубое и неоднократное оскорбление при власти - штраф 20.000 рублей."
        , "| 8.7 Самовольное покидание военным места службы - две звезды"
        , "| 8.8 Помеха сотруднику правоохранительных органов - одна звезда")
return

f9 & 3::
    ShowInfo("КоАП (Основные статьи):"
        , "| 2.1. Езда по встречной полосе: 5000 рублей, а так же лишение лицензии на управление ТС."
        , "| 2.2. Езда по встречной полосе, в следствии чего ДТП: 10.000 рублей, компенсация, а так же лишение лицензии на управление ТС."
        , "| 2.3. Пересечение двойной сплошной: 8000 рублей, Если ДТП, то лишение лицензии на управление ТС."
        , "| 2.4. азворот через двойную сплошную линию разметки: 10.000 рублей, Если ДТП, то лишение лицензии на управление ТС."
        , "| 3.1. Проезд на красный свет: 3000 рублей"
        , "| 3.2. Проезд на красный свет, ДТП: 10.000 рублей, лишение лицензии на управление ТС."
        , "| 9.1. Агрессивное поведение на дороге находясь в ТС на водительском месте: 10.000 рублей и конфискация всех имеющихся лицензий на управление ТС."
        , "| 13.1 За оскорбление сотрудника правоохранительных органов: 25.000 рублей.")
return

f9 & 4::
    ShowInfo("Устав МО (сокращённо):"
        , "| 3.8 Обращение к старшим только на 'Вы'. [Выговор]"
        , "| 3.10 Запрещено перечить старшему. [Выговор]"
        , "| 3.11 Сержант+ обязан быть на конвоях. [Выговор]"
        , "| 3.12 В конце дня снять бронежилет. [Выговор]"
        , "| 3.13 При общении предъявлять удостоверение. [Выговор]"
        , "| 3.14 В патруле ездить только на 'ВАИ'. [Выговор]"
        , "| 4.1 Запрещено стрелять/давить без причины. [Увал]"
        , "| 4.2 Личное использование Т/С. [Увал]"
        , "| 4.3 Личное использование должности. [Выговор/Увал]"
        , "| 4.4 Езда по В/Ч без причины. [Выговор]"
        , "| 4.5 Брать Т/С без разрешения. [Выговор]"
        , "| 4.6 Запрещены наркотики. [Выговор/Увал]"
        , "| 4.7 Неподчинение старшему. [Выговор/Увал]"
        , "| 4.8 Бездействие на В/Ч. [Выговор]"
        , "| 4.9 Прогул рабочего дня. [Увал]"
        , "| 4.10 Неадекватное поведение. [Выговор/Увал]"
        , "| 4.11 Требовать повышения/отчёта нельзя. [Выговор]"
        , "| 4.12 Носить боевую форму вне задач нельзя. [Выговор]"
        , "| 4.13 Продавать патроны запрещено. [Увал]"
        , "| 4.14 Несоблюдение субординации. [Выговор/Увал]"
        , "| 4.15 Запрещено лазить на крыши. [Выговор]"
        , "| 4.16 Воровство ящиков с вертолёта. [Выговор]"
        , "| 4.17 Запрещено использовать ЛТС на В/Ч и в городе. [Выговор]"
        , "| 4.18 Сон вне казармы/мед.блока >5 мин. [Выговор]"
        , "| 4.19 Превышение полномочий. [Выговор]"
        , "| 4.20 Ряд-Прп: нельзя на КПП без причины. [Предупр./Выговор]"
        , "| 4.22 Неподобающее поведение (маты, танцы). [Выговор]"
        , "| 4.23 Стрельба по своим. [Увал]"
        , "| 4.24 Сотрудничество с ОПГ. [Увал]"
        , "| 4.25 Взаимодействие с ОПГ даже вне службы. [Увал]"
        , "| 4.26 Развлечения в рабочее время запрещены. [Выговор]")
return

f9 & 5::
    ShowInfo("ФзОП (сокращённо). Страница 1/2:"
        , "| 3.1 Знать УК, КоАП, ФЗоП, ПДД. [Выговор/Увал]"
        , "| 3.2 Защита граждан, порядок, поимка преступников. [Выговор/Увал]"
        , "| 3.3 Пресекать нарушения. [Выговор]"
        , "| 3.4 Докладывать о правонарушениях. [Выговор]"
        , "| 3.5 Огонь без предупреждения при угрозе жизни. [Увал]"
        , "| 3.6 Уважать граждан. [Выговор]"
        , "| 3.7 Парковать Т/С аккуратно. [Выговор]"
        , "| 3.8 Иметь регистратор, фиксировать действия. [Увал]"
        , "| 3.9 Проводить обыск при задержании. [Выговор]"
        , "| 3.10 Показывать удостоверение по просьбе (кроме рядовых). [Выговор]"
        , "| 3.11 Показывать удостоверение при приказе. [Выговор]"
        , "| 3.12 Читать миранду при задержании. [Выговор]"
        , "|"
        , "| 4.1 Запр. оружие без причины. [Увал]"
        , "| 4.2 Запр. наркотики. [Увал]"
        , "| 4.3 Запр. дубинка/наручники без причины. [Выговор/Увал]"
        , "| 4.4 Запр. оскорбления/маты. [Выговор/Увал]"
        , "| 4.5 Запр. сотрудничество с ОПГ. [Увал]"
        , "| 4.6 Запр. личный Т/С/аксессуары в раб. время. [Выговор]"
        , "| 4.7 Запр. задерживать больше лиц, чем сотрудников. [Увал]"
        , "| 4.8 Запр. требовать проверки отчёта, неповиновение. [Выговор]"
        , "| 4.9 Запр. снимать розыск (кроме ошибки). [Увал]"
        , "| 4.10 Запр. личное использование сирен. [Выговор]"
        , "| 4.11 Запр. взаимодействие с БП. [Увал]"
        , "| 4.12 Запр. Т/С в личных целях. [Увал]"
        , "| 4.14 Запр. полномочия в личных целях. [Выговор/понижение]"
        , "| 4.15 Запр. нарушать ПДД (кроме погони). [Выговор]")
return

f9 & 6::
    ShowInfo("ФзОП (сокращённо). Страница 2/2:"
        , "| 4.16 Огонь только при серьёзных основаниях. [Увал]"
        , "| 4.17 Стрельба: 1 предупреждение, 1 в воздух, далее в колёса. [Увал]"
        , "| 4.18 Запр. гражданская форма на службе. [Выговор/Увал]"
        , "| 4.19 Запр. нарушать субординацию. [Выговор/Увал]"
        , "| 4.20 Запр. игнорировать вызовы. [Выговор/Увал]"
        , "| 4.22 Запр. развлечения в рабочее время. [Выговор]"
        , "| 4.23 Запр. нахождение в заведениях (казино и т.д.). [Выговор/Увал]"
        , "| 4.24 Запр. бред в мегафон. [Выговор]"
        , "| 4.25 Запр. неадекватное поведение. [Выговор/Увал]"
        , "| 4.27 Запр. пост без напарника. [Выговор]"
        , "| 4.28 Запр. отбирать права без причины. [Увал]"
        , "| 4.29 Запр. уходить с поста без доклада. [Выговор]"
        , "| 4.30 Запр. самовольно уходить с поста. [Выговор]"
        , "| 4.31 Вносить в казну <100 руб. [Выговор]"
        , "| 4.32 Запр. розыск без причины. [Увал]"
        , "| 4.33 Запр. розыск без оснований/доков. [Увал]"
        , "| 4.34 ДПС: запр. проверять доки без причины. [Выговор/Увал]"
        , "| 4.35 ДПС: запр. эвакуировать без помехи. [Выговор/Увал]"
        , "| 4.36 Запр. оставлять барьеры без контроля. [Увал]"
        , "| 4.37 Запр. не выполнять приказы. [Выговор]"
        , "| 4.38 Повторное нарушение = Увал."
        , "| 4.39 Запр. вводить начальство в заблуждение. [Выговор]"
        , "| 4.40 Запр. быть в розыске. [Увал]"
        , "| 4.41 Запр. снимать розыск своим. [Увал]"
        , "| 4.42 Запр. работать вне отдела. [Выговор]"
        , "| 4.43 Запр. сон >5 мин вне раздевалки. [Выговор]"
        , "| 4.44 Строй только с Майора. [Выговор]"
        , "| 4.45 Запр. радары на платной дороге. [Увал]"
        , "| 4.46 Запр. контакты с ОПГ даже вне службы. [Увал]"
        , "| 4.47 Запр. неверный формат удостоверений. [Устное/Выговор]"
        , "| 4.48 Запр. патруль на 1-2 ранге. [Выговор]"
        , "| 4.49 В КТО участвует только СОБР. [Увал]")
return

f9 & 7::
    ShowInfo("Устав ФСИН (сокращённо):"
        , "| 4.0 Запр. открывать двери кнопкой в раздевалке. [Выговор/Увал]"
        , "| 4.1 Запр. игнорировать приказы старших. [Выговор/Увал]"
        , "| 4.2 Запр. использовать оружие не по назначению. [Выговор/Увал]"
        , "| 4.3 Запр. вредить коллегам. [Увал+ЧС]"
        , "| 4.4 Запр. вредить заключённым без причины. [Увал+ЧС]"
        , "| 4.5 Запр. наркотики (даже без формы). [Увал+ЧС]"
        , "| 4.6 Запр. личные цели на транспорте/ЛТС. [Выговор]"
        , "| 4.8 Запр. обман/угрозы старшему составу. [Увал]"
        , "| 4.9 Запр. неадекватное поведение. [Выговор]"
        , "| 4.10 Запр. назойливые просьбы об отчётах. [Выговор]"
        , "| 4.11 Запр. обман ради выгоды. [Выговор/Увал]"
        , "| 4.12 Запр. нарушать субординацию. [Выговор/Увал]"
        , "| 4.15 Запр. прогул рабочего дня. [Увал]"
        , "| 4.16 Сон >3 мин вне раздевалки. [Выговор]"
        , "| 4.17 Запр. превышать полномочия. [Выговор/Увал+ЧС]"
        , "| 4.18 Запр. оскорбления/маты/упоминание родных. [Выговор/Увал]"
        , "| 4.19 Запр. покидать ФСИН без разрешения. [Увал]"
        , "| 4.20 Запр. ставить ЛТС в тюрьме (кроме нач./зам.). [Выговор]"
        , "| 4.22 Запр. брать взятки от заключённых. [Увал]"
        , "| 4.23 Запр. тревога без причины. [Выговор]"
        , "| 4.24 Запр. кататься на шлагбаумах. [Выговор]"
        , "| 4.25 Запр. делать оповещения. [Выговор]"
        , "| 4.26 Запр. выдавать пропуска вне графика. [Выговор]"
        , "| 4.27 Запр. алкоголь на службе. [Выговор]"
        , "| 4.28 Обяз. сдать оружие/броню после смены. [Выговор]"
        , "| 4.29 Если остался в форме — выполнять обязанности. [Выговор/Увал]"
        , "| 4.30 Запр. развлечения в рабочее время. [Выговор]")
return

f10 up::
f9 & x up::
f9 & 1 up::
f9 & 2 up::
f9 & 3 up::
f9 & 4 up::
f9 & 5 up::
f9 & 6 up::
f9 & 7 up::
f9 & Numpad0 up::
f9 & Numpad1 up::
f9 & Numpad2 up::
f9 & Numpad3 up::
f9 & Numpad4 up::
f9 & Numpad5 up::
f9 & Numpad6 up::
f9 & Numpad7 up::
f9 & Numpad8 up::
f9 & Numpad9 up::goto DestroyInfo