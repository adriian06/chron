import 'package:auto_route/auto_route.dart';
import 'package:chron/auth/bloc/auth_redirect_bloc.dart';
import 'package:chron/main.dart';
import 'package:chron/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: const Text('Home Screen'),
          onTap: () async {
            final auth = sl<AuthRepository>();
            final redirectBloc = context.read<AuthRedirectBloc>();
            final prefs = await SharedPreferences.getInstance();
            prefs.remove('remember_me');
            await auth.signOut();
            redirectBloc.add(RedirectUser());
          },
        ),
      ),
    );
  }
}
