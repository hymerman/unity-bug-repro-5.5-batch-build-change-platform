pushd %~dp0
setlocal


rem Path to Unity command
set UNITY_CMD_PATH=C:\Program Files\Unity5.5.0p1\Editor\Unity.exe
set UNITY_PROJECT_PATH=%~dp0\
set OUTPUT_DIR=%~dp0_output

rem Start clean
rd /s /q %OUTPUT_DIR%
mkdir %OUTPUT_DIR%



"%UNITY_CMD_PATH%" -quit -batchmode -projectPath %UNITY_PROJECT_PATH% -buildTarget win32 -logFile %OUTPUT_DIR%\unity_editor_step_1_win.log
"%UNITY_CMD_PATH%" -quit -batchmode -projectPath %UNITY_PROJECT_PATH% -buildTarget linux -logFile %OUTPUT_DIR%\unity_editor_step_2_linux.log






popd