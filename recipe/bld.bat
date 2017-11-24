if "%ARCH%"=="32" (
   set PLATFORM=x86
) else (
  set PLATFORM=x64
)

call vcbuild.bat nosign release %PLATFORM%

COPY Release\node.exe %PREFIX%\node.exe

%PREFIX%\node.exe -v
%PREFIX%\node.exe deps\npm\bin\npm-cli.js install npm -gf
%PREFIX%\npm.cmd version
REM dedupe npm to avoid too-long path issues on Windows
cd %PREFIX%\node_modules\npm
%PREFIX%\npm.cmd dedupe
