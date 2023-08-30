# PowerShell Game solutions

## MasterMind Solution

```PowerShell
# MasterMind Game
Clear-Host
# Choose 4 random numbers from 1 through 6
$HiddenNumbers = 1..6 | Get-Random -Count 4
$Turns = 0
[System.Collections.ArrayList]$Tries = @()
do {
  $WrongPos = 0
  $RightPos = 0
  # Make sure the player types 4 unique numbers ranging from 1 to 6
  do {
    [int[]]$Guess = (Read-Host -Prompt 'Enter 4 numbers 1-6 with commas to separate').split(',')
    $Guess = $Guess | Select-Object -Unique
    $HighestNumber = ($Guess | Sort-Object -Descending)[0] 
  } until ($Guess.count -eq 4 -and $HighestNumber -le 6 )
  # Test for write and wrong positions
  foreach ($Index in 0..3) {
    if ($Guess[$Index] -eq $HiddenNumbers[$Index]) {$RightPos++}
    elseif ($Guess[$Index] -in $HiddenNumbers) {$WrongPos++}
  }
  $Hash = @{
    GuessArray = $Guess
    Right      = $RightPos
    Wrong      = $WrongPos
  }
  $Tries.Add($Hash)
  # Display all of the tries so far
  Clear-Host 
  foreach ($Try in $Tries) {
    Write-Host -ForegroundColor Yellow "$($Try.GuessArray) " -NoNewline 
    Write-Host -ForegroundColor Cyan "- RP $($Try.Right)  WP $($Try.Wrong) " 
  }
  $Turns++
} until ($RightPos -eq 4 -or $Turns -eq 12)
Write-Host 
# Determine if player wins or not
if ($Turns -eq 12 -and $RightPos -ne 4) {"Player loses"}
else {"Player wins"}
```
# Connect Four Game Solution 

```PowerShell
# Connect 4 Game
# This game has 6 columns in which two players drop a token into a column to make four of the same color in a row
function Show-Game {
  Param($fnGame)
  #Clear-Host
  $Cols = 0..5
  $Rows = 0..5
  Write-Host '1  2  3  4  5  6'
  Write-Host '----------------'

  foreach ($Col in $Cols) {
    foreach ($Row in $Rows) {
      write-host "$($fnGame[$Row][$Col])  " -NoNewline
    }
    Write-Host
  }
}

function Test-Winner {
  Param ($fnGame)
  foreach ($Col in $fnGame) {
    $OXList = ($Col | Where-Object {$_ -ne '-'}) -join ''
    if ($OXList -match 'XXXX') {return 'X'}
    elseif ($OXList -match 'OOOO') {return 'O'}
  }
  foreach ($Row in @(0,1,2,3,4,5)) {
    $OXList = ($fnGame[0][$Row],$fnGame[1][$Row],$fnGame[2][$Row],$fnGame[3][$Row],$fnGame[4][$Row],$fnGame[5][$Row] | Where-Object {$_ -ne '-'}) -join ''
    if ($OXList -match 'XXXX') {return 'X'}
    elseif ($OXList -match 'OOOO') {return 'O'}    
  }
  $OXList = ($fnGame[3][0],$fnGame[2][1],$fnGame[1][2],$fnGame[0][3] | Where-Object {$_ -ne '-'}) -join ''
  if ($OXList -match 'XXXX') {return 'X'}
  elseif ($OXList -match 'OOOO') {return 'O'}     
  $OXList = ($fnGame[4][0],$fnGame[3][1],$fnGame[2][2],$fnGame[1][3],$fnGame[0][4] | Where-Object {$_ -ne '-'}) -join ''
  if ($OXList -match 'XXXX') {return 'X'}
  elseif ($OXList -match 'OOOO') {return 'O'}  
  $OXList = ($fnGame[5][0],$fnGame[4][1],$fnGame[3][2],$fnGame[2][3],$fnGame[1][4],$fnGame[0][5] | Where-Object {$_ -ne '-'}) -join ''
  if ($OXList -match 'XXXX') {return 'X'}
  elseif ($OXList -match 'OOOO') {return 'O'}  
  $OXList = ($fnGame[5][1],$fnGame[4][2],$fnGame[3][3],$fnGame[2][4],$fnGame[1][5] | Where-Object {$_ -ne '-'}) -join ''
  if ($OXList -match 'XXXX') {return 'X'}
  elseif ($OXList -match 'OOOO') {return 'O'}  
  $OXList = ($fnGame[5][2],$fnGame[4][3],$fnGame[3][4],$fnGame[2][5] | Where-Object {$_ -ne '-'}) -join ''
  if ($OXList -match 'XXXX') {return 'X'}
  elseif ($OXList -match 'OOOO') {return 'O'}  

  $OXList = ($fnGame[0][2],$fnGame[1][3],$fnGame[2][4],$fnGame[3][5] | Where-Object {$_ -ne '-'}) -join ''
  if ($OXList -match 'XXXX') {return 'X'}
  elseif ($OXList -match 'OOOO') {return 'O'}     
  $OXList = ($fnGame[0][1],$fnGame[1][2],$fnGame[2][3],$fnGame[3][4],$fnGame[4][5] | Where-Object {$_ -ne '-'}) -join ''
  if ($OXList -match 'XXXX') {return 'X'}
  elseif ($OXList -match 'OOOO') {return 'O'}  
  $OXList = ($fnGame[0][0],$fnGame[1][1],$fnGame[2][2],$fnGame[3][3],$fnGame[4][4],$fnGame[5][5] | Where-Object {$_ -ne '-'}) -join ''
  if ($OXList -match 'XXXX') {return 'X'}
  elseif ($OXList -match 'OOOO') {return 'O'}  
  $OXList = ($fnGame[1][0],$fnGame[2][1],$fnGame[3][2],$fnGame[4][3],$fnGame[5][4] | Where-Object {$_ -ne '-'}) -join ''
  if ($OXList -match 'XXXX') {return 'X'}
  elseif ($OXList -match 'OOOO') {return 'O'}  
  $OXList = ($fnGame[2][0],$fnGame[3][1],$fnGame[4][2],$fnGame[5][3] | Where-Object {$_ -ne '-'}) -join ''
  if ($OXList -match 'XXXX') {return 'X'}
  elseif ($OXList -match 'OOOO') {return 'O'}  
  return '-'
}
  

[array]$Game =  [System.Collections.ArrayList]('-','-','-','-','-','-'),
                [System.Collections.ArrayList]('-','-','-','-','-','-'),
                [System.Collections.ArrayList]('-','-','-','-','-','-'),
                [System.Collections.ArrayList]('-','-','-','-','-','-'),
                [System.Collections.ArrayList]('-','-','-','-','-','-'),
                [System.Collections.ArrayList]('-','-','-','-','-','-')


$WinResult = '-'
$GameOver = $false
$PlayerMark = 'X'
do {
  Show-Game -fnGame $Game
  do {
    $Choice = Read-Host -Prompt "Choose a column, Player: $PlayerMark"
    if ($Choice -match '^[1-6]$') {
      $ColNumChosen = ($Choice -as [int]) - 1
      $ColPosAvailable = $Game[$ColNumChosen] | Where-Object {$_ -eq '-'}
      if ($ColPosAvailable.Count -eq 0) {$GoodChoice = $false} 
      else {$GoodChoice = $true}
    }
    else {$GoodChoice = $false}
  } until ($GoodChoice -eq $true)
  $NextPosAvailable = $ColPosAvailable.Count - 1
  $Game[$ColNumChosen][$NextPosAvailable] = $PlayerMark
  $WinResult = Test-Winner -fnGame $Game
  if ($WinResult -ne '-') {
    $GameOver = $true
    break
  }
  if ($PlayerMark -eq 'X') {$PlayerMark = 'O'}
  else {$PlayerMark = 'X'}
} until ($GameOver)
Show-Game -fnGame $Game
"Winner is $WinResult"


```


[Go back to Game Challenge 1](PSGameChallenge1.md)
