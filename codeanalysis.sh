#!/bin/bash
echo "Downloading ShiftLeft Agent!"
curl -O https://www.shiftleft.io/download/sl-latest-windows-x64.zip
echo "Extracting Shiftleft Agent!"
powershell -Command "& {Expand-Archive sl-latest-windows-x64.zip -DestinationPath . ;}"
echo "Setting SL authentication parameters!"
$BUILD_SOURCESDIRECTORY\\sl auth --org "fcf5e7a2-973f-4cff-b35b-62163909124d" --token "eyJhbGciOiJSUzUxMiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1NTk3Nzc3MDksImlzcyI6IlNoaWZ0TGVmdCIsIm9yZ0lEIjoiZmNmNWU3YTItOTczZi00Y2ZmLWIzNWItNjIxNjM5MDkxMjRkIiwic2NvcGVzIjpbImFwaTp2MiIsInVwbG9hZHM6d3JpdGUiLCJsb2c6d3JpdGUiLCJwaXBlbGluZXN0YXR1czpyZWFkIiwiYmxhY2tsaXN0czpyZWFkIiwicG9saWNpZXM6cmVhZCJdfQ.xcO5m5wi5PhDJ9bpodRXE6HiLdCnM-MJCiZhtR9JiXS-2PH6N_JvF3TK9MoPOy3e8XI64mJuqWXU3IGF2sNFrOBOfS6n7TV6FPBOjEyGIzXA4iiawsY42L4Xs_o7YyTQ7LYDGJzxKYsr2FUGjmk70R5-tzDeAqtgqTD7nr7_42NQNmIIHvUaOAy5X26C89huU5rWWjXeTtlfgvaftNnXW-2Tajys2JCBwTuD0xj4iuTLQ7hEoUdLxVxbdSJrH0xKwlhm-Q9PBj7iBVLd4dw8R5njRO_9aOvnnMwC2AaBUR7Y6G_K8PxNVb8YG4ccV67tuLhvivrxs4asIWNSwaHXxg"
sleep 10
echo "Performing Code Analysis"
$BUILD_SOURCESDIRECTORY\\sl analyze --app Hello-ShiftLeft-App-DevOps --cpg --csharp --dotnet-framework --csharp2cpg-args "-l info" "$BUILD_SOURCESDIRECTORY\\WebSite\WebSite.csproj"
echo "AGENT_WORKFOLDER is $AGENT_WORKFOLDER"
echo "AGENT_WORKFOLDER contents:"
ls -1 $AGENT_WORKFOLDER
echo "AGENT_BUILDDIRECTORY is $AGENT_BUILDDIRECTORY"
echo "AGENT_BUILDDIRECTORY contents:"
ls -1 $AGENT_BUILDDIRECTORY
echo "BUILD_SOURCESDIRECTORY is $BUILD_SOURCESDIRECTORY"
echo "BUILD_SOURCESDIRECTORY contents:"
ls -1 $BUILD_SOURCESDIRECTORY
echo "Over and out."
