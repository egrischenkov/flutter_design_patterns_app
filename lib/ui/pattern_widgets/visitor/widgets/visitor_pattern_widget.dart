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

import 'package:flutter/material.dart';

import '../../../widgets/common_elevated_button.dart';
import '../../../widgets/vertical_space.dart';
import '../file_structure_widgets/directory.dart';
import '../files/audio_file.dart';
import '../files/image_file.dart';
import '../files/text_file.dart';
import '../files/video_file.dart';
import '../i_file.dart';
import '../i_visitor.dart';
import '../visitors/human_readable_visitor.dart';
import '../visitors/xml_visitor.dart';
import 'files_dialog.dart';
import 'files_visitor_selection.dart';

class VisitorPatternWidget extends StatefulWidget {
  const VisitorPatternWidget({Key? key}) : super(key: key);

  @override
  _VisitorPatternWidgetState createState() => _VisitorPatternWidgetState();
}

class _VisitorPatternWidgetState extends State<VisitorPatternWidget> {
  final List<IVisitor> visitorsList = [
    HumanReadableVisitor(),
    XmlVisitor(),
  ];

  late IFile _rootDirectory;
  int _selectedVisitorIndex = 0;

  @override
  void initState() {
    super.initState();

    _rootDirectory = _buildMediaDirectory();
  }

  IFile _buildMediaDirectory() {
    var musicDirectory = Directory(
      title: 'Music',
      level: 1,
    );
    musicDirectory.addFile(
      AudioFile('Darude - sandstorm', 'Before the storm', 'mp3', 2612453),
    );
    musicDirectory.addFile(
      AudioFile('Toto - Africa', 'Toto IV', 'mp3', 3219811),
    );
    musicDirectory.addFile(
      AudioFile('Bag Raiders - Shooting Stars', 'Bag Raiders', 'mp3', 38112114),
    );

    var moviesDirectory = Directory(
      title: 'Movies',
      level: 1,
    );
    moviesDirectory.addFile(
      VideoFile('The Matrix', 'The Wachowskis', 'avi', 951495532),
    );
    moviesDirectory.addFile(
      VideoFile('Pulp Fiction', 'Quentin Tarantino', 'mp4', 1251495532),
    );

    var catPicturesDirectory = Directory(
      title: 'Cats',
      level: 2,
    );
    catPicturesDirectory.addFile(
      ImageFile('Cat 1', '640x480px', 'jpg', 844497),
    );
    catPicturesDirectory.addFile(
      ImageFile('Cat 2', '1280x720px', 'jpg', 975363),
    );
    catPicturesDirectory.addFile(
      ImageFile('Cat 3', '1920x1080px', 'jpg', 975363),
    );

    var picturesDirectory = Directory(
      title: 'Pictures',
      level: 1,
    );
    picturesDirectory.addFile(catPicturesDirectory);
    picturesDirectory.addFile(
      ImageFile('Not a cat', '2560x1440px', 'png', 2971361),
    );

    var mediaDirectory = Directory(
      title: 'Media',
      level: 0,
    );
    mediaDirectory.addFile(musicDirectory);
    mediaDirectory.addFile(moviesDirectory);
    mediaDirectory.addFile(picturesDirectory);
    mediaDirectory.addFile(
      Directory(
        title: 'New Folder',
        level: 1,
      ),
    );
    mediaDirectory.addFile(
      TextFile(
        'Nothing suspicious there',
        'Just a noraml text file without any sensitive information',
        'txt',
        430791,
      ),
    );
    mediaDirectory.addFile(
      TextFile(
        'TeamTrees',
        'Team Trees also known as #teamtrees, some more info text.',
        'txt',
        1042,
      ),
    );

    return mediaDirectory;
  }

  void _setSelectedVisitorIndex(int? index) {
    setState(() {
      _selectedVisitorIndex = index ?? 0;
    });
  }

  void _showFilesDialog() {
    var selectedVisitor = visitorsList[_selectedVisitorIndex];
    var filesText = _rootDirectory.accept(selectedVisitor);

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => FilesDialog(
        filesText: filesText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          FilesVisitorSelection(
            visitorsList: visitorsList,
            selectedIndex: _selectedVisitorIndex,
            onChanged: _setSelectedVisitorIndex,
          ),
          CommonElevatedButton(
            title: 'Export files',
            onTap: _showFilesDialog,
          ),
          VerticalSpace(16),
          _rootDirectory.render(context),
        ],
      ),
    );
  }
}
