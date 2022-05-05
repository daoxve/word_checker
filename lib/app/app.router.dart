// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../core/exports/exports.dart';

class Routes {
  static const String mainView = '/';
  static const String homeView = '/home-view';
  static const String settingsView = '/settings-view';
  static const String changeThemeView = '/change-theme-view';
  static const String addThemeView = '/add-theme-view';
  static const String adjustTextfieldFontView = '/adjust-textfield-font-view';
  static const all = <String>{
    mainView,
    homeView,
    settingsView,
    changeThemeView,
    addThemeView,
    adjustTextfieldFontView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.mainView, page: MainView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.settingsView, page: SettingsView),
    RouteDef(Routes.changeThemeView, page: ChangeThemeView),
    RouteDef(Routes.addThemeView, page: AddThemeView),
    RouteDef(Routes.adjustTextfieldFontView, page: AdjustTextfieldFontView),
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
    ChangeThemeView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const ChangeThemeView(),
        settings: data,
      );
    },
    AddThemeView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const AddThemeView(),
        settings: data,
      );
    },
    AdjustTextfieldFontView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const AdjustTextfieldFontView(),
        settings: data,
      );
    },
  };
}
