class Review {
  final String id;
  final String barId;
  final String userId;
  final int rating;
  final String comment;
  final DateTime createdAt;

  Review({
    required this.id,
    required this.barId,
    required this.userId,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'bar_id': barId,
    'user_id': userId,
    'rating': rating,
    'comment': comment,
    'created_at': createdAt.toIso8601String(),
  };
}