
import 'package:barfly/core/log.dart';
import 'package:barfly/core/config.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;


class MongoDBException implements Exception {
  final String message;
  MongoDBException(this.message);
}

/// Service class for interacting with MongoDB
class MongoDbService {
  late mongo.Db _db;
  mongo.State get dbState => _db.state;
  String _logLevel = 'INFO'; // Default log level

  set logLevel(String level) {
    switch (level) {
      case 'ALL':
      case 'FINE':
      case 'INFO':
      case 'SEVERE':
        _logLevel = level;
        break;
      default:
        _logLevel = 'INFO';
    }
    Log(message: "logLevel set to: $_logLevel", level: _logLevel, user: 'MongoDbService',timestamp: DateTime.now().toString());
  }

  
  MongoDbService() {
    connect();
  }
  
  Future<List<Map<String, dynamic>>> getAll(String collection) async {
        if (_db.state != mongo.State.open) {
            await _db.open();
        }
        await createLogsCollection();
        final coll = _db.collection(collection);
        final res =  await coll.find().toList();
        return res;
    }
      Future<dynamic> getById(String collection, String id) async {
        if (_db.state != mongo.State.open) {
          await _db.open();
        }
        final coll = _db.collection(collection);
    final res = await coll.findOne(mongo.where.id(mongo.ObjectId.fromHexString(id)));
    if (res == null) {
        Log(message: "Document with id $id not found in collection $collection", level: Log.kSevere, user: 'MongoDbService', timestamp: DateTime.now().toString());
        return null;
    } else {
      Log(message: "Successfully retrieved document with id $id in collection $collection", level: Log.kInfo, user: 'MongoDbService', timestamp: DateTime.now().toString());
      return res..['_id'] = res['_id'].toHexString();
    }
  }

  


  
  Future<void> createLogsCollection() async {
    if (_db.state != mongo.State.open) {
      throw MongoDBException("Database is not open.");
    }
    final collections = await _db.getCollectionNames();
    if (!collections.contains("logs")) {
      await _db.createCollection("logs");
    }
  }  


   Future<String> insert(String collection, Map<String, dynamic> data) async {
    if (_db.state != mongo.State.open) {
      await _db.open();
    }
    final coll = _db.collection(collection);
      Log(message: "Inserting data into $collection: $data", level: Log.kInfo, user: 'MongoDbService', timestamp: DateTime.now().toString());
    String pubId;
    if (data.containsKey('_id')) {
      pubId = data['_id'];
      data['_id'] = mongo.ObjectId.fromHexString(data['_id'] as String);
    } else {
      data['_id'] = mongo.ObjectId();
      pubId = data['_id'].toHexString();
    }
    final result = await coll.insertOne(data);
    if (result.isSuccess) {
      return pubId.toString();
    }

    throw MongoDBException("Failed to insert data. ${result.errmsg ?? 'Result is null'}");
  }

  Future<void> update(Map<String, dynamic> data, String collection) async {
    if (_db.state != mongo.State.open) {
      await _db.open();
    }
    final coll = _db.collection(collection);
    final id = data['_id']!;
    final result = await coll.updateOne(mongo.where.id(id), {r'$set': data..remove('_id')});
    if (!result.isSuccess) {
      throw MongoDBException("Failed to update data: ${result.errmsg ?? ''}");
    }
  }

  Future<void> delete(String collection, String id) async {
    if (_db.state != mongo.State.open) { await _db.open(); }
    final coll = _db.collection(collection);
    final result = await coll.deleteOne(mongo.where.id(mongo.ObjectId.fromHexString(id)));
    if (!result.isSuccess) {
      throw MongoDBException("Failed to delete data: ${result.errmsg ?? 'Result is null'}");
    }
  }

  Future<void> deleteMany(String collection, mongo.SelectorBuilder filter) async {
      if (_db.state != mongo.State.open) { await _db.open(); }
      final coll = _db.collection(collection);
      final result = await coll.deleteMany(filter);
      if (!result.isSuccess) {
          throw MongoDBException("Failed to delete data: ${result.errmsg ?? 'Result is null'}");
      }
  }
  
   Future<void> deleteAll(String collection) async {
    if (_db.state != mongo.State.open) {
      await _db.open();
    }
    final coll = _db.collection(collection);
    await coll.deleteMany(mongo.where.exists('_id'));
  }

  Future<void> close() async {
      await _db.close();

  }

    Future<void> deleteAllLogs() async {
      if (_db.state != mongo.State.open) {
        await _db.open();
      }
      await _db.collection("logs").deleteMany(mongo.where.exists('_id'));
  }

  Future<void> connect() async {
      final mongoUri = Config.getMongoUri();
      _db = mongo.Db(mongoUri);
      try { 
        await _db.open();
        Log(message: "Successfully connected to MongoDB", level: Log.kInfo, user: 'MongoDbService', timestamp: DateTime.now().toString());
      } catch (e) {
         throw MongoDBException("Failed to connect to MongoDB: ${e.toString()}"); }
    }
}