$projectName = "Realm";
$projectPath = "C:\Users\i43909\repos-docs\pbesra-gh\New folder\projects\backend-basic-template";


# ------------------ Start prepare project -------------------------------
Write-Host "Renaming sub projects ...."
$subProjects = @(
    "src\app.ApplicationCore",
    "src\$projectName.ApplicationCore\app.ApplicationCore.csproj",
    
    "src\app.Domain",
    "src\$projectName.Domain\app.Domain.csproj",
    
    "src\app.Persistence",
    "src\$projectName.Persistence\app.Persistence.csproj"
);

foreach ($item in $subProjects) {
    $newName = $item.Replace('app.', "$projectName.");
    Rename-Item -Path "$projectPath\$item" -NewName "$projectPath\$newName"
}

Write-Host "Renaming sub projects completed."

Write-Host "Get sln content..."
# Read the contents of the .sln file
$slnfileContent = Get-Content -Path "$projectPath\app.sln"

# Replace 'app' with 'testapp'
$slnfileContent = $slnfileContent.Replace("app.", "$projectName.")

Write-Host "Deleting sln file..."
Remove-Item -Path "$projectPath\app.sln"

Write-Host "Creating sln file..."
$slnfileContent | Add-Content -Path "$projectPath\app.sln"

Write-Host "Renaming sln to $projectName.sln file..."
Rename-Item "$projectPath\app.sln" -NewName "$projectPath\$projectName.sln"

Write-Host "Renaming project to $projectName file..."
Rename-Item -Path $projectPath -NewName $projectName

Write-Host "Project prepare completed."