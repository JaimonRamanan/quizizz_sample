import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  final Function() onTap;
  const PlayButton({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        Icons.pause,
        color: Colors.white,
      ),
    );
  }
}