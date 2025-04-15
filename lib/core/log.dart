
/// Represents a log entry with timestamp, message, level, and user information.
class Log {
   static String logLevel = 'INFO';
  /// The timestamp of when the log entry was created.
  final String timestamp;

  /// The message associated with the log entry.
  final String message;

  /// The log level (e.g., "INFO", "ERROR", "DEBUG").
  final String level;

  /// The user associated with the log entry.
  final String user;

  /// Creates a new Log object.
  Log({
    required this.timestamp,
    required this.message,
    required this.level,
    required this.user,
  });

  /// Log Levels
  static const String kAll = 'ALL';
  static const String kFine = 'FINE';
  static const String kSevere = 'SEVERE';
  static const String kInfo = 'INFO';
  static const String kWarning = 'WARNING';
  
  
  /// Converts the Log object into a database-compatible map.
  Map<String, dynamic> toDatabase() {
    return {
      'timestamp': timestamp,
      'message': message,
      'level': level,
      'user': user,
    };
  }

  /// Creates a Log object from a database map.
  static Log fromDatabase(Map<String, dynamic> map) {
    return Log(
      // Use the constants for the log fields.
      timestamp: map['timestamp'] as String,
      // Use the constants for the log fields.
      message: map['message'] as String,
      // Use the constants for the log fields.
      level: map['level'] as String,
      // Use the constants for the log fields.
      user: map['user'] as String,
    );
  }
}