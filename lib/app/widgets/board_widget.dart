import 'package:flutter/material.dart';

import 'package:jogo_da_velha_flutter/app/controllers/game_controller.dart';
import 'package:jogo_da_velha_flutter/app/models/board_tile_model.dart';

import '../core/constants.dart';

class BoardWidget extends StatelessWidget {
  final void Function(int index) onTap;
  final GameController controller;
  final List<BoardTileModel> board;

  const BoardWidget({
    Key? key,
    required this.onTap,
    required this.controller,
    required this.board,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size =
        MediaQuery.of(context).size.height > MediaQuery.of(context).size.width
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.height;
    return SizedBox(
      height: size * 0.90,
      width: size * 0.90,
      child: GridView.builder(
        itemCount: boardSize,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
        itemBuilder: (context, index) {
          BoardTileModel tile = board[index];
          return GestureDetector(
            onTap: () {
              onTap(index);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: tile.color,
                child: Center(
                  child: Text(
                    tile.symbol,
                    style: TextStyle(
                        fontSize: 72,
                        color: tile.symbol == 'O'
                            ? Colors.black87
                            : Colors.white70),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
