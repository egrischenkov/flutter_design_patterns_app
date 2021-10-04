import 'package:flutter/material.dart';

import 'file.dart';

class AudioFile extends File {
  AudioFile(String title, int size)
      : super(
          title: title,
          size: size,
          iconData: Icons.music_note,
        );
}
