class Favorite {
  final String id;
  final String userId;
  final String barId;
  final DateTime createdAt;

  Favorite({
    required this.id,
    required this.userId,
    required this.barId,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'bar_id': barId,
    'created_at': createdAt.toIso8601String(),
  };
}