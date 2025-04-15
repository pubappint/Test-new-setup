import 'dart:developer';
import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

class SchemaCreator {
  final SupabaseClient client = Supabase.instance.client;


  static const List<String> tableNames = [
    'bar',    
    'beer',
    'brewery',
    'event',
    'favorite',    
    'users',
    'follow',
    'pub',
    'review'
  ];
    List<Map<String, dynamic>> _parseFields(String fileContent) {
    final List<Map<String, dynamic>> fields = [];
    final RegExp fieldRegex = RegExp(r'final (\w+) (\w+);');    
   for (final RegExpMatch match in fieldRegex.allMatches(fileContent)) {
      final String type = match.group(1)!;
      final String name = match.group(2)!;
      fields.add({'name': name, 'type': type});
    }
    return fields;
  }


  Future<void> createTables() async {
    final Map<String, List<Map<String, dynamic>>> schemas =
        await readTableSchemas();
    await createBarTable(schemas['bar']!);
    await createBeerTable(schemas['beer']!);
    await createBreweryTable(schemas['brewery']!);
    await createEventTable(schemas['event']!);
    await createFavoriteTable(schemas['favorite']!);
    await createFollowTable(schemas['follow']!);
    await createPubTable(schemas['pub']!);
    await createReviewTable(schemas['review']!);
    await createUsersTable(schemas['users']!);
  }

  Future<void> createBarTable(List<Map<String, dynamic>> schema) async {
    try {
      await client.rpc('delete_table', params: {'table_name': 'bar'});
      for (final field in schema) {
       await client.rpc('create_column_if_not_exists', params: {
          'table_name': 'bar',
          'column_name': field['name'],
          'data_type': 'text',
          'primary_key': field['name'] == 'id',
        });
      }
    } catch (e) {
      log('Error creating bar table: $e');
    }
  }

  Future<void> createBeerTable(List<Map<String, dynamic>> schema) async {
    try {
      await client.rpc('delete_table', params: {'table_name': 'beer'});
      for (final field in schema) {
      await client.rpc('create_column_if_not_exists', params: {
          'table_name': 'beer',
          'column_name': field['name'],
          'data_type': 'text',
          'primary_key': field['name'] == 'id',
        });
      }
    } catch (e) {
      log('Error creating beer table: $e');
    }
  }

  Future<void> createBreweryTable(List<Map<String, dynamic>> schema) async {
    try {
     await client.rpc('delete_table', params: {'table_name': 'brewery'});
      for (final field in schema) {
      await client.rpc('create_column_if_not_exists', params: {
          'table_name': 'brewery',
          'column_name': field['name'],
          'data_type': 'text',
          'primary_key': field['name'] == 'id',
        });
      }
    } catch (e) {
      log('Error creating brewery table: $e');
    }
  }

  Future<void> createEventTable(List<Map<String, dynamic>> schema) async {
    try {
      await client.rpc('delete_table', params: {'table_name': 'event'});
       for (final field in schema) {
       await client.rpc('create_column_if_not_exists', params: {
          'table_name': 'event',
          'column_name': field['name'],
          'data_type': 'text',
          'primary_key': field['name'] == 'id',
        });
      }
    } catch (e) {
      log('Error creating event table: $e');
    }
  }

  Future<void> createFavoriteTable(List<Map<String, dynamic>> schema) async {
    try {
     await client.rpc('delete_table', params: {'table_name': 'favorite'});
      for (final field in schema) {
       await client.rpc('create_column_if_not_exists', params: {
          'table_name': 'favorite',
          'column_name': field['name'],
          'data_type': 'text',
          'primary_key': field['name'] == 'id',
        });
      }
    } catch (e) {
      log('Error creating favorite table: $e');
    }
  }

  Future<void> createFollowTable(List<Map<String, dynamic>> schema) async {
    try {
      await client.rpc('delete_table', params: {'table_name': 'follow'});
      for (final field in schema) {
       await client.rpc('create_column_if_not_exists', params: {
          'table_name': 'follow',
          'column_name': field['name'],
          'data_type': 'text',
          'primary_key': false,
        });
      }
     await client.rpc('create_composite_key', params: {
          'table_name': 'follow',
          'column_names': ['follower_id', 'followed_id']
        });
    } catch (e) {
       log('Error creating follow table: $e');
    }
  }

  Future<void> createReviewTable(List<Map<String, dynamic>> schema) async {
    try {
      await client.rpc('delete_table', params: {'table_name': 'review'});
      for (final field in schema) {
       await client.rpc('create_column_if_not_exists', params: {
          'table_name': 'review',
          'column_name': field['name'],
          'data_type': 'text',
          'primary_key': field['name'] == 'id',
        });
      }
    } catch (e) {
       log('Error creating review table: $e');
    }
  }

  Future<void> createPubTable(List<Map<String, dynamic>> schema) async {
    try {
       await client.rpc('delete_table', params: {'table_name': 'pub'});
      for (final field in schema) {
      await client.rpc('create_column_if_not_exists', params: {
          'table_name': 'pub',
          'column_name': field['name'],
          'data_type': 'text',
          'primary_key': field['name'] == 'id',
        });
      }
    } catch (e) {
        log('Error creating pub table: $e');
    }
  }

  Future<void> createUsersTable(List<Map<String, dynamic>> schema) async {
    try {
      await client.rpc('delete_table', params: {'table_name': 'users'});
      for (final field in schema) {
       await client.rpc('create_column_if_not_exists', params: {
          'table_name': 'users',
          'column_name': field['name'],
          'data_type': 'text',
          'primary_key': field['name'] == 'id',
        });
      }
    } catch (e) {
      log('Error creating users table: $e');
    }
  }
  Future<Map<String, List<Map<String, dynamic>>>> readTableSchemas() async {
    final Map<String, List<Map<String, dynamic>>> tableSchemas = {};
    final Directory directory = Directory('lib/database/supabase');
    final List<FileSystemEntity> entities =
        directory.listSync();

    for (final FileSystemEntity entity in entities) {
      if (entity is File && entity.path.endsWith('.dart')) {
        final String tableName = entity.path.split('/').last.replaceAll('.dart','');
        if (tableNames.contains(tableName)) {
          final String fileContent = await entity.readAsString();
          
          tableSchemas[tableName] = _parseFields(fileContent);
        }
      }
    }
    return tableSchemas;
  }
  
}
