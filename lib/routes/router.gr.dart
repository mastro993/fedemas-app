// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../presentation/main_page.dart';
import '../presentation/project_details/project_details_home2work_page.dart';

class Routes {
  static const String mainPage = '/';
  static const String projectDetailsHome2WorkPage =
      '/project-details-home2-work-page';
  static const all = <String>{
    mainPage,
    projectDetailsHome2WorkPage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.mainPage, page: MainPage),
    RouteDef(Routes.projectDetailsHome2WorkPage,
        page: ProjectDetailsHome2WorkPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    MainPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => MainPage(),
        settings: data,
      );
    },
    ProjectDetailsHome2WorkPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProjectDetailsHome2WorkPage(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushMainPage() => push<dynamic>(Routes.mainPage);

  Future<dynamic> pushProjectDetailsHome2WorkPage() =>
      push<dynamic>(Routes.projectDetailsHome2WorkPage);
}
