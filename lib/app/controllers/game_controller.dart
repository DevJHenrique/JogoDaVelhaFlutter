import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jogo_da_velha_flutter/app/core/constants.dart';
import 'package:jogo_da_velha_flutter/app/core/game_ia.dart';
import 'package:jogo_da_velha_flutter/app/models/board_tile_model.dart';
import 'package:jogo_da_velha_flutter/app/widgets/game_dialog.dart';

enum PlayerType { player1, player2 }
enum WinnerType { none, player1, player2, draw }

class GameController {
  List<BoardTileModel> board = [];
  PlayerType currentPlayer = PlayerType.player1;
  bool? isSinglePlayer;
  WinnerType winner = WinnerType.none;

  List<BoardTileModel> generateBoard() {
    board = List<BoardTileModel>.generate(
      boardSize,
      (index) => BoardTileModel(id: index + 1),
    );
    currentPlayer = PlayerType.player1;
    winner = WinnerType.none;
    return board;
  }

  Future? checkBoardResult(
    List<BoardTileModel> board,
    BuildContext context,
  ) {
    List<String> listBoard = [];
    for (var item in board) {
      listBoard.add(item.symbol);
    }

    bool player1Won = false;
    // ignore: unused_local_variable
    bool player2Won = false;
    List<int> emptyTiles = seachEmptyTiles(board);

    if (emptyTiles.isEmpty) {
      winner = WinnerType.draw;
      return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => GameDialog(
          title: gameTied,
          isSinglePlayer: isSinglePlayer!,
        ),
      );
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
      return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => GameDialog(
          title: player1Win,
          isSinglePlayer: isSinglePlayer!,
        ),
      );
    }
    if (player2Won) {
      winner = WinnerType.player2;
      winner = WinnerType.player1;
      return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => GameDialog(
          title: player2Win,
          isSinglePlayer: isSinglePlayer!,
        ),
      );
    }
  }

  List<int> seachEmptyTiles(List<BoardTileModel> board) {
    List<int> emptyTiles = [];
    for (var i = 0; i < boardSize; i++) {
      if (board[i].enable) {
        emptyTiles.add(board[i].id);
      }
    }
    return emptyTiles;
  }

  void onTapTile(int index, BuildContext context) {
    if (board[index].enable) {
      int emptyTiles = seachEmptyTiles(board).length;
      markBoardTileByIndex(index);
      checkBoardResult(board, context);

      if (isSinglePlayer!) {
        if (emptyTiles < 8 && emptyTiles > 1) {
          var result = GameIA().initialize(board, currentPlayer);
          markBoardTileByIndex(result - 1);
          checkBoardResult(board, context);
        }
        if (emptyTiles > 8) {
          var random = Random();
          var index = random.nextInt(seachEmptyTiles(board).length - 1);
          markBoardTileByIndex(index);
        }
      }
    }
  }

  void markBoardTileByIndex(index) {
    final tile = board[index];
    _markBoardTileWithPlayer(tile, currentPlayer);
    tile.enable = false;
  }

  void _markBoardTileWithPlayer(BoardTileModel tile, PlayerType player) {
    if (player == PlayerType.player1) {
      tile.symbol = player1Symbol;
      tile.color = player1Color;
      currentPlayer = PlayerType.player2;
    } else {
      tile.symbol = player2Symbol;
      tile.color = player2Color;
      currentPlayer = PlayerType.player1;
    }
  }

  // Widget showWinnerDialog() {
  //   return GameDialog();
  // }
}
