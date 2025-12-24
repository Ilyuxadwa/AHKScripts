; Информация про пользователя

name := "Имя"
surname := "Фамилия"
department := "Взвод"
rank := "Звание"
tag := "ТЕГ" ; Тег в рацию



; Пользовательская настройка скрипта (True - Включено, False - Выключено)

keyModifier := "XButton2" ; Специальная клавиша для замены Numpad'a (Нажимаете эту клавишу + цифру на основной клавиатуре)
hotkeys := true ; Включение и отключение горячих клавиш (Нужны ли они вообще?)
commands := true ; Включение и отключение команд (Нужны ли они вообще?)



; Системные настройки скрипта

#UseHook
#NoEnv
SetWorkingDir %A_ScriptDir%
SetKeyDelay, -1, 10
SetBatchLines, -1
#MaxHotkeysPerInterval 500
#HotkeyInterval 500
#Hotstring EndChars `n
#Hotstring ? *0
#Hotstring NoMouse

#InstallKeybdHook
#InstallMouseHook
#Persistent



; Остальные переменные для работы скрипта

infoState := false
scriptMode := 0 ; 0 - Обычный (конвой), 1 - Строй, 2 - Собес
ExtendedInfo("AHK для МО by Foster"
        , ""
        , "Скрипт больше предназначен для старших рангов МО (5+),"
        , "однако для новобранцев тоже есть полезные функции."
        , "Полная инструкция: https://github.com/Ilyuxadwa/AHKScripts/blob/main/Radmir/МО/Info km.md")
Sleep 3000
Goto DestroyInfo
Return



; Назначение клавиш

#If (scriptMode = 0) && hotkeys && GetKeyState(keyModifier, "P")
1::Goto Приветствие
<!1::Goto Удостоверение
^1::Goto Бегунок
2::Goto КонвойСбор
3::Goto КонвойИнфо
4::Goto КонвойВыезд
5::Goto КонвойЗагрузка
6::Goto КонвойЕдемВч
<!6::Goto КонвойЕдемГос
7::Goto КонвойКонец
8::Goto МегафонКонвой
9::Goto Принять
<!9::Goto Повысить
^9::Goto ВыдатьВзвод
>!9::Goto ЗанестиЧС
0::Goto Выговор
<!0::Goto СнятьВыговор
^0::Goto Уволить
>!0::Goto УволитьОфф
#If
#If (scriptMode = 1) && hotkeys && GetKeyState(keyModifier, "P")
1::Goto Строй3МинПовседневный
<!1::Goto Строй5МинПовседневный
^1::Goto Строй3МинБоевка
>!1::Goto Строй5МинБоевка
2::Goto СтройИнфо
<!2::Goto РандомЛекция
3::Goto Лекция1
4::Goto Лекция2
5::Goto Лекция3
6::Goto Лекция4
7::Goto Лекция5
8::Goto Лекция6
9::Goto Лекция7
0::Goto Тренировка
#If
#If (scriptMode = 2) && hotkeys && GetKeyState(keyModifier, "P")
1::Goto СобесВопрос
<!1::Goto СобесНачало
^1::Goto Годен
2::Goto СобесПаспорт
3::Goto СобесПроМедку
4::Goto СобесМедка
5::Goto СобесПроЛицензии
6::Goto СобесЛицензии
7::Goto СобесПсих1
8::Goto СобесПсих2
9::Goto СобесРП
0::Goto ОтказРП
<!0::Goto ОтказПаспорт
^0::Goto ОтказМедка
>!0::Goto ОтказЛиц
#If
Ctrl & LAlt::Goto ПереключитьАхк



; Назначение команд

#If commands
::/hello::
::.руддщ::
::.прив::
CommandHelper()
Goto Приветствие

::/doc::
::.вщс::
::.удо::
CommandHelper()
Goto Удостоверение

::/stop::
::.ыещз::
::.стоп::
CommandHelper()
Goto Бегунок

::/convoy1::
::/convoy_sbor::
::.сщтмщн1::
::.сщтмщн_ыищк::
::кн.сб::
CommandHelper()
Goto КонвойСбор

::/convoy2::
::/convoy_info::
::.сщтмщн2::
::.сщтмщн_штащ::
::кн.инф::
CommandHelper()
Goto КонвойИнфо

::/convoy3::
::/convoy_start::
::.сщтмщн3::
::.сщтмщн_ыефке::
::кн.нач::
CommandHelper()
Goto КонвойВыезд

::/convoy4::
::/convoy_loading::
::.сщтмщн4::
::.сщтмщн_дщфвштп::
::кн.заг::
CommandHelper()
Goto КонвойЗагрузка

::/convoy5.1::
::/convoy_base::
::.сщтмщн5.1::
::.сщтмщн_ифыу::
::кн.вч::
CommandHelper()
Goto КонвойЕдемВч

::/convoy5.2::
::/convoy_org::
::.сщтмщн5.2::
::.сщтмщн_щкп::
::кн.орг::
CommandHelper()
Goto КонвойЕдемГос

::/convoy6::
::/convoy_end::
::.сщтмщн6::
::.сщтмщн_утв::
::кн.кон::
CommandHelper()
Goto КонвойКонец

::/m::
::.ь::
::.мегафон::
CommandHelper()
Goto МегафонКонвой

::/stroy_startd3::
::.ыекщн_ыефкев3::
::строй.сборп3::
::ст.сбп3::
CommandHelper()
Goto Строй3МинПовседневный

::/stroy_startd5::
::.ыекщн_ыефкев5::
::строй.сборп5::
::ст.сбп5::
CommandHelper()
Goto Строй5МинПовседневный

::/stroy_startb3::
::.ыекщн_ыефкеи3::
::строй.сборб3::
::ст.сбб3::
CommandHelper()
Goto Строй3МинБоевка

::/stroy_startb5::
::.ыекщн_ыефкеи5::
::строй.сборб5::
::ст.сбб5::
CommandHelper()
Goto Строй5МинБоевка

::/stroy_info::
::.ыекщн_штащ3::
::строй.ифно::
::ст.инф::
CommandHelper()
Goto СтройИнфо

::/lec::
::.дус::
::.лек::
::.лекция::
CommandHelper()
Goto РандомЛекция

::/lec 1::
::.дус 1::
::.лек 1::
::.лекция 1::
CommandHelper()
Goto Лекция1

::/lec 2::
::.дус 2::
::.лек 2::
::.лекция 2::
CommandHelper()
Goto Лекция2

::/lec 3::
::.дус 3::
::.лек 3::
::.лекция 3::
CommandHelper()
Goto Лекция3

::/lec 4::
::.дус 4::
::.лек 4::
::.лекция 4::
CommandHelper()
Goto Лекция4

::/lec 5::
::.дус 5::
::.лек 5::
::.лекция 5::
CommandHelper()
Goto Лекция5

::/lec 6::
::.дус 6::
::.лек 6::
::.лекция 6::
CommandHelper()
Goto Лекция6

::/lec 7::
::.дус 7::
::.лек 7::
::.лекция 7::
CommandHelper()
Goto Лекция7

::/training::
::.екфштштп::
::.треня::
CommandHelper()
Goto Тренировка

::/sobes::
::.ыщиуы::
::.соб::
CommandHelper()
Goto СобесВопрос

::/sobes_start::
::.ыщиуы_ыефке::
::/sobes1::
::.ыщиуы1::
::.соб.нач::
CommandHelper()
Goto СобесНачало

::/sobes_pass::
::.ыщиуы_зфыы::
::/sobes2::
::.ыщиуы2::
::.соб.пас::
CommandHelper()
Goto СобесПаспорт

::/sobes_cmc::
::.ыщиуы_сьс::
::/sobes3::
::.ыщиуы3::
::.соб.дмед::
CommandHelper()
Goto СобесПроМедку

::/sobes_mc::
::.ыщиуы_ьс::
::/sobes4::
::.ыщиуы4::
::.соб.мед::
CommandHelper()
Goto СобесМедка

::/sobes_clic::
::.ыщиуы_сдшс::
::/sobes5::
::.ыщиуы5::
::.соб.длиц::
CommandHelper()
Goto СобесПроЛицензии

::/sobes_lic::
::.ыщиуы_дшс::
::/sobes6::
::.ыщиуы6::
::.соб.лиц::
CommandHelper()
Goto СобесЛицензии

::/sobes_q1::
::.ыщиуы_й1::
::/sobes7::
::.ыщиуы7::
::.соб.вп1::
CommandHelper()
Goto СобесПсих1

::/sobes_q2::
::.ыщиуы_й2::
::/sobes8::
::.ыщиуы8::
::.соб.вп2::
CommandHelper()
Goto СобесПсих2

::/sobes_rp::
::.ыщиуы_кз::
::/sobes9::
::.ыщиуы9::
::.соб.рп::
CommandHelper()
Goto СобесРП

::/cancel_rp::
::.сфтсуд_кз::
::.соб.открп::
CommandHelper()
Goto ОтказРП

::/cancel_pass::
::.сфтсуд_зфыы::
::.соб.откпас::
CommandHelper()
Goto ОтказПаспорт

::/cancel_mc::
::.сфтсуд_ьс::
::.соб.откмед::
CommandHelper()
Goto ОтказМедка

::/cancel_lic::
::.сфтсуд_дшс::
::.соб.отклиц::
CommandHelper()
Goto ОтказЛиц

::/sobes_ok::
::.ыщиуы_щл::
::/sobes10::
::.ыщиуы10::
::.соб.ок::
CommandHelper()
Goto Годен

::/invite::
::.штмшеу::
CommandHelper()
Goto Принять

::/uninvite::
::.штмшеу::
CommandHelper()
Goto Уволить

::/uninviteoff::
::.штмшеу::
CommandHelper()
Goto УволитьОфф

::/fwarn::
::.ацфкт::
CommandHelper()
Goto Выговор

::/unfwarn::
::.гтацфкт::
CommandHelper()
Goto СнятьВыговор

::/blist::
::.идшые::
CommandHelper()
Goto ЗанестиЧС

::/rang::
::.кфтп::
CommandHelper()
Goto Повысить

::/vinvite::
::.мштмшеу::
CommandHelper()
Goto ВыдатьВзвод
#If

CommandHelper() {
    SendInput, {end}+{home}{del}
    SendInput, {esc}
    Sleep 500
}



; Сокращенный ввод

:?*:хелпу1::/d [МО] - [ФСБ/МВД] На воинскую часть готовится нападение. Срочно требуется подкрепление{!}
:?*:хелпу2::/d [МО] - [ФСБ/МВД] На воинскую часть произошло нападение. Срочно требуется подкрепление{!}
:?*:хелп-конвой1::/d [МО] - [ФСБ/МВД] Требуется доп. сопровождение для конвоя{!}
:?*:хелп-конвой2::/d [МО] - [ФСБ/МВД] Требуется доп. сопровождение для конвоя{!} Мы ожидаем на секретной базе.
:?*:связь-фсб::/d [МО] - [ФСБ] На связь...
:?*:связь-мвд::/d [МО] - [МВД] На связь...
:?*:связь-фсин::/d [МО] - [ФСИН] На связь...
:?*:связь-мз::/d [МО] - [МЗ] На связь...
:?*:насвязи-фсб::/d [МО] - [ФСБ] На связи{!}
:?*:насвязи-мвд::/d [МО] - [МВД] На связи{!}
:?*:насвязи-фсин::/d [МО] - [ФСИН] На связи{!}
:?*:насвязи-мз::/d [МО] - [МЗ] На связи{!}
:?*:поставка-мвд::/d [МО] - [МВД] Поставка материалов прибудет к Вам в течении 5 минут.
:?*:поставка-фсб::/d [МО] - [ФСБ] Поставка материалов прибудет к Вам в течении 5 минут.
:?*:поставка-фсин::/d [МО] - [ФСИН] Поставка материалов прибудет к Вам в течении 5 минут.
:?*:ворота-мвд::/d [МО] - [МВД] Откройте ворота, к Вам приехала поставка материалов.
:?*:ворота-фсб::/d [МО] - [ФСБ] Откройте ворота, к Вам приехала поставка материалов.
:?*:ворота-фсин::/d [МО] - [ФСИН] Откройте ворота, к Вам приехала поставка материалов.
:?*:сречь::
SendInput, /r [%tag%] Рядовой  успешно сдал речь{!}{Left 19}
Return
:?*:сприсягу::
SendInput, /r [%tag%] Рядовой  успешно сдал присягу{!}{Left 22}
Return
:?*:сустав::
SendInput, /r [%tag%] Рядовой  успешно сдал устав Мин. Обороны{!}{Left 33}
Return
:?*:патруль-нач::
SendInput, /r [%tag%] Докладывает: %surname%. Выехали в патруль по  с жетоном: . Сост.: Стаб.{Left 26}
Return
:?*:патруль-прод::
SendInput, /r [%tag%] Докладывает: %surname%. Продолжаем патруль по  с жетоном: . Сост.: Стаб.{Left 26}
Return
:?*:патруль-кон::
SendInput, /r [%tag%] Докладывает: %surname%. Завершили патруль по  с жетоном: . Сост.: Стаб.{Left 26}
Return
:?*:патрульвч-нач::
SendInput, /r [%tag%] Докладывает: %surname%. Выехал в патруль по ВЧ. Состояние: Стабильное.
Return
:?*:патрульвч-прод::
SendInput, /r [%tag%] Докладывает: %surname%. Продолжаю патруль по ВЧ. Состояние: Стабильное.
Return
:?*:патрульвч-кон::
SendInput, /r [%tag%] Докладывает: %surname%. Завершил патруль по ВЧ. Состояние: Стабильное.
Return
:?*:пост-нач::
SendInput, /r [%tag%] Докладывает: %surname%. Заступил на пост: . Состояние: Стабильное.{Left 24}
Return
:?*:пост-прод::
SendInput, /r [%tag%] Докладывает: %surname%. Продолжаю пост: . Состояние: Стабильное.{Left 24}
Return
:?*:пост-кон::
SendInput, /r [%tag%] Докладывает: %surname%. Покинул пост: . Состояние: Стабильное.{Left 24}
Return



; Основное

Приветствие:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}Здравия желаю, я - %rank% Армии %surname%{!} {Enter}
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
Input, id, V I M, {Enter}
Sleep 800
SendInput, {F6}Цель прибытия на охраняемую территорию?{Enter}
Return

Удостоверение:
SendMessage, 0x50,, 0x4190419,, A
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

Бегунок:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}Гражданин, остановитесь{!}{Enter}
Sleep 500
SendInput, {F6}Если Вы не остановитесь, мы откроем по Вам огонь{!}{Enter}
Return

; Конвой

КонвойСбор:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/r [%tag%] Бойцы, собираемся в конвой для поставки материалов.{Enter}
Sleep 1000
SendInput, {F6}/r [%tag%] Просьба сразу взять боевую форму, бронежилет, оружие и аптечки...{Enter}
Sleep 1000
SendInput, {F6}/r [%tag%] После чего организовать строй на плацу.{Enter}
Return

КонвойИнфо:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/r [%tag%] Внимание колонна, перед началом движения прошу вас:{Enter}
Sleep 1000
SendInput, {F6}/r [%tag%] Проверить наличие оружия, бронежилета и аптечки.{Enter}
Sleep 1000
SendInput, {F6}/r [%tag%] Настроить рацию на частоту 102.1{Enter}
Sleep 1000
SendInput, {F6}/rr /radio_set - Поставка материалов.{Enter}
Sleep 1000
SendInput, {F6}/r [%tag%] Во время движения соблюдать ПДД, ехать аккуратно, без обгонов,{Enter}
Sleep 1000
SendInput, {F6}/r [%tag%] ... следуя по маршруту за автомобилем ВАИ.{Enter}
Sleep 1000
SendInput, {F6}/rr Важно, не играть в гонки, а выполнять четко поставленную задачу.{Enter}
Sleep 1000
SendInput, {F6}/rr Если мне не понравится ваше вождение - произойдет замена.{Enter}
Sleep 1000
SendInput, {F6}/r [%tag%] В случае нападения - ваша задача максимально защищать колонну.{Enter}
Sleep 1000
SendInput, {F6}/r [%tag%] И самое главное - слушать приказы от организатора колонны и старших по званию.{Enter}
Sleep 1000
SendInput, {F6}/rr На последок, напоминаю про скрины для отчета о сопровождении колонны.{Enter}
Sleep 1000
SendInput, {F6}/rr Начало | Середина (Секретная база) | Конец{Enter}
Return

КонвойВыезд:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/r [%tag%] Колонна, начинаем движение за автомобилем ВАИ на секретную базу.{Enter}
Return

КонвойЗагрузка:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/r [%tag%] Внимание колонна.{Enter}
Sleep 1000
SendInput, {F6}/r [%tag%] Все бойцы обязаны грузить ящики без исключений.{Enter}
Sleep 1000
SendInput, {F6}/rr Так-же напоминаю про скрин для отчета о сопровождении колонны.{Enter}
Return

КонвойЕдемВч:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/r [%tag%] Внимание колонна, выдвигаемся на базу.{Enter}
Sleep 1000
SendInput, {F6}/r [%tag%] Следуем по маршруту за автомобилем ВАИ.{Enter}
Return

КонвойЕдемГос:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}Куда путь держим:{Space}
Input, route, V I M, {Enter}
SendInput, {end}+{home}{del}{esc}
Sleep 500
SendInput, {F6}/r [%tag%] Внимание колонна, выдвигаемся в %route%.{Enter}
Sleep 1000
SendInput, {F6}/r [%tag%] Следуем по маршруту за автомобилем ВАИ.{Enter}
Return

КонвойКонец:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/r [%tag%] Благодярю всех за помощь в поставке материалов.{Enter}
Sleep 1000
SendInput, {F6}/r [%tag%] Не забудьте снять боевую форму, а так-же...{Enter}
Sleep 1000
SendInput, {F6}/r [%tag%] Смените частоту рации на 102.0{Enter}
Sleep 1000
SendInput, {F6}/rr /radio_set - Основной канал.{Enter}
Sleep 1000
SendInput, {F6}/rr {!} И не забывайте про скрин для отчета.{Enter}
Return

МегафонКонвой:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/do Мегафон лежит на панели.{Enter}
Sleep 1000
SendInput, {F6}/me взял его в руки и зажал красную кнопку{Enter}
Sleep 1000
SendInput, {F6}/m [ВАИ] Внимание, Гражданские{!} Пропускаем военную колонну{!}{Enter}
Sleep 2000
SendInput, {F6}/m [ВАИ] В случае угрозы безопасности - откроем огонь по колесах{!}{Enter}
Return

; Строй

Строй3МинПовседневный:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/r [%tag%] Строй на плацу, готовность 3 минуты{!} Форма: Повседневная.{Enter}
Sleep 60000
SendInput, {F6}/r [%tag%] Строй на плацу, готовность 2 минуты{!} Форма: Повседневная.{Enter}
Sleep 60000
SendInput, {F6}/r [%tag%] Строй на плацу, готовность 1 минута{!} Форма: Повседневная.{Enter}
Return

Строй5МинПовседневный:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/r [%tag%] Строй на плацу, готовность 5 минут{!} Форма: Повседневная.{Enter}
Sleep 60000
SendInput, {F6}/r [%tag%] Строй на плацу, готовность 4 минуты{!} Форма: Повседневная.{Enter}
Sleep 60000
SendInput, {F6}/r [%tag%] Строй на плацу, готовность 3 минуты{!} Форма: Повседневная.{Enter}
Sleep 60000
SendInput, {F6}/r [%tag%] Строй на плацу, готовность 2 минуты{!} Форма: Повседневная.{Enter}
Sleep 60000
SendInput, {F6}/r [%tag%] Строй на плацу, готовность 1 минута{!} Форма: Повседневная.{Enter}
Return

Строй3МинБоевка:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/r [%tag%] Строй на плацу, готовность 3 минуты{!} Форма: Боевая.{Enter}
Sleep 60000
SendInput, {F6}/r [%tag%] Строй на плацу, готовность 2 минуты{!} Форма: Боевая.{Enter}
Sleep 60000
SendInput, {F6}/r [%tag%] Строй на плацу, готовность 1 минута{!} Форма: Боевая.{Enter}
Return

Строй5МинБоевка:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/r [%tag%] Строй на плацу, готовность 5 минут{!} Форма: Боевая.{Enter}
Sleep 60000
SendInput, {F6}/r [%tag%] Строй на плацу, готовность 4 минуты{!} Форма: Боевая.{Enter}
Sleep 60000
SendInput, {F6}/r [%tag%] Строй на плацу, готовность 3 минуты{!} Форма: Боевая.{Enter}
Sleep 60000
SendInput, {F6}/r [%tag%] Строй на плацу, готовность 2 минуты{!} Форма: Боевая.{Enter}
Sleep 60000
SendInput, {F6}/r [%tag%] Строй на плацу, готовность 1 минута{!} Форма: Боевая.{Enter}
Return

СтройИнфо:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/n Перед началом хочу вам напомнить что нужно для того, что бы вам защитали отчет:{Enter}
Sleep 1000
SendInput, {F6}/n 1. С Спец. Операции (РП) требуется не менее 5 скринов{Enter}
Sleep 1000
SendInput, {F6}/n Начало | Середина (должно быть видно 5 отыгровок от вас) | Конец.{Enter}
Sleep 1000
SendInput, {F6}/n 2. С тренировки нужно 3+ скринов.{Enter}
Sleep 1000
SendInput, {F6}/n  Начало | середина (несколько упражнений) | Конец.{Enter}
Sleep 1000
SendInput, {F6}/n 3. С лекции требуется всего 1 скрин. (Желательно конец){Enter}
Sleep 1000
SendInput, {F6}/n Концом РП и тренировки являются слова от проводящего строй...{Enter}
Sleep 1000
SendInput, {F6}/n Что тренировка окончена / Спец. задание все выполнили.{Enter}
Sleep 1000
SendInput, {F6}/n 4. Все скрины должны быть сделаны с /c 060{Enter}
Sleep 1000
SendInput, {F6}/n Спасибо за внимание, переходим к строю...{Enter}
Return

Лекция1:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/s Лекция{!} {Enter}
Sleep 2000
SendInput, {F6}/s Добро пожаловать в доблестную армию. {Enter}
Sleep 2000
SendInput, {F6}/s Разговаривать или обращаться без разрешения запрещено{!} {Enter}
Sleep 2000
SendInput, {F6}/s Обращаться к друг другу строго на Вы {Enter}
Sleep 2000
SendInput, {F6}/s При обращение добавить слово "Товарищ" Звание. {Enter}
Sleep 2000
SendInput, {F6}/s Перед тем, как начать военную службу Вы должны принять присягу {Enter}
Sleep 2000
SendInput, {F6}/s До принятия присяги вам запрещается нести боевое дежурство {Enter}
Sleep 2000
SendInput, {F6}/s участвовать в боевых действиях и боевой службе. {Enter}
Sleep 2000
SendInput, {F6}/s За вами также запрещается закреплять вооружение и боевую технику. {Enter}
Sleep 2000
SendInput, {F6}/s При попытке нанесения вреда Армии или получения боеприпасов для личного использования {Enter}
Sleep 2000
SendInput, {F6}/s Вы будете демобилизованы из Министерства Обороны, а в некоторых случаях занесены в ЧС{!} {Enter}
Sleep 2000
SendInput, {F6}/s Использовать вооружение в собственных целях запрещено{Enter}
Sleep 2000
SendInput, {F6}/s Использования оружия разрешено только при Чрезвычайных Ситуациях и тренировках. {Enter}
Sleep 2000
SendInput, {F6}/s Применению оружия должно предшествовать четко выраженное предупреждение об этом лица {Enter}
Sleep 2000
SendInput, {F6}/s за исключением случаев непосредственной опасности для жизни военнослужащего или других граждан. {Enter}
Return

Лекция2:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/s Уважаемые сотрудники МО{Enter}
Sleep 2000
SendInput, {F6}/s Сейчас я проведу лекцию на тему "Устав". {Enter}
Sleep 2000
SendInput, {F6}/s Устав — свод правил, регулирующих организацию и порядок... {Enter}
Sleep 2000
SendInput, {F6}/s деятельности в какой-либо определённой сфере отношений или... {Enter}
Sleep 2000
SendInput, {F6}/s какого-либо государственного органа, организаций... {Enter}
Sleep 2000
SendInput, {F6}/s предприятия, учреждения и так далее. {Enter}
Sleep 2000
SendInput, {F6}/s После того как вы будучи новобранцем прыбыли на ВЧ... {Enter}
Sleep 2000
SendInput, {F6}/s Вы обязаны были в казарме выучить устав! {Enter}
Sleep 2000
SendInput, {F6}/s Незнание устава не освободит вас от ответствинности {Enter}
Sleep 2000
SendInput, {F6}/s За нарушение устава вам могут выдать Выговор либо уволить из МО с занесением {Enter}
Sleep 2000
SendInput, {F6}/s В ЧС организации МО {Enter}
Sleep 2000
SendInput, {F6}/s Прошу не нарушать устав {Enter}
Sleep 2000
SendInput, {F6}/s На этом лекция на тему "Устав" окончена. Спасибо за внимание {Enter}
Return

Лекция3:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/s Здравия желаю, сейчас я проведу лекцию, что запрещено военнослужащим {Enter}
Sleep 2000
SendInput, {F6}/s Военнослужащим запрещено: {Enter}
Sleep 2000
SendInput, {F6}/s Допускать утрату боеприпасов, техники и любого иного военного имущества. {Enter}
Sleep 2000
SendInput, {F6}/s Допускать распространение служебной, военной, государственной тайны. {Enter}
Sleep 2000
SendInput, {F6}/s Обсуждать вопросы, связанные с присвоением воинских званий и должностей. {Enter}
Sleep 2000
SendInput, {F6}/s Самовольно покидать территорию Армии. {Enter}
Sleep 2000
SendInput, {F6}/s Допускать проникновение неучтенных лиц на территорию Армии. {Enter}
Sleep 2000
SendInput, {F6}/s Хранить и употреблять наркотики. {Enter}
Sleep 2000
SendInput, {F6}/s Общаться с членами банд. {Enter}
Sleep 2000
SendInput, {F6}/s Стрелять по другим военнослужащим. Если это не тренировка. {Enter}
Sleep 2000
SendInput, {F6}/s Спорить со старшими по званию, не выполнять приказы, нарушать данный устав. {Enter}
Sleep 2000
SendInput, {F6}/s Просить о повышении. {Enter}
Sleep 2000
SendInput, {F6}/s Самовольно оставлять пост. {Enter}
Sleep 2000
SendInput, {F6}/s Передавать патроны кому-либо, кроме сослуживцев.{Enter}
Sleep 2000
SendInput, {F6}/s Портить государственные транспортные средства. {Enter}
Sleep 2000
SendInput, {F6}/s Отдыхать или спать в неположенном месте. Разрешено отдыхать только в казарме. {Enter}
Sleep 2000
SendInput, {F6}/s Если вы спите на посту, плацу! Вам будет выдан выговор! {Enter}
Sleep 2000
SendInput, {F6}/s Спасибо за внимание. {Enter}
Return

Лекция4:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/s Здравия желаю, коллеги сейчас я проведу вам лекцию. {Enter}
Sleep 2000
SendInput, {F6}/s Лекция на тему "Правила поведения на тренировке". {Enter}
Sleep 2000
SendInput, {F6}/s С самого начала я хочу сказать что такое тренеровка.. {Enter}
Sleep 2000
SendInput, {F6}/s Тренеровка-это осмысленная физическая деятельность, направленная на развитие силы.. {Enter}
Sleep 2000
SendInput, {F6}/s выносливости, ловкости, скорости и других физических и психологических навыков. {Enter}
Sleep 2000
SendInput, {F6}/s Правила поведение на тренеровке {Enter}
Sleep 2000
SendInput, {F6}/s 1. Слушаться старших по званию {Enter}
Sleep 2000
SendInput, {F6}/s 2. Доставать оружие только по приказу. {Enter}
Sleep 2000
SendInput, {F6}/s 3. Не покидать строй,только по приказу. {Enter}
Sleep 2000
SendInput, {F6}/s 4. В строю молчать,слушать что говорят ваши коллеги. {Enter}
Sleep 2000
SendInput, {F6}/s 5. Слушаться только ст.состав. {Enter}
Sleep 2000
SendInput, {F6}/s 6. Тренеровку может начать Майор и выше по званию. {Enter}
Sleep 2000
SendInput, {F6}/s 7. Вы должны четко и внимательно слушать ст.состав. {Enter}
Sleep 2000
SendInput, {F6}/s 8. Если вы будете спать в строю вам будут давать выговор. {Enter}
Sleep 2000
SendInput, {F6}/s 9. Если вы устали, вы можете подойти к тому кто организовал тренеровку... {Enter}
Sleep 2000
SendInput, {F6}/s И попросить отдохнуть. {Enter}
Sleep 2000
SendInput, {F6}/s 10. С разрешение Майора и выше, вы можете не являться на тренеровку. {Enter}
Sleep 2000
SendInput, {F6}/s А на этом наша лекция подошла к концу. {Enter}
Sleep 2000
SendInput, {F6}/s Спасибо за внимание. {Enter}
Return

Лекция5:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/s Сейчас я проведу лекцию о том, как вести себя на посту КПП с гражданскими. {Enter}
Sleep 2000
SendInput, {F6}/s Сначала нужно поприветствовать и спросить цель прибытия у гостя. {Enter}
Sleep 2000
SendInput, {F6}/s При этом вы должны убрать оружие, не нужно пугать или проявлять агрессию. {Enter}
Sleep 2000
SendInput, {F6}/s Выполняйте все просьбы гражданина, если они не противоречат уставу. {Enter}
Sleep 2000
SendInput, {F6}/s Старайтесь избежать конфликтов, если таковые могут возникнуть. {Enter}
Sleep 2000
SendInput, {F6}/s Но если все-таки гражданин начал хамить, кричать и драться, то: {Enter}
Sleep 2000
SendInput, {F6}/s Просите гостя отъехать или отойти от КПП. {Enter}
Sleep 2000
SendInput, {F6}/s В случае неподчинения разрешено применить силу, досчитав до десяти. {Enter}
Sleep 2000
SendInput, {F6}/s Не нужно начинать диалог с гражданами, стоящими дальше 20 метров от КПП. {Enter}
Sleep 2000
SendInput, {F6}/s Запрещено стрелять, кричать и бить людей без причины. {Enter}
Sleep 2000
SendInput, {F6}/s За это вы будете уволены и занесены в ЧС МО. {Enter}
Sleep 2000
SendInput, {F6}/s Надеюсь все поняли главные принципы общения на КПП. {Enter}
Sleep 2000
SendInput, {F6}/s Лекция на тему "Поведение на КПП с гражданскими" окончена. Спасибо за внимание. {Enter}
Return

Лекция6:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/s Уважаемые сотрудники МО{!}{Enter}
Sleep 1000
SendInput, {F6}/s Сейчас я проведу лекцию по взводам.{Enter}
Sleep 1000
SendInput, {F6}/s Военная автомобильная инспекция ВАИ главная задача:{Enter}
Sleep 1000
SendInput, {F6}/s Обеспечение безопасности дорожного движения в Вооруженных силах;{Enter}
Sleep 1000
SendInput, {F6}/s службы военных автоинспекций на маршрутах движения т/с ВЧ{Enter}
Sleep 1000
SendInput, {F6}/s регистрация транспортных средств воинских частей;{Enter}
Sleep 1000
SendInput, {F6}/s транспортных средств воинских частей к участию в дорожном движении.{Enter}
Sleep 1000
SendInput, {F6}/s Взвод боевого обеспечения ВБО главная задача:{Enter}
Sleep 1000
SendInput, {F6}/s Боевое обеспечение (Оперативное обеспечение){Enter}
Sleep 1000
SendInput, {F6}/s комплекс мероприятий осуществляемый в войсках, которые планируются{Enter}
Sleep 1000
SendInput, {F6}/s организуются и осуществляются во всех видах операций{Enter}
Sleep 1000
SendInput, {F6}/s для создания благоприятных условий для применения{Enter}
Sleep 1000
SendInput, {F6}/s своих войск (сил), вооружения и военной техники,{Enter}
Sleep 1000
SendInput, {F6}/s а также снижения эффективности применения войск (сил) и вооружения.{Enter}
Sleep 1000
SendInput, {F6}/s Учебная Часть УЧ{Enter}
Sleep 1000
SendInput, {F6}/s Взвод обучения новобранцев всем правилам МО.{Enter}
Sleep 1000
SendInput, {F6}/s Основной задачей УЧ является:{Enter}
Sleep 1000
SendInput, {F6}/s Контроль за правильностью несения службы части, следить за тем{Enter}
Sleep 1000
SendInput, {F6}/s чтобы бойцы не нарушали дисциплину и субординацию как в{Enter}
Sleep 1000
SendInput, {F6}/s общении, так и в своем поведении,{Enter}
Sleep 1000
SendInput, {F6}/s учат младший состав уставу, принимают у них устав{Enter}
Sleep 1000
SendInput, {F6}/s присягу и речь.{Enter}
Sleep 1000
SendInput, {F6}/s Только после этого бойцы могут вступить в другой взвод.{Enter}
Sleep 1000
SendInput, {F6}/s Воздушно-десантные войска ВДВ{Enter}
Sleep 1000
SendInput, {F6}/s самостоятельный род войск вооруженных сил{Enter}
Sleep 1000
SendInput, {F6}/s предназначенный для охвата противника{Enter}
Sleep 1000
SendInput, {F6}/s выполнения задач в его тылу по нарушению{Enter}
Sleep 1000
SendInput, {F6}/s управления войсками, захвату и уничтожению наземных элементов {Enter}
Sleep 1000
SendInput, {F6}/s высокоточного оружия, срыву выдвижения и развертывания резервов{Enter}
Sleep 1000
SendInput, {F6}/s нарушению работы тыла и коммуникаций{Enter}
Sleep 1000
SendInput, {F6}/s Также ВДВ часто применяются как силы быстрого реагирования.{Enter}
Sleep 1000
SendInput, {F6}/s На этом наша лекция на тему взводы окончена{!}{Enter}
Return

Лекция7:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/s Сейчас я проведу лекцию о правилах поездки за боеприпасами.{Enter}
Sleep 2000
SendInput, {F6}/s Организовать колонну может любой сотрудник от звания Капитан и выше.{Enter}
Sleep 2000
SendInput, {F6}/s Перед началом он объявит об этом в рацию.{Enter}
Sleep 2000
SendInput, {F6}/s Все сотрудники которые учавствуют в поставке обязаны иметь при себе:{Enter}
Sleep 2000
SendInput, {F6}/s Бронежилет, оружие а так-же аптечки.{Enter}
Sleep 2000
SendInput, {F6}/s Во время поездки все Т/С едут за автомобилем ВАИ.{Enter}
Sleep 2000
SendInput, {F6}/s Никто никого не обганяет и все водители соблюдают ПДД.{Enter}
Sleep 2000
SendInput, {F6}/s По приезду на секретную базу все сотрудники обязаны загружать ящики в ТАЙФУН.{Enter}
Sleep 2000
SendInput, {F6}/s После загрузки организатор объявит следующий пункт назначения.{Enter}
Sleep 2000
SendInput, {F6}/s Во время поставки можно заезжать в несколько разных организаций.{Enter}
Sleep 2000
SendInput, {F6}/s Если во время движения колонну начинают подрезать - следует предупредить водителей{Enter}
Sleep 2000
SendInput, {F6}/s Что в случае продолжения - будет открыт огонь по его машине.{Enter}
Sleep 2000
SendInput, {F6}/s Если же произошло вооруженное нападение - все сотрудники обязаны защищать ТАЙФУН.{Enter}
Sleep 2000
SendInput, {F6}/s При необходимости разрешено нарушать ПДД.{Enter}
Sleep 2000
SendInput, {F6}/s Однако если не был открыт огонь - не следует стрелять первым.{Enter}
Sleep 2000
SendInput, {F6}/s На этом лекция подошла к концу. Спасибо за внимание.{Enter}
Return

Тренировка:
SendMessage, 0x50,, 0x4190419,, A
Random, exercise1, 10000, 100000
Random, exercise2, 10000, 100000
SendInput, {F6}/s Перейдем к тренировке{!}{Enter}
SendInput, {F6}/s Начнём её с %exercise1% отжиманий.{Enter}
Sleep 1000
SendInput, {F6}/n /anim 6 23 | Примичание: Хасл не делают{Enter}
Sleep 120000
SendInput, {F6}/s Отставить{!}{Enter}
Sleep 1000
SendInput, {F6}/s Дальше делаем %exercise2% приседаний{!}{Enter}
Sleep 1000
SendInput, {F6}/n Нажимайте клавишу "C" или же /anim 3 2{Enter}
Sleep 60000
SendInput, {F6}/s Отставить{!}{Enter}
Sleep 1000
SendInput, {F6}/s Закончим тренировку легкой медитацией{!}{Enter}
Sleep 1000
SendInput, {F6}/n /anim 8 2{Enter}
Sleep 120000
SendInput, {F6}/s Отставить{!}{Enter}
Sleep 1000
SendInput, {F6}/s Тренировка окончена. Не расходимся{!}{Enter}
Return

; Собеседование

СобесВопрос:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}Здравия желаю{!} Я %rank% Армии %surname%. Вы на призыв?{Enter}
Return

СобесНачало:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}Хорошо, тогда мне нужно проверить ваши документы.{Enter}
Sleep 1000
SendInput, {F6}/n Все должно быть с RP отыгровками: /me, /do, без использования AHK.{Enter}
Sleep 1000
SendInput, {F6}/n В /me пишут с маленькой буквы, в конце точку не ставят{Enter}
Sleep 1000
SendInput, {F6}/n В /do пишут с большой буквы, в конце точку ставят.{Enter}
Sleep 1000
SendInput, {F6}/n На каждый документ требуется минимум 3 строки с РП отыгровками.{Enter}
Sleep 1000
SendInput, {F6}/n Можно допустить не больше 3-х ошибок, а так-же запрещенно МГ.{Enter}
Sleep 1000
SendInput, {F6}Начнем с паспорта.{Enter}
Sleep 1000
SendInput, {F6}/n /pass id - после 3-х отыгровок.{Enter}
Return

СобесПаспорт:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/me взял паспорт у человека напротив{Enter}
Sleep 1000
SendInput, {F6}/do Паспорт в руке.{Enter}
Sleep 1000
SendInput, {F6}/yes{Enter}
Sleep 1000
SendInput, {F6}/me открыл паспорт на 2 странице{Enter}
Sleep 1000
SendInput, {F6}/do Паспорт открыт.{Enter}
Sleep 1000
SendInput, {F6}/me осмотрел страницу и взглянул на человека{Enter}
Sleep 1000
SendInput, {F6}/do Страница осмотрена.{Enter}
Sleep 1000
SendInput, {F6}/me закрыл паспорт{Enter}
Sleep 1000
SendInput, {F6}/me вернул паспорт человеку напротив{Enter}
Return

СобесПроМедку:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}Отлично, теперь мне требуется Ваша мед. карта.{Enter}
Sleep 1000
SendInput, {F6}/n /showmc id - после 3-х отыгровок.{Enter}
Return

СобесМедка:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/me взял мед.карту у человека напротив{Enter}
Sleep 1000
SendInput, {F6}/yes{Enter}
Sleep 1000
SendInput, {F6}/me начал осматривать мед.карту{Enter}
Sleep 1000
SendInput, {F6}/do Процесс...{Enter}
Sleep 1000
SendInput, {F6}/me взглянул на заключение{Enter}
Sleep 1000
SendInput, {F6}/do Заключение осмотрено.{Enter}
Sleep 1000
SendInput, {F6}/me закрыл мед.карту{Enter}
Sleep 1000
SendInput, {F6}/me вернул мед.карту человеку напротив{Enter}
Return

СобесПроЛицензии:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}Последнее что мне нужно - Ваши лицензии.{Enter}
Sleep 1000
SendInput, {F6}/n /lic id - после 3-х отыгровок.{Enter}
Return

СобесЛицензии:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/me взял лицензии у человека напротив{Enter}
Sleep 1000
SendInput, {F6}/yes{Enter}
Sleep 1000
SendInput, {F6}/me начал осматривать лицензии{Enter}
Sleep 1000
SendInput, {F6}/do Процесс...{Enter}
Sleep 1000
SendInput, {F6}/me осмотрел лицензии и проверил подписи{Enter}
Sleep 1000
SendInput, {F6}/do Лицензии осмотрены.{Enter}
Sleep 1000
SendInput, {F6}/me закрыл лицензии{Enter}
Sleep 1000
SendInput, {F6}/me вернул лицензии человеку напротив{Enter}
Return

СобесПсих1:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}Отлично, с документами у Вас всё в порядке.{Enter}
Sleep 1000
SendInput, {F6}Дальше мне нужно задать вам несколько вопросов...{Enter}
Sleep 1000
SendInput, {F6}Первый вопрос: Что у меня над головой?{Enter}
Return

СобесПсих2:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}Замечательно. Второй вопрос: Что такое "ДМ" и "ТК", кто такой администратор?{Enter}
Return

СобесРП:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}Хорошо, дайте мне пару минут подумать...{Enter}
Sleep 1000
SendInput, {F6}/n Сейчас я задам вам пару RP терминов{Enter}
Sleep 1000
SendInput, {F6}/n Отвечать нужно полностью, без сокращений{Enter}
Sleep 1000
SendInput, {F6}/n Если вы уйдете в AFK, то засчитаю как ошибку{Enter}
Sleep 1000
SendInput, {F6}/n Что такое:{Space}
Return


ОтказРП:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/me схватил печать и поднял руку{Enter}
Sleep 1000
SendInput, {F6}/do Печать в руке.{Enter}
Sleep 1000
SendInput, {F6}/me резким движением руки поставил штамп "Не годен."{Enter}
Sleep 1000
SendInput, {F6}Извините, но увы, Вы нам не подходите.{Enter}
Sleep 1000
SendInput, {F6}/n Причина: не умение отыгрывать РП{Enter}
Sleep 1000
SendInput, {F6}Приходите на следующее собеседование.{Enter}
Return

ОтказПаспорт:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/me схватил печать и поднял руку{Enter}
Sleep 1000
SendInput, {F6}/do Печать в руке.{Enter}
Sleep 1000
SendInput, {F6}/me резким движением руки поставил штамп "Не годен."{Enter}
Sleep 1000
SendInput, {F6}Извините, но увы, Вы нам не подходите.{Enter}
Sleep 1000
SendInput, {F6}/n Причина: В паспорте должно быть: возраст 21+ год (3+ лвл), а так-же законопослужность 5+{Enter}
Sleep 1000
SendInput, {F6}Приходите на следующее собеседование.{Enter}
Return

ОтказМедка:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/me схватил печать и поднял руку{Enter}
Sleep 1000
SendInput, {F6}/do Печать в руке.{Enter}
Sleep 1000
SendInput, {F6}/me резким движением руки поставил штамп "Не годен."{Enter}
Sleep 1000
SendInput, {F6}Извините, но увы, Вы нам не подходите из-за заключения в Вашей мед. карте.{Enter}
Sleep 1000
SendInput, {F6}Приходите на следующее собеседование.{Enter}
Sleep 1000
SendInput, {F6}/n Необходимо иметь заключение "Полностью здоров(а)".{Enter}
Return

ОтказЛиц:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/me схватил печать и поднял руку{Enter}
Sleep 1000
SendInput, {F6}/do Печать в руке.{Enter}
Sleep 1000
SendInput, {F6}/me резким движением руки поставил штамп "Не годен."{Enter}
Sleep 1000
SendInput, {F6}Извините, но увы, Вы нам не подходите. У вас нету базовой лицензии на вождение.{Enter}
Sleep 1000
SendInput, {F6}Приходите на следующее собеседование.{Enter}
Return

Годен:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/me схватил печать и поднял руку{Enter}
Sleep 1000
SendInput, {F6}/do Печать в руке.{Enter}
Sleep 1000
SendInput, {F6}/me резким движением руки поставил штамп "Годен."{Enter}
Sleep 1000
SendInput, {F6}Поздравляю{!}. Вы годен для службы в Министерстве Обороны.{Enter}
Sleep 1000
SendInput, {F6}Подойдите к Полковнику либо Генералу, они выдадут Вам форму и рацию.{Enter}
Return

; Старший Состав

Принять:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/do Рюкзак на спине.{Enter}
Sleep 1000
SendInput, {F6}/me снял рюкзак и открыл его{Enter}
Sleep 1000
SendInput, {F6}/me достал новую форму, рацию и нашивку{Enter}
Sleep 1000
SendInput, {F6}/do Все необходимое в руках.{Enter}
Sleep 1000
SendInput, {F6}/me передал комплект человеку напротив{Enter}
Sleep 1000
SendInput, {F6}/me достал IPad и перешел в вкладку "Добавить сотрудника"{Enter}
Sleep 1000
SendInput, {F6}/me ввел данные нового сотрудника и внес в базу данных{Enter}
Sleep 1000
SendInput, {F6}/do Новый сотрудник зарегистрирован.{Enter}
Sleep 1000
SendInput, {F6}Удачи на службе{!}{Enter}
Sleep 500
SendInput, {F6}/invite{Space}
Input, temp, V I M, {Enter}
Sleep 1000
SendInput, {F6}/n Не забудьте поставить /setspawn - Мин. Обороны (на базе организации){Enter}
Return

Выговор:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/me достал IPad и перешел в вкладку "Сотрудники"{Enter}
Sleep 1000
SendInput, {F6}/do Показался список сотрудников.{Enter}
Sleep 1000
SendInput, {F6}/me ввел фамилию необходимого сотрудника{Enter}
Sleep 1000
SendInput, {F6}/me нашел из списка нужного и выбрал его{Enter}
Sleep 1000
SendInput, {F6}/do В планшете высветелась карта сотрудника.{Enter}
Sleep 1000
SendInput, {F6}/me нажал кнопку "Выдать выговор" и ввел причину{Enter}
Sleep 1000
SendInput, {F6}/do Выговор выдан.{Enter}
Sleep 1000
SendInput, {F6}/todo Убирая IPad*Готово...{Enter}
Sleep 500
SendInput, {F6}/fwarn{Space}
Return

СнятьВыговор:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/me достал IPad и перешел в вкладку "Сотрудники"{Enter}
Sleep 1000
SendInput, {F6}/do Показался список сотрудников.{Enter}
Sleep 1000
SendInput, {F6}/me ввел фамилию необходимого сотрудника{Enter}
Sleep 1000
SendInput, {F6}/me нашел из списка нужного и выбрал его{Enter}
Sleep 1000
SendInput, {F6}/do В планшете высветелась карта сотрудника.{Enter}
Sleep 1000
SendInput, {F6}/me нажал кнопку "Снять выговор"{Enter}
Sleep 1000
SendInput, {F6}/do Выговор снят.{Enter}
Sleep 1000
SendInput, {F6}/todo Убирая IPad*Готово...{Enter}
Sleep 500
SendInput, {F6}/unfwarn{Space}
Return

Уволить:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/me достал IPad и перешел в вкладку "Сотрудники"{Enter}
Sleep 1000
SendInput, {F6}/do Показался список сотрудников.{Enter}
Sleep 1000
SendInput, {F6}/me ввел фамилию необходимого сотрудника{Enter}
Sleep 1000
SendInput, {F6}/me нашел из списка нужного и выбрал его{Enter}
Sleep 1000
SendInput, {F6}/do В планшете высветелась карта сотрудника.{Enter}
Sleep 1000
SendInput, {F6}/me нажал кнопку "Уволить" и ввел причину{Enter}
Sleep 1000
SendInput, {F6}/do Сотрудник уволен.{Enter}
Sleep 1000
SendInput, {F6}/todo Убирая IPad*Прощай.{Enter}
Sleep 500
SendInput, {F6}/uninvite{Space}
Return

УволитьОфф:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/me достал IPad и перешел в вкладку "Сотрудники"{Enter}
Sleep 1000
SendInput, {F6}/do Показался список сотрудников.{Enter}
Sleep 1000
SendInput, {F6}/me ввел фамилию необходимого сотрудника{Enter}
Sleep 1000
SendInput, {F6}/me нашел из списка нужного и выбрал его{Enter}
Sleep 1000
SendInput, {F6}/do В планшете высветелась карта сотрудника.{Enter}
Sleep 1000
SendInput, {F6}/me нажал кнопку "Уволить" и ввел причину{Enter}
Sleep 1000
SendInput, {F6}/do Сотрудник уволен.{Enter}
Sleep 1000
SendInput, {F6}/todo Убирая IPad*Прощай.{Enter}
Sleep 500
SendInput, {F6}/uninviteoff{Space}
Return

ЗанестиЧС:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/me достал IPad и перешел в вкладку "Сотрудники"{Enter}
Sleep 1000
SendInput, {F6}/do Показался список сотрудников.{Enter}
Sleep 1000
SendInput, {F6}/me ввел фамилию необходимого сотрудника{Enter}
Sleep 1000
SendInput, {F6}/me нашел из списка нужного и выбрал его{Enter}
Sleep 1000
SendInput, {F6}/do В планшете высветелась карта сотрудника.{Enter}
Sleep 1000
SendInput, {F6}/me нажал кнопку "Занести в ЧС организации" и ввел причину{Enter}
Sleep 1000
SendInput, {F6}/do Сотрудник занесен в ЧС.{Enter}
Sleep 1000
SendInput, {F6}/todo Убирая IPad*Он заслужил это...{Enter}
Sleep 1000
SendInput, {F6}/blist{Space}
Return

Повысить:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/me достал IPad и перешел в вкладку "Сотрудники"{Enter}
Sleep 1000
SendInput, {F6}/do Показался список сотрудников.{Enter}
Sleep 1000
SendInput, {F6}/me ввел фамилию необходимого сотрудника{Enter}
Sleep 1000
SendInput, {F6}/me нашел из списка нужного и выбрал его{Enter}
Sleep 1000
SendInput, {F6}/do В планшете высветелась карта сотрудника.{Enter}
Sleep 1000
SendInput, {F6}/me нажал кнопку "Повысить" и ввел номер рапорта{Enter}
Sleep 1000
SendInput, {F6}/do Сотрудник был повышен.{Enter}
Sleep 1000
SendInput, {F6}/todo Убирая IPad*Поздравляю{!}{Enter}
Sleep 500
SendInput, {F6}/rang{Space}
Return

ВыдатьВзвод:
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/me достал IPad и перешел в вкладку "Сотрудники"{Enter}
Sleep 1000
SendInput, {F6}/do Показался список сотрудников.{Enter}
Sleep 1000
SendInput, {F6}/me ввел фамилию необходимого сотрудника{Enter}
Sleep 1000
SendInput, {F6}/me нашел из списка нужного и выбрал его{Enter}
Sleep 1000
SendInput, {F6}/do В планшете высветелась карта сотрудника.{Enter}
Sleep 1000
SendInput, {F6}/me нажал кнопку "Изменить взвод" и выбрал нужный взвод из списка{Enter}
Sleep 1000
SendInput, {F6}/do Сотруднику был выдан новый отдел.{Enter}
Sleep 1000
SendInput, {F6}/todo Убирая IPad*Держите ваши шевроны{!}{Enter}
Sleep 1000
SendInput, {F6}/do Новые шевроны в кармане.{Enter}
Sleep 1000
SendInput, {F6}/me достал их{Enter}
Sleep 1000
SendInput, {F6}/do Новые шевроны в руке.{Enter}
Sleep 1000
SendInput, {F6}/me отдал их человеку напротив{Enter}
Sleep 500
SendInput, {F6}/invite{Space}
Return

; Доп. функции

РандомЛекция:
Random, num, 1, 7
    lec := "Лекция" num
    Goto %lec%
Return

ПереключитьАхк: ; 0 - Обычный (конвой), 1 - Строй, 2 - Собес
if (scriptMode=0){
    scriptMode := 1
    StateInfo("Строй","BDCCD9")
}
else if (scriptMode=1){
    scriptMode := 2
    StateInfo("Призыв","6D8387")
}
else if (scriptMode=2){
    scriptMode := 0
    StateInfo("Обычный (Конвой)","FFFFFF")
}
Return

Ctrl & K::
    hotkeys := !hotkeys
    StateInfo("Клавиши:"+hotkeys,"FFFFFF")
Return
Ctrl & C::
    commands := !commands
    StateInfo("Команды:"+commands,"FFFFFF")
Return

!n::
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/n Откат.{Enter}
Return

^n::
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/n Намеренные действия не откатываются.{Enter}
Return

!f::
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/c 60{Enter}
Return

^f::
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/c 60{Enter}
Sleep 1500
SendInput,{F8}
Return

LAlt & RAlt::
SendMessage, 0x50,, 0x4190419,, A
SendInput,{F6}/radio_set{Enter}
Return

LShift & RAlt::
SendMessage, 0x50,, 0x4190419,, A
SendInput,{F6}/rc{Enter}
Return



; Интерфейсы с подсказками

StateInfo(text, textColor:="White") {
    Gui 1:+LastFound +AlwaysOnTop -Caption +ToolWindow 

    SysGet, MonitorWorkArea, MonitorWorkArea

    Gui, 1:Color, 000000
    Gui, 1:Font, MS sans serif
    Gui, 1:Font, cBlue
    Gui, 1:Font, s25
    Gui, 1:Add, Text, c%textColor%, %text%
    WinSet, TransColor, %CustomColor3% 250 

    Gui, 1:Show, Hide
    WinGetPos,,, width, height
    yPos := MonitorWorkAreaBottom - height - 20
    xPos := MonitorWorkAreaRight - width - 20
    
    Gui, 1:Show, x%xPos% y%yPos% NoActivate, window.
    Sleep 2000
    Gui, 1:Destroy
}

ExtendedInfo(title, lines*) {
    global infoState
    if (infoState)
        Return

    CustomColor3 := "202020"
    Gui, 2:+LastFound +AlwaysOnTop -Caption +ToolWindow
    Gui, 2:Color, %CustomColor3%
    WinSet, Transparent, 150

    SysGet, MonitorWorkArea, MonitorWorkArea
    MonitorWorkAreaRight -= 5

    Gui, 2:Font, cWhite w25, MS Sans Serif

    Gui, 2:Add, Text, cWhite,
    Gui, 2:Add, Text, cWhite, %title%
    Gui, 2:Add, Text, cWhite,
    for _, line in lines
        Gui, 2:Add, Text, cWhite, %line%
    Gui, 2:Add, Text, cWhite,

    Gui, 2:Show, Hide
    WinGetPos,,, width, height
    yPos := (MonitorWorkAreaBottom - MonitorWorkAreaTop - height) // 2 + MonitorWorkAreaTop
    xPos := MonitorWorkAreaRight - width
    Gui, 2:Show, x%xPos% y%yPos% NoActivate, window.

    infoState := true
}

DestroyInfo:
Gui, 2:Destroy
infoState := false
Return



; Горячие клавиши для показа информации

F11::
    ExtendedInfo("AHK для МО by Foster"
        , ""
        , "Скрипт больше предназначен для старших рангов МО (5+),"
        , "однако для новобранцев тоже есть полезные функции."
        , "Полная инструкция: https://github.com/Ilyuxadwa/AHKScripts/blob/main/Radmir/МО/Info km.md")
Return

F9 & 1::
    ExtendedInfo("Что делает 1:"
        , "Режим: Обычный"
        , "| 1: Приветсвие"
        , "| 1 + LAlt: Только Удостоверение"
        , "| 1 + Ctrl: Посторонний на ВЧ"
        , "Режим: Строй"
        , "| 1: Сбор строя 3 мин, повседневная форма"
        , "| 1 + LAlt: Сбор строя 5 мин, повседневная форма"
        , "| 1 + Ctrl: Сбор строя 3 мин, боевая форма"
        , "| 1 + RAlt: Сбор строя 5 мин, боевая форма"
        , "Режим: Призыв"
        , "| 1: Вопрос"
        , "| 1 + LAlt: Начать собес"
        , "| 1 + Ctrl: Годен")
Return

F9 & 2::
    ExtendedInfo("Что делает 2:"
        , "Режим: Обычный"
        , "| 2: Сбор конвоя"
        , "Режим: Строй"
        , "| 2: Информация про строй"
        , "| 2 + LAlt: Рандомная лекция"
        , "Режим: Призыв"
        , "| 2: Взять паспорт")
Return

F9 & 3::
    ExtendedInfo("Что делает 3:"
        , "Режим: Обычный"
        , "| 3: Информация про конвой"
        , "Режим: Строй"
        , "| 3: Лекция 1"
        , "Режим: Призыв"
        , "| 3: Попросить мед. карту")
Return

F9 & 4::
    ExtendedInfo("Что делает 4:"
        , "Режим: Обычный"
        , "| 4: Выезд конвоя"
        , "Режим: Строй"
        , "| 4: Лекция 2"
        , "Режим: Призыв"
        , "| 4: Взять мед. карту")
Return

F9 & 5::
    ExtendedInfo("Что делает 5:"
        , "Режим: Обычный"
        , "| 5: Конвой секретка"
        , "Режим: Строй"
        , "| 5: Лекция 3"
        , "Режим: Призыв"
        , "| 5: Попросить лицензии")
Return

F9 & 6::
    ExtendedInfo("Что делает 6:"
        , "Режим: Обычный"
        , "| 6: Конвой на базу"
        , "| 6 + LAlt: Конвой в другую организацию"
        , "Режим: Строй"
        , "| 6: Лекция 4"
        , "Режим: Призыв"
        , "| 6: Взять лицензии")
Return

F9 & 7::
    ExtendedInfo("Что делает 7:"
        , "Режим: Обычный"
        , "| 7: Конвой конец"
        , "Режим: Строй"
        , "| 7: Лекция 5"
        , "Режим: Призыв"
        , "| 7: Вопрос 1")
Return

F9 & 8::
    ExtendedInfo("Что делает 8:"
        , "Режим: Обычный"
        , "| 8: Мегафон"
        , "Режим: Строй"
        , "| 8: Лекция 6"
        , "Режим: Призыв"
        , "| 8: Вопрос 2")
Return

F9 & 9::
    ExtendedInfo("Что делает 9:"
        , "Режим: Обычный"
        , "| 9: Принять"
        , "| 9 + LAlt: Повысить"
        , "| 9 + Ctrl: Выдать взвод"
        , "| 9 + RAlt: Занести в ЧС"
        , "Режим: Строй"
        , "| 9: Лекция 7"
        , "Режим: Призыв"
        , "| 9: РП термины")
Return

F9 & 0::
    ExtendedInfo("Что делает 0:"
        , "Режим: Обычный"
        , "| 0: Выговор"
        , "| 0 + LAlt: Снять выговор"
        , "| 0 + Ctrl: Уволить"
        , "| 0 + RAlt: Уволить оффлайн"
        , "Режим: Строй"
        , "| 0: Тренировка"
        , "Режим: Призыв"
        , "| 0: Отказ - Неумение РП"
        , "| 0 + LAlt: Отказ - паспорт"
        , "| 0 + Ctrl: Отказ - мед. карта"
        , "| 0 + RAlt: Отказ - лицензии")
Return

F10 & 1::
    ExtendedInfo("Устав МО. Страница 1/5: (Глава 1 - Глава 3.4)"
        , "| 1.1 Незнание устава не освобождает от ответственности."
        , "| 1.2 Устав являться общепринятым."
        , "| 1.3 Устав действует в любое время."
        , "| 1.4 Генерал МО имеет право вносить изменения в устав."
        , "| 1.5. За несоблюдение устава могут быть применены взыскания (беседа, замечание, задание, выговор, увольнение, ЧС)."
        , "| 1.6 Генерал МО имеет право изменять вид дисциплинарного взыскания."
        , ""
        , "Глава 2. Рабочий день"
        , "| 2.1 Рабочий день в будни с 8:00 до 21:00."
        , "| 2.2 Рабочий день в субботу с 09:00 до 20:00."
        , "| 2.3 Рабочий день в воскресенье 09:00 до 19:00."
        , "| 2.4 Обеденный перерыв с 13:00 до 14:00 (за 1-5 минут до окончания быть на рабочем месте)."
        , ""
        , "Глава 3. Обязанности военнослужащего"
        , "| 3.1 Сотрудник обязан соблюдать УК, КоАП, ПДД, Законодательную Базу."
        , "| 3.2 Сотрудник обязан вести себя в любой ситуации адекватно."
        , "| 3.3 Сотрудник обязан докладывать о всех правонарушениях, и пытаться их выявить."
        , "| 3.4 Сотрудник обязан охранять граждан, и оберегать их.")
Return

F10 & 2::
    ExtendedInfo("Устав МО. Страница 2/5: (Глава 3.5 - Глава 4.7)"
        , "| 3.5 Сотрудник должен правильно выполнять приказы старшего состава."
        , "| 3.6 Сотрудник обязан уважать обычных граждан, сотрудников и служащих другой организации."
        , "| 3.7 Сотрудник который находится на территории военной части должен охранять склад. (искл. Ком. роты, комбат, ком. части)"
        , "| 3.8 Сотрудник должен обращаться с старшим по званию исключительно на 'Вы'."
        , "| 3.9 Ношение бронежилета во время воинской службы (НЕ ДЕЙСТВИТЕЛЬНО)."
        , "| 3.10 Сотрудникам запрещено перечить старшему по званию."
        , "| 3.11 Сержант и выше ежедневно обязан присутствовать на конвоях, помогать в загрузке или разгрузке материалов."
        , "| 3.12 Сотрудники снимая форму в конце рабочего дня - обязаны снять бронежилет если находиться в нем."
        , "| 3.13 Сотрудник обязан предъявить военное удостоверение/нашивку при разговоре и/или отдаче приказа с гражданином."
        , "| 3.14 Сотрудник во время патруля обязаны передвигаться только на транспорте 'ВАИ'."
        , ""
        , "Глава 4. Запреты военнослужащего"
        , "| 4.1 Запрещено открывать огонь без причины, наносить урон и давить людей."
        , "| 4.2 Использовать Т/С в личных целях."
        , "| 4.3 Использовать служебное положение в личных целях."
        , "| 4.4 Езда по В/Ч без причины."
        , "| 4.5 Брать Т/С без разрешения старшего состава."
        , "| 4.6 Запрещено использовать наркотики."
        , "| 4.7 Не подчиняться старшему по званию.")
Return

F10 & 3::
    ExtendedInfo("Устав МО. Страница 3/5: (Глава 4.8 - Глава 4.20)"
        , "| 4.8 Запрещено бездействие на военной части, и за ней."
        , "| 4.9 Прогул рабочего дня запрещён. (Примечание: Если сотрудник после окончания рабочего дня остаётся в форме, он обязан выполнять свои должностные обязанности.)"
        , "| 4.10 Запрещено неадекватное поведение."
        , "| 4.11 Запрещено требование повышения, проверки отчёта. (Ответ 24 часа)"
        , "| 4.12 Запрещено носить боевую форму на военной части (( Искл: поездка за мт, пост, патруль, рп ))."
        , "| 4.13 Запрещено продавать патроны."
        , "| 4.14 Запрещено не соблюдать субординацию с старшими по званию."
        , "| 4.15 Запрещено залезать на крышу складов, столовой, КПП, казармы."
        , "| 4.16 Запрещено воровать ящики с вертолёта."
        , "| 4.17 Запрещено заезжать/парковать/ездить на ЛТС на территории ВЧ, а также ездить на ЛТС по городу и во время рабочего дня."
        , "| 4.18 Военнослужащему запрещено спать в неположенном месте более 5 минут (( Искл: казарма, мед.блок ))."
        , "| 4.19 Военнослужащему запрещено превышать свои полномочия."
        , "| 4.20 Рядовому, Ефрейтору, Сержанту и Прапорщику запрещено находится на или за территорией КПП без весомой на то причины. [Наказание на 1й раз: устное предупреждение].")
Return

F10 & 4::
    ExtendedInfo("Устав МО. Страница 4/5: (Глава 4.22 - Глава 5)"
        , "| 4.22 Неподобающее поведение от сотрудника. (оскорбления, маты, танцы)"
        , "| 4.23 Запрещено стрелять по своим сослуживцам."
        , "| 4.24 Сотруднику запрещается сотрудничать с преступниками (ОПГ)."
        , "| 4.25 Запрещено взаимодействовать с лицами из ОПГ сотрудникам даже вне рабочее время без формы."
        , "| 4.26 В рабочее время сотруднику запрещено посещать любые места развлечения."
        , ""
        , "Глава 5. Использование рации"
        , "| 5.1 Выяснение личных обстоятельств в /r /rr чат рации."
        , "| 5.2 Ругаться матом в /r чат рации."
        , "| 5.3 Писать не по теме, оффтоп."
        , "| 5.4 Запрещено нести бред, флуд."
        , "| 5.5 Запрещено использовать рацию для маркетинга."
        , "| 5.6 Запрещен многократный повтор одних и тех же слов в рацию."
        , "| 5.7 Запрещено использовать нецензурную лексику в рацию."
        , "| 5.8 Запрещено оскорбление / унижение кого-либо в рацию."
        , "| 5.9 Запрещено многократное выпрашивание проверки отчёта / повышение."
        , "| 5.10 Запрещено говорить в рацию без 'ТЕГА' после 2-x предупреждений.")
Return

F10 & 5::
    ExtendedInfo("Устав МО. Страница 5/5: (Глава 6)"
        , "| 6.1 Проводить построения могут только сотрудники со звания 'Майор'."
        , "| 6.2 Военнослужащий обязан явиться на построение по первому приказу."
        , "| 6.3 В случае возникновения обстоятельств, которые не дают возможность явиться в строй вовремя, Военнослужащий обязан сообщить об этом в рацию."
        , "| 6.4 Военнослужащему запрещено спать в строю более 1 минуты."
        , "| 6.5 Военнослужащему запрещено говорить в строю без разрешения."
        , "| 6.6 Военнослужащему запрещено покидать строй без разрешения."
        , "| 6.7 Военнослужащему запрещено использовать телефон в строю. (Искл: звонок в службу точного времени)"
        , "| 6.8 Военнослужащему запрещено доставать оружие в строю без приказа."
        , "| 6.9 Военнослужащему запрещено танцевать, заниматься лишними делами в строю."
        , "| 6.10 Военнослужащему обязан выполнять приказы проводящего построение."
        , "| 6.11 Военнослужащий имеет право не являться на построение после получения на то одобрения от проводящего построение."
        , "| 6.12 Военнослужащий начиная со звания Полковник имеет право освободить сотрудника(-ов) от построения при уважительных причинах."
        , "| 6.13 До окончания готовности, военнослужащий имеет право встать в строй не спрашивая разрешение."
        , "| 6.14 По истечению готовности, военнослужащий обязан спросить разрешение и, после его получения, встать в конец строя.")
Return

F11 up::
F10 & 1 up::
F10 & 2 up::
F10 & 3 up::
F10 & 4 up::
F10 & 5 up::
F9 & 0 up::
F9 & 1 up::
F9 & 2 up::
F9 & 3 up::
F9 & 4 up::
F9 & 5 up::
F9 & 6 up::
F9 & 7 up::
F9 & 8 up::
F9 & 9 up::goto DestroyInfo