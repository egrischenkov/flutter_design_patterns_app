import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../entity/design_pattern.dart';
import '../../entity/repository/markdown_repository.dart';
import 'platform_progress_indicator.dart';

class MarkdownWidget extends StatelessWidget {
  final _markdownRepository = MarkdownRepository();
  final DesignPattern designPattern;

  MarkdownWidget({required this.designPattern});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _markdownRepository.get(designPattern.id),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  bottom: 16,
                ),
                child: Markdown(
                  data: snapshot.data! as String,
                  selectable: true,
                  styleSheet:
                      MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                    code: TextStyle(
                      backgroundColor: Colors.grey,
                    ),
                    codeblockDecoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              )
            : PlatformProgressIndicator();
      },
    );
  }
}
