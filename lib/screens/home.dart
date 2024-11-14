import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'control_screen.dart';
import 'iot.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  bool isClotheslineOn = false;
  double? temperature;
  int? humidity;
  double? windSpeed;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _fetchWeather();
    _startWeatherUpdate();
  }

  // Update the weather every 10 seconds (for demonstration purposes)
  void _startWeatherUpdate() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _fetchWeather();
    });
  }

  Future<void> _fetchWeather() async {
    const apiKey = '791dc787731644ce486fc4fe66969735';
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=Jember&units=metric&appid=791dc787731644ce486fc4fe66969735');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        temperature = data['main']['temp'];
        humidity = data['main']['humidity'];
        windSpeed = data['wind']['speed'];
      });
    } else {
      print("Failed to load weather data");
    }
  }

  void _toggleClothesline() {
    setState(() {
      isClotheslineOn = !isClotheslineOn;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CloudHome', style: TextStyle(fontSize: 24)),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/logo1 1.png'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            Text(
              'Selamat Siang, User',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue[400]!, Colors.blue[200]!],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    FontAwesomeIcons.cloudSun,
                    size: 60,
                    color: Colors.orange,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${temperature?.toStringAsFixed(1) ?? "--"}° C',
                    style: TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('${humidity ?? "--"}%', style: TextStyle(color: Colors.white)),
                      Text('${windSpeed?.toStringAsFixed(1) ?? "--"} km/h', style: TextStyle(color: Colors.white)),
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      'CLOTHSLINE',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: isClotheslineOn ? Colors.red : Colors.blue[900],
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/power (1) 2.png',
                        width: 50,
                        height: 50,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
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
              onPressed: () {},
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
      backgroundColor: Colors.blue[800],
    );
  }
}
