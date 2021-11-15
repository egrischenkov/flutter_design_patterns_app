import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class HeartAnimatedWidget extends StatefulWidget {

  @override
  _HeartAnimatedWidgetState createState() => _HeartAnimatedWidgetState();
}

class _HeartAnimatedWidgetState extends State<HeartAnimatedWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    )..repeat(reverse: true);
    _sizeAnimation = Tween<double>(begin: 1.15, end: 1.3).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
        reverseCurve: Curves.elasticIn,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _sizeAnimation,
      child: SizedBox(
        height: 40,
        child: FittedBox(
          child: Icon(
            Icons.favorite_border,
            color: heartIconColor,
          ),
        ),
      ),
    );
  }
}
