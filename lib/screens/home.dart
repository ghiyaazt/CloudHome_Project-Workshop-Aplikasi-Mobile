import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'control_screen.dart';
import 'iot.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  bool isClotheslineOn = false;

  void _toggleClothesline() {
    setState(() {
      isClotheslineOn = !isClotheslineOn;
    });
  }

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
            Text(
              'Selamat Siang, User',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Icon(
                    FontAwesomeIcons.cloudSun,
                    size: 60,
                    color: Colors.orange,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '17° C',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('6%'),
                      Text('90%'),
                      Text('19 km/h'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: _toggleClothesline,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: isClotheslineOn ? Colors.red : Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/power (1) 2.png', // Replace with your image asset path
                  width: 60,  // Adjust as needed
                  height: 60,
                  color: Colors.white, // Optional: apply color tint if desired
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'CLOTHSLINE',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
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
                // Home action
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
}
