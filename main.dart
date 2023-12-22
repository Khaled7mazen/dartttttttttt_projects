// Import  library for i/o operations.
import 'dart:io';

import 'tictack_game.dart';

void main() {
  TicTacGame ticTacgame = TicTacGame();
  bool gameEnded = false;
  
for (; !gameEnded; ) {
  print('Player ${ticTacgame.currentPlayer}, enter your move (1-9):');

  // Reading player input from the console and parsing it as an integer or as a null
  int? userInput = int.tryParse(stdin.readLineSync() ?? '');

  if (userInput != null) {
    gameEnded = ticTacgame.move(userInput);
  } else {
    print('Invalid input');
  }
}
//Asking the player if they want to play again
  print('Do you want to play again? (yes/no)');
  bool playAgain = stdin.readLineSync()?.toLowerCase() == 'yes';

  if (playAgain) {
    //if the user wants to play again
    main();
  } else {
   // if the user chooses not to play again
    print('Thx ');  
  }
}

