import 'package:barfly/database/mongodb/mongodb_constants.dart';

import 'package:barfly/core/database_entity.dart';
import 'package:barfly/core/validation.dart';

/// Represents additional data associated with a bar or pub.
class BarData implements DatabaseEntity {
  /// The unique identifier of this BarData entry.
  final String id;

  /// The identifier of the bar this data is associated with.
  final String barId;

  /// A list of image URLs or paths related to the bar.
  final List<String> images;

  /// A list of brewery names associated with the bar.
  final List<String> brewerys;

  /// A list of beer types served at the bar.
  final List<String> beerTypes;

  /// A list indicating whether beers are served on tap or in bottles.
  final List<String> tapOrBottle;

  /// The date and time when this data was created.
  final DateTime createdAt;

  /// Creates a new BarData object.
  BarData({
    required this.id,
    required this.barId,
    required this.images,
    required this.brewerys,
    required this.beerTypes,
    required this.tapOrBottle,  
    required this.createdAt,}){
    validate();
  }

  /// Validates the attributes of the BarData object and throws an exception if invalid.
  ///
  /// Uses the validation methods from [Validation] class.
  void validate() {
    Validation.validateId(id);

    Validation.validateId(barId);
  }
  
  
  
    /// Creates a BarData object from a database map.
    ///
    /// Converts a map of data (typically from a database) into a [BarData] object.
    ///
    /// [map] The map containing the bar data.
    @override
    BarData fromDatabase(Map<String, dynamic> map) {
      return BarData(
        id: map[MongoDatabaseConstants.barDataBarIdKey].toString(),
        barId: map[MongoDatabaseConstants.barDataBarIdKey],
        images: List<String>.from(map[MongoDatabaseConstants.barDataImagesKey]),
        brewerys: List<String>.from(map[MongoDatabaseConstants.barDataBreweryKey]),
        beerTypes: List<String>.from(map[MongoDatabaseConstants.barDataBeerTypeKey]),
        tapOrBottle: List<String>.from(map[MongoDatabaseConstants.barDataTapOrBottleKey]),
        createdAt: map[MongoDatabaseConstants.eventCreatedAtKey],
      );
    }
    
  
    /// Converts the BarData object into a database map.
    ///
    /// Converts the [BarData] object into a map that can be stored in a database.
    @override
    Map<String, dynamic> toDatabase() => {          
          MongoDatabaseConstants.idKey: id,
          MongoDatabaseConstants.barDataBarIdKey: barId,
          MongoDatabaseConstants.barDataImagesKey: images,
          MongoDatabaseConstants.barDataBreweryKey: brewerys,
          MongoDatabaseConstants.barDataBeerTypeKey: beerTypes,
          MongoDatabaseConstants.barDataTapOrBottleKey: tapOrBottle,
          MongoDatabaseConstants.eventCreatedAtKey: createdAt,
      };
}
