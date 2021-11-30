/*
Copyright (c) 2019 Mangirdas Kazlauskas

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

import '../../composite/file_size_converter.dart';
import '../file_structure_widgets/directory.dart';
import '../files/audio_file.dart';
import '../files/image_file.dart';
import '../files/text_file.dart';
import '../files/video_file.dart';
import '../formatting_extension.dart';
import '../i_visitor.dart';

class HumanReadableVisitor implements IVisitor {
  @override
  String getTitle() {
    return 'Export as text';
  }

  @override
  String visitAudioFile(AudioFile audioFile) {
    final fileInfo = <String, String> {
      'Type': 'Audio',
      'Album': audioFile.albumTitle,
      'Extension': audioFile.fileExtension,
      'Size': FileSizeConverter.bytesToString(audioFile.getSize()),
    };

    return _formatFile(audioFile.title, fileInfo);
  }

  @override
  String visitDirectory(Directory directory) {
    var directoryText = '';

    for (var file in directory.files) {
      directoryText += '${file.accept(this)}';
    }

    return directoryText;
  }

  @override
  String visitImageFile(ImageFile imageFile) {
    final fileInfo = <String, String> {
      'Type': 'Image',
      'Resolution': imageFile.resolution,
      'Extension': imageFile.fileExtension,
      'Size': FileSizeConverter.bytesToString(imageFile.getSize()),
    };

    return _formatFile(imageFile.title, fileInfo);
  }

  @override
  String visitTextFile(TextFile textFile) {
    final fileContentPreview = textFile.content.length > 30
        ? '${textFile.content.substring(0, 30)}...'
        : textFile.content;

    final fileInfo = <String, String> {
      'Type': 'Text',
      'Preview': fileContentPreview,
      'Extension': textFile.fileExtension,
      'Size': FileSizeConverter.bytesToString(textFile.getSize()),
    };

    return _formatFile(textFile.title, fileInfo);
  }

  @override
  String visitVideoFile(VideoFile videoFile) {
    final fileInfo = <String, String>{
      'Type': 'Video',
      'Directed by': videoFile.directedBy,
      'Extension': videoFile.fileExtension,
      'Size': FileSizeConverter.bytesToString(videoFile.getSize()),
    };

    return _formatFile(videoFile.title, fileInfo);
  }

  String _formatFile(String title, Map<String, String> fileInfo) {
    var formattedFile = '$title: \n';

    for (var entry in fileInfo.entries) {
      formattedFile += '${entry.key}: ${entry.value}'.indentAndAddNewLine(2);
    }

    return formattedFile;
  }
} 