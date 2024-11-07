import 'package:flutter/material.dart';
import 'home.dart';
import 'iot.dart';


class cuaca extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('CloudHome',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
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
              icon: Image.asset('assets/images/iot 1.png', height: 24), // Adjust image paths
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
