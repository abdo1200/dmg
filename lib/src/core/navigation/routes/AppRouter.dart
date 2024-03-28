import 'package:auto_route/auto_route.dart';

import 'AppRouter.gr.dart';

//
// @MaterialAutoRouter(
//   replaceInRouteName: 'Page,Route',
//   routes: <AutoRoute>[
//  ]
// )
// class $AppRouter {}

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeContainer.page, initial: true, children: [
          CustomRoute(page: HomeRoute.page, initial: true),
        ]),
      ];
}
