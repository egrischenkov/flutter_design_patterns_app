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
