class Pub {
  final String id;
  final String name;

  const Pub({
    required this.id,
    required this.name,
  });

   factory Pub.fromJson(Map<String, dynamic> json) {
    return Pub(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}