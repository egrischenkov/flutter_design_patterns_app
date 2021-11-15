import 'package:flutter/material.dart';
import '../../../widgets/vertical_space.dart';

class Box extends StatelessWidget {
  final int nodeId;
  final Color color;
  final Widget? child;

  const Box({
    required this.nodeId,
    required this.color,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Text(
              nodeId.toString(),
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.black),
            ),
            VerticalSpace(16),
            if (child != null) child!,
          ],
        ),
      ),
    );
  }
}
