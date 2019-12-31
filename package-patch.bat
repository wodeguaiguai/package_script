@echo off

cd /d %~dp0

set cur_path=%~dp0

rmdir /S /Q %cur_path%\操作机_patch
rmdir /S /Q %cur_path%\前置机_patch

set filename=%1%_patch.7z

del %filename%

xcopy /Y /E %cur_path%操作机 %cur_path%操作机_patch\
cd /d %cur_path%操作机_patch\
rmdir /S /Q locales
rmdir /S /Q swiftshader
del *.bin
del *.dat
del *.dll
del *.log
del *.pak
del *.pdb
del *.dmp
del ffmpeg.pdb

del ffmpeg.exe

xcopy /Y /E %cur_path%前置机 %cur_path%前置机_patch\
cd /d %cur_path%前置机_patch\
del *.dll
del *.ipdb
del *.pdb

cd /d %cur_path%

7z.exe a -t7z -r -mx=9 -m1=LZMA2 %filename% ".\操作机_patch\"
7z.exe a -t7z -r -mx=9 -m1=LZMA2 %filename% ".\前置机_patch\"
