import 'package:flutter/material.dart';
import 'file.dart';

class ImageFile extends File {
  ImageFile(String title, int size)
      : super(
          title: title,
          size: size,
          iconData: Icons.image,
        );
}
