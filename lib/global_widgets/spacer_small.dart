import 'package:flutter/material.dart';

class SpacerSmall extends StatelessWidget {
  const SpacerSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.04,
    );
  }
}
