::执行前先把Path的内容备份一下,不保证一定不会出问题,以下代码在Windows7正确执行
@echo off
::在等号后设置你的JDK路径,可以带空格
set jdkPath=C:\java\jdk1_8
for /f "skip=2 tokens=2*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "Path"') do (
	set oldValue=%%b
)
@reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "JAVA_HOME" /t REG_SZ /d "%jdkPath%" /f >nul
echo %oldValue%|find /i "%JAVA_HOME%" >nul
if %ERRORLEVEL%==1 (
	@reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "Path" /t REG_EXPAND_SZ /d "%%JAVA_HOME%%\bin;%oldValue%" /f >nul
)
@echo 注册表修改成功,按任意键退出!
@pause>nul
