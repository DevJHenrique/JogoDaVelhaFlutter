import 'package:flutter/material.dart';
import '../controllers/menu_game_controller.dart';
import '../widgets/game_button_widget.dart';
import '../widgets/game_logo_widget.dart';

class MenuGamePage extends StatelessWidget {
  const MenuGamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final controller = MenuGameController();
    return Scaffold(
      backgroundColor: Colors.cyan[300],
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const GameLogoWidget(),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'JOGO DA VELHA',
              style: TextStyle(color: Colors.white70, fontSize: 24),
            ),
            const SizedBox(
              height: 80,
            ),
            GameButtonWidget(
                text: '1 Jogador',
                onPressed: () {
                  controller.navigateTo(context, true);
                }),
            const SizedBox(
              height: 20,
            ),
            GameButtonWidget(
                text: '2 Jogadores',
                onPressed: () {
                  controller.navigateTo(context, false);
                }),
          ],
        ),
      ),
    );
  }
}
