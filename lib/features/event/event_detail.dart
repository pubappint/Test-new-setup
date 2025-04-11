import 'package:flutter/material.dart';

// Erstelle eine neue Event Detail Seite.
class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Detail'),
      ),
      body: const Center(
        child: Text('Event Detail Page'),
      ),
    );
  }
}