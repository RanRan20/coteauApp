
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class WordPressNewsView extends StatefulWidget {
  @override
  _WordPressNewsViewState createState() => _WordPressNewsViewState();
}

class _WordPressNewsViewState extends State<WordPressNewsView> {
  List _news = [];

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    final response = await http.get(Uri.parse('https://9to5mac.com/wp-json/wp/v2/posts?_embed&per_page=3'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _news = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias con relacion a apple'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset('assets/images/icon.png'),
            SizedBox(height: 20),
            if (_news.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: _news.length,
                  itemBuilder: (context, index) {
                    final post = _news[index];
                    return ListTile(
                      title: Text(post['title']['rendered']),
                      subtitle: Text(post['excerpt']['rendered'].replaceAll(RegExp(r'<[^>]*>'), '')),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        _launchURL(post['link']);
                      },
                    );
                  },
                ),
              )
            else
              Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}