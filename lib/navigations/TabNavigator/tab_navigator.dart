import 'package:flutter/material.dart';
import 'package:spotfy_ui_clone/components/tabItem.dart';
import 'package:spotfy_ui_clone/navigations/TabNavigatorRoutes/tab_navigator_routes.dart';
import 'package:spotfy_ui_clone/views/Home/home.dart';
import 'package:spotfy_ui_clone/views/library.dart';
import 'package:spotfy_ui_clone/views/profile.dart';
import 'package:spotfy_ui_clone/views/search.dart';

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  const TabNavigator({
    super.key,
    required this.navigatorKey,
    required this.tabItem,
  });

  Map<String, WidgetBuilder> _screenRoutes(
    BuildContext context,
  ) {
    return {
      TabNavigatorRoutes.home: ((context) => const HomeView()),
      TabNavigatorRoutes.search: ((context) => const SearchView()),
      TabNavigatorRoutes.library: ((context) => const LibraryView()),
      TabNavigatorRoutes.profile: ((context) => const ProfileView()),
    };
  }

  @override
  Widget build(BuildContext context) {
    final screenRoutes = _screenRoutes(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.home,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => screenRoutes[routeSettings.name]!(context),
        );
      },
    );
  }
}
