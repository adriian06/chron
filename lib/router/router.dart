import 'package:auto_route/auto_route.dart';
import 'package:chron/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: AuthWrapperRoute.page, children: [
          AutoRoute(page: SignInRoute.page, initial: true),
          AutoRoute(page: SignUpRoute.page),
        ]),
        AutoRoute(page: HomeRoute.page),
      ];
}
