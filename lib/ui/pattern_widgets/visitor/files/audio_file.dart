import 'package:flutter/material.dart';

import '../file_structure_widgets/file.dart';
import '../i_visitor.dart';

class AudioFile extends File {
  final String albumTitle;

  const AudioFile(String title, this.albumTitle, String fileExtension, int size)
      : super(title, fileExtension, size, Icons.music_note);
  @override
  String accept(IVisitor visitor) {
    return visitor.visitAudioFile(this);
  }
}