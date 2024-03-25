// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:chron/app_init/loading_screen.dart' as _i5;
import 'package:chron/app_init/splash_screen.dart' as _i10;
import 'package:chron/auth/auth_wrapper.dart' as _i2;
import 'package:chron/auth/ui/sign_in_screen.dart' as _i8;
import 'package:chron/auth/ui/sign_up_screen.dart' as _i9;
import 'package:chron/chron/app_wrapper/app_wrapper.dart' as _i1;
import 'package:chron/chron/home_screens/ui/calendar_screen.dart' as _i3;
import 'package:chron/chron/home_screens/ui/home_screen.dart' as _i4;
import 'package:chron/chron/home_screens/ui/projects_screen.dart' as _i6;
import 'package:chron/chron/home_screens/ui/settings_screen.dart' as _i7;
import 'package:chron/models/user.dart' as _i12;
import 'package:flutter/material.dart' as _i13;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    AppWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<AppWrapperRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(
            child: _i1.AppWrapperPage(
          currentUserData: args.currentUserData,
          key: args.key,
        )),
      );
    },
    AuthWrapperRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AuthWrapperScreen(),
      );
    },
    CalendarRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CalendarPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
    LoadingRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LoadingPage(),
      );
    },
    ProjectsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ProjectsPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SettingsPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SignInScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SignUpScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(child: const _i10.SplashScreen()),
      );
    },
  };
}

/// generated route for
/// [_i1.AppWrapperPage]
class AppWrapperRoute extends _i11.PageRouteInfo<AppWrapperRouteArgs> {
  AppWrapperRoute({
    required _i12.UserData currentUserData,
    _i13.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          AppWrapperRoute.name,
          args: AppWrapperRouteArgs(
            currentUserData: currentUserData,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AppWrapperRoute';

  static const _i11.PageInfo<AppWrapperRouteArgs> page =
      _i11.PageInfo<AppWrapperRouteArgs>(name);
}

class AppWrapperRouteArgs {
  const AppWrapperRouteArgs({
    required this.currentUserData,
    this.key,
  });

  final _i12.UserData currentUserData;

  final _i13.Key? key;

  @override
  String toString() {
    return 'AppWrapperRouteArgs{currentUserData: $currentUserData, key: $key}';
  }
}

/// generated route for
/// [_i2.AuthWrapperScreen]
class AuthWrapperRoute extends _i11.PageRouteInfo<void> {
  const AuthWrapperRoute({List<_i11.PageRouteInfo>? children})
      : super(
          AuthWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthWrapperRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CalendarPage]
class CalendarRoute extends _i11.PageRouteInfo<void> {
  const CalendarRoute({List<_i11.PageRouteInfo>? children})
      : super(
          CalendarRoute.name,
          initialChildren: children,
        );

  static const String name = 'CalendarRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoadingPage]
class LoadingRoute extends _i11.PageRouteInfo<void> {
  const LoadingRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoadingRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ProjectsPage]
class ProjectsRoute extends _i11.PageRouteInfo<void> {
  const ProjectsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ProjectsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProjectsRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SettingsPage]
class SettingsRoute extends _i11.PageRouteInfo<void> {
  const SettingsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SignInScreen]
class SignInRoute extends _i11.PageRouteInfo<void> {
  const SignInRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SignUpScreen]
class SignUpRoute extends _i11.PageRouteInfo<void> {
  const SignUpRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SplashScreen]
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
