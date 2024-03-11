import 'package:auto_route/auto_route.dart';
import 'package:chron/auth/bloc/auth_redirect_bloc.dart';
import 'package:chron/global_widgets/global_widgets.dart';
import 'package:chron/main.dart';
import 'package:chron/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/chron_logo.png',
                  height: 200,
                  width: 200,
                ),
                const SpacerSmall(),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    filled: true,
                    labelText: 'Email',
                  ),
                  controller: emailController,
                ),
                const SpacerTiny(),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    filled: true,
                    labelText: 'Password',
                  ),
                  controller: passwordController,
                ),
                const SpacerTiny(),
                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (value) async {
                        setState(() {
                          rememberMe = value!;
                        });
                      },
                    ),
                    Text(
                      'Remember me',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                const SpacerTiny(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: FilledButton.tonal(
                    onPressed: () async {
                      final auth = sl<AuthRepository>();
                      final redirectBloc = context.read<AuthRedirectBloc>();
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool('remember_me', rememberMe);
                      await auth.signUp(
                          emailController.text, passwordController.text);
                      redirectBloc.add(RedirectUser());
                    },
                    child: const Text('Sign Up'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
