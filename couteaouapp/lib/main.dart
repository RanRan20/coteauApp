import 'package:flutter/material.dart';
import 'package:couteaouapp/views/AboutView.dart';
import 'package:couteaouapp/views/AgePredictionView.dart';
import 'package:couteaouapp/views/GenderPredictionView.dart';
import 'package:couteaouapp/views/PokemonSearchView.dart';
import 'package:couteaouapp/views/ToolBoxView.dart';
import 'package:couteaouapp/views/UniversitySearchView.dart';
import 'package:couteaouapp/views/WeatherView.dart';
import 'package:couteaouapp/views/WordPressNewsView.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App couteaou',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blueGrey[900],
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> _views = [
    ToolBoxView(),
    GenderPredictionView(),
    AgePredictionView(),
    UniversitySearchView(),
    WeatherView(),
    PokemonSearchView(),
    WordPressNewsView(),
    AboutView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Coteaou'),
        actions: [],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: _views[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        iconSize: 24, // Tamaño de los iconos ajustado
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/home.png'),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/person.png'),
            label: 'Género',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/cake.png'),
            label: 'Edad',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/school.png'),
            label: 'Universidades',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/cloud.png'),
            label: 'Clima',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/pokemon.png'),
            label: 'Pokémon',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/article.png'),
            label: 'Noticias',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/info.png'),
            label: 'Acerca de',
          ),
        ],
      ),
    );
  }
}