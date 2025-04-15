final List<Map<String, dynamic>> expectedMongoDbSchema = [
  {
    'name': 'pubs',
    'fields': [
      {'name': 'name', 'type': 'String'},
      {'name': 'address', 'type': 'String'},
      {'name': 'location', 'type': 'Map<String, double>'},
       {'name': 'description', 'type': 'String'},
      {'name': 'openingHours', 'type': 'String'},
      {'name': 'beers', 'type': 'List<String>'},
      {'name': 'events', 'type': 'List<String>'},
      {'name': 'ratings', 'type': 'List<Map<String, int>>'},
      {'name': 'userId', 'type': 'String'},
    ]
  },
  {
    'name': 'events',
    'fields': [
      {'name': 'name', 'type': 'String'},
      {'name': 'description', 'type': 'String'},
      {'name': 'pubId', 'type': 'UUID'},
      {'name': 'date', 'type': 'String'},
      {'name': 'time', 'type': 'String'},
    ]
  },
  {
    'name': 'beers',
    'fields': [
      {'name': 'name', 'type': 'String'},
      {'name': 'breweryId', 'type': 'UUID'},
      {'name': 'description', 'type': 'String'},
      {'name': 'beerType', 'type': 'String'},
      {'name': 'alcoholContent', 'type': 'double'},
      {'name': 'ratings', 'type': 'List<Map<String, int>>'},
      {'name': 'userId', 'type': 'String'},
    ]
  },
  {
    'name': 'breweries',
    'fields': [
      {'name': 'name', 'type': 'String'},
      {'name': 'address', 'type': 'String'},
      {'name': 'location', 'type': 'Map<String, double>'},
      {'name': 'description', 'type': 'String'},
       {'name': 'beers', 'type': 'List<String>'},
      {'name': 'userId', 'type': 'String'},
    ]
  },
  {
    'name': 'users',
    'fields': [
      {'name': 'name', 'type': 'String'},
      {'name': 'email', 'type': 'String'},
      {'name': 'id', 'type': 'UUID'},
      {'name': 'favorites', 'type': 'List<String>'},
    ]
  },
  {
    'name': 'logs',
    'fields': [
      {'name': 'timestamp', 'type': 'String'},
      {'name': 'message', 'type': 'String'},
      {'name': 'level', 'type': 'String'},
    ]
  },
  {
    'name': 'reviews',
    'fields': [
      {'name': 'userId', 'type': 'UUID'},
      {'name': 'pubId', 'type': 'UUID'},
      {'name': 'rating', 'type': 'int'},
      {'name': 'comment', 'type': 'String'},
      {'name': 'id', 'type': 'UUID'},
    ]
  },
  {
    'name': 'favorites',
    'fields': [
      {'name': 'userId', 'type': 'UUID'},
      {'name': 'pubId', 'type': 'UUID'},
    ]
  },
];