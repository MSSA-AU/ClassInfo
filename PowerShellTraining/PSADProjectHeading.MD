# PowerShell Projects

```PowerShell
# Make sure all of the challenges are running in Windows PowerShell 5.1
# To check this type the next line into the PowerShell console
$PSVersionTable

# If this command shows the PSVersion to be a later
# version than 5.1 (for example 7.3.5), type the next commans 
# to start Windows PowerShell 7
powershell.exe
```

## What is required

- You need to run these projects within the **"AZ-040T00 Automating Administration with Windows PowerShell "** Lab
- You need to create a new PowerShell module per project
- You need to make the modules load automatically when you go to launch the function that you have built
- You need to make sure that there is Comment-Based-Help provided for each of the functions
- You need to complete at least on of these projects today.

## Hints

- Get-Command 
  - This will help you find the command you need based on its name of module
- Get-Help
  - This will help you discover how to execute the command you have found and which parameters are included in this command
- Get-Member 
  - This will show you what was the output of a command
- Where-Object 
  - This will only show objects that fit a criteria
- ForEach or Foreach-Object 
  - These will help you perform some actions against each of the objects in an array
- if   
  - Will allow code to execute only if a condition is $true

## Links to the Projects

[Go to Project 1](PSADProject1.md#create-new-users-in-active-directory-from-a-csv-file)<br>
[Go to Project 2](PSADProject2.md#restore-an-accidently-deleted-ad-user-account-from-the-recycle-bin)<br>
[Go to Project 3](PSADProject3.md#find-all-direct-and-indirect-groups-an-ad-user-is-a-member-of)<br>
[Go to Project 4](PSADProject4.md#disable-ad-users)<br>

## Links to the Game Challenges
[Go to Game Project 1](PSGameChallenge1.md)<br>
[Go to Game Project 2](PSGameChallenge2.md)<br>

