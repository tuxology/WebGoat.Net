#!/bin/bash
echo "Downloading ShiftLeft Agent!"
curl -O https://www.shiftleft.io/download/sl-latest-windows-x64.zip
echo "Extracting Shiftleft Agent!"
powershell -Command "& {Expand-Archive sl-latest-windows-x64.zip -DestinationPath . ;}"
echo "Setting SL authentication parameters!"
$BUILD_SOURCESDIRECTORY\\sl auth --org $ORGID --token $TOKENID
set month=%date:~4,2%
if "%month:~0,1%" == " " set month=0%month:~1,1%
echo month=%month%
set day=%date:~0,2%
if "%day:~0,1%" == " " set day=0%day:~1,1%
echo day=%day%
set datetimef=%year%%month%%day%_%hour%%min%%secs%
echo datetimef=%datetimef%
sleep 10
echo "Performing Code Analysis!"
$BUILD_SOURCESDIRECTORY\\sl analyze --app Hello-ShiftLeft-DevOps --cpg --csharp --dotnet-framework --csharp2cpg-args "-l info" "$BUILD_SOURCESDIRECTORY\\WebSite\WebSite.csproj"
sleep 10
echo "Over and out."
