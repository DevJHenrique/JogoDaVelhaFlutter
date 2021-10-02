import 'package:flutter/material.dart';

const int boardSize = 9;

//Player config
const Color player1Color = Colors.cyan;
const Color player2Color = Colors.cyan;
const String player1Symbol = "X";
const String player2Symbol = "O";

// Game config
const String gameTitle = "Jogo da Velha Flutter";
const String gameTied = "Empatou!";
const String player1Win = "Player 1 won!";
const String player2Win = "Player 2 won!";
const String dialogMessafe = "Press the reset button to start again!";
const String singlePlayerModeLabel = "1 Jogador";
const String multiPlayerModeLabel = "2 Jogadores";
const String resetButtonLabel = "Reiniciar";
const winnerRules = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
  [1, 4, 7],
  [2, 5, 8],
  [3, 6, 9],
  [1, 5, 9],
  [3, 5, 7],
];
