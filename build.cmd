@echo off
REM ������������ Python �ű��������� .list ת���� .json
REM �ٱ���Ŀ¼������ .json �ļ������ɶ�Ӧ�� .srs �ļ�

setlocal enabledelayedexpansion

REM Python �ű��ļ���������ͱ��������ͬĿ¼��
set PYTHON_SCRIPT=����ת��.py

REM sing-box.exe ·�����������ͬĿ¼�����øģ�
set SINGBOX=sing-box.exe

REM ��ִ�� Python �ű�����Ҫϵͳ�Ѱ�װ Python��
echo �������й���ת���ű� %PYTHON_SCRIPT% ...
python "%PYTHON_SCRIPT%"
if errorlevel 1 (
    echo ? Python �ű�ִ��ʧ�ܣ������Ƿ�װ Python��
    pause
    exit /b
)

REM ������ǰĿ¼������ json �ļ�������� srs
for %%f in (*.json) do (
    echo ���ڱ��� %%f ...
    %SINGBOX% rule-set compile --output "%%~nf.srs" "%%f"
)

echo.
echo ? ���� list ��ת��Ϊ json ������Ϊ srs

@REM .\build.cmd