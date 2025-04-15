import 'package:barfly/core/log.dart';

class MongoDBLog {
  final String timestamp;
  final String message;
  final String user;
  final String level;
  final String? id;

  MongoDBLog({
    required this.timestamp,
    required this.message,
    required this.user,
    required this.level,
    this.id,
  });

  void setLogLevel(String value) {     
    if (value == Log.kAll) {
      Log.logLevel = value;
    } else if (value == Log.kFine) {
      Log.logLevel = value;
    } else if (value == Log.kSevere) {
      Log.logLevel = value;
    } else if (value == Log.kInfo) {
      Log.logLevel = value;
    } 
  }

   Map<String, dynamic> toJson() {   
    return {
      'timestamp': timestamp,
      'message': message,
      'level': Log.logLevel,
      'user' : user,
    };
  }

  Map<String, dynamic> toDatabase() {
    return {
      'timestamp': timestamp,
      'message': message,
      'level': level,
      'user': user,
      '_id': id
    };
  }
}