; Информация (обязательно заполнить)

tag := "ТЕГ"
rank := "Звание"
name := "Имя"
surname := "Фамилия"



; Другие переменные для работы скрипта

specials := false



; Назначение клавиш (может использоватся вместо команд). Для их работы необходимо их включить (+ на нампаде) 



#If specials
Numpad1::Goto Доки
!Numpad1::Goto ФуллДоки
^Numpad1::Goto Посторонний

Numpad2::Goto ВзводПринять
!Numpad2::Goto ВзводУволить
^Numpad2::Goto ВзводНомер

Numpad3::Goto Мегафон

Numpad4::Goto СтройСбор3мин
!Numpad4::Goto СтройСбор5мин
^Numpad4::Goto КонвойСбор

Numpad5::Goto КонвойИнфо
!Numpad5::Goto КонвойСередина
^Numpad5::Goto КонвойКонец
#If



; Блок текстовых команд

:?*:ст.сб3::
:?*:ст.сбор3::
:?*:строй.сбор3::
Goto СтройСбор3мин

:?*:ст.сб5::
:?*:ст.сбор5::
:?*:строй.сбор5::
Goto СтройСбор5мин

:?*:ст.инф::
:?*:строй.инф::
Goto СтройИнфо

:?*:кн.сб::
:?*:конвой.сбор::
Goto КонвойСбор

:?*:кн.инф::
:?*:конвой.инф::
Goto КонвойИнфо

:?*:кн.ср::
:?*:кн.сер::
:?*:конвой.ср::
:?*:конвой.сер::
Goto КонвойСередина

:?*:кн.к::
:?*:конвой.конец::
Goto КонвойКонец

:?*:взв.номер::
:?*:взв.?::
:?*:взвод.номер::
:?*:взвод.?::
Goto ВзводНомер

:?*:взв.инв::
:?*:взвод.инв::
:?*:взв.прин::
:?*:взвод.прин::
Goto ВзводПринять

:?*:взв.увал::
:?*:взвод.увал::
Goto ВзводУволить

:?*:взвод.номер::
Goto КонвойКонец

:?*:доки::
Goto Доки

:?*:док.ф::
:?*:фуллдок::
:?*:фулл.док::
Goto ФуллДоки

:?*:гражд::
:?*:посторонний::
Goto Посторонний



; Блок функций

Доки:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
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
SendInput, {F6}/doc{Space}
Return

ФуллДоки:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput, {F6}Здравия желаю, я - %rank% Армии %name% %surname%{!}{Enter}
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
SendInput, {F6}/doc{Space}
Sleep 5000
SendInput, {F6}Цель прибытия на охраняемую территорию?{Enter}
Return

Посторонний:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
SendInput, {F6}Гражданин, будьте добры документы, подтвердающие вашу личность{!} {Enter}
Sleep 500
SendInput, {F6}/n /doc id или /pass id {Enter}
Sleep 500
SendInput, {F6}В случае неподчинения по вам откроют огонь{!}{Enter}
Return


ВзводПринять:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
Sendinput,{F6}/do Новые шевроны в кармане.{Enter}
Sleep 1000
Sendinput,{F6}/me достал их {Enter}
Sleep 1000
Sendinput,{F6}/do Новые шевроны в руке.{Enter}
Sleep 1000
Sendinput,{F6}/me отдал их человеку напротив {Enter}
Sleep 1000
Sendinput,{F6}/invite{Space}
Return

ВзводУволить:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
Sendinput,{F6}/do Шевроны весят на человеке.{Enter}
Sleep 1000
Sendinput,{F6}/me сорвал их {Enter}
Sleep 1000
Sendinput,{F6}/do Шевроны в руке.{Enter}
Sleep 1000
Sendinput,{F6}/me убрал их в карман {Enter}
Sleep 1000
Sendinput,{F6}/uninvite{Space}
Return

ВзводНомер:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
Sendinput,{F6}Хорошо, я вас приму.{Enter}
Sleep 1000
Sendinput,{F6}Только скажите номер вашего заявления?{Enter}
Return

Мегафон:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
Sendinput,{F6}/do Мегафон лежит на панели.{Enter}
Sleep 1000
Sendinput,{F6}/me взял его в руки и зажал красную кнопку{Enter}
Sleep 1000
Sendinput,{F6}/m [ВАИ] Внимание, Гражданские{!} Пропускаем военную колонну{!}{Enter}
Sleep 2000
Sendinput,{F6}/m [ВАИ] В случае угрозы безопасности - откроем огонь по колесах{!}{Enter}
Return

СтройСбор3мин:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
Sendinput,{F6}/r [%tag%] Строй на плацу, готовность 3 минуты{!}{Enter}
Sleep 60000
Sendinput,{F6}/r [%tag%] Строй на плацу, готовность 2 минуты{!} {Enter}
Sleep 60000
Sendinput,{F6}/r [%tag%] Строй на плацу, готовность 1 минута{!}{Enter}
Return

СтройСбор5мин:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
Sendinput,{F6}/r [%tag%] Строй на плацу, готовность 5 минут{!}{Enter}
Sleep 60000
Sendinput,{F6}/r [%tag%] Строй на плацу, готовность 4 минуты{!}{Enter}
Sleep 60000
Sendinput,{F6}/r [%tag%] Строй на плацу, готовность 3 минуты{!}{Enter}
Sleep 60000
Sendinput,{F6}/r [%tag%] Строй на плацу, готовность 2 минуты{!} {Enter}
Sleep 60000
Sendinput,{F6}/r [%tag%] Строй на плацу, готовность 1 минута{!}{Enter}
Return

СтройИнфо:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
Sendinput,{F6}/n Перед началом хочу вам напомнить что нужно для того, что бы вам защитали отчет:{Enter}
Sleep 1000
Sendinput,{F6}/n 1. С Спец. Операции (РП) требуется не менее 5 скринов{Enter}
Sleep 1000
Sendinput,{F6}/n Начало | Середина (должно быть видно 5 отыгровок от вас) | Конец.{Enter}
Sleep 1000
Sendinput,{F6}/n 2. С тренировки нужно 3+ скринов.{Enter}
Sleep 1000
Sendinput,{F6}/n  Начало | середина (несколько упражнений) | Конец.{Enter}
Sleep 1000
Sendinput,{F6}/n 3. С лекции требуется всего 1 скрин. (Желательно конец){Enter}
Sleep 1000
Sendinput,{F6}/n Концом РП и тренировки являются слова от проводящего строй...{Enter}
Sleep 1000
Sendinput,{F6}/n Что тренировка окончена / Спец. задание все выполнили.{Enter}
Sleep 1000
Sendinput,{F6}/n 4. Все скрины должны быть сделаны с /c 060{Enter}
Sleep 1000
Sendinput,{F6}/n Спасибо за внимание, переходим к строю...{Enter}
Return

КонвойСбор:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
Sendinput,{F6}/r [%tag%] Бойцы, собираемся в конвой для поставки материалов.{Enter}
Sleep 1000
Sendinput,{F6}/r [%tag%] Просьба сразу взять боевую форму, бронежилет, оружие и аптечки.{Enter}
Sleep 1000
Sendinput,{F6}/r [%tag%] Жду всех на плацу.{Enter}
Return

КонвойИнфо:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
Sendinput,{F6}/r [%tag%] Внимание колонна, перед началом движения прошу вас:{Enter}
Sleep 1000
Sendinput,{F6}/r [%tag%] Проверить наличие оружия, бронежилета и аптечки.{Enter}
Sleep 1000
Sendinput,{F6}/r [%tag%] Настроить рацию на частоту 102.1{Enter}
Sleep 1000
Sendinput,{F6}/rr /radio_set - Поставка материалов.{Enter}
Sleep 1000
Sendinput,{F6}/r [%tag%] Во время движения соблюдать ПДД, ехать аккуратно, без обгонов.{Enter}
Sleep 1000
Sendinput,{F6}/rr Важно, не играть в гонки а выполнять четко поставленную задачу.{Enter}
Sleep 1000
Sendinput,{F6}/rr Если мне не понравится ваше вождение - произойдет замена.{Enter}
Sleep 1000
Sendinput,{F6}/r [%tag%] Так-же в случае нападения - ваша задача максимально защищать колонну.{Enter}
Sleep 1000
Sendinput,{F6}/rr И на последок, напоминаю про скрины для отчетов о сопровождении колонны...{Enter}
Sleep 1000
Sendinput,{F6}/rr В начале | Середина (Секретная база) | Конец{Enter}
Return

КонвойСередина:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
Sendinput,{F6}/r [%tag%] Внимание колонна.{Enter}
Sleep 1000
Sendinput,{F6}/r [%tag%] Все пассажиры обязаны грузить ящики без исключений.{Enter}
Sleep 1000
Sendinput,{F6}/rr Так-же напоминаю про скрин для отчета о сопровождении колонны.{Enter}
Sleep 1000
Sendinput,{F6}/r [%tag%] После загрузки выдвигаемся в{Space}
Return

КонвойКонец:
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
Sendinput,{F6}/r [%tag%] Благодярю всех за помощь в поставке материалов.{Enter}
Sleep 1000
Sendinput,{F6}/r [%tag%] После разгрузки снимите боевую форму, а также...{Enter}
Sleep 1000
Sendinput,{F6}/r [%tag%] Смените частоту рации на 102.0{Enter}
Sleep 1000
Sendinput,{F6}/rr /radio_set - Основной канал.{Enter}
Sleep 1000
Sendinput,{F6}/rr И не забудьте про скрин для отчета{!}{!}{!}{Enter}
Return



; Дополнительное

!n::
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{F6}/n Откат.{Enter}
Return

!f::
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{F6}/c 60{Enter}
Return

^f::
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{F6}/c 60{Enter}
Sleep 2500
Sendinput,{F8}
Return

NumpadAdd::
specials := !specials
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{F6}/n Нампад для ахк: %specials%
Sleep 800
Sendinput,{BS 150}{Enter}
return