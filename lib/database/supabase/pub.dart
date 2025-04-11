class Pub {
  
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

  Pub({
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

  factory Pub.fromMap(Map<String, dynamic> map) {
    return Pub(
      id: map['id'],
      name: map['name'],
      address: map['address'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      openingHours: map['opening_hours'],
      description: map['description'],
      avgRating: map['avg_rating'],
      priceLevel: map['price_level'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  @override
  String toString() {
    return 'Pub(id: $id, name: $name)';
  }

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