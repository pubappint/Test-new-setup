abstract class DatabaseEntity {
  DatabaseEntity fromDatabase(Map<String, dynamic> map);
  Map<String, dynamic> toDatabase();
}