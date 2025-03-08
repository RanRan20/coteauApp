import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GenderPredictionView extends StatefulWidget {
  @override
  _GenderPredictionViewState createState() => _GenderPredictionViewState();
}

class _GenderPredictionViewState extends State<GenderPredictionView> {
  TextEditingController _controller = TextEditingController();
  String _result = '';
  Color _backgroundColor = Colors.white;

  void _predictGender(String name) async {
    final response = await http.get(Uri.parse('https://api.genderize.io/?name=$name'));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      setState(() {
        if (jsonResponse['gender'] == 'male') {
          _result = 'Masculino';
          _backgroundColor = Colors.blue;
        } else {
          _result = 'Femenino';
          _backgroundColor = Colors.pink;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Ingresa un nombre'),
            ),
            ElevatedButton(
              onPressed: () => _predictGender(_controller.text),
              child: Text('Predecir Género'),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}