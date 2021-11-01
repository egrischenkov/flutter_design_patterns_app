import 'package:flutter/material.dart';
import 'file.dart';

class VideoFile extends File {
  VideoFile(String title, int size)
      : super(
          title: title,
          size: size,
          iconData: Icons.movie,
        );
}
