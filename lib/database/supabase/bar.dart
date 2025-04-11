class Bar {
  final String id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final String openingHours;
  final String description;
  final double avgRating;
  final String priceLevel;
  final DateTime createdAt;

  Bar({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.openingHours,
    required this.description,
    required this.avgRating,
    required this.priceLevel,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'address': address,
    'latitude': latitude,
    'longitude': longitude,
    'opening_hours': openingHours,
    'description': description,
    'avg_rating': avgRating,
    'price_level': priceLevel,
    'created_at': createdAt.toIso8601String(),
  };
}