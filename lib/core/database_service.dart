import 'package:barfly/core/database_entity.dart';

/// Abstract class defining the interface for a database service.
///
/// This class outlines the methods required for any class that interacts with a database.
abstract class DatabaseService {
  /// Retrieves all objects of a specific type from the database.
  ///
  /// This method fetches all documents from the specified [collection]
  /// and returns them as a list of type [T].
  /// [collection] The name of the collection to retrieve data from.  
  Future<List<DatabaseEntity>> getAll(String collection);
  /// Retrieves an object of a specific type from the database by its ID.
  ///
  /// This method fetches a single document from the specified [collection]
  /// using the provided [id] and returns it as an object of type [T].
  /// Returns null if no document matches the provided ID.
  /// [collection] The name of the collection to retrieve data from.
  /// [id] The ID of the document to retrieve.  
  Future<DatabaseEntity?> getById(String collection, String id);
  /// Inserts a new object into the database.
  ///
  /// This method inserts the provided [data] into the specified [collection].
  /// [collection] The name of the collection to insert data into.
  /// [data] The data to insert.
  Future<String> insert(String collection, DatabaseEntity data, {required String level, required String user});
  /// Updates an existing object in the database.
  ///
  /// This method updates the provided [data] in the specified [collection].
  /// [collection] The name of the collection to update data in.
  /// [data] The data to update.
  Future<void> update(DatabaseEntity data, String collection);
  /// Deletes an object from the database by its ID.
  /// [collection] The name of the collection to delete data from.
  /// [id] The ID of the document to delete.
  Future<void> delete(String collection, String id);
}
