import 'package:flutter/material.dart';
import 'home.dart';
import 'iot.dart';

void main() {
  runApp(menujemuran());
}

class menujemuran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CloudHome',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isOn = false;
  int _selectedIndex = 1;

  void togglePower() {
    setState(() {
      isOn = !isOn;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cloud, color: Colors.white, size: 30),
            SizedBox(width: 8),
            Text(
              'CloudHome',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[700]!, Colors.blue[200]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'CLOTHSLINE',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: togglePower,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: isOn ? Colors.green : Colors.red,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/power (1) 2.png', // Path ke gambar power button
                      width: 80,
                      height: 80,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    isOn ? 'ON' : 'OFF',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 0) {
            // Navigasi ke layar IoT
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => iotscreen()),
            );
          } else if (index == 1) {
            // Navigasi ke layar Home
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Beranda()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/iot 1.png'),
            ), // Gambar ikon untuk IoT
            label: 'IoT',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/home (3) 1.png'),
            ), // Gambar ikon untuk Home
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/snowing 2.png'),
            ), // Gambar ikon untuk Cuaca
            label: 'Cuaca',
          ),
        ],
      ),
    );
  }
}