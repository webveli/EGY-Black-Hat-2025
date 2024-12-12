Set WinScriptHost = CreateObject("WScript.Shell")

' التحقق من وجود الملف
If (CreateObject("Scripting.FileSystemObject").FileExists("C:\Python312\Shoot.bat")) Then
    ' تشغيل الملف دفعي بصمت
    WinScriptHost.Run Chr(34) & "C:\Python312\Shoot.bat" & Chr(34), 0
Else
    MsgBox "The file Shoot.bat does not exist."
End If

Set WinScriptHost = Nothing
