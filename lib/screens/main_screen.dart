import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  static const String route = 'main_screen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(
        'Hello world!',
        style: TextStyle(color: Colors.red, fontSize: 150.0),
      ),
    );
  }
}
