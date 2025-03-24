import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userName = Provider.of<String>(context);

    return Scaffold(
      appBar: AppBar(title: Text('FutureProvider Example')),
      body: Center(
        child: Text(
          'User: $userName',
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}
