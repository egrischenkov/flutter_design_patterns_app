import 'package:auto_route/annotations.dart';

import '../../../ui/pages/category_page.dart';
import '../../../ui/pages/details_page.dart';
import '../../../ui/pages/favorite_page.dart';
import '../../../ui/pages/init_page.dart';
import '../../../ui/pages/language_page.dart';
import '../../../ui/pages/main_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: InitPage, initial: true),
    AutoRoute(page: MainPage),
    AutoRoute(page: CategoryPage),
    AutoRoute(page: FavoritePage),
    AutoRoute(page: LanguagePage),
    AutoRoute(page: DetailsPage),
  ],
)
class $AppRouter {}
