import 'package:auto_route/auto_route.dart';
import 'package:chron/chron/home_screens/bloc/user_data_bloc.dart';
import 'package:chron/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AppWrapperPage extends StatelessWidget implements AutoRouteWrapper {
  const AppWrapperPage({required this.currentUserData, super.key});

  final UserData currentUserData;

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserDataBloc(currentUserData: currentUserData),
        ),
      ],
      child: this,
    );
  }
}
