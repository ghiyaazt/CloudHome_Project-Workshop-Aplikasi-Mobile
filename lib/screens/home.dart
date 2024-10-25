import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Untuk ikon cuaca

void main() => runApp(CloudHomeApp());

class CloudHomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Beranda(),
    );
  }
}

class Beranda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CloudHome'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Bagian salam dan tanggal
            Text(
              'Selamat Siang, User',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Bagian cuaca hari ini
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    'Cuaca Hari ini',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '24 September 2024',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  // Ikon cuaca (kamu bisa menyesuaikan sesuai kebutuhan)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(FontAwesomeIcons.sun, size: 40, color: Colors.orange),
                      Icon(FontAwesomeIcons.cloud, size: 40, color: Colors.grey),
                      Icon(FontAwesomeIcons.cloudRain, size: 40, color: Colors.blue),
                      Icon(FontAwesomeIcons.snowflake, size: 40, color: Colors.lightBlue),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Bagian suhu dan kelembaban
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _infoCard('Suhu', '-'),
                _infoCard('Kelembaban', '-'),
              ],
            ),
            SizedBox(height: 30),
            // Bagian CLOTHSLINE
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    // Add the image here
                    Image.asset(
                      'assets/images/power (1) 2.png',
                      height: 150,  // You can adjust the size
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Tambahkan aksi tombol di sini
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      child: Text(
                        'CLOTHSLINE',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'Cuaca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
      ),
    );
  }

  // Widget untuk menampilkan kartu informasi suhu dan kelembaban
  Widget _infoCard(String title, String value) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
