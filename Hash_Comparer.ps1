# Hash Comparer Script
# By: Akvile Kiskis
# Date: 08/04/2019
#
# The purpose of this script is to compare a downloaded file hash to the one listed on their website to ensure integrity.

###### List all functions first ######

# Function to get file name
Function Get-FileName
{
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.InitialDirectory = "C:\Users\%USERPROFILE%\Downloads"
    $OpenFileDialog.ShowDialog() | Out-Null
    $OpenFileDialog.FileName
 }

# Function to show the hash options
function Show-Menu
{
     param (
           [string]$Title = 'Hash Selection Menu'
     )
     cls
     Write-Host "================ $Title ================"
     
     Write-Host "1: Press '1' for MD5."
     Write-Host "2: Press '2' for SHA1."
     Write-Host "3: Press '3' for SHA256."
     Write-Host "4: Press '4' for SHA384."
     Write-Host "5: Press '5' for SHA512."
     Write-Host "6: Press '6' to exit the program."
}

# Function to compare hashes
function Compare-Hashes ($Algorithm)
{
    $fileHash = Get-FileHash $filePath -Algorithm $Algorithm | Select-Object -ExpandProperty Hash
    # Prompt user for the listed file hash they received
    $originalHash = Read-Host -Prompt "Enter the file hash you want to compare this file to: "
    # Display both
    Write-Host "The file hash on your system is: $fileHash"
    Write-Host "What the file hash should be is: $originalHash"

    # compare them
    if ($fileHash -ne $originalHash)
    {
        Write-Warning "The hashes don't match!"
    }
    else
    {
        Write-Host "The hashes match!" -ForegroundColor Green
    }

    # ask if user would like to compare another file or exit
    Write-Host -NoNewline "Would you like to compare another files? (Y/N) "
    $response = Read-Host
    If ( $response -ne "Y" -or $response -ne "y" ) { exit }
}


###### Begin Script ######
 
 # Check the hash - Give them options, let it run on a loop 
do
{
    # Prompt user for the file hash they want to check
     $filePath = Get-FileName 
     
     Show-Menu
     $input = Read-Host "Please make a selection"
     switch ($input)
     {
           '1' {
                $Algorithm = "MD5"
                Compare-Hashes($Algorithm)
           } '2' {
                $Algorithm = "SHA1"
                Compare-Hashes($Algorithm)
           } '3' {
                $Algorithm = "SHA256"
                Compare-Hashes($Algorithm)
           } '4' {
                $Algorithm = "SHA384"
                Compare-Hashes($Algorithm)
           } '5' {
                $Algorithm = "SHA512"
                Compare-Hashes($Algorithm)
           } 
     }
}
until ($input -eq '6')
