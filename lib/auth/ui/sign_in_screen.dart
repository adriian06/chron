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
    return Scaffold(body: body(context));
  }

  Widget btnSign(BuildContext context, Widget child, Function() pressed) {
    return ElevatedButton(onPressed: pressed, child: child);
  }

  Widget customText(String title,
      {double fontSize = 12, FontWeight fontWeight = FontWeight.normal}) {
    return Text(
      title,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
    );
  }

  Widget customTextField(TextEditingController controller, String title) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: title,
      ),
      controller: controller,
    );
  }

  Widget optionField(bool desiredValue) {
    return Row(
      children: [
        Checkbox(
          value: desiredValue,
          onChanged: (value) async {
            setState(() {
              desiredValue = value!;
            });
          },
        ),
        spacer(x: 5),
        customText('Remember me', fontSize: 16)
      ],
    );
  }

  Widget spacer({double x = 0, double y = 0}) {
    return SizedBox(
      width: x,
      height: y,
    );
  }

  Widget body(BuildContext context) {
    return Column(
      children: [
        spacer(y: 20),
        Container(
          height: 60.0,
          width: 60.0,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo-no-background.png'),
              fit: BoxFit.fill,
            ),
            shape: BoxShape.circle,
          ),
        ),
        spacer(y: 20),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: customTextField(emailController, 'Email'),
        ),
        spacer(y: 20),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: customTextField(passwordController, 'Password'),
        ),
        spacer(y: 20),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: optionField(rememberMe),
        ),
        spacer(y: 20),
        ElevatedButton(
          onPressed: () async {
            final redirectBloc = context.read<AuthRedirectBloc>();
            final prefs = await SharedPreferences.getInstance();
            prefs.setBool('remember_me', rememberMe);
            await sl<AuthRepository>()
                .signIn(emailController.text, passwordController.text);
            redirectBloc.add(RedirectUser());
          },
          child: customText('Sign In', fontSize: 18),
        ),
        spacer(y: 20),
        GestureDetector(
          child: customText('create account', fontSize: 14),
          onTap: () {
            context.router.push(const SignUpRoute());
          },
        ),
      ],
    );
  }
}
