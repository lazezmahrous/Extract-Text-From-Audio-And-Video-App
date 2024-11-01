import 'dart:io';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        exit(0);
        // logic
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HomePage'),
        ),
        body: Column(
          children: [
            Container(),
          ],
        ),
      ),
    );
  }
}
