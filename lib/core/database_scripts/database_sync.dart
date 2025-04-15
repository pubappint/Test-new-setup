import 'dart:io';
import '../database_api/supabase_api.dart';
import 'mongodb_schema.dart';



class MongoDBApi {
  Future<void> connectToMongoDB() async {}
  Future<List<String>> getCollections() async { return []; }
  Future<List<Map<String, String>>> getCollectionFields(String collection) async { return []; }

  Future<void> addCollection(String collection) async {}
  Future<void> addField(String collection, String field) async {}

}



void main() async {
  await syncDatabases();
}

Future<void> syncDatabases() async {}

Future<void> initializeApp() async {
}
// rest of code
Future<List<String>> selectDatabases() async {
  List<String> databases = [];
  bool isValidInput = false;
  do {
    print("Welche Datenbanken sollen synchronisiert werden? (MongoDB, Supabase, Beide)");
    final input = stdin.readLineSync();

    if (input != null) {
      if (input.toLowerCase() == "mongodb" || input.toLowerCase() == "supabase" || input.toLowerCase() == "beide") {
        isValidInput = true;
        databases = input.toLowerCase() == "beide" ? ["MongoDB", "Supabase"] : [input];
      } else {        print("Ungültige Eingabe. Bitte wähle MongoDB, Supabase oder Beide.");
      }
    }
  } while (!isValidInput);
  return databases;
}

Future<String> selectComparisonLevel() async {
  String comparisonLevel = "";
  bool isValidInput = false;
  do {
        final input = stdin.readLineSync()?.toLowerCase();

    if (input != null) {
      if (input == "struktur" || input == "felder" || input == "relationen" || input == "daten") {
        isValidInput = true;
        comparisonLevel = input;
      } else {
        print("Ungültige Eingabe. Bitte wähle Struktur, Felder, Relationen oder Daten.");
      } 
    }
  } while (!isValidInput);

  return comparisonLevel;
}

Future<List<String>> selectCollectionsTables() async {
  List<String> tablesCollections = [];
  bool isValidInput = false;

  do {
    print("Welche Collections/Tabellen sollen verglichen werden? (alle, einzeln)");
    final input = stdin.readLineSync();

    if (input != null) {
      if (input.toLowerCase() == "alle" ) {
        isValidInput = true;
        tablesCollections = ["alle"];
      } else if (input.toLowerCase() == "einzeln") {        
        isValidInput = true;
        print("Welche Collections/Tabellen sollen verglichen werden? (Bitte Namen kommagetrennt eingeben)");
        print("Vorhandene Tabellen/Collections sind: pubs, events, beers, breweries, users, logs, reviews, favorites");
        final inputCollections = stdin.readLineSync();
        if (inputCollections != null) {
          tablesCollections = inputCollections.split(',').map((e) => e.trim()).toList();
        }
      } else {
        print("Ungültige Eingabe. Bitte wähle 'alle' oder 'einzeln'.");
      }      
    }
  } while (!isValidInput);

  return tablesCollections;
}

Future<Map<String, dynamic>> connectToDatabases(
  List<String> databases,) async {
  final Map<String, dynamic> apiObjects = {};
  try {
    if (databases.contains('MongoDB')) {
      final mongoDBApi = MongoDBApi();
      await mongoDBApi.connectToMongoDB();
      apiObjects['mongoDBApi'] = mongoDBApi;
      print('Erfolgreich mit MongoDB verbunden');
    }

    if (databases.contains('Supabase')) {
      final supabaseApi = SupabaseApi();
      await supabaseApi.connectToSupabase();
      apiObjects['supabaseApi'] = supabaseApi;
      print('Erfolgreich mit Supabase verbunden');
    }
  } catch (e) {
    print('Fehler beim Verbindungsaufbau: $e');
  } 
  
  return apiObjects;  
}

Future<Map<String, dynamic>> compareMongoDBStructures(MongoDBApi mongoDBApi, String comparisonLevel) async {
  Map<String, dynamic> differences = {};

  try {

    final collections = await mongoDBApi.getCollections();    
    print('--- MongoDB Collections ---');
    if (comparisonLevel == 'struktur' || comparisonLevel == 'felder') {
      for (final collection in collections) {
        print('Collection: $collection');
        final fields = await mongoDBApi.getCollectionFields(collection);        

        // Vergleichen mit erwartetem Schema
         var expectedCollection = expectedMongoDbSchema
            .firstWhere((element) => element['name'] == collection, orElse: () => {});

        if (expectedCollection.isEmpty) {          
          print("    Collection nicht im Schema gefunden");
          differences[collection] = {"Collection": "nicht im Schema gefunden"};          
        } else {
          if (comparisonLevel == 'felder') {
            List<Map<String, String>> expectedFields = expectedCollection['fields'];
            for (var expectedField in expectedFields) {
              String fieldName = expectedField.keys.first;
              String fieldType = expectedField.values.first;
              bool fieldExists = false;
              for (var actualField in fields) {
                String actualFieldName = actualField.keys.first;
                if (actualFieldName == fieldName) {
                  fieldExists = true;
                  String actualFieldType = actualField.values.first;
                  if (actualFieldType != fieldType) {   
                    print("    Falscher Datentyp $fieldName erwartet: $fieldType, vorhanden: $actualFieldType");
                    differences[collection] = {
                      if (differences[collection] == null) ...{},
                      fieldName: {"erwartet": fieldType, "vorhanden": actualFieldType} 
                    };
                  }
                  break;
                } 
              }
              if (!fieldExists) {
               print("    Fehlendes Feld $fieldName");
                differences[collection] = {
                  if (differences[collection] == null) ...{},
                  fieldName: {"vorhanden": false, "erwartet": fieldType}
                };
              }
            }
          }
        }
      }
    }
  } catch (e) {
    print('Fehler beim Vergleichen der MongoDB Strukturen: $e');
  } finally {
    print('MongoDB Vergleich abgeschlossen');
  }
  return differences;
}


Future<Map<String, dynamic>> compareSupabaseStructures(SupabaseApi supabaseApi, String comparisonLevel) async {
  Map<String, dynamic> differences = {};

  try {
    final supabase = await supabaseApi.connectToSupabase();
    final collections = await supabaseApi.getTables(supabase);
    print('--- Supabase Tables ---');
    if (comparisonLevel == 'struktur' || comparisonLevel == 'felder' || comparisonLevel == 'relationen') {
      for (final collection in collections) {
        print('Table: $collection');
        print('  Fields: ${await supabaseApi.getTableFields(supabase, collection)}');

        if (comparisonLevel == 'relationen') {
          print('  Relations: ${await supabaseApi.getTableRelations(supabase, collection)}');
        }
        print('  Indexes: ${await supabaseApi.getTableIndexes(supabase, collection)}');
      }
    }
  } catch (e) {    
    print('Fehler beim Vergleichen der Supabase Strukturen: $e');
  } finally {
    print('Supabase Vergleich abgeschlossen');
 }

  return differences;
}

Future<Map<String, dynamic>> displayDifferences(Map<String, dynamic> differences) async {
  print("--- Unterschiede ---");
  Map<String, dynamic> result = {};

  if (differences.isEmpty){
    print("Keine Unterschiede gefunden");    
  }

  if (differences.containsKey('MongoDB')) {
    print("--- MongoDB ---");
    final mongoDBDifferences = differences['MongoDB'];
    for (final collection in mongoDBDifferences.keys) {
      print("Collection: $collection");
      final collectionDiffs = mongoDBDifferences[collection];
      if (collectionDiffs is String) {
        print("    $collectionDiffs");
      } else {
        for (final field in collectionDiffs.keys) {
          if (collectionDiffs[field] is Map) {
            final fieldDiff = collectionDiffs[field];
            if (fieldDiff["vorhanden"] == false) {
              print("    Fehlendes Feld: $field");
            } else {
              print("    Falscher Datentyp für Feld: $field");
              print("      Erwartet: ${fieldDiff["erwartet"]}");
              print("      Vorhanden: ${fieldDiff["vorhanden"]}");
            }
          }
        }
      }
    }
  }
  if (differences.containsKey('Supabase')) {
    print("--- Supabase ---");
  }

  return result;
}

Future<bool> confirmChanges() async {    
  print("Sollen die Änderungen durchgeführt werden? (y/n)");
  final input = stdin.readLineSync();
  if (input != null && input.toLowerCase() == 'y') {
    return true;
  } else {
    return false;
  }
}

Future<void> updateDatabase(Map<String, dynamic> differences, Map<String, dynamic> apiObjects) async {    
  print("Datenbanken werden aktualisiert...");
  final mongoDBApi = apiObjects['mongoDBApi'];
  final supabaseApi = apiObjects['supabaseApi'];
  
  if (mongoDBApi == null || supabaseApi == null) {
    print("Ein Fehler ist aufgetreten: Eine der Datenbanken konnte nicht initialisiert werden");
    return; 
  }
  try {
    if (differences.containsKey('MongoDB')) {
      final mongoDBDifferences = differences['MongoDB'];
      for (final collection in mongoDBDifferences.keys) {
        final collectionDiffs = mongoDBDifferences[collection];
        if (collectionDiffs is String) {
          if (collectionDiffs == "nicht im Schema gefunden") {
            await mongoDBApi.addCollection(collection);
          }
        } else {  
          for (final field in collectionDiffs.keys) {
            await mongoDBApi.addField(collection, field); 
          }
        }
      }
    }
    
    if (differences.containsKey('Supabase')) {
      final supabaseDifferences = differences['Supabase'];
      for (final table in supabaseDifferences.keys) {
        final tableDiffs = supabaseDifferences[table];
        if (tableDiffs is String) {
          if (tableDiffs == "nicht im Schema gefunden") {
            await supabaseApi.addTable(table);
          }
        } else { 
          for (final field in tableDiffs.keys) {
          await supabaseApi.addField(table, field);
          }
        }
      }
    }
  } catch(e) {
   print('Fehler beim Aktualisieren der Datenbanken: $e');
  } finally {
    print("Datenbanken wurden aktualisiert.");
  }
}
