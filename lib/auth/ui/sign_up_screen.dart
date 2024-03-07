import 'package:auto_route/auto_route.dart';
import 'package:chron/auth/bloc/auth_redirect_bloc.dart';
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
        body: Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Email',
          ),
          controller: emailController,
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
          controller: passwordController,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const Text('remember me'),
            const SizedBox(
              width: 10,
            ),
            Checkbox(
                value: rememberMe,
                onChanged: (value) async {
                  setState(() {
                    rememberMe = value!;
                  });
                }),
          ],
        ),
        ElevatedButton(
          onPressed: () async {
            final auth = sl<AuthRepository>();
            final redirectBloc = context.read<AuthRedirectBloc>();
            final prefs = await SharedPreferences.getInstance();
            prefs.setBool('remember_me', rememberMe);
            await auth.signUp(emailController.text, passwordController.text);
            redirectBloc.add(RedirectUser());
          },
          child: const Text('Sign In'),
        ),
      ],
    ));
  }
}
