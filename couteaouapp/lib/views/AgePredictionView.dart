import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AgePredictionView extends StatefulWidget {
  @override
  _AgePredictionViewState createState() => _AgePredictionViewState();
}

class _AgePredictionViewState extends State<AgePredictionView> {
  TextEditingController _controller = TextEditingController();
  String _result = '';
  int _age = 0;
  String _status = '';
  String _image = '';

  void _predictAge(String name) async {
    final response = await http.get(Uri.parse('https://api.agify.io/?name=$name'));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      setState(() {
        _age = jsonResponse['age'];
        if (_age < 18) {
          _status = 'Joven';
          _image = 'young_image.png';
        } else if (_age < 60) {
          _status = 'Adulto';
          _image = 'adult_image.png';
        } else {
          _status = 'Anciano';
          _image = 'elderly_image.png';
        }
        _result = 'Edad: $_age ($_status)';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: 'Ingresa un nombre'),
          ),
          ElevatedButton(
            onPressed: () => _predictAge(_controller.text),
            child: Text('Predecir Edad'),
          ),
          SizedBox(height: 20),
          Text(
            _result,
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          if (_image.isNotEmpty) Image.asset(_image),
        ],
      ),
    );
  }
}