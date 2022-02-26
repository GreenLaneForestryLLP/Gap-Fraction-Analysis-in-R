@echo off
if %1.==.goto usage


if exist %1 (
echo %1 > gf_temp
echo %1 > gs_temp
goto suite )
if exist %1.bmp echo %1.bmp > gf_gf_temp
if exist %1.bmp echo %1.bmp > gs_temp
if not exist %1 if not exist %1.bmp goto filenotfound

:suite
echo 1 >> gs_temp
echo 1 >> gf_temp
echo 2148 860 >> gs_temp
echo 2148 860 >> gf_temp
echo 1140 1864 >> gs_temp
echo 1140 1864 >> gf_temp
echo 3040 2472 >> gs_temp
echo 3040 2472 >> gf_temp
echo %2 >> gs_temp
echo %2 >> gf_temp

if %2==g (
echo %3 >> gs_temp
echo %3 >> gf_temp )



echo y >> gs_temp
echo 10.0 >> gs_temp
echo 65.0 >> gs_temp
echo 1.0 >> gs_temp


echo n >> gf_temp
echo 18 24 >> gf_temp
echo 1.34 >> gf_temp

GFA-WIN < gs_temp
GFA-WIN < gf_temp


if exist gf_%1.txt (
del gf_%1.txt )
if exist gs_%1.txt (
del gs_%1.txt )
ren gapfract.txt gf_%1.txt
ren gapsize.dat gs_%1.txt

goto end
del gf_temp
del gs_temp
:usage
echo USAGE : call-GFA <file_name> <c/g> <if g, threshold_value>
goto end

:filenotfound
echo file not found
goto end

:end
