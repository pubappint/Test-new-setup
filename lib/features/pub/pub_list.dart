import 'package:flutter/material.dart';
import 'package:barfly/services/database_connection.dart';
import 'package:barfly/database/mongodb/pub.dart';
import 'package:barfly/database/mongodb/mongodb_constants.dart';

class PubListPage extends StatefulWidget {
  const PubListPage({super.key});

  @override
  PubListPageState createState() => PubListPageState();
}

class PubListPageState extends State<PubListPage> {
  late Future<List<Pub>> pubsFuture;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    pubsFuture = loadPubs();
  }

  Future<List<Pub>> loadPubs() async {
    try {
      final dbConnection = DatabaseConnection();
      await dbConnection.connectToDatabases();
      final mongoDBService = dbConnection.getMongoDBService;
      final List<Map<String, dynamic>> result = await mongoDBService.getAll(MongoDatabaseConstants.pubCollection);
      return result
          .map((e) => Pub(
              name: e[MongoDatabaseConstants.pubNameKey].toString(),
              id: e[MongoDatabaseConstants.idKey].toString(),
              address: e[MongoDatabaseConstants.pubAddressKey].toString(),
              latitude: double.parse(e[MongoDatabaseConstants.pubLatitudeKey].toString()),
              longitude: double.parse(e[MongoDatabaseConstants.pubLongitudeKey].toString()),
              openingHours: e[MongoDatabaseConstants.pubOpeningHoursKey]?.toString() ?? '',
              description: e[MongoDatabaseConstants.pubDescriptionKey]?.toString() ?? '',
              avgRating: double.parse(e[MongoDatabaseConstants.pubAvgRatingKey]?.toString() ?? '0.0'),              priceLevel: e[MongoDatabaseConstants.pubPriceLevelKey]?.toString() ?? '',
              ))
              
          .toList();
    } catch (e) {
      errorMessage = 'Failed to load pubs: $e';
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pubs List'),
      ),
      body: FutureBuilder<List<Pub>>(
        future: pubsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(errorMessage ?? 'An unknown error occurred'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final pub = snapshot.data![index];
                return ListTile(title: Text(pub.name));
              },
            );
          }
          return const Center(child: Text('No pubs found.'));
        },
      ),
    );
  }
}
