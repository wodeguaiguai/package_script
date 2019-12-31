@echo off

cd /d %~dp0

set cur_path=%~dp0
set web_ui_path="D:\Projects\work\park_map\parkmap"
set cpp_path="D:\Projects\work\route_management\cpp"
set cef_release_path=%cpp_path%"\tests\cefclient\Release"
set front_release_path=%cpp_path%\x64\Release"

rmdir /S /Q %cur_path%\������
mkdir %cur_path%\������

rmdir /S /Q  %cur_path%\ǰ�û�
mkdir %cur_path%\ǰ�û�

set filename=%1%.7z

del %filename%

cd /d %web_ui_path%
git pull
call compress.bat
copy /Y skin %cef_release_path%

cd /d %cef_release_path%
xcopy /Y /E * %cur_path%\������\
cd /d %cur_path%\������\
rmdir /S /Q log
rmdir /S /Q blob_storage
rmdir /S /Q cache
del config-*.ini
del config.ini
del config_demo.ini
del debug.log
del console.log
del *.dmp
copy %cpp_path%\config.ini config_demo.ini

cd /d %front_release_path%
xcopy /Y /E * %cur_path%\ǰ�û�\
cd /d %cur_path%\ǰ�û�\
rmdir /S /Q log
del *.bsc
del *.iobj
del *.lib
del *.exp
del *.dmp
del config-*.ini
del config.ini
del config_demo.ini
copy %cpp_path%\config.ini config_demo.ini

cd /d %cpp_path%
git rev-parse --short HEAD
git rev-parse --short HEAD > %cur_path%\������\tag.txt

xcopy /Y %cur_path%\������\tag.txt %cur_path%\ǰ�û�\

cd /d %cur_path%./

7z.exe a -t7z -r -mx=9 -m1=LZMA2 %filename% ".\������\"
7z.exe a -t7z -r -mx=9 -m1=LZMA2 %filename% ".\ǰ�û�\"