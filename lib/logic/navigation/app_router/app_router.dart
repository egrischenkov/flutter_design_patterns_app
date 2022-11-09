import 'package:auto_route/annotations.dart';

import '../../../ui/pages/category_page_state.dart';
import '../../../ui/pages/details_page_state.dart';
import '../../../ui/pages/favorite_page_state.dart';
import '../../../ui/pages/init_page_state.dart';
import '../../../ui/pages/language_page_state.dart';
import '../../../ui/pages/main_page_state.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: InitPageState, initial: true),
    AutoRoute(page: MainPageState),
    AutoRoute(page: CategoryPageState),
    AutoRoute(page: FavoritePageState),
    AutoRoute(page: LanguagePageState),
    AutoRoute(page: DetailsPageState),
  ],
)
class $AppRouter {}
