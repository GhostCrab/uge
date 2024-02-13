@echo off
ctime -begin uge.ctm

set CommonCompilerFlags=-std:c++20 -nologo -MT -Gm- -GR- -EHa- -Oi -WX -W4 /arch:AVX2 -wd4201 -wd4100 -wd4189 -wd4505 -DHANDMADE_INTERNAL=1 -DHANDMADE_SLOW=1 -DHANDMADE_WIN32=1 -FC -Zi
set CommonLinkerFlags=-incremental:no -opt:ref user32.lib Gdi32.lib Dsound.lib Winmm.lib

IF NOT EXIST ..\data mkdir ..\data
IF NOT EXIST ..\build mkdir ..\build
pushd ..\build

del *.pdb > NUL 2> NUL

echo WAITING FOR PDB > lock.tmp

@REM 64-bit build

cl %CommonCompilerFlags%^
 -O2^
 ..\code\main.cpp^
 ..\code\UGE\UGE.cpp^
 ..\code\Platform\App.cpp^
 ..\code\Platform\AppSettings.cpp^
 ..\code\Platform\FileIO.cpp^
 ..\code\Platform\ImGuiHelper.cpp^
 ..\code\Platform\MurmurHash.cpp^
 ..\code\Platform\Settings.cpp^
 ..\code\Platform\SF12_Assert.cpp^
 ..\code\Platform\SF12_Math.cpp^
 ..\code\Platform\Timer.cpp^
 ..\code\Platform\Utility.cpp^
 ..\code\Platform\Window.cpp^
 ..\code\Platform\EnkiTS\TaskScheduler.cpp^
 ..\code\Platform\EnkiTS\TaskScheduler_c.cpp^
 ..\code\Platform\Graphics\DX12.cpp^
 ..\code\Platform\Graphics\DX12_Helpers.cpp^
 ..\code\Platform\Graphics\DX12_Upload.cpp^
 ..\code\Platform\Graphics\DXErr.cpp^
 ..\code\Platform\Graphics\GraphicsTypes.cpp^
 ..\code\Platform\Graphics\Profiler.cpp^
 ..\code\Platform\Graphics\ShaderCompilation.cpp^
 ..\code\Platform\Graphics\ShaderDebug.cpp^
 ..\code\Platform\Graphics\Spectrum.cpp^
 ..\code\Platform\Graphics\SpriteFont.cpp^
 ..\code\Platform\Graphics\SpriteRenderer.cpp^
 ..\code\Platform\Graphics\SwapChain.cpp^
 ..\code\Platform\Graphics\Textures.cpp^
 /I ..\code\^
 /I ..\code\UGE^
 /I ..\code\Shaders^
 /I ..\code\Platform^
 /I ..\code\Platform\EnkiTS^
 /I ..\code\Platform\Graphics^
 /I ..\code\Platform\ImGui^
 /EHsc^
 /openmp^
 /link^
 shell32.lib^
 imm32.lib^
 d3d12.lib^
 d3dcompiler.lib^
 dxgi.lib^
 %CommonLinkerFlags%

@REM wasapi test

@REM cl -FC -Zi ..\code\wasapi_init.c user32.lib Gdi32.lib Dsound.lib ole32.lib

popd


@REM 
@REM 


















@REM ..\code\Platform\Graphics\imgui.cpp^
@REM ..\code\Platform\Graphics\imgui_demo.cpp^
@REM ..\code\Platform\Graphics\imgui_draw.cpp^
@REM ..\code\Platform\Graphics\imgui_widgets.cpp^