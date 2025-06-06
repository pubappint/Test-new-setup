/// Enum to represent the possible price levels.
enum PriceLevel {
  low,
  medium,
  high,
}
class MongoDatabaseConstants {
  static const String logsCollection = 'logs';
  static const String userCollection = 'users';
  static const String barCollection = 'bars';
  static const String pubCollection = 'pubs';
  static const String eventCollection = 'events';
  static const String breweryCollection = 'breweries';
  static const String beerCollection = 'beers';
  static const String reviewCollection = 'reviews';
  static const String followCollection = 'follows';
  static const String favoriteCollection = 'favorites';
  static const String idKey = '_id';
  static const String eventNameKey = 'name';
  static const String eventDescriptionKey = 'description';
  static const String eventAddressKey = 'address';
  static const String eventLatitudeKey = 'latitude';
  static const String eventLongitudeKey = 'longitude';
  static const String eventAvgRatingKey = 'avgRating';
  static const String eventPriceLevelKey = 'priceLevel';
  static const String eventCreatedAtKey = 'createdAt';
  static const String pubsCollection = 'pubs';
  static const String barDataCollection = 'barData';
  static const String pubNameKey = 'name';
  static const String pubAddressKey = 'address';
  static const String pubLatitudeKey = 'latitude';
  static const String pubLongitudeKey = 'longitude';
  static const String barDataBarIdKey = 'barId';
  static const String barDataImagesKey = 'images';
  static const String barDataBreweryKey = 'brewerys';
  static const String barDataBeerTypeKey = 'beerTypes';
  static const String barDataTapOrBottleKey = 'tapOrBottle';  
  static const String pubOpeningHoursKey = 'openingHours';
  static const String pubDescriptionKey = 'description';
  static const String pubAvgRatingKey = 'avgRating';
  static const String pubPriceLevelKey = 'priceLevel';
}