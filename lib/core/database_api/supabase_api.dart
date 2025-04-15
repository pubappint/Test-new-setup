import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SupabaseApi {
  SupabaseClient? _client;

  Future<SupabaseClient> connectToSupabase() async {
    if (_client != null) {
      return _client!;
    }
    final supabaseUrl = dotenv.env['SUPABASE_URL'];
    final supabaseKey = dotenv.env['SUPABASE_KEY'];

    if (supabaseUrl == null || supabaseKey == null) {
      throw Exception('Supabase URL or Key not found in .env');
    }
    _client = SupabaseClient(supabaseUrl, supabaseKey);
    return _client!;
  }

  Future<List<String>> getTables(SupabaseClient supabase) async {
    final response = await supabase.rpc('get_all_tables').select();
    return List<String>.from(response.map((table) => table['tablename']));
  }

  Future<List<Map<String, String>>> getTableFields(
      SupabaseClient supabase, String tableName) async {
    final response = await supabase
        .rpc('get_all_fields', params: {'tablename': tableName})
        .select();

    return List<Map<String, String>>.from(response.map((field) => {
          'name': field['column_name'],
          'type': field['data_type'],
        }));
  }

  Future<List<Map<String, String>>> getTableRelations(
      SupabaseClient supabase, String tableName) async {
    final response = await supabase
        .rpc('get_all_relations', params: {'tablename': tableName})
        .select();

    return List<Map<String, String>>.from(response.map((relation) => {
          'relation': relation['relation'],
        }));
  }

  Future<List<String>> getTableIndexes(
      SupabaseClient supabase, String tableName) async {
    final response = await supabase
        .rpc('get_all_indizes', params: {'tablename': tableName})
        .select();

    return List<String>.from(response.map((index) => index['indexname']));
  }

  Future<List<String>> getAllTables() async { //alt
    final client = await connectToSupabase();
    return await getTables(client);
  }

  Future<List<String>> getAllFieldsOfTable(String tableName) async {//alt
    final client = await connectToSupabase();
    final fields = await getTableFields(client, tableName);
     final List<String> fieldNames = [];
    for(var field in fields){
      fieldNames.add(field["name"]!);
    }
     return fieldNames;
  }

  Future<List<String>> getAllRelationsOfTable(String tableName) async { //alt
     final client = await connectToSupabase();
    return await getTableRelations(client, tableName).then((value) => value.map((e) => e["relation"]!).toList());
  }
  Future<List<String>> getAllIndizesOfTable(String tableName) async { //alt
    final client = await connectToSupabase();
    return await getTableIndexes(client, tableName);
  }
}