FileEncoding, UTF-8

easyPath := A_ScriptDir . "\easy.txt"
mediumPath := A_ScriptDir . "\medium.txt"
hardPath := A_ScriptDir . "\hard.txt"

easy_words := []
medium_words := []
hard_words := []

last_word := []
Loop, Read, %easyPath%
{
    easy_words.Push(A_LoopReadLine)
}
Loop, Read, %mediumPath%
{
    medium_words.Push(A_LoopReadLine)
}
Loop, Read, %hardPath%
{
    hard_words.Push(A_LoopReadLine)
}


if (easy_words.MaxIndex() = 0)
{
    MsgBox, Ошибка: Не удалось загрузить слова из файла "easy.txt".
    ExitApp
}
if (medium_words.MaxIndex() = 0)
{
    MsgBox, Ошибка: Не удалось загрузить слова из файла "medium.txt".
    ExitApp
}
if (hard_words.MaxIndex() = 0)
{
    MsgBox, Ошибка: Не удалось загрузить слова из файла "hard.txt".
    ExitApp
}


:?*:слово-лег::

    if (easy_words.Length() = 0)
    {
        SendMessage, 0x50,, 0x4190419,, A
        SendInput, {Backspace 150}{F6}
	sleep 1000
	SendInput, {F6}/n Похоже вы использовали все слова типа: Легкий.{enter}
	sleep 2000 
	SendInput, {F6}/n Перезапустите скрипт для обновления.{enter}
	return
    }


    Random, randIndex, 1, % easy_words.MaxIndex()
    word := easy_words[randIndex]
    last_word := word

    easy_words.RemoveAt(randIndex)

    shuffledWord := ShuffleString(word)
    StringUpper, shuffledWord, shuffledWord

    result := ""
    Loop, Parse, shuffledWord
    {
        result .= A_LoopField . "."
    }
    

    StringTrimRight, result, result, 1
    SendInput %result%
return

:?*:слово-ср::

    if (medium_words.Length() = 0)
    {
        SendMessage, 0x50,, 0x4190419,, A
        SendInput, {Backspace 150}{F6}
	sleep 1000
	SendInput, {F6}/n Похоже вы использовали все слова типа: Средний.{enter}
	sleep 2000 
	SendInput, {F6}/n Перезапустите скрипт для обновления.{enter}
	return
    }


    Random, randIndex, 1, % medium_words.MaxIndex()
    word := medium_words[randIndex]
    last_word := word

    medium_words.RemoveAt(randIndex)

    shuffledWord := ShuffleString(word)
    StringUpper, shuffledWord, shuffledWord

    result := ""
    Loop, Parse, shuffledWord
    {
        result .= A_LoopField . "."
    }
    

    StringTrimRight, result, result, 1
    SendInput %result%
return

:?*:слово-сл::

    if (hard_words.Length() = 0)
    {
	SendMessage, 0x50,, 0x4190419,, A
        SendInput, {Backspace 150}{F6}
	sleep 1000
	SendInput, {F6}/n Похоже вы использовали все слова типа: Сложный.{enter}
	sleep 2000 
	SendInput, {F6}/n Перезапустите скрипт для обновления.{enter}
	return
    }


    Random, randIndex, 1, % hard_words.MaxIndex()
    word := hard_words[randIndex]
    last_word := word

    hard_words.RemoveAt(randIndex)

    shuffledWord := ShuffleString(word)
    StringUpper, shuffledWord, shuffledWord

    result := ""
    Loop, Parse, shuffledWord
    {
        result .= A_LoopField . "."
    }
    

    StringTrimRight, result, result, 1
    SendInput %result%
return

Numpad9::
    if (last_word != "")
    {
        SendInput %last_word%
    }
    else
    {
        MsgBox, Нет сохраненного слова для вставки.
    }
return


ShuffleString(str) {
    randomStr := ""
    strArray := []
    

    Loop, Parse, str
    {
        strArray.Push(A_LoopField)
    }
    

    while (strArray.MaxIndex() > 0) {
        Random, randIndex, 1, % strArray.MaxIndex()
        randomStr .= strArray.RemoveAt(randIndex)
    }
    
    return randomStr
}
