import 'package:flutter/material.dart';

import 'i_visitor.dart';

abstract class IFile {
  int getSize();
  Widget render(BuildContext context);
  String accept(IVisitor visitor);
}