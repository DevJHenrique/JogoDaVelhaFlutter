import 'package:flutter/material.dart';

class GameLogoWidget extends StatelessWidget {
  const GameLogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(
            text: 'X',
            style: TextStyle(color: Colors.white70, fontSize: 54),
          ),
          TextSpan(
            text: '|',
            style: TextStyle(color: Colors.cyan[800], fontSize: 60),
          ),
          const TextSpan(
            text: 'O',
            style: TextStyle(color: Colors.black87, fontSize: 54),
          ),
        ],
      ),
    );
  }
}
