import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:barfly/core/config.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';

final String supabaseUrl = Config.supabaseUrl();
final String supabaseAnonKey = Config.supabaseAnonKey();


class MockSharedPreferencesStorePlatform extends SharedPreferencesStorePlatform {
  final Map<String, Object> _store = {};

  @override
  Future<bool> clear() async {
    _store.clear();
    return true;
  }

  @override
  Future<Map<String, Object>> getAll() async {
    return Map.from(_store);
  }

  @override
  Future<bool> remove(String key) async {
    _store.remove(key);
    return true;
  }

  @override
  Future<bool> setValue(String valueType, String key, Object value) async {
    _store[key] = value;
    return true;
  }
}

void main() async {
  setUpAll(() async {   
    await Config.load();
    SharedPreferencesStorePlatform.instance =
        MockSharedPreferencesStorePlatform();

     await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
     );
  });
  
  tearDownAll(() async {
    // Supabase doesn't have a explicit close method.
  });

  group('Supabase connection tests', () {
    test('connect() should establish a connection', () async {
      await Future.delayed(const Duration(milliseconds: 500));
      final session =  Supabase.instance.client.auth.currentSession;
      
      expect(session, isNotNull);
    });
  });
}
