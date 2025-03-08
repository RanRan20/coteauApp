import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class UniversitySearchView extends StatefulWidget {
  @override
  _UniversitySearchViewState createState() => _UniversitySearchViewState();
}

class _UniversitySearchViewState extends State<UniversitySearchView> {
  TextEditingController _controller = TextEditingController();
  List _universities = [];

  void _fetchUniversities(String country) async {
    final response = await http.get(Uri.parse('http://universities.hipolabs.com/search?country=$country'));
    if (response.statusCode == 200) {
      setState(() {
        _universities = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: 'Nombre del País (en inglés)'),
          ),
          ElevatedButton(
            onPressed: () => _fetchUniversities(_controller.text),
            child: Text('Buscar Universidades'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _universities.length,
              itemBuilder: (context, index) {
                var uni = _universities[index];
                return ListTile(
                  title: Text(uni['name'], style: TextStyle(color: Colors.white)),
                  subtitle: Text(uni['domain'], style: TextStyle(color: Colors.white)),
                  onTap: () => launch(uni['web_pages'][0]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}