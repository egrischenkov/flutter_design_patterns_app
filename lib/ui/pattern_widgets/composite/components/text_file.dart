import 'package:flutter/material.dart';
import 'file.dart';

class TextFile extends File {
  TextFile(String title, int size)
      : super(
          title: title,
          size: size,
          iconData: Icons.text_fields,
        );
}
