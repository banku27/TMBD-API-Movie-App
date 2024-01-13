import 'package:flutter/material.dart';

class LikedPage extends StatelessWidget {
  const LikedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Oops! You have not saved anything."),
      ),
    );
  }
}
