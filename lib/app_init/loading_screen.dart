import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

@RoutePage()
class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.dotsTriangle(
            color: Theme.of(context).primaryColor, size: 50),
      ),
    );
  }
}
