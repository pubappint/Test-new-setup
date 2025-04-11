import 'package:flutter/material.dart';
import 'package:barfly/services/database_connection.dart';
import 'package:barfly/core/mongodb_service.dart';
import 'package:barfly/core/mongodb_constants.dart' as mongodb_constants;
import 'package:barfly/core/log.dart';
 
class EventListPage extends StatefulWidget{
  const EventListPage({super.key});

  @override
  State<EventListPage> createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  late Future<List<Log>> _logsFuture;

  @override
  void initState(){
    super.initState();
    _logsFuture = _loadLogs();
  }

 Future<List<Log>> _loadLogs() async {
    final DatabaseConnection dbConnection = DatabaseConnection();
    final MongoDBService mongoDBService = dbConnection.getMongoDBService;
    try {
      final List<dynamic> logs = await mongoDBService.getAll(mongodb_constants.logsCollection);
      return logs.map((log) => Log.fromDatabase(log as Map<String, dynamic>)).toList();
      
    } catch (e) {
      throw Exception('Failed to load events: $e');
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event List'),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<List<Log>>(
        future: _logsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) =>Text(snapshot.data![index].message),
              separatorBuilder: (context, index) =>
                    const Divider(),
              );
          } else {
            return const Center(child: Text('No events found'));
          }
        },
      ),
    );
  }
}