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
RCtrl & Numpad0::Goto ВводНика
Numpad1::Goto Приветствие
Alt & Numpad1::Goto УдостоверениеФСБ
RCtrl & Numpad1::Goto Нашивка
Numpad2::Goto ПросьбаОстановится
Alt & Numpad2::Goto РаботаФСБ
RCtrl & Numpad2::Goto ПросьбаДокументов
Numpad3::Goto НачатьПогоню
Alt & Numpad3::Goto Арест
RCtrl & Numpad3::Goto ОтменаАреста
Numpad4::Goto СнятьАксессуары
Alt & Numpad4::Goto Обыск
RCtrl & Numpad4::Goto ОбыскДокументов
Numpad5::Goto Фоторобот
Alt & Numpad5::Goto ЧеловекДокументы
RCtrl & Numpad5::Goto ЧеловекОтпечатки
Numpad6::Goto Розыск
Alt & Numpad6::Goto Штраф
RCtrl & Numpad6::Goto СнятьРозыск
Numpad7::Goto ВыкинутьИзАвто
Alt & Numpad7::Goto ПосадитьВАвто
RCtrl & Numpad7::Goto ВыломатьДверь
Numpad8::Goto ЗачитатьПрава
Alt & Numpad8::Goto ВызватьАдвоката
RCtrl & Numpad8::Goto ПосадитьЗаРешетку
Numpad9::Goto ОтследитьМестоположение
Alt & Numpad9::Goto Выговор
RCtrl & Numpad9::Goto Уволить
Alt & X::Goto ПолицейскийПланшет
RCtrl & X::Goto СписокРозыска
Alt & RCtrl::Goto ПереключитьАхк

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

:?*:фейк-ник::
:?*:fakename::
:?*:fakenick::
Goto ВводНика

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
Sleep 700
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
SendInput {F6}Так-же вы имеете право на адвоката. Вам нужен адвокат?{enter}
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
SendInput, {F6}Ожидаем ответ в течении 5 минут, время пошло{Enter}
Sleep 700
SendInput, {F6}/me взглянул на часы и запомнил время{Enter}
Sleep 700
SendInput, {F6}/d [ФСБ] - [Право] Нужен адвокат в  . Время на ответ: 5 минут.{Left 27}
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
SendInput, {F6}/me Открыл список разыскиваемых{Enter}
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
Sleep 100
SendInput, {Down}
Sleep 100
SendInput, {Enter}
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
Sleep 100
SendInput, {Down}
Sleep 100
SendInput, {Enter}
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
Sleep 100
SendInput, {Down}
Sleep 100
SendInput, {Enter}
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

Rctrl & f::
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
        , "| N0 + RCtrl: Ввести ник маскировки (для использования ахк других орг.)")
return

f9 & Numpad1::
    ShowInfo("Что делает Numpad1:"
        , "| N1: Представится и показать нашивку ФСБ"
        , "| N1 + Alt: Показать удостоверение ФСБ"
        , "| N1 + RCtrl: Показать только нашивку")
return

f9 & Numpad2::
    ShowInfo("Что делает Numpad2:"
        , "| N2: Попросить остановится гражданина"
        , "| N2 + Alt: Оповестить о работе ФСБ"
        , "| N2 + RCtrl: Попросить документы у гражданина")
return

f9 & Numpad3::
    ShowInfo("Что делает Numpad3:"
        , "| N3: Начать погоню за нарушителем"
        , "| N3 + Alt: Надеть наручники + сопровождение"
        , "| N3 + RCtrl: снять наручники + сопровождение")
return

f9 & Numpad4::
    ShowInfo("Что делает Numpad4:"
        , "| N4: Снять маску и другие аксессуары"
        , "| N4 + Alt: Обыскать человека на котиков (в случае находки - введите «найдено» в чат)"
        , "| N4 + RCtrl: Найти документы в карманах человека")
return

f9 & Numpad5::
    ShowInfo("Что делает Numpad5:"
        , "| N5: Опознать человека по лицу"
        , "| N5 + Alt: Опознать человека по документам"
        , "| N5 + RCtrl: Опознать человека по отпечаткам пальцев")
return

f9 & Numpad6::
    ShowInfo("Что делает Numpad6:"
        , "| N6: Выдать розыск"
        , "| N6 + Alt: Выписать штраф"
        , "| N6 + RCtrl: Снять розыск")
return

f9 & Numpad7::
    ShowInfo("Что делает Numpad7:"
        , "| N7: Выкинуть из автомобиля"
        , "| N7 + Alt: Посадить в автомобиль"
        , "| N7 + RCtrl: Выломать дверь в дом")
return

f9 & Numpad8::
    ShowInfo("Что делает Numpad8:"
        , "| N8: Зачитать права"
        , "| N8 + Alt: Вызвать адвоката"
        , "| N8 + RCtrl: Посадить человека за решетку")
return

f9 & Numpad9::
    ShowInfo("Что делает Numpad9:"
        , "| N9: Отследить местоположение"
        , "| N9 + Alt: Выдать выговор"
        , "| N9 + RCtrl: Уволить человека")
return

f9 & x::
    ShowInfo("Что делает X:"
        , "| X + Alt: Открыть полицейский планшет"
        , "| X + RCtrl: Просмотреть список нарушителей в розыске")
return

f10 up::
f9 & x up::
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