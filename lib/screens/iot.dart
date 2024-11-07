import 'package:cloud_home/screens/suhudankelembapan.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'clothsline_menu.dart';
import 'control_screen.dart';

class iotscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.blue,
      ),
      body: HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatefulWidget {
  @override
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  int _indexTerpilih = 0;

  void _onItemTapped(int index) {
    setState(() {
      _indexTerpilih = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/logo1 2.png'),
        ),
        title: Image.asset('assets/images/cloudhome 2.png', height: 40),
        actions: [
          SizedBox(width: 48),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Tambah Perangkat',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildDeviceButton('CLOTHSLINE', 'assets/images/drying 2.png'),
            _buildDeviceButton('TEMPERATUR DAN KELEMBABAN',
                'assets/images/humidity (1) 1.png'),
            _buildDeviceButton(
                'KONTROL LED', 'assets/images/light-bulb (1) 1.png'),
            SizedBox(height: 20),
            Text(
              'Notifikasi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildNotificationCard(
              'CLOTHSLINE',
              'Hujan turun! Jemuran anda telah diamankan secara otomatis',
              'assets/images/rain-sensor (1) 1.png',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexTerpilih,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Beranda()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => cuaca()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/iot 1.png')),
            label: 'IoT',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/home (3) 1.png')),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/snowing 2.png')),
            label: 'Cuaca',
          ),
        ],
      ),
    );
  }

  Widget _buildDeviceButton(String label, String imagePath) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15),
          backgroundColor: Colors.blue[700],
        ),
        icon: Image.asset(imagePath, width: 24, height: 24, color: Colors.white),
        label: Text(label, style: TextStyle(color: Colors.white)),
        onPressed: () {
          if (label == 'CLOTHSLINE') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => menujemuran()),
            );
          } else if (label == 'TEMPERATUR DAN KELEMBABAN') {
            // Navigasi ke suhu dan kelembapan
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => suhudankelembaban()),
            );
          } else {
            // Tambahkan navigasi atau aksi lain sesuai kebutuhan
          }
        },
      ),
    );
  }

  Widget _buildNotificationCard(
      String title, String message, String imagePath) {
    return Card(
      color: Colors.grey[200],
      child: ListTile(
        leading: Image.asset(imagePath, width: 40, height: 40),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(message),
      ),
    );
  }
}
