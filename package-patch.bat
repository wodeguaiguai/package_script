@echo off

cd /d %~dp0

set cur_path=%~dp0

rmdir /S /Q %cur_path%\������_patch
rmdir /S /Q %cur_path%\ǰ�û�_patch

set filename=%1%_patch.7z

del %filename%

xcopy /Y /E %cur_path%������ %cur_path%������_patch\
cd /d %cur_path%������_patch\
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

xcopy /Y /E %cur_path%ǰ�û� %cur_path%ǰ�û�_patch\
cd /d %cur_path%ǰ�û�_patch\
del *.dll
del *.ipdb
del *.pdb

cd /d %cur_path%

7z.exe a -t7z -r -mx=9 -m1=LZMA2 %filename% ".\������_patch\"
7z.exe a -t7z -r -mx=9 -m1=LZMA2 %filename% ".\ǰ�û�_patch\"
