import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:barfly/core/mongodb_service.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;


void main() {
  late MongoDbService mongoDbService;

  setUpAll(() async {
    // Lade die Umgebungsvariablen, bevor die Verbindung aufgebaut wird.
    await dotenv.load(fileName: ".env");
    mongoDbService = MongoDbService();
    await mongoDbService.connect();
  });

  tearDownAll(() async {
    await mongoDbService.close();
  });

  test('MongoDbService should initially be disconnected', () async {
    final service = MongoDbService();
    expect(service.dbState, mongo.State.closed);
  });

  test('MongoDbService should connect successfully', () async {
    // Überprüfen, ob die Verbindung erfolgreich hergestellt wurde
    expect(mongoDbService.dbState, mongo.State.open);
    await mongoDbService.close();
    expect(mongoDbService.dbState, mongo.State.closed);
  });
}

