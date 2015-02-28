@echo off

if not exist "%~dp0\Thirdparty\ACT\Advanced Combat Tracker.exe" (
	echo エラー: "Thirdparty" ディレクトリに "Advanced Combat Tracker.exe" をコピーしてください。
	goto END
)

if not exist "%~dp0\Thirdparty\OverlayPlugin\OverlayPlugin.dll" (
	echo エラー: "Thirdparty" ディレクトリに "OverlayPlugin.dll HtmlRenderer.dll" をコピーしてください。
	goto END
)

set DOTNET_PATH=%windir%\Microsoft.NET\Framework\v4.0.30319
if not exist %DOTNET_PATH% (
	echo エラー: .NET Framework のディレクトリが見つかりません。ビルドを実行するためには .NET Framework 4.5.1 がインストールされている必要があります。
	goto END
)


%DOTNET_PATH%\msbuild /t:Rebuild /p:Configuration=Release /p:Platform="Any CPU" /p:OutputPath="%~dp0\Build" "%~dp0\EnmityPlugin.sln"

:END
