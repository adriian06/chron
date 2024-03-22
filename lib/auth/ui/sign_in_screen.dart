import 'package:auto_route/auto_route.dart';
import 'package:chron/auth/bloc/auth_redirect_bloc.dart';
import 'package:chron/global_widgets/global_widgets.dart';
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
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
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
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      labelText: 'Password',
                      filled: true,
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
                        final redirectBloc = context.read<AuthRedirectBloc>();
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setBool('remember_me', rememberMe);
                        await sl<AuthRepository>().signIn(
                            emailController.text, passwordController.text);
                        redirectBloc.add(RedirectUser());
                      },
                      child: const Text('Sign In'),
                    ),
                  ),
                  const SpacerMedium(),
                  TextButton(
                    child: const Text('create account'),
                    onPressed: () {
                      context.router.push(const SignUpRoute());
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
