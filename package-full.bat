@echo off

cd /d %~dp0

set cur_path=%~dp0
set web_ui_path="D:\Projects\work\park_map\parkmap"
set cpp_path="D:\Projects\work\route_management\cpp"
set cef_release_path=%cpp_path%"\tests\cefclient\Release"
set front_release_path=%cpp_path%\x64\Release"

rmdir /S /Q %cur_path%\操作机
mkdir %cur_path%\操作机

rmdir /S /Q  %cur_path%\前置机
mkdir %cur_path%\前置机

set filename=%1%.7z

del %filename%

cd /d %web_ui_path%
git pull
call compress.bat
copy /Y skin %cef_release_path%

cd /d %cef_release_path%
xcopy /Y /E * %cur_path%\操作机\
cd /d %cur_path%\操作机\
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
xcopy /Y /E * %cur_path%\前置机\
cd /d %cur_path%\前置机\
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
git rev-parse --short HEAD > %cur_path%\操作机\tag.txt

xcopy /Y %cur_path%\操作机\tag.txt %cur_path%\前置机\

cd /d %cur_path%./

7z.exe a -t7z -r -mx=9 -m1=LZMA2 %filename% ".\操作机\"
7z.exe a -t7z -r -mx=9 -m1=LZMA2 %filename% ".\前置机\"