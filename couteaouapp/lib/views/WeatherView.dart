// lib/views/weather_view.dart
import 'package:flutter/material.dart';

class WeatherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clima en RD'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wb_sunny, size: 100, color: Colors.yellow),
            SizedBox(height: 20),
            Text(
              'Clima para hoy en República Dominicana:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Soleado, 29°C',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}