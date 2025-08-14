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



; Часть для строя

:?*:лек1::
SendMessage, 0x50,, 0x4190419,, A
SendInput, {Enter}
sleep 500
SendInput, {F6}/s Добро пожаловать в доблестную армию. {Enter}
sleep 3000
SendInput, {F6}/s Разговаривать или обращаться без разрешения запрещено{!} {Enter}
sleep 3000
SendInput, {F6}/s Обращаться к друг другу строго на Вы {Enter}
sleep 3000
SendInput, {F6}/s При обращение добавить слово "Товарищ" Звание. {Enter}
sleep 3000
SendInput, {F6}/s Перед тем, как начать военную службу Вы должны принять присягу {Enter}
sleep 3000
SendInput, {F6}/s До принятия присяги вам запрещается нести боевое дежурство {Enter}
sleep 3000
SendInput, {F6}/s участвовать в боевых действиях и боевой службе. {Enter}
sleep 3000
SendInput, {F6}/s За вами также запрещается закреплять вооружение и боевую технику. {Enter}
sleep 3000
SendInput, {F6}/s При попытке нанесения вреда Армии или получения боеприпасов для личного использования {Enter}
sleep 3000
SendInput, {F6}/s Вы будете демобилизованы из Министерства Обороны, а в некоторых случаях занесены в ЧС{!} {Enter}
sleep 3000
SendInput, {F6}/s Использовать вооружение в собственных целях запрещено{Enter}
sleep 3000
SendInput, {F6}/s Использования оружия разрешено только при Чрезвычайных Ситуациях и тренировках. {Enter}
sleep 3000
SendInput, {F6}/s Применению оружия должно предшествовать четко выраженное предупреждение об этом лица {Enter}
sleep 3000
SendInput, {F6}/s за исключением случаев непосредственной опасности для жизни военнослужащего или других граждан. {Enter}
return

:?*:лек2::
SendMessage, 0x50,, 0x4190419,, A
SendInput, {Enter}
sleep 500
SendInput, {F6}/s Уважаемые сотрудники МО{Enter}
Sleep 3000
SendInput, {F6}/s Сейчас я проведу лекцию на тему "Устав". {Enter}
Sleep 3000
SendInput, {F6}/s Устав — свод правил, регулирующих организацию и порядок... {Enter}
Sleep 3000
SendInput, {F6}/s деятельности в какой-либо определённой сфере отношений или... {Enter}
Sleep 3000
SendInput, {F6}/s какого-либо государственного органа, организаций... {Enter}
Sleep 3000
SendInput, {F6}/s предприятия, учреждения и так далее. {Enter}
Sleep 3000
SendInput, {F6}/s После того как вы будучи новобранцем прыбыли на ВЧ... {Enter}
Sleep 3000
SendInput, {F6}/s Вы обязаны были в казарме выучить устав! {Enter}
Sleep 3000
SendInput, {F6}/s Незнание устава не освободит вас от ответствинности {Enter}
Sleep 3000
SendInput, {F6}/s За нарушение устава вам могут выдать Выговор либо уволить из МО с занесением {Enter}
Sleep 3000
SendInput, {F6}/s В ЧС организации МО {Enter}
Sleep 3000
SendInput, {F6}/s Прошу не нарушать устав {Enter}
Sleep 3000
SendInput, {F6}/s На этом лекция на тему "Устав" окончена. Спасибо за внимание {Enter}
Return

:?*:лек3::
SendMessage, 0x50,, 0x4190419,, A
SendInput, {Enter}
sleep 500
SendInput,,{F6}/s Здравия желаю,сейчас я проведу лекцию, что запрещено военнослужащим {Enter}
Sleep 3000
SendInput,,{F6}/s Военнослужащим запрещено: {Enter}
Sleep 3000
SendInput,,{F6}/s Допускать утрату боеприпасов, техники и любого иного военного имущества. {Enter}
Sleep 3000
SendInput,,{F6}/s Допускать распространение служебной, военной, государственной тайны. {Enter}
Sleep 3000
SendInput,,{F6}/s Обсуждать вопросы, связанные с присвоением воинских званий и должностей. {Enter}
Sleep 3000
SendInput,,{F6}/s Самовольно покидать территорию Армии. {Enter}
Sleep 3000
SendInput,,{F6}/s Допускать проникновение неучтенных лиц на территорию Армии. {Enter}
Sleep 3000
SendInput,,{F6}/s Хранить и употреблять наркотики. {Enter}
Sleep 3000
SendInput,,{F6}/s Общаться с членами банд. {Enter}
Sleep 3000
SendInput,,{F6}/s Стрелять по другим военнослужащим. Если это не тренировка. {Enter}
Sleep 3000
SendInput,,{F6}/s Спорить со старшими по званию, не выполнять приказы, нарушать данный устав. {Enter}
Sleep 3000
SendInput,,{F6}/s Просить о повышении. {Enter}
Sleep 3000
SendInput,,{F6}/s Самовольно оставлять пост. {Enter}
Sleep 3000
SendInput,,{F6}/s Передавать патроны кому-либо, кроме сослуживцев.{Enter}
Sleep 3000
SendInput,,{F6}/s Портить государственные транспортные средства. {Enter}
Sleep 3000
SendInput,,{F6}/s Отдыхать или спать в неположенном месте. Разрешено отдыхать только в казарме. {Enter}
Sleep 3000
SendInput,,{F6}/s Если вы спите на посту, плацу! Вам будет выдан выговор! {Enter}
Sleep 3000
SendInput,,{F6}/s Спасибо за внимание. {Enter}
Return

:?*:лек4::
SendMessage, 0x50,, 0x4190419,, A
SendInput, {Enter}
sleep 500
SendInput,,{F6}/s Здравия желаю,коллеги сейчас я проведу вам лекцию. {Enter}
Sleep 3000
SendInput,,{F6}/s Лекция на тему "Правила поведения на тренировке". {Enter}
Sleep 3000
SendInput,,{F6}/s С самого начала я хочу сказать что такое тренеровка.. {Enter}
Sleep 3000
SendInput,,{F6}/s Тренеровка-это осмысленная физическая деятельность, направленная на развитие силы.. {Enter}
Sleep 3000
SendInput,,{F6}/s выносливости, ловкости, скорости и других физических и психологических навыков. {Enter}
Sleep 3000
SendInput,,{F6}/s Правила поведение на тренеровке {Enter}
Sleep 3000
SendInput,,{F6}/s 1. Слушаться старших по званию {Enter}
Sleep 3000
SendInput,,{F6}/s 2. Доставать оружие только по приказу. {Enter}
Sleep 3000
SendInput,,{F6}/s 3. Не покидать строй,только по приказу. {Enter}
Sleep 3000
SendInput,,{F6}/s 4. В строю молчать,слушать что говорят ваши коллеги. {Enter}
Sleep 3000
SendInput,,{F6}/s 5. Слушаться только ст.состав. {Enter}
Sleep 3000
SendInput,,{F6}/s 6. Тренеровку может начать Майор и выше по званию. {Enter}
Sleep 3000
SendInput,,{F6}/s 7. Вы должны четко и внимательно слушать ст.состав. {Enter}
Sleep 3000
SendInput,,{F6}/s 8. Если вы будете спать в строю вам будут давать выговор. {Enter}
Sleep 3000
SendInput,,{F6}/s 9. Если вы устали, вы можете подойти к тому кто организовал тренеровку... {Enter}
Sleep 3000
SendInput,,{F6}/s И попросить отдохнуть. {Enter}
Sleep 3000
SendInput,,{F6}/s 10. С разрешение Майора и выше, вы можете не являться на тренеровку. {Enter}
Sleep 3000
SendInput,,{F6}/s А на этом наша лекция подошла к концу. {Enter}
Sleep 3000
SendInput,,{F6}/s Спасибо за внимание. {Enter}
Return

:?*:лек5::
SendMessage, 0x50,, 0x4190419,, A
SendInput, {Enter}
sleep 500
SendInput, {F6}/s Сейчас я расскажу вам как вести себя на посту КПП с гражданскими. {Enter}
sleep 3000
SendInput, {F6}/s Сначала нужно поприветствовать и спросить цель прибытия у гостя. {Enter}
sleep 3000
SendInput, {F6}/s При этом вы должны убрать оружие, не нужно пугать или проявлять агрессию. {Enter}
sleep 3000
SendInput, {F6}/s Выполняйте все просьбы гражданина, если они не противоречат уставу. {Enter}
sleep 3000
SendInput, {F6}/s Старайтесь избежать конфликтов, если таковые могут возникнуть. {Enter}
sleep 3000
SendInput, {F6}/s Но если все-таки гражданин начал хамить, кричать и драться, то: {Enter}
sleep 3000
SendInput, {F6}/s Просите гостя отъехать или отойти от КПП. {Enter}
sleep 3000
SendInput, {F6}/s В случае неподчинения разрешено применить силу, досчитав до десяти. {Enter}
sleep 3000
SendInput, {F6}/s Не нужно начинать диалог с гражданами, стоящими дальше 10 метров от КПП. {Enter}
sleep 3000
SendInput, {F6}/s Запрещено стрелять, кричать и бить людей без причины. {Enter}
sleep 3000
SendInput, {F6}/s За это вы будете уволены и занесены в ЧС МО. {Enter}
sleep 3000
SendInput, {F6}/s Надеюсь все поняли главные принципы общения на КПП. {Enter}
sleep 3000
SendInput, {F6}/s Лекция на тему "Поведение на КПП с гражданскими" окончена. Спасибо за внимание. {Enter}
Return

:?*:лек6::
SendMessage, 0x50,, 0x4190419,, A
SendInput, {Enter}
sleep 500
SendInput, {F6}/s Уважаемые сотрудники МО{!}{ENTER}
Sleep 1000
SendInput, {F6}/s Сейчас я проведу лекцию по взводам.{enter}
sleep 1000
SendInput, {F6}/s Военная автомобильная инспекция ВАИ главная задача:{enter}
sleep 1000
SendInput, {F6}/s Обеспечение безопасности дорожного движения в Вооруженных силах;{enter}
Sleep 1000
SendInput, {F6}/s службы военных автоинспекций на маршрутах движения т/с ВЧ{enter}
Sleep 1000
SendInput, {F6}/s регистрация транспортных средств воинских частей;{enter}
Sleep 1000
SendInput, {F6}/s транспортных средств воинских частей к участию в дорожном движении.{enter}
Sleep 1000
SendInput, {F6}/s Взвод боевого обеспечения ВБО главная задача:{enter}
sleep 1000
SendInput, {F6}/s Боевое обеспечение (Оперативное обеспечение){Enter}
sleep 1000
SendInput, {F6}/s комплекс мероприятий осуществляемый в войсках, которые планируются{Enter}
sleep 1000
SendInput, {F6}/s организуются и осуществляются во всех видах операций{Enter}
sleep 1000
SendInput, {F6}/s для создания благоприятных условий для применения{Enter}
sleep 1000
SendInput, {F6}/s своих войск (сил), вооружения и военной техники,{Enter}
sleep 1000
SendInput, {F6}/s а также снижения эффективности применения войск (сил) и вооружения.{Enter}
sleep 1000
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
SendInput, {F6}/s На этом наша лекция на тему взводы окончена{Enter}
Return

:?*:треня::
SendMessage, 0x50,, 0x4190419,, A
SendInput, {Enter}
sleep 500
Random, exercise1, 10000, 100000
Random, exercise2, 10000, 100000
SendInput, {F6}/s Перейдем к тренировке{!}{ENTER}
Sleep 1000
SendInput, {F6}/s Начнём её с %exercise1% отжиманий.{enter}
Sleep 1000
SendInput, {F6}/n /anim 6 23 | Примичание: Хасл не делают{enter}
sleep 120000
SendInput, {F6}/s Отставить{!}{enter}
sleep 1000
SendInput, {F6}/s Дальше делаем %exercise2% приседаний{!}{enter}
Sleep 1000
SendInput, {F6}/n Нажимайте клавишу "C" или же /anim 3 2{enter}
sleep 60000
SendInput, {F6}/s Отставить{!}{enter}
sleep 1000
SendInput, {F6}/s Закончим тренировку легкой медитацией{!}{enter}
sleep 1000
SendInput, {F6}/n /anim 8 2{enter}
sleep 120000
SendInput, {F6}/s Отставить{!}{enter}
sleep 1000
SendInput, {F6}/s Тренировка окончена. Не расходимся{!}{enter}
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