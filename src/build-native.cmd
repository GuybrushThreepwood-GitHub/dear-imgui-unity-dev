@setlocal
@echo off
rem adapted from https://github.com/mellinoe/imgui.net-nativebuild

set ROOT=%~dp0

set BUILD_CONFIG=Release
set BUILD_ARCH=x64
set BUILD_CMAKE_GENERATOR_PLATFORM=x64

:ArgLoop
if    [%1] == []         goto Build
if /i [%1] == [Release] (set BUILD_CONFIG=Release&& shift & goto ArgLoop)
if /i [%1] == [Debug]   (set BUILD_CONFIG=Debug&& shift & goto ArgLoop)
if /i [%1] == [x64]     (set BUILD_ARCH=x64&& shift & goto ArgLoop)
if /i [%1] == [x86]     (set BUILD_ARCH=x86&& set BUILD_CMAKE_GENERATOR_PLATFORM=Win32&& shift & goto ArgLoop)
shift
goto ArgLoop

:Build

pushd %ROOT%

if NOT exist ".\build\%BUILD_ARCH%" (
    mkdir build\%BUILD_ARCH%
)
pushd build\%BUILD_ARCH%
cmake -DFT_DISABLE_ZLIB=TRUE -DFT_DISABLE_BZIP2=TRUE -DFT_DISABLE_PNG=TRUE -DFT_DISABLE_HARFBUZZ=TRUE -DFT_DISABLE_BROTLI=TRUE -DCMAKE_GENERATOR_PLATFORM=%BUILD_CMAKE_GENERATOR_PLATFORM% ..\..

echo [root] Calling cmake --build . --config %BUILD_CONFIG% 
cmake --build . --config %BUILD_CONFIG%
popd
popd

:Success
exit /b 0
