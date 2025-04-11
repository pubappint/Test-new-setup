/// Class containing validation methods for various data types.
class Validation {
  /// Validates the ID.
  ///
  /// Throws an [ArgumentError] if the ID is empty.
  static void validateId(String id) {
    if (id.isEmpty) {
      throw ArgumentError('ID cannot be empty');
    }
  }

  /// Validates the name.
  ///
  /// Throws an [ArgumentError] if the name is empty.
  static void validateName(String name) {
    if (name.isEmpty) {
      throw ArgumentError('Name cannot be empty');
    }
  }

  /// Validates the description.
  ///
  /// Throws an [ArgumentError] if the description is empty.
  static void validateDescription(String description) {
    if (description.isEmpty) {
      throw ArgumentError('Description cannot be empty');
    }
  }

  /// Validates the address.
  ///
  /// Throws an [ArgumentError] if the address is empty.
  static void validateAddress(String address) {
    if (address.isEmpty) {
      throw ArgumentError('Address cannot be empty');
    }
  }

  /// Validates the latitude.
  ///
  /// Throws an [ArgumentError] if the latitude is not between -180 and 180.
  static void validateLatitude(double latitude) {
    if (latitude < -180 || latitude > 180) {
      throw ArgumentError('Latitude must be between -180 and 180');
    }
  }

  /// Validates the longitude.
  ///
  /// Throws an [ArgumentError] if the longitude is not between -180 and 180.
  static void validateLongitude(double longitude) {
    if (longitude < -180 || longitude > 180) {
      throw ArgumentError('Longitude must be between -180 and 180');
    }
  }

  /// Validates the average rating.
  ///
  /// Throws an [ArgumentError] if the average rating is not between 0 and 5.
  static void validateAvgRating(double avgRating) {
    if (avgRating < 0 || avgRating > 5) {
      throw ArgumentError('AvgRating must be between 0 and 5');
    }
  }

  /// Validates the price level.
  ///
  /// Throws an [ArgumentError] if the price level is empty.
  static void validatePriceLevel(String priceLevel) {
        if (priceLevel.isEmpty) {
      throw ArgumentError('PriceLevel cannot be empty');
    }
  }
}