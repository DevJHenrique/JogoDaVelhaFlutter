import 'package:flutter/material.dart';
import '../core/constants.dart';
import 'game_logo_widget.dart';

class GameDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final bool isSinglePlayer;
  const GameDialog(
      {Key? key, this.title, this.content, required this.isSinglePlayer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size =
        MediaQuery.of(context).size.height > MediaQuery.of(context).size.width
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.height;
    // ignore: prefer_const_constructors
    return Dialog(
      elevation: 1,
      backgroundColor: Colors.cyan[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: size,
        height: size,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
                const GameLogoWidget(),
                const SizedBox(height: 20),
                Text(
                  title!,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 30),
                ),
              ],
            ),
            Text(
              content ?? 'Pressione reiniciar para jogar novamente',
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  Navigator.of(context)
                      .popAndPushNamed('/game', arguments: isSinglePlayer);
                },
                child: const Text(
                  resetButtonLabel,
                  style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
