import 'package:auto_route/auto_route.dart';
import 'package:chron/app_init/splash_bloc.dart';
import 'package:chron/auth/bloc/auth_redirect_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

@RoutePage()
class SplashScreen extends StatelessWidget implements AutoRouteWrapper {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashFinished) {
          context.read<AuthRedirectBloc>().add(RedirectUser());
        }
      },
      child: Scaffold(
        body: Center(
          child: LoadingAnimationWidget.dotsTriangle(
              color: Theme.of(context).primaryColor, size: 50),
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc()..add(StartBeforeAppChecks()),
      child: this,
    );
  }
}
