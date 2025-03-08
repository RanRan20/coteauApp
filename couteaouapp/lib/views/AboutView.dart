import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca de Mí'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/perfil.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              'Nombre: Carlos Jimenez',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              'Email: ranxn20@gmail.com',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'LinkedIn: https://www.linkedin.com/in/carlos-ranniel-jim%C3%A9nez-rodr%C3%ADguez-4a3b72227/',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Teléfono: +1 829-835-1176',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}