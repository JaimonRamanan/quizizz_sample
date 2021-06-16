import 'package:flutter/material.dart';
import 'package:quizizz/onboarding/widgets/animating_widget.dart';

class NestedAnimatedWidget extends StatelessWidget {
  final double height1;
  final double width1;
  final Color color1;
  final double height2;
  final double width2;
  final Color color2;
  final Widget child;
  const NestedAnimatedWidget({
    Key key,
    @required AnimationController controller,
    this.height1,
    this.width1,
    this.color1,
    this.height2,
    this.width2,
    this.color2,
    this.child,
  })  : _controller = controller,
        super(key: key);

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return AnimatingWidget(
      controller: _controller,
      height: height1,
      width: width1,
      color: color1,
      child: AnimatingWidget(
        controller: _controller,
        height: height2,
        width: width2,
        color: color2,
        child: child,
      ),
    );
  }
}
