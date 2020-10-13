import 'package:auto_route/auto_route_annotations.dart';
import 'package:fedemas_app/presentation/main_page.dart';
import 'package:fedemas_app/presentation/project_details/project_details_home2work_page.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    MaterialRoute(page: MainPage, initial: true),
    MaterialRoute(page: ProjectDetailsHome2WorkPage),
  ],
)
class $Router {}
