import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'views/menu_game_page.dart';
import 'views/game_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MaterialApp(
      title: 'Jogo da Velha Flutter',
      theme:
          ThemeData(primaryColor: Colors.cyan[300], primarySwatch: Colors.cyan),
      initialRoute: '/',
      routes: {
        '/': (_) => const MenuGamePage(),
        '/game': (_) => const GamePage(),
      },
    );
  }
}
