import 'package:flutter/material.dart';

class GameButtonWidget extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const GameButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 200,
      child: ElevatedButton(
        style: ButtonStyle(elevation: MaterialStateProperty.all(1)),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white70, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
