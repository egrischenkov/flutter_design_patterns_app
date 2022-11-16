import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../locale_model.dart';
import '../../logic/extensions/context_extensions.dart';
import '../../utils/app_colors.dart';
import '../../utils/const.dart';
import '../base_page.dart';

class LanguagePage extends BasePage {
  final localeStrings = <String>[enLocaleName, ruLocaleName];
  @override
  String? getTitle(BuildContext context) => context.localizations.language;

  @override
  bool isCurvedAppBar() => false;

  Color? backgroundColor() => languageScreenBackgroundColor;

  @override
  Widget buildBody(BuildContext context) {
    final localeModel = context.read<LocaleModel>();
    final currentLocale = Localizations.localeOf(context);
    var indexOfCurrentLocale = context.supportedLocales.indexOf(currentLocale);

    return Container(
      color: languageScreenBackgroundColor,
      child: ListView.builder(
        itemCount: context.supportedLocales.length,
        itemBuilder: (context, index) {
          return RadioListTile(
            title: Text(localeStrings[index]),
            value: index,
            groupValue: indexOfCurrentLocale,
            activeColor: activeRadioColor,
            selected: index == indexOfCurrentLocale,
            onChanged: (_) async {
              localeModel.setLocale(context, context.supportedLocales[index]);
            },
          );
        },
      ),
    );
  }

  void load(Locale locale) {
    final name = locale.countryCode?.isEmpty ?? false ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    Intl.defaultLocale = localeName;
  }
}
