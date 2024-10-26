#!/bin/bash

projectName="Realm"
projectPath="/mnt/c/Users/i43909/repos-docs/pbesra-gh/New folder/projects/backend-basic-template"

# ------------------ Start prepare project -------------------------------
echo "Renaming sub projects ..."
subProjects=(
    "src/app.ApplicationCore"
    "src/$projectName.ApplicationCore/app.ApplicationCore.csproj"
    
    "src/app.Domain"
    "src/$projectName.Domain/app.Domain.csproj"
    
    "src/app.Persistence"
    "src/$projectName.Persistence/app.Persistence.csproj"
)

for item in "${subProjects[@]}"; do
    newName="${item//app./$projectName.}"
    mv "$projectPath/$item" "$projectPath/$newName"
done

echo "Renaming sub projects completed."

echo "Get sln content..."
# Read the contents of the .sln file
slnfileContent=$(cat "$projectPath/app.sln")

# Replace 'app' with the project name
slnfileContent="${slnfileContent//app./$projectName.}"

echo "Deleting sln file..."
rm "$projectPath/app.sln"

echo "Creating sln file..."
echo "$slnfileContent" > "$projectPath/app.sln"

echo "Renaming sln to $projectName.sln file..."
mv "$projectPath/app.sln" "$projectPath/$projectName.sln"

echo "Renaming project to $projectName file..."
mv "$projectPath" "$(dirname "$projectPath")/$projectName"

echo "Project prepare completed."

