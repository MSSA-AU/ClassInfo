# Write a game to simulate the Mastermind board game

| 1 | 4 | 3 | 6 | WrongPlace | CorrectPlace|
|---|---|---|---|:---:|:---:|
|   |   |   |   |   |   |
|   |   |   |   |   |   |
|   |   |   |   |   |   |
|   |   |   |   |   |   |
|   |   |   |   |   |   |
|   |   |   |   |   |   |
|   |   |   |   |   |   |
|   |   |   |   |   |   |
|   |   |   |   |   |   |
|   |   |   |   |   |   |
|   |   |   |   |   |   |
|   |   |   |   |   |   |

### Rules of the game

- The game starts off with a random set of four different numbers from 1, 2, 3, 4, 5, 6
  - These are not shown until the end of the game
- The player chooses 4 numbers one row per turn
- The computer shows how many numbers were:
  - correct but in the wrong position
  - correct in the right position
- The computer cannot tell the player which numbers are correct, only how many of them are the right numbers in the wrong position or right position
- The game ends in one of two ways:
  - The player guesses the correct numbers in the right order, and the player wins
  - The player tries 12 times unsuccessfully to guess the numbers and the player loses
 
### Example

If 3  4   5   1  were the chosen master numbers[...](PSGameSolution.md)

| # | # | # | # | WrongPlace | CorrectPlace| 
|---|---|---|---|:---:|:---:|
| 1 | 5 | 2 | 6 | **2** | **0** |
| 3 | 4 | 1 | 5 | **2** | **2** |
| 3 | 4 | 5 | 1 | **0** | **4** |

### Player Wins

[Game to main Challenge Page](PSADProjectHeading.MD)
