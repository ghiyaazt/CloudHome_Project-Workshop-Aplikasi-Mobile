import 'package:flutter/material.dart';

void main() {
  runApp(AplikasiSaya());
}

class AplikasiSaya extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HalamanDashboard(),
    );
  }
}

class HalamanDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CloudHome'),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Selamat Siang, Pengguna',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Card(
              color: Colors.blue[100],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Cuaca Hari ini',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      '24 September 2024',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.wb_sunny, size: 50),
                        Icon(Icons.cloud, size: 50),
                        Icon(Icons.cloud, size: 50),
                        Icon(Icons.wb_cloudy, size: 50),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Container(
                      height: 100,
                      child: Center(
                        child: Text('Suhu'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Container(
                      height: 100,
                      child: Center(
                        child: Text('Kelembaban'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Text('CLOTHSLINE', style: TextStyle(fontSize: 18)),
                  IconButton(
                    icon: Icon(Icons.power_settings_new, size: 50),
                    onPressed: () {
                      // Tambahkan fungsionalitas di sini
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_cloudy),
            label: 'Cuaca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny),
            label: 'Ramalan',
          ),
        ],
      ),
    );
  }
}