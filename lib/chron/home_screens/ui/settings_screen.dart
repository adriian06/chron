import 'package:auto_route/auto_route.dart';
import 'package:chron/auth/bloc/auth_redirect_bloc.dart';
import 'package:chron/chron/home_screens/bloc/user_data_bloc.dart';
import 'package:chron/main.dart';
import 'package:chron/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('User logat:'),
        const SizedBox(height: 10),
        BlocBuilder<UserDataBloc, UserDataState>(builder: (context, state) {
          return Text(
              '${state.currentUserData.email} ${state.currentUserData.createdAt.toString()} ${state.currentUserData.id}');
        }),
        FilledButton(
            onPressed: () async {
              final auth = sl<AuthRepository>();
              final redirectBloc = context.read<AuthRedirectBloc>();
              final prefs = await SharedPreferences.getInstance();
              prefs.remove('remember_me');
              await auth.signOut();
              redirectBloc.add(RedirectUser());
            },
            child: const Text('Sign Out')),
      ],
    ));
  }
}
