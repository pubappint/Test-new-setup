import 'package:mongo_dart/mongo_dart.dart' as mdb;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:barfly/core/log.dart';
import 'package:barfly/core/mongodb_service.dart';
import 'package:barfly/database/mongodb/mongodb_log.dart';
import 'package:barfly/database/mongodb/mongodb_constants.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:barfly/database/mongodb/pub.dart';


void main() async {
  group('MongoDB connection tests', () {
    late MongoDbService mongoDbService;
    setUpAll(() async { // Asynchrone setUpAll
      await dotenv.load(fileName: ".env");
      mongoDbService = MongoDbService();
      await mongoDbService.connect(); // Verbindung in setUpAll herstellen
    });

    tearDownAll(() async { // Asynchrone tearDownAll
       if (mongoDbService.dbState == mdb.State.open) {
        await mongoDbService.close();
       }
    });

    test('connect() should establish a connection', () async { // Asynchroner Test
        await mongoDbService.deleteMany(MongoDatabaseConstants.pubCollection, mdb.where.exists('_id'));        
        await Future.delayed(const Duration(milliseconds: 100));
        await mongoDbService.connect();
         expect(mongoDbService.dbState, equals(mdb.State.open));
    });

    test('insert() should insert a document', () async {      
      await mongoDbService.deleteMany(MongoDatabaseConstants.pubCollection, mdb.where.exists('_id'));      
      await Future.delayed(const Duration(milliseconds: 100));      
      // Manuell gesetzte ID
      final objectId = mdb.ObjectId();
      final pubId = objectId.toHexString();      
      final pub = Pub(
          id: pubId,
          name: "Test Pub",
          address: "Test Addresse",
          latitude: 48.137154,
          longitude: 11.576124,          

          openingHours: "Mo-Sa 10:00-24:00",
          description: "Test Description",
          avgRating: 3.5,
          priceLevel: PriceLevel.low);

      // Einfügen des Dokuments und Überprüfung der zurückgegebenen ID
      final insertedId = await mongoDbService.insert(MongoDatabaseConstants.pubCollection, pub.toJson()..['_id'] = pubId);      
      expect(insertedId, equals(pubId)); 
    });


    test('getAll() should retrieve all documents', () async { // Asynchroner Test
      await mongoDbService.deleteMany(MongoDatabaseConstants.pubCollection, mdb.where.exists('_id'));      
      await Future.delayed(const Duration(milliseconds: 100));      
      
       // Verbindung vor dem Abruf herstellen
      final logs = await mongoDbService.getAll(MongoDatabaseConstants.logsCollection);
      expect(logs, isA<List>());
      expect(logs, isNotEmpty);
    });

    test('getById() should retrieve a document by its id', () async { // Asynchroner Test      
      await mongoDbService.deleteMany(MongoDatabaseConstants.pubCollection, mdb.where.exists('_id'));      
      await Future.delayed(const Duration(milliseconds: 100));

      // Neuer Eintrag erstellen und einfügen 
       final objectId = mdb.ObjectId();
      final pubId = objectId.toHexString();
       final pub = Pub(
          id: pubId,
          name: "Test Pub",
          address: "Test Addresse",
          latitude: 48.137154,
          longitude: 11.576124,
          openingHours: "Mo-Sa 10:00-24:00",          
          description: "Test Description",
          avgRating: 3.5,
          priceLevel: PriceLevel.low);
      final insertedId = await mongoDbService.insert(MongoDatabaseConstants.pubCollection, pub.toJson()..['_id'] = pubId);      
      await Future.delayed(const Duration(milliseconds: 100));

      // Eintrag abrufen
      final result = await mongoDbService.getById(MongoDatabaseConstants.pubCollection, insertedId);            
      expect(result?['_id'].toString(), equals(insertedId));      
    });
    
    test('close() should close the connection', () async {
       await mongoDbService.deleteMany(MongoDatabaseConstants.pubCollection, mdb.where.exists('_id'));      
       await Future.delayed(const Duration(milliseconds: 100));
       
       await mongoDbService.connect();// Verbindung vor dem Abruf herstellen
      await mongoDbService.close();      
      expect(mongoDbService.dbState, equals(mdb.State.closed));
    });

    test('change LogLevel', () async { // Asynchroner Test
      await mongoDbService.deleteMany(MongoDatabaseConstants.pubCollection, mdb.where.exists('_id'));
       await Future.delayed(const Duration(milliseconds: 100));
       
      await mongoDbService.connect();// Verbindung vor dem Abruf herstellen
      MongoDBLog log = MongoDBLog(
        timestamp: DateTime.now().toIso8601String(),
        message: "Test Message",
        user: "Test User",
        level: Log.kAll,
      );


      if (mongoDbService.dbState != mdb.State.open) {
        await mongoDbService.connect();
      }


      // Sicherstellen das ein log gefunden wurde.
      await mongoDbService.insert(MongoDatabaseConstants.logsCollection, log.toJson());
      final logs = await mongoDbService.getAll(MongoDatabaseConstants.logsCollection);
      expect(logs.length.toString(), isNotEmpty);

      Log.logLevel = Log.kAll;
      expect(Log.logLevel, equals(Log.kAll));


      Log.logLevel = Log.kFine;
      expect(Log.logLevel, equals(Log.kFine));
      

      Log.logLevel = Log.kSevere;
      expect(Log.logLevel, equals(Log.kSevere));


      Log.logLevel = Log.kInfo;
      expect(Log.logLevel, equals(Log.kInfo));
    });
  });  
}

