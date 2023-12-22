class TicTacGame {
  late List<String> board;
  late String currentPlayer;

  TicTacGame() {
    board = List.filled(9, ' ');// Initializes the board with empty spaces
    currentPlayer = 'X';//  the deafult player is player 'X'
  }

    // Prints the current state 
void printBoard() {
    for (var i = 0; i < 9; i += 3) {  
      print('${board[i]} | ${board[i + 1]} | ${board[i + 2]}');
      if (i < 6) print('--+---+--');
    }
  }
  bool move(int position) {
     // Check if the move is valid
    if (position < 1 || position > 9 || board[position - 1] != ' ') {
      print('Invalid move. Please try again.');
      return false;
    }
     // Update the board
    board[position - 1] = currentPlayer;
    printBoard();

     // Check if it's a wins or draw
    if (checkWin()) {
      print('Player $currentPlayer wins!');
      return true;
    } else if (board.every((c) => c != ' ')) {
      print('It\'s a draw!');
      return true;
    } else {
      currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
      return false;
    }
  }

  bool checkWin() {
    for (var i = 0; i < 3; i++) {
        // Check columns
      if (board[i] != ' ' && board[i] == board[i + 3] && board[i] == board[i + 6]) {
        return true; 
      }
       // Check rows
      if (board[i * 3] != ' ' &&board[i * 3] == board[i * 3 + 1] && board[i * 3] == board[i * 3 + 2]) {
        return true; 
      }
    }
      // Check diagonals 1 & 2
    if (board[0] != ' ' && board[0] == board[4] && board[0] == board[8]) {
      return true; 
    }
    if (board[2] != ' ' && board[2] == board[4] && board[2] == board[6]) {
      return true; 
    }
    return false;
  }
}