import 'package:flutter/material.dart';

class SpacerMedium extends StatelessWidget {
  const SpacerMedium({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
    );
  }
}
