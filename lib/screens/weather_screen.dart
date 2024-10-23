import 'package:flutter/material.dart';

class LayarCuaca extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cuaca Hari Ini"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wb_sunny, size: 100, color: Colors.orange),
            SizedBox(height: 20),
            Text(
              "Cuaca Cerah",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Suhu: 25°C",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              "Lokasi: Jakarta", // Tambahkan teks untuk lokasi
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
