import 'package:cloud_home/screens/home.dart';
import 'package:cloud_home/screens/iot.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class cuaca extends StatefulWidget {
  @override
  _CuacaState createState() => _CuacaState();
}

class _CuacaState extends State<cuaca> {
  String _city = 'Jember';
  double? _temperature;
  int? _humidity;
  String? _weatherDescription;

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  Future<void> _fetchWeather() async {
    const apiKey = 'YOUR_OPENWEATHER_API_KEY';
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$_city&units=metric&appid=$apiKey');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _temperature = data['main']['temp'];
        _humidity = data['main']['humidity'];
        _weatherDescription = data['weather'][0]['description'];
      });
    } else {
      setState(() {
        _weatherDescription = "Failed to load weather data";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'CloudHome',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
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
              'Kec. Sumbersari, $_city',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue[800],
              child: _temperature != null && _humidity != null
                  ? WeatherCard(
                      time: 'Current',
                      temperature: '${_temperature!.toStringAsFixed(1)}° C',
                      humidity: '$_humidity%',
                      description: _weatherDescription!,
                    )
                  : Center(
                      child: CircularProgressIndicator(),
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
              icon: Image.asset('assets/images/iot 1.png', height: 24),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          iotscreen()), // Update the target screen class
                );
              },
            ),
            IconButton(
              icon: Image.asset('assets/images/home (3) 1.png', height: 24),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Beranda()), // Update the target screen class
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
  final String description;

  WeatherCard({
    required this.time,
    required this.temperature,
    required this.humidity,
    required this.description,
  });

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(time, style: TextStyle(color: Colors.white, fontSize: 16)),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.cloud, color: Colors.white, size: 20),
              SizedBox(width: 8),
              Text(temperature,
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
          Text('Humidity: $humidity',
              style: TextStyle(color: Colors.white, fontSize: 16)),
          Text('Description: $description',
              style: TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }
}

class IoTScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("IoT Screen")),
      body: Center(child: Text("IoT Screen")),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Center(child: Text("Home Screen")),
    );
  }
}
