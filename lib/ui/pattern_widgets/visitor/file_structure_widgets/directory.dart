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
import '../../composite/file_size_converter.dart';
import '../i_file.dart';
import '../i_visitor.dart';

class Directory extends StatelessWidget implements IFile {
  final String title;
  final int level;
  final bool isInitiallyExpanded;

  final _files = <IFile>[];
  List<IFile> get files => _files;

  Directory({
    required this.title,
    required this.level,
    this.isInitiallyExpanded = false,
});

  void addFile(IFile file) {
    _files.add(file);
  }

  @override
  String accept(IVisitor visitor) {
    return visitor.visitDirectory(this);
  }

  @override
  int getSize() {
    var sum = 0;
    _files.forEach((file) => sum += file.getSize());

    return sum;
  }

  @override
  Widget render(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: ExpansionTile(
          leading: Icon(Icons.folder),
          title: Text("$title (${FileSizeConverter.bytesToString(getSize())})"),
          children: _files.map((file) => file.render(context)).toList(),
          initiallyExpanded: isInitiallyExpanded,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return render(context);
  }
}
