import 'package:flutter/material.dart';
import 'clothsline_menu.dart';
import 'home.dart';
import 'suhudankelembapan.dart';
import 'control_screen.dart'; // Ensure this is the correct import path for your Weather page

class iotscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo1 2.png', height: 40),
            SizedBox(width: 10),
            Text('CloudHome',
                style: TextStyle(fontSize: 24, color: Colors.black)),
          ],
        ),
        actions: [SizedBox(width: 48)],
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
  void _onItemTapped(int index) {
    setState(() {});

    // Navigate to the corresponding page based on index
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Beranda()), // Home page
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => cuaca()), // Weather page
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Device',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildDeviceButton('CLOTHSLINE', 'assets/images/drying 2.png'),
            _buildDeviceButton(
                'TEMPERATURE AND HUMIDITY', 'assets/images/humidity (1) 1.png'),
            _buildDeviceButton(
                'LED CONTROL', 'assets/images/light-bulb (1) 1.png'),
            SizedBox(height: 20),
            Text(
              'Notification',
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
      // Custom Bottom Navigation Bar
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Image.asset('assets/images/iot 1.png', height: 24),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => iotscreen()),
                );
              },
            ),
            IconButton(
              icon: Image.asset('assets/images/home (3) 1.png', height: 24),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Beranda()),
                );
              },
            ),
            IconButton(
              icon: Image.asset('assets/images/snowing 2.png', height: 24),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => cuaca()),
                );
              },
            ),
          ],
        ),
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        icon:
            Image.asset(imagePath, width: 24, height: 24, color: Colors.white),
        label: Text(label, style: TextStyle(color: Colors.white)),
        onPressed: () {
          if (label == 'CLOTHSLINE') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => menujemuran()),
            );
          } else if (label == 'TEMPERATURE AND HUMIDITY') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => suhudankelembaban()),
            );
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
