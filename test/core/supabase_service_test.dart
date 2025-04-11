import 'package:flutter_test/flutter_test.dart';
import 'package:barfly/core/supabase_service.dart';
import 'package:barfly/core/config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mocktail/mocktail.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() async {  
  

  group('SupabaseService', () {
    final sharedPreferences = MockSharedPreferences();
    when(() => sharedPreferences.setString(any(), any())).thenAnswer((_) async => true);
    when(() => sharedPreferences.getString(any())).thenReturn('foo');
    SharedPreferences.setMockInitialValues({});
    late SupabaseClient client;
    late SupabaseService service;
    setUpAll(() async {
      await Config.load();
      service = SupabaseService();
      await service.initialize();
      client = Supabase.instance.client;
    });

    tearDownAll(() async {
      client.dispose();
    }); 

    test('service should not be null', () {
      expect(service, isNotNull);
    });

    test('initialize should initialize client', () async {
      expect(service, isA<SupabaseService>());
      expect(client, isA<SupabaseClient>());
    });

    
  });
}
