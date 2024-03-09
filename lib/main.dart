import 'package:auto_route/auto_route.dart';
import 'package:chron/app_theme/custom_app_theme.dart';
import 'package:chron/auth/bloc/auth_redirect_bloc.dart';
import 'package:chron/firebase/firebase_options.dart';
import 'package:chron/repositories/auth_repository.dart';
import 'package:chron/router/router.dart';
import 'package:chron/router/router.gr.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  sl.registerSingleton<AuthRepository>(AuthRepository());
  runApp(BlocProvider(
    create: (_) => AuthRedirectBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AuthRedirectBloc>().state;
    return MaterialApp.router(
      theme: CustomTheme.lightThemeData(context),
      darkTheme: CustomTheme.darkThemeData(),
      routerDelegate: AutoRouterDelegate.declarative(
        _appRouter,
        routes: (_) => [
          if (state is Initial || state is Loading) const SplashRoute(),
          if (state is Unauthenticated) const SignInRoute(),
          if (state is Authenticated) const HomeRoute(),
          if (state is Error) const SignInRoute(),
        ],
      ),
    );
  }
}
