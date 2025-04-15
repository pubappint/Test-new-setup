import 'dart:core';

import '../../core/validation.dart';
import '../../core/database_entity.dart';

import 'package:barfly/core/log.dart';
import 'package:barfly/database/mongodb/mongodb_log.dart';
import 'mongodb_constants.dart';

/// Represents a pub with various details.
class Pub implements DatabaseEntity {
  /// The unique identifier of the pub.
  final String id;

  /// The name of the pub.
  final String name;

  /// The address of the pub.
  final String address;

  /// The latitude coordinate of the pub's location.
  final double latitude;

  /// The longitude coordinate of the pub's location.
  final double longitude;

  /// The opening hours of the pub.
  final String openingHours;

  /// A brief description of the pub.
  final String description;

  /// The average rating of the pub.
  final double avgRating;

  /// The price level of the pub (e.g., $, $$, $$$).
  final PriceLevel priceLevel;

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
  }) {
    validate();
  }

  /// Validates the attributes of the Pub object using the Validation class.
  ///
  /// This method performs various validations on the Pub object's properties
  /// such as name, description, address, latitude, longitude, and avgRating.
  /// It uses the static validation methods provided by the [Validation] class.
  ///
  /// Throws an [ArgumentError] if any of the validation checks fail.
  void validate() {
    Validation.validateId(id);

    Validation.validateName(name);
    Validation.validateDescription(description);
    Validation.validateAddress(address);
    Validation.validateLatitude(latitude);
    Validation.validateLongitude(longitude);
    Validation.validateAvgRating(avgRating);
    if (openingHours.isEmpty) {
      throw ArgumentError('Opening hours cannot be empty');
    }
    if (latitude < -180 || latitude > 180) {
      throw ArgumentError('Latitude must be between -180 and 180');
    }
    if (longitude < -180 || longitude > 180) {
      throw ArgumentError('Longitude must be between -180 and 180');
    }
  }

  /// Creates a Pub object from a database map.
  ///
  /// Converts a map of data (typically from a database) into a [Pub] object.
  @override
  Pub fromDatabase(Map<String, dynamic> map) {    
    return Pub(
        id: map[MongoDatabaseConstants.idKey] as String? ?? '',
        name: map[MongoDatabaseConstants.pubNameKey] as String? ?? '',
        address: map[MongoDatabaseConstants.pubAddressKey] as String? ?? '',
        latitude: map[MongoDatabaseConstants.pubLatitudeKey] as double? ?? 0.0,
        longitude:
            map[MongoDatabaseConstants.pubLongitudeKey] as double? ?? 0.0,
        openingHours: map['openingHours'] as String? ?? '',
        description: map['description'] as String? ?? '',
        avgRating:
            map[MongoDatabaseConstants.eventAvgRatingKey] as double? ?? 0.0,
        priceLevel: () {
          final priceLevelString =
              map[MongoDatabaseConstants.eventPriceLevelKey] as String?;
          if (priceLevelString == null) return PriceLevel.low;
          try {
            return PriceLevel.values.byName(priceLevelString);
          } catch(e) {MongoDBLog(timestamp: DateTime.now().toIso8601String(), message: "error: $e", user: "Database", level: Log.kSevere);}
          return PriceLevel.low;
        }()
    );
  }

  /// Converts the Pub object into a database map.
  ///
  /// Replace Magic Strings with Const.
  /// Converts the [Pub] object into a map that can be stored in a database.
  @override
  Map<String, dynamic> toDatabase() => {
        'id': id,
        'name': name,
        'address': address,
        MongoDatabaseConstants.pubLatitudeKey: latitude,
        MongoDatabaseConstants.pubLongitudeKey: longitude,
        'openingHours': openingHours,
        'description': description,
        MongoDatabaseConstants.eventAvgRatingKey: avgRating,
        MongoDatabaseConstants.eventPriceLevelKey: priceLevel.name
      };

   /// Converts the [Pub] object into a map that can be serialized to JSON.
  ///
  /// This method returns a map representation of the [Pub] object suitable for
  /// JSON serialization. It includes all the properties of the pub.
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'address': address,
    'latitude': latitude,
    'longitude': longitude,
    'openingHours': openingHours,
    'description': description,
    'avgRating': avgRating,
    'priceLevel': priceLevel.name,
  };
}
