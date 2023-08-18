// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.username}) : super(key: key);

  final String? username;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hoş Geldin, ${widget.username}"),
      ),
      body: const Center(
        child: Text("HomePage"),
      ),
    );
  }
}
