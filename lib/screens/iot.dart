import 'package:flutter/material.dart';

void main() {
  runApp(IotScreen());
}

class IotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IoT Screen'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'Ini adalah layar IoT',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
