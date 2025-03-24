// my_app.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<int>(context);

    return Scaffold(
      appBar: AppBar(title: Text('StreamProvider with Provider')),
      body: Center(
        child: Text(
          'Counter: $counter',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
