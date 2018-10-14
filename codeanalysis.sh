#!/bin/bash
echo "Downloading ShiftLeft Agent!"
curl -O https://www.shiftleft.io/download/sl-latest-windows-x64.zip
echo "Extracting Shiftleft Agent!"
powershell -Command "& {Expand-Archive sl-latest-windows-x64.zip -DestinationPath . ;}"
echo "Setting SL authentication parameters!"
$BUILD_SOURCESDIRECTORY\\sl auth --org $ORGID --token $TOKENID
echo %DATE%
echo %TIME%
set datetimef=%date:~-4%_%date:~3,2%_%date:~0,2%__%time:~0,2%_%time:~3,2%_%time:~6,2%
echo %datetimef%
sleep 10
echo "Performing Code Analysis!"
$BUILD_SOURCESDIRECTORY\\sl analyze --app Hello-ShiftLeft-DevOps --cpg --csharp --dotnet-framework --csharp2cpg-args "-l info" "$BUILD_SOURCESDIRECTORY\\WebSite\WebSite.csproj"
sleep 10
echo "Over and out."
