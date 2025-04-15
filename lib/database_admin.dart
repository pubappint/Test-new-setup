import 'package:barfly/services/database_connection.dart';

class DatabaseAdmin {
  final DatabaseConnection databaseConnection;

  DatabaseAdmin({required this.databaseConnection});

  Future<void> setupPubsCollection() async {
    try {
      // We do not need to setup any collection, since it is not required anymore.
    } catch (e) {
      throw Exception("Pub Collection konnte nicht erstellt werden");
    }
  }

  Future<void> insertTestData() async {
    try {
      // We do not need to insert any data, since it is not required anymore.
    } catch (e) {
      throw Exception("Testdaten konnten nicht erstellt werden");
    }
  }

  Future<void> deleteAllLogs() async {
    try {
      await databaseConnection.mongoDBService.deleteAllLogs();
    } catch (e){
      throw Exception("Logs konnten nicht gelöscht werden");
    }
  }
}
