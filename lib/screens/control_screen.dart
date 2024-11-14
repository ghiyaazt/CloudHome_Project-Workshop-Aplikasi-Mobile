import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'home.dart';
import 'iot.dart';

class cuaca extends StatefulWidget {
  @override
  _CuacaState createState() => _CuacaState();
}

class _CuacaState extends State<cuaca> {
  String _city = 'Jember';
  List<Map<String, dynamic>> _forecast = [];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _fetchWeather();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(hours: 1), (timer) {
      _fetchWeather();
    });
  }

  Future<void> _fetchWeather() async {
    const apiKey = '791dc787731644ce486fc4fe66969735';
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=Jember&units=metric&appid=791dc787731644ce486fc4fe66969735');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _forecast = List.generate(8, (index) {
          final forecastData = data['list'][index];
          final dateTime = DateTime.parse(forecastData['dt_txt']);
          return {
            "time": "${dateTime.hour.toString().padLeft(2, '0')}:00",
            "temperature": forecastData['main']['temp'].toString(),
            "humidity": forecastData['main']['humidity'].toString(),
            "icon": forecastData['weather'][0]['icon']
          };
        });
      });
    } else {
      setState(() {
        _forecast = [];
      });
    }
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
            child: Column(
              children: [
                Text(
                  'Kec. Sumbersari, $_city',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Wednesday',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue[800],
              child: _forecast.isNotEmpty
                  ? ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: _forecast.length,
                itemBuilder: (context, index) {
                  final item = _forecast[index];
                  return WeatherCard(
                    time: item['time'],
                    temperature: '${item['temperature']}° C',
                    humidity: '${item['humidity']}%',
                    icon: item['icon'],
                  );
                },
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
  final String icon;

  WeatherCard({
    required this.time,
    required this.temperature,
    required this.humidity,
    required this.icon,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Jam:", style: TextStyle(color: Colors.white70, fontSize: 14)),
              Text(time, style: TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
          Row(
            children: [
              Image.network(
                'http://openweathermap.org/img/wn/$icon@2x.png',
                width: 24,
                height: 24,
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Suhu:", style: TextStyle(color: Colors.white70, fontSize: 14)),
                  Text(temperature, style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Kelembaban:", style: TextStyle(color: Colors.white70, fontSize: 14)),
              Text(humidity, style: TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }
}
