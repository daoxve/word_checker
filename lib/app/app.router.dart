// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../exports.dart';
import '../ui/views/change_themes/change_themes_view.dart';

class Routes {
  static const String mainView = '/';
  static const String homeView = '/home-view';
  static const String settingsView = '/settings-view';
  static const String changeThemesView = '/change-themes-view';
  static const all = <String>{
    mainView,
    homeView,
    settingsView,
    changeThemesView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.mainView, page: MainView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.settingsView, page: SettingsView),
    RouteDef(Routes.changeThemesView, page: ChangeThemesView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    MainView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const MainView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    SettingsView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const SettingsView(),
        settings: data,
      );
    },
    ChangeThemesView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const ChangeThemesView(),
        settings: data,
      );
    },
  };
}
