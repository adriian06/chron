import 'package:flutter/material.dart';

class SpacerTiny extends StatelessWidget {
  const SpacerTiny({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
    );
  }
}
