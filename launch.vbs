Set WshShell = CreateObject("WScript.Shell")
Set FSO = CreateObject("Scripting.FileSystemObject")

' Get the directory of the VBScript file
CurrentDir = FSO.GetParentFolderName(WScript.ScriptFullName)

' Construct the full path to the batch file
BatchFilePath = CurrentDir & "\wa.bat"

' Check if the batch file exists
If FSO.FileExists(BatchFilePath) Then
    ' Run the batch file hidden, without waiting, then exit VBScript
    WshShell.Run "cmd /c """ & BatchFilePath & """", 0, False
    WScript.Quit
Else
    MsgBox "Batch file not found: " & BatchFilePath
    WScript.Quit
End If
