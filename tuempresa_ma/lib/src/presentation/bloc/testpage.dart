import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name =
        (ModalRoute.of(context)!.settings.arguments as Map)["name"].toString();
    print(name);
    return Scaffold(
      appBar: AppBar(title: const Text('Test Page')),
      body: Center(
        child: Text(name),
      ),
    );
  }
}
