import 'package:flutter/cupertino.dart';

class MenuGameController {
  void navigateTo(BuildContext context, bool isSinglePlayer) {
    Navigator.pushNamed(context, '/game', arguments: isSinglePlayer);
  }
}
