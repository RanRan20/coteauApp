// lib/views/pokemon_search_view.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PokemonSearchView extends StatefulWidget {
  @override
  _PokemonSearchViewState createState() => _PokemonSearchViewState();
}

class _PokemonSearchViewState extends State<PokemonSearchView> {
  final _controller = TextEditingController();
  String _pokemonName = '';
  String _pokemonImage = '';
  String _baseExperience = '';
  List<String> _abilities = [];

  Future<void> _fetchPokemon() async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$_pokemonName'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _pokemonImage = data['sprites']['front_default'];
        _baseExperience = data['base_experience'].toString();
        _abilities = (data['abilities'] as List)
            .map((ability) => ability['ability']['name'].toString())
            .toList()
            .cast<String>();
      });
    } else {

      setState(() {
        _pokemonImage = '';
        _baseExperience = '';
        _abilities = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Búsqueda de Pokémon'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Ingrese el nombre del Pokémon',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                setState(() {
                  _pokemonName = value.toLowerCase();
                });
                _fetchPokemon();
              },
            ),
            SizedBox(height: 20),
            if (_pokemonImage.isNotEmpty)
              Image.network(_pokemonImage),
            if (_baseExperience.isNotEmpty)
              Text('Experiencia Base: $_baseExperience'),
            if (_abilities.isNotEmpty)
              Text('Habilidades: ${_abilities.join(', ')}'),
          ],
        ),
      ),
    );
  }
}