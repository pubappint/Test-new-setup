class User {
  final String id;
  final String email;
  final String username;
  final String password;
  final String? profilePictureUrl;
  final DateTime createdAt;
  final List<String>? musicPreferences;
  final List<String>? beerPreferences;

  User({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    this.profilePictureUrl,
    required this.createdAt,
    this.musicPreferences,
    this.beerPreferences,
  });
}