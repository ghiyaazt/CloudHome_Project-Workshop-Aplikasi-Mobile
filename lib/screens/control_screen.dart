import 'package:flutter/material.dart';
import 'home.dart';
import 'iot.dart';

void main() {
  runApp(cuaca());
}

class cuaca extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('CloudHome',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            padding: EdgeInsets.all(8),
            child: Text(
              'Kec. Sumbersari',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue[800],
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return WeatherCard(
                    time: '${19 + index}.00',
                    temperature: '${26 - index}° C',
                    humidity: '${16 + index}%',
                  );
                },
              ),
            ),
          ),
        ],
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

class WeatherCard extends StatelessWidget {
  final String time;
  final String temperature;
  final String humidity;

  WeatherCard(
      {required this.time, required this.temperature, required this.humidity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue[700],
        border: Border(
          bottom: BorderSide(color: Colors.blue[900]!),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(time, style: TextStyle(color: Colors.white, fontSize: 16)),
          Row(
            children: [
              Icon(Icons.cloud, color: Colors.white, size: 20),
              SizedBox(width: 8),
              Text(temperature,
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
          Text(humidity, style: TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }
}

// Dummy screen for IoT
class IoTScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("IoT Screen")),
      body: Center(child: Text("This is the IoT screen")),
    );
  }
}
