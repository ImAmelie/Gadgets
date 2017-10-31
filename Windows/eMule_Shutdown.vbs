' eMule自动关机脚本
' author:Amelie

Dim path,time,result

' 变量设置 path:temp文件夹所在位置 time:关机时间,以分钟为单位
path = "Z:\Xtreme\Temp"
time = 10


Set dir = CreateObject("Scripting.FileSystemObject").GetFolder(path)
Set ws = WScript.CreateObject("WScript.Shell")
Do While True
	If dir.Files.Count = 0 AND dir.SubFolders.Count = 0 Then
		ws.run "shutdown -s -t "&time*60,0
		If msgbox("系统即将在"&time&"分钟后关机"+Chr(10)+"是否取消本次关机？",vbYesNo,"eEmule自动关机") = 6 Then
			ws.run "shutdown -a",0
			msgbox "关机操作已取消",0,"成功"
		End If
		wscript.quit
	End If
	WScript.Sleep 120000
Loop