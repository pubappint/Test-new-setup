import 'package:flutter_test/flutter_test.dart';
import 'package:barfly/core/mongodb_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mongo_dart/mongo_dart.dart' as mdb;

void main() {
  late MongoDBService service;  

  setUpAll(() async {
    await dotenv.load(fileName: ".env");
      service = MongoDBService();
      await service.connect();
      
  });

    tearDownAll(() async {
      await service.deleteAllLogs();      
      await service.close();
      
      
    });

  test('getAll gibt Liste mit Einträgen zurück, wenn Einträge vorhanden sind', () async {        
    await service.deleteAllLogs();    
    await service.insert('logs', {"_id": mdb.ObjectId.fromHexString('65d0462936f729a544d54e54')}, level: 'info', user: 'Test');
    
  });
  test('getAll gibt leere Liste zurück, wenn \'app_logs\' leer ist', () async {
    
    final res = await service.getAll('app_logs');
    expect(res, isEmpty);
  });
}
