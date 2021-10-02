import 'package:flutter/material.dart';
import 'package:jogo_da_velha_flutter/app/controllers/game_controller.dart';
import 'package:jogo_da_velha_flutter/app/core/constants.dart';
import 'package:jogo_da_velha_flutter/app/models/board_tile_model.dart';
import 'package:jogo_da_velha_flutter/app/widgets/board_widget.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<BoardTileModel> board = [];
  final controller = GameController();

  @override
  void initState() {
    board = controller.generateBoard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isSinglePlayer = ModalRoute.of(context)!.settings.arguments as bool;
    controller.isSinglePlayer = isSinglePlayer;
    return Scaffold(
        bottomSheet: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 40,
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)))),
            child: const Text(
              resetButtonLabel,
              style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
            onPressed: () {
              Navigator.of(context)
                  .popAndPushNamed('/game', arguments: isSinglePlayer);
            },
          ),
        ),
        backgroundColor: Colors.cyan[300],
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  TextButton.icon(
                    onPressed: Navigator.of(context).pop,
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.black87,
                    ),
                    label: const Text(
                      'Voltar',
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: BoardWidget(
                  controller: controller,
                  onTap: (index) {
                    setState(() {
                      controller.onTapTile(index, context);
                    });
                  },
                  board: board,
                ),
              ),
            ],
          ),
        ));
  }
}
