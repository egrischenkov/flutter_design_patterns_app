import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../entity/repository/markdown_repository.dart';
import 'platform_progress_indicator.dart';

class MarkdownWidget extends StatelessWidget {
  final _markdownRepository = MarkdownRepository();
  final String designPatternId;

  MarkdownWidget({required this.designPatternId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _markdownRepository.get(designPatternId),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16,),
              child: Markdown(
                  data: snapshot.data! as String,
                  selectable: true,
                ),
            )
            : PlatformProgressIndicator();
      },
    );
  }
}
