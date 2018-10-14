#!/bin/bash
echo "Downloading ShiftLeft Agent!"
curl -O https://www.shiftleft.io/download/sl-latest-windows-x64.zip
echo "Extracting Shiftleft Agent!"
powershell -Command "& {Expand-Archive sl-latest-windows-x64.zip -DestinationPath . ;}"
echo "Setting SL authentication parameters!"
$BUILD_SOURCESDIRECTORY\\sl auth --org $ORGID --token $TOKENID
echo $ShiftLeftAppName
sleep 10
echo "Performing Code Analysis!"
$BUILD_SOURCESDIRECTORY\\sl analyze --app Hello-ShiftLeft-$BUILD_BUILDID --cpg --csharp --dotnet-framework --csharp2cpg-args "-l info" "$BUILD_SOURCESDIRECTORY\\WebSite\WebSite.csproj"
sleep 10
echo "Over and out."
