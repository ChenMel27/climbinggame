# Bouldering Climber - GBA Game

## Overview
Bouldering game takes you through various randomly set bouldering routes where the player controls a climber flashing a vertical ascent and they must avoid falling boulders while collecting holds (FROM BOTTOM TO TOP).

## Controls
- **D-Pad Up**: Climber up
- **D-Pad Down**: Climber down
- **D-Pad Left**: Climber left
- **D-Pad Right**: Climber right
- **Start Button**: Pause, Resume the game, See score board

## Game States
- **Start**: Displays the mountain with title. Press **Start** to begin climbing.
- **Game**: Control the climber, collect holds, and avoid boulders.
- **Pause**: Pause the game. Press **Start** to resume.
- **Level Up**: Displays a message when the player successfully wins a round. This
is identical to the win state but named differently because there is no "winning".
- **Lose**: Shows animation of the climber falling when hit by a boulder.
- **Scoreboard**: Shows the current score and high score.

## How to Play
1. Press **Start** on the start screen to begin.
2. Use the*D-Pad to move the climber.
3. Collect holds in order from bottom to top to level up.
4. Avoid falling boulders—if hit, the game ends.
5. Collect all holds to reach the next level.
6. The game continues until the player loses, then the **Scoreboard** is displayed.

## Extra Credit Implemented
1. **Game Objects Image Switching**
   - The **climber changes images** when they reach they are one hold away from levelling up.
   - `drawClimber()` -> game.c

2. **Non-GAME Animation (3+ Frames)**
   - In the **Lose state**, the climber has a **falling animation**
   - `lose()` -> main.c

3. **Persistent High Score + Scoreboard State**
   - The **high score persists** after losing and restarting.
   - There is a **Scoreboard state** that shows `score` and `highScore`.
   - `scoreboard()` -> main.c

## PLEASE READ
- **No Win State**: The "win" state is called level up.
- **Basic Graphics**: I wanted to improve the graphics but wanted to get the functionaliy down first.
- **Future Improvements**:
- Show the grades of the boulder and keep increasing
- Draw adam ondra
- Make an outdoor climbing version
- Make it top rope / lead