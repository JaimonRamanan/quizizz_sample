import 'dart:math';

import 'package:flutter/widgets.dart';

class AnimatingWidget extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final Widget child;
  const AnimatingWidget({
    Key key,
    @required AnimationController controller,
    this.height,
    this.width,
    this.color,
    this.child,
  })  : _controller = controller,
        super(key: key);

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: SizedBox(
        height: height,
        width: width,
        child: AnimatedBuilder(
          animation: _controller.view,
          builder: (context, child) {
            return Transform.rotate(
                angle: _controller.value * 2 * pi,
                origin: Offset(-18, 10),
                child: child);
          },
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(125.0),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
