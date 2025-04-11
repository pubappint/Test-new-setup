import 'package:barfly/core/log.dart';
import 'package:barfly/core/config.dart';
import 'package:mongo_dart/mongo_dart.dart' as mdb;

class MongoDBException implements Exception {
  final String message;
  MongoDBException(this.message);
}
enum LogLevel {  
  debug,
  info,
  error
}

/// Service class for interacting with MongoDB.
/// Service class for interacting with MongoDB.
class MongoDBService {
  late mdb.Db _db;  
    mdb.Db getDb() {
    return _db;
  }

  /// Initializes the MongoDB connection.
  MongoDBService(){
    connect();
  }
  
  Future<List<Map<String, dynamic>>> getAll(String collection) async {
    if (_db.state != mdb.State.open) { await _db.open(); }
    await createLogsCollection();
        
    final coll = _db.collection(collection);    
    return await coll.find().toList();
  }
  
  Future<dynamic> getById(String collection, String id) async {
      if (_db.state != mdb.State.open) {        
        await _db.open();}
      final coll = _db.collection(collection);
      final res = await coll.findOne(mdb.where.id(mdb.ObjectId.fromHexString(id)));
      if (res == null) {
        return null;
      }
      return null;
    }
  
  Future<void> createLogsCollection() async {        
    if (_db.state != mdb.State.open) { await _db.open(); }
      
    final collections = await _db.getCollectionNames();
    
    if (!collections.contains("app_logs")) {
      await _db.createCollection("app_logs");
    }
  }
  
  Future<String> insert(String collection, Map<String, dynamic> data, {required String level, required String user}) async {
    if (_db.state != mdb.State.open) {
      await _db.open();
    }    
        try {
      final coll = _db.collection(collection);
      final result = await coll.insertOne(data);
      if (result.isSuccess) {
        return result.id.toHexString();
      }
      throw MongoDBException("Failed to insert data. ${result.errmsg}");
    } catch (e) {
      throw MongoDBException("Failed to insert data. ${e.toString()}");
    }
  }

  Future<void> update(Map<String, dynamic> data, String collection) async {
      if (_db.state != mdb.State.open) {        
        await _db.open();}

      final coll = _db.collection(collection);
      final id = data['_id'];
      data.remove('_id');
      final result = await coll.updateOne(mdb.where.id(id), { r'$set': data });
      if (!result.isSuccess) {
        throw MongoDBException("Failed to update data: ${result.errmsg}");
      }
    }
  
    Future<void> delete(String collection, String id) async {
      if (_db.state != mdb.State.open) {        
        await _db.open();}

      final coll = _db.collection(collection);
      final result = await coll.deleteOne(mdb.where.id(mdb.ObjectId.fromHexString(id)));
      if (!result.isSuccess) {
        throw MongoDBException("Failed to delete data: ${result.errmsg}");
      }
    }

  Future<void> close() async {
      await _db.close();
    }


  Future<void> addLog(Log log, String level, String user) async {
    if (_db.state != mdb.State.open) { await _db.open(); }

    
      final collection = _db.collection("logs");
      await collection.insertOne(log.toDatabase());
    }
  
    Future<List<Log>> getLogs(String collection) async {
      if (_db.state != mdb.State.open) {        
        await _db.open();
      }
    final result = await _db.collection(collection).find().toList();
      return result.map((log) => Log.fromDatabase(log)).toList();
    }

  Future<void> deleteAllLogs() async {
      if (_db.state != mdb.State.open) {        
        await _db.open();}

      await _db.collection("logs").deleteMany(mdb.where.exists('_id'));
    }

  /// Connects to the MongoDB database.
  Future<void> connect() async {
      final mongoUri = Config.getMongoUri();
      _db = mdb.Db(mongoUri);      
  }
}

    

