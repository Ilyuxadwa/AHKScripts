/*
В блокноте, VSCode, Notepad++ и других редакторах кода:
Ctrl+H - Заменяем ТЕГ на ваш. Звание, Имя Фамилия используются только в 1 случае, поменять легко.
*/

Numpad1::
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}Здравия желаю, я - Звание Армии Имя Фамилия{!} {Enter}
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


Numpad2::
SendMessage, 0x50,, 0x4190419,, A
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

!Numpad2::
SendMessage, 0x50,, 0x4190419,, A
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

^Numpad2::
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{F6}Хорошо, я вас приму.{Enter}
Sleep 1000
Sendinput,{F6}Только скажите номер вашего заявления?{Enter}
Return

Numpad3::
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{F6}/do Мегафон лежит на панели.{Enter}
Sleep 1000
Sendinput,{F6}/me взял его в руки и зажал красную кнопку{Enter}
Sleep 1000
Sendinput,{F6}/m [ВАИ] Внимание, Гражданские{!} Пропускаем военную колонну{!}{Enter}
Sleep 2000
Sendinput,{F6}/m [ВАИ] В случае угрозы безопасности - откроем огонь по колесах{!}{Enter}
Return

:?*:ст.сб3::
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
Sendinput,{F6}/r [ТЕГ] Строй на плацу, готовность 3 минуты{!}{Enter}
Sleep 60000
Sendinput,{F6}/r [ТЕГ] Строй на плацу, готовность 2 минуты{!} {Enter}
Sleep 60000
Sendinput,{F6}/r [ТЕГ] Строй на плацу, готовность 1 минута{!}{Enter}
Return

:?*:ст.сб5::
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
Sendinput,{F6}/r [ТЕГ] Строй на плацу, готовность 5 минут{!}{Enter}
Sleep 60000
Sendinput,{F6}/r [ТЕГ] Строй на плацу, готовность 4 минуты{!}{Enter}
Sleep 60000
Sendinput,{F6}/r [ТЕГ] Строй на плацу, готовность 3 минуты{!}{Enter}
Sleep 60000
Sendinput,{F6}/r [ТЕГ] Строй на плацу, готовность 2 минуты{!} {Enter}
Sleep 60000
Sendinput,{F6}/r [ТЕГ] Строй на плацу, готовность 1 минута{!}{Enter}
Return

:?*:кн.сб::
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
Sendinput,{F6}/r [ТЕГ] Бойцы, собираемся в конвой для поставки материалов.{Enter}
Sleep 1000
Sendinput,{F6}/r [ТЕГ] Просьба сразу взять боевую форму, бронежилет, оружие и аптечки.{Enter}
Sleep 1000
Sendinput,{F6}/r [ТЕГ] Жду всех на плацу.{Enter}
Return

:?*:кн.инф::
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
Sendinput,{F6}/r [ТЕГ] Внимание колонна, перед началом движения прошу вас:{Enter}
Sleep 1000
Sendinput,{F6}/r [ТЕГ] Проверить наличие оружия, бронежилета и аптечки.{Enter}
Sleep 1000
Sendinput,{F6}/r [ТЕГ] Настроить рацию на частоту 102.1{Enter}
Sleep 1000
Sendinput,{F6}/rr /radio_set - Поставка материалов.{Enter}
Sleep 1000
Sendinput,{F6}/r [ТЕГ] Во время движения соблюдать ПДД, ехать аккуратно, без обгонов.{Enter}
Sleep 1000
Sendinput,{F6}/rr Важно, не играть в гонки а выполнять четко поставленную задачу.{Enter}
Sleep 1000
Sendinput,{F6}/rr Если мне не понравится ваше вождение - произойдет замена.{Enter}
Sleep 1000
Sendinput,{F6}/r [ТЕГ] Так-же в случае нападения - ваша задача максимально защищать колонну.{Enter}
Sleep 1000
Sendinput,{F6}/rr И на последок, напоминаю про скрины для отчетов о сопровождении колонны...{Enter}
Sleep 1000
Sendinput,{F6}/rr В начале | Середина (Секретная база) | Конец{Enter}
Return

:?*:кн.ср::
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
Sendinput,{F6}/r [ТЕГ] Внимание колонна.{Enter}
Sleep 1000
Sendinput,{F6}/r [ТЕГ] Все пассажиры обязаны грузить ящики без исключений.{Enter}
Sleep 1000
Sendinput,{F6}/rr Так-же напоминаю про скрин для отчета о сопровождении колонны.{Enter}
Sleep 1000
Sendinput,{F6}/r [ТЕГ] После загрузки выдвигаемся в{Space}
Return

:?*:кн.к::
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{Enter}
Sleep 500
Sendinput,{F6}/r [ТЕГ] Благодярю всех за помощь в поставке материалов.{Enter}
Sleep 1000
Sendinput,{F6}/r [ТЕГ] После разгрузки снимите боевую форму, а также...{Enter}
Sleep 1000
Sendinput,{F6}/r [ТЕГ] Смените частоту рации на 102.0{Enter}
Sleep 1000
Sendinput,{F6}/rr /radio_set - Основной канал.{Enter}
Sleep 1000
Sendinput,{F6}/rr И не забудьте про скрин для отчета{!}{!}{!}{Enter}
Return

:?*:ст.инф::
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
