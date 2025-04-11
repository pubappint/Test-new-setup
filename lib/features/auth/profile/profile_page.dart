import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const CircleAvatar(
              radius: 50,
              // Hier könnte man ein Profilbild einfügen
              child: Icon(Icons.person, size: 50),
            ),
            const SizedBox(height: 20),
            const Text(
              'Benutzername', // Hier könnte der Name des Benutzers stehen
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'user@email.com', // Hier könnte die E-Mail des Benutzers stehen
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Hier könnten weitere Informationen oder Aktionen stehen
          ],
        ),
      ),
    );
  }
}