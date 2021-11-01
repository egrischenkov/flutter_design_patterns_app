import 'package:flutter/widgets.dart';
import '../../../widgets/vertical_space.dart';

class SizedShapeColumn extends StatelessWidget {
  final String label;
  final Widget child;

  const SizedShapeColumn({
    required this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.0,
      child: Column(
        children: <Widget>[
          Text(label, style: TextStyle(fontSize: 18)),
          VerticalSpace(16),
          child,
        ],
      ),
    );
  }
}
