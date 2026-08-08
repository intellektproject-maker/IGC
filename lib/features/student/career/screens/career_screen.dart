import 'package:flutter/material.dart';

class CareerScreen extends StatelessWidget {
  const CareerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Career"),
      ),
      body: const Center(
        child: Text(
          "Career Screen",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}