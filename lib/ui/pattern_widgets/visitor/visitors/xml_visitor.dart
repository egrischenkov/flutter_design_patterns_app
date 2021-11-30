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

class XmlVisitor extends IVisitor {
  @override
  String getTitle() {
    return 'Export as XML';
  }

  @override
  String visitAudioFile(AudioFile audioFile) {
    final fileInfo = <String, String>{
      'title': audioFile.title,
      'album': audioFile.albumTitle,
      'extension': audioFile.fileExtension,
      'size': FileSizeConverter.bytesToString(audioFile.getSize()),
    };

    return _formatFile('audio', fileInfo);
  }

  @override
  String visitDirectory(Directory directory) {
    final isRootDirectory = directory.level == 0;

    var directoryText = isRootDirectory ? '<files>\n' : '';

    for (var file in directory.files) {
      directoryText += '${file.accept(this)}';
    }

    return isRootDirectory ? '$directoryText</files>\n' : directoryText;
  }

  @override
  String visitImageFile(ImageFile imageFile) {
    final fileInfo = <String, String>{
      'title': imageFile.title,
      'resolution': imageFile.resolution,
      'extension': imageFile.fileExtension,
      'size': FileSizeConverter.bytesToString(imageFile.getSize()),
    };

    return _formatFile('image', fileInfo);
  }

  @override
  String visitTextFile(TextFile textFile) {
    final fileContentPreview = textFile.content.length > 30
        ? '${textFile.content.substring(0, 30)}...'
        : textFile.content;

    final fileInfo = <String, String>{
      'title': textFile.title,
      'preview': fileContentPreview,
      'extension': textFile.fileExtension,
      'size': FileSizeConverter.bytesToString(textFile.getSize()),
    };

    return _formatFile('text', fileInfo);
  }

  @override
  String visitVideoFile(VideoFile videoFile) {
    final fileInfo = <String, String>{
      'title': videoFile.title,
      'directed_by': videoFile.directedBy,
      'extension': videoFile.fileExtension,
      'size': FileSizeConverter.bytesToString(videoFile.getSize()),
    };

    return _formatFile('video', fileInfo);
  }

  String _formatFile(String type, Map<String, String> fileInfo) {
    var formattedFile = '<$type>'.indentAndAddNewLine(2);

    for (var entry in fileInfo.entries) {
      formattedFile += '<${entry.key}>${entry.value}</${entry.key}>'.indentAndAddNewLine(4);
    }

    formattedFile += '<$type>'.indentAndAddNewLine(2);

    return formattedFile;
  }
}