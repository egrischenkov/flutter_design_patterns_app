import 'package:flutter/material.dart';

import '../i_file.dart';

class Directory extends StatelessWidget implements IFile {
  final String title;
  final bool isInitiallyExpanded;

  final files = <IFile>[];

  Directory({
    required this.title,
    this.isInitiallyExpanded = false,
  });

  void addFile(IFile file) {
    files.add(file);
  }

  @override
  int getSize() {
    var sum = 0;
    files.forEach((file) {
      sum +=  file.getSize();
    });
    return sum;
  }

  @override
  Widget render(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      leading: Icon(Icons.folder),
      
      children: files.map((file) => file.render(context)).toList(),
      initiallyExpanded: isInitiallyExpanded,
    );
  }

  @override
  Widget build(BuildContext context) {
    return render(context);
  }
}
