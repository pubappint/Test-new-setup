import 'dart:io';

import 'package:barfly/core/mongodb_constants.dart';
import 'package:barfly/core/supabase_service.dart';
import 'package:barfly/core/mongodb_service.dart';
import 'package:barfly/core/log.dart';
import 'package:flutter/foundation.dart';

/// Manages the connection to the database services.
class DatabaseConnection {
  /// The MongoDB service used for database operations.
  final MongoDBService mongoDBService = MongoDBService();

  /// Gets the instance of the MongoDB service.
  ///
  /// Returns the [MongoDBService] instance for database operations.
  MongoDBService get getMongoDBService => mongoDBService;
  
  MongoDBService get mongoDbService => mongoDBService;

  final SupabaseService _supabaseService = SupabaseService();

  /// Connects to the databases and performs necessary setup.
  ///
  /// This method establishes a connection to the MongoDB database and
  /// creates the logs collection if it doesn't exist. It handles potential
  /// [SocketException] for network errors and other exceptions for database
  /// operation failures.
  ///
  /// Throws an [Exception] if a network error occurs or if the connection to
  /// the databases fails.    
  Future<void> connectToDatabases() async {
      await _supabaseService.initialize();

    try {
      await getMongoDBService.connect();
      // Use the constant for the logs collection name.
      await getMongoDBService.createLogsCollection();
    } on SocketException {
      throw Exception('Network error: Unable to connect to the database.');
    }on Exception catch (e){
      debugPrint("Failed to connect to databases: ${e.toString()}");
      throw Exception('Failed to connect to databases: ${e.toString()}');
    }
  }




  

  

  /// Adds a new log entry to the logs collection.
  ///
  /// This method adds a new [Log] entry to the database.
  ///
  /// [timestamp] The timestamp of the log.
  /// [message] The message of the log.
  /// [level] The level of the log.
  /// [user] The user of the log.
  ///
  /// Throws an [Exception] if adding the log fails.
  Future<void> addLog(
      String timestamp, String message, String level, String user) async {
    try {
      final newLog = Log(timestamp: timestamp, message: message, level: level, user: user);
      await _insertLog(newLog);      
    } catch (e) {
        throw Exception('Failed to add log: $e');
    }
  }
  

    Future<void> _insertLog(Log log) async{
      final logDocument = Log(timestamp: DateTime.now().toString(), message: log.message, level: 'info', user: 'system');
      await getMongoDBService.insert(logsCollection, logDocument.toDatabase(), level: 'info', user: 'system');
      debugPrint(
        'Log with message ${log.message} was added',
      );
    }

  Future<void> closeConnections() async {
      await mongoDBService.close();
      await _supabaseService.close();
  }
}
