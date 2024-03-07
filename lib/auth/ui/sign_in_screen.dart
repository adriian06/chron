import 'package:auto_route/auto_route.dart';
import 'package:chron/auth/bloc/auth_redirect_bloc.dart';
import 'package:chron/main.dart';
import 'package:chron/repositories/auth_repository.dart';
import 'package:chron/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
              },
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          child: const Text('create account'),
          onTap: () {
            context.router.push(const SignUpRoute());
          },
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () async {
            final redirectBloc = context.read<AuthRedirectBloc>();
            final prefs = await SharedPreferences.getInstance();
            prefs.setBool('remember_me', rememberMe);
            await sl<AuthRepository>()
                .signIn(emailController.text, passwordController.text);
            redirectBloc.add(RedirectUser());
          },
          child: const Text('Sign In'),
        ),
      ],
    ));
  }
}
