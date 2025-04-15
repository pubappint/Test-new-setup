import 'package:flutter/material.dart';
import 'package:barfly/services/database_connection.dart';
import 'package:barfly/database/mongodb/pub.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:barfly/core/supabase_service.dart';

import 'package:barfly/core/mongodb_constants.dart';

class PubDetailPage extends StatefulWidget {
  final String pubId;

  const PubDetailPage({super.key, required this.pubId});

  @override
  PubDetailPageState createState() => PubDetailPageState();
}

class PubDetailPageState extends State<PubDetailPage> {
  late Future<Pub?> pubData;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    pubData = _loadPubData();
  }

   Future<Pub?> _loadPubData() async {
    try {
      final supabaseService = SupabaseService(client: Supabase.instance.client);

      final mongoDBService = DatabaseConnection(supabaseService: supabaseService).mongoDBService;
      final entity = await mongoDBService.getById(MongoDatabaseConstants.pubCollection,widget.pubId);
      if(entity == null){
        return null;
      }
      final data = entity.toDatabase();

      final pub = Pub(
          id: data['_id'],
          name: data['name'],
          address: data['address'],
          latitude: data['latitude'],
          longitude: data['longitude'],
          description: "",
          avgRating: 0.0,
          priceLevel: data['priceLevel'].toDouble(),
          openingHours: data['openingHours'],

      );

      return pub;
    } catch (e) {
      setState(() {
        errorMessage = 'Fehler beim Laden der Pub-Daten: $e';
      });
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pub Detail'),
      ),
      body: FutureBuilder<Pub?>(
        future: pubData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child:  CircularProgressIndicator());
          } else if (snapshot.hasError || errorMessage != null) {
            return Center(
              child: Text(errorMessage ?? 'Ein unbekannter Fehler ist aufgetreten.'),
            );
          } else if (snapshot.hasData) {
            final pub = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${pub.name}', style: Theme.of(context).textTheme.headlineMedium),
                  Text('Adresse: ${pub.address}'),
                  Text('Öffnungszeiten: ${pub.openingHours}'),
                ],
              ),
            );
          } else {
            return const Center(child: Text('Keine Pub-Daten gefunden.'));
          }
        },
      )
    );
  }
}