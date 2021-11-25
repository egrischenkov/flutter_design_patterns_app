import 'package:flutter/material.dart';
import 'logic/extensions/context_extensions.dart';

class LocaleModel extends ChangeNotifier {
  Locale? locale;

  void setLocale(BuildContext context, Locale selectedLocale){
    final localeList = context.supportedLocales;
    if(!localeList.contains(selectedLocale)) return;
    locale = selectedLocale;
    print('locale => $locale');
    notifyListeners();
  }
}