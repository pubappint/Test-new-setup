import 'package:barfly/database/mongodb/mongodb_constants.dart';
import 'package:barfly/core/database_entity.dart';
import 'package:barfly/core/validation.dart';

/// `EventValidationException` is thrown when an `Event` object fails validation.
class EventValidationException implements Exception {
  final String message;

  /// Constructs a new `EventValidationException`.
  ///
  /// The [message] provides details about the validation failure.
  EventValidationException(this.message);

  @override
  String toString() => 'EventValidationException: $message';
}

/// `Event` represents a planned event with a specific name, description, location,
/// rating, and price level.
class Event implements DatabaseEntity {
  /// `id` is the unique identifier for this event.
  final String id;
  /// `name` is the name of the event.
  final String name;
  /// `description` is a detailed description of the event.
  final String description;
  /// `address` is the physical location of the event.
  final String address;
  /// `latitude` is the geographical latitude of the event's location.
  final double latitude;
  /// `longitude` is the geographical longitude of the event's location.
  final double longitude;
  /// `avgRating` is the average rating of the event, typically on a scale.
  final double avgRating;
  /// `priceLevel` represents the price range or level of the event.
  final double priceLevel;
  /// `createdAt` is the timestamp indicating when this event was created.
  final DateTime createdAt;

  /// Constructs a new `Event` instance with the given properties.
  ///
  /// Each property must be provided, and after creation, the event is validated
  /// to ensure that all data meets the necessary criteria.
  Event({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.latitude,
      required this.longitude,
      required this.avgRating,
      required this.priceLevel,
      required this.createdAt,
    }) {
    Validation.validateId(id);
    Validation.validateName(name);
    Validation.validateDescription(description);
    Validation.validateAddress(address);
    Validation.validateLatitude(latitude);
    Validation.validateLongitude(longitude);
    Validation.validateAvgRating(avgRating);
    if (priceLevel < 0 || priceLevel > 4) {
      throw ArgumentError('PriceLevel must be between 0 and 4');
    }
  }

  /// Creates an Event object from a map, typically database data.
  @override
  Event fromDatabase(Map<String, dynamic> map) {
    return Event(
      id: map[MongoDatabaseConstants.idKey] as String,
      name: map[MongoDatabaseConstants.eventNameKey] as String? ?? "",
      description: map[MongoDatabaseConstants.eventDescriptionKey] as String? ?? '',
      address: map[MongoDatabaseConstants.eventAddressKey] as String? ?? '',
      latitude: map[MongoDatabaseConstants.eventLatitudeKey] as double? ?? 0.0,
      longitude: map[MongoDatabaseConstants.eventLongitudeKey] as double? ?? 0.0,
      avgRating: map[MongoDatabaseConstants.eventAvgRatingKey] as double? ?? 0.0,
      priceLevel: map[MongoDatabaseConstants.eventPriceLevelKey] as double? ?? 0.0,
      createdAt: map[MongoDatabaseConstants.eventCreatedAtKey] as DateTime? ?? DateTime.now(),
    );
  }

  /// Converts the Pub object into a database map.
  @override
  Map<String, dynamic> toDatabase() {
    return {
      MongoDatabaseConstants.idKey: id,
      MongoDatabaseConstants.eventNameKey: name,
      MongoDatabaseConstants.eventDescriptionKey: description,
      MongoDatabaseConstants.eventAddressKey: address,
      MongoDatabaseConstants.eventLatitudeKey: latitude,
      MongoDatabaseConstants.eventLongitudeKey: longitude,
      MongoDatabaseConstants.eventAvgRatingKey: avgRating,
      MongoDatabaseConstants.eventPriceLevelKey: priceLevel,
      MongoDatabaseConstants.eventCreatedAtKey: createdAt,
    };
  }
}