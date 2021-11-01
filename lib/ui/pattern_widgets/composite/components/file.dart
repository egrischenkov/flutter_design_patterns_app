import 'package:flutter/material.dart';

import '../file_size_converter.dart';
import '../i_file.dart';

class File extends StatelessWidget implements IFile {
  final String title;
  final int size;
  final IconData iconData;

  const File({
    required this.title,
    required this.size,
    required this.iconData,
  });

  @override
  int getSize() => size;

  @override
  Widget render(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(iconData),
      trailing: Text(FileSizeConverter.bytesToString(size)),
      dense: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return render(context);
  }
}
