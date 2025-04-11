class MongoDBOperationException implements Exception {
  final String message;

  MongoDBOperationException(this.message);
}