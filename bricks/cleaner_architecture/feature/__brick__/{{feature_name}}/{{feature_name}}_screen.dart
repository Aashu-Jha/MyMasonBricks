import 'package:flutter/material.dart';

class {{feature_name.pascalCase()}}Screen extends StatefulWidget {
  const {{feature_name.pascalCase()}}Screen({super.key});

  @override
  State<{{feature_name.pascalCase()}}Screen> createState() => _{{feature_name.pascalCase()}}ScreenState();
}

class _{{feature_name.pascalCase()}}ScreenState extends State<{{feature_name.pascalCase()}}Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
