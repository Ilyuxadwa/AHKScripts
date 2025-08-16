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

!Numpad1::
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

Numpad2::
SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/r [ТЕГ] Внимание{!} Нападение на территорию В/Ч.{Enter}
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

Numpad4::
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{F6}/r [ТЕГ] Докладывает: Фамилия. Выехали в патруль по  с жетоном: . Состояние: Стабильное.{Left 36}
Return

!Numpad4::
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{F6}/r [ТЕГ] Докладывает: Фамилия. Продолжаем патруль по  с жетоном: . Состояние: Стабильное.{Left 36}
Return

^Numpad4::
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{F6}/r [ТЕГ] Докладывает: Фамилия. Завершаем патруль по  с жетоном: . Состояние: Стабильное.{Left 36}
Return

Numpad5::
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{F6}/r [ТЕГ] Докладывает: Фамилия. Заступил на пост: . Состояние: Стабильное.
Return

!Numpad5::
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{F6}/r [ТЕГ] Докладывает: Фамилия. Продолжаю стоять на пост: . Состояние: Стабильное.
Return

^Numpad5::
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{F6}/r [ТЕГ] Докладывает: Фамилия. Покидаю пост: . Состояние: Стабильное.
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
