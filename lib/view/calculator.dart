import 'package:calculator/widget/operations.dart';
import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Calculator', style: TextStyle(color: Colors.blue)),
        backgroundColor: Colors.grey.shade200,
        centerTitle: true,
      ),
      body: Operations(),
    );
  }
}
