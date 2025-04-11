class Follow {
  final String followerId;
  final String followedId;
  final DateTime createdAt;

  Follow({
    required this.followerId,
    required this.followedId,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => {
        'follower_id': followerId,
        'followed_id': followedId,
        'created_at': createdAt.toIso8601String(),
      };
}