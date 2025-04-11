class MongoDBConnectionException implements Exception {
  final String message;

  const MongoDBConnectionException(this.message);

  @override
  String toString() => "MongoDBConnectionException: $message";
}