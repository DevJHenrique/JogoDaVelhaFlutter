import 'dart:math';

import '../controllers/game_controller.dart';
import '../models/board_tile_model.dart';
import 'constants.dart';

class GameIA {
  final controller = GameController();
  List<BoardTileModel>? currentBoard;
  int currentPlayer = 0;

  int initialize(List<BoardTileModel> board, PlayerType player) {
    currentBoard = copyBoard(board);
    currentPlayer = player.index;
    var result = bestMove();
    return result;
  }

  int bestMove() {
    List<int> emptyTiles = controller.seachEmptyTiles(currentBoard!);
    if (emptyTiles.isEmpty) {
      return -1;
    }
    int bestScore = 0;
    double best = double.negativeInfinity;
    // ignore: unused_local_variable
    String playerSymbol;
    int score = -1;

    if (currentPlayer == 0) {
      playerSymbol = player1Symbol;
    } else {
      playerSymbol = player2Symbol;
    }
    for (var i = 0; i < emptyTiles.length; i++) {
      List<BoardTileModel> result = copyBoard(currentBoard!);
      result = simulateMove(emptyTiles[i] - 1, result, player: currentPlayer);
      WinnerType winner = checkBoardResult(result);
      if (winner != WinnerType.none) {
        score = 100;
      }
      result = simulateMove(emptyTiles[i] - 1, result,
          player: currentPlayer == 1 ? 0 : 1);
      winner = checkBoardResult(result);
      if (winner != WinnerType.none) {
        score = 10;
      }
      if (score > best) {
        best = max(score.toDouble(), best);
        bestScore = emptyTiles[i];
      }
    }

    if (best == -1) {
      bestScore = emptyTiles[Random().nextInt(emptyTiles.length - 1)];
    }
    return bestScore;
  }

  List<BoardTileModel> simulateMove(int index, List<BoardTileModel> board,
      {int player = 1}) {
    String playerSymbol = player == 0 ? player1Symbol : player2Symbol;
    List<BoardTileModel> result =
        markBoardTileByIndex(index, board, playerSymbol);

    return result;
  }

  List<BoardTileModel> copyBoard(List<BoardTileModel> board) {
    List<BoardTileModel> newBoard = [];
    for (var i = 0; i < board.length; i++) {
      newBoard.add(board[i].copyWith());
    }
    return newBoard;
  }

  List<BoardTileModel> markBoardTileByIndex(
      int index, List<BoardTileModel> board, String playerSymbol) {
    board[index].symbol =
        playerSymbol == player1Symbol ? player1Symbol : player2Symbol;
    board[index].enable = false;
    return board;
  }

  WinnerType checkBoardResult(List<BoardTileModel> board) {
    List<String> listBoard = [];
    for (var item in board) {
      listBoard.add(item.symbol);
    }

    WinnerType winner = WinnerType.none;
    bool player1Won = false;
    // ignore: unused_local_variable
    bool player2Won = false;
    List<int> emptyTiles = controller.seachEmptyTiles(board);

    if (emptyTiles.isEmpty) {
      winner = WinnerType.draw;
      return winner;
    }
    for (var item in winnerRules) {
      if (!player1Won) {
        player1Won = listBoard[item[0] - 1].contains('X') &&
            listBoard[item[1] - 1].contains('X') &&
            listBoard[item[2] - 1].contains('X');
      }
      if (!player2Won) {
        player2Won = listBoard[item[0] - 1].contains('O') &&
            listBoard[item[1] - 1].contains('O') &&
            listBoard[item[2] - 1].contains('O');
      }
    }
    if (player1Won) {
      winner = WinnerType.player1;
    }
    if (player2Won) {
      winner = WinnerType.player2;
    }
    return winner;
  }
}
