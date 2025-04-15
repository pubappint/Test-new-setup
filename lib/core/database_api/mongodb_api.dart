import 'package:mongo_dart/mongo_dart.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MongoDBApi {
  Db? _db;

  Future<Db> connectToMongoDB() async {
    final dbUri = dotenv.get('MONGODB_URI');
    _db = await Db.create(dbUri);
    await _db!.open();
    return _db!;
  }

  Future<List<String>> getCollections() async {
    if (_db == null || !_db!.isConnected) {
      await connectToMongoDB();
    }
    final List<String?> collectionsWithNull = await _db!.getCollectionNames();
    List<String> collections = [];
    for (String? collection in collectionsWithNull) {
      if (collection != null) {
        collections.add(collection);
      }
    }
    return collections;
  }

  Future<List<Map<String, String>>> getCollectionFields(
      String collectionName) async {
    if (_db == null || !_db!.isConnected) {
      await connectToMongoDB();
    }
    final collection = _db!.collection(collectionName);
    final firstDocument = await collection.findOne();
    if (firstDocument == null) {
      return [];
    }
    List<Map<String, String>> fields = [];
    firstDocument.forEach((key, value) {
      fields.add({key: value.runtimeType.toString()});
    });
    return fields;
  }
  Future<void> closeConnection() async {
    await _db?.close();
  }
}