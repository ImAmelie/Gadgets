@echo off
echo command="%%windir%%\System32\cmd.exe /c javap -l -p -s -constants -c -verbose """+WScript.Arguments(0)+""" > """+WScript.Arguments(0)+".bytecode.txt""" > "%ProgramFiles%\javap.vbs"
echo CreateObject("WScript.Shell").Run command,0 >> "%ProgramFiles%\javap.vbs"
reg add "HKCR\.class\shell" /ve /t REG_SZ /d "打开" /f
reg add "HKCR\.class\shell\javap(J)\Command" /ve /t REG_EXPAND_SZ /d "wscript \"%ProgramFiles%\javap.vbs\" \"%%1\"" /f
echo 建立"Java字节码反编译"右键菜单成功！3秒后本窗口自动关闭
ping -n 3 0 >nul

:: 作者: Amelie 
:: 提示: 同时选中多个.class文件,按Menu键(右Ctrl左侧)之后再按J键,同时反编译多个.class文件
:: 有bug请联络作者
:: 依赖程序:JDK