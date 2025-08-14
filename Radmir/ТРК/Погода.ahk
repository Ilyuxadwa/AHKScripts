Numpad0::
SendMessage, 0x50,, 0x4190419,, A
Sendinput,{F6}/me настраивает аппаратуру{Enter}
sleep 1000
Sendinput,{F6}/me подключает аппаратуру к блоку питания{Enter}
sleep 1000
Sendinput,{F6}/me взял микрофон в руки{Enter}
sleep 1000
Sendinput,{F6}/do Вышел в прямой эфир.{Enter}
return

NumPad1::
SendMessage, 0x50,, 0x4190419,, A
Sendinput, {F6}/r [В] Занимаю эфир.{Enter}
sleep, 1500
Sendinput, {F6}/efir{Enter}
sleep, 1500
Sendinput, {F6}/t ...:::: Музыкальная заставка ТРК "Ритм" ::::...{Enter}
sleep, 2200
Sendinput {F6}/t Здравствуйте, Уважаемые жители области.{Enter}
sleep, 2200
Sendinput {F6}/t Сегодня с Вами в эфире Ведущий ТРК "Ритм" - Ильяс Фостер.{Enter}
sleep, 2200
Sendinput {F6}/t В эфире "Прогноз погоды".{Enter}
sleep, 2200
Sendinput {F6}/t В данный момент температура в области составляет (12°){Enter}
sleep, 2200
Sendinput {F6}/t Наблюдается ясное небо{Enter}
sleep, 1000
Sendinput {F6}/c 60{Enter}
sleep, 10000
Sendinput {F6}/t В городе Арзамас ожидаются осадки, температура (15°){Enter}
sleep, 2200
Sendinput {F6}/t Синоптики рекомендуют оставаться дома и пить горячий чай{Enter}
sleep, 2200
Sendinput {F6}/t Город Южный радует своей солнечной погодой, температура свыше (20°){Enter}
sleep, 2200
Sendinput {F6}/t В городе Лыткарино ожидается потепление темперпературы (13°){Enter}
sleep, 2200
Sendinput {F6}/t Дождливой областью на данный момент, оказался город Эдово{Enter}
sleep, 2200
Sendinput {F6}/t Температура в этой области состовляет (14°){Enter}
sleep, 2200
Sendinput {F6}/t Ну на этом все, спасибо что были с нами.{Enter}
sleep, 2200
Sendinput, {F6}/t С Вами был Ведущий ТРК "Ритм" - Ильяс Фостер.{Enter}
sleep, 2200
Sendinput, {F6}/t ...:::: Музыкальная заставка ТРК "Ритм" ::::...{Enter}
sleep, 1500
Sendinput, {F6}/efir{Enter}
sleep, 1500
Sendinput {F6}/r [В] Освобождаю эфир.{Enter}
Return

Numpad2::
SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/me выключил аппаратуру{Enter}
Sleep 1000
SendInput, {f6}/do Аппаратура выключена.{Enter}
Sleep 1000
SendInput, {f6}/me убрал аппаратуру на полку.{ENTER}
Sleep 1000
SendInput, {f6}/do Аппаратура на полке.{Enter}
Return