import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; // Mengimpor LayarLogin dari login_screen.dart

void main() {
  runApp(AplikasiCuaca());
}

class AplikasiCuaca extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayarLogin(), // Menetapkan LayarLogin sebagai halaman awal
    );
  }
}
