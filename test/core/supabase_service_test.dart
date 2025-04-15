import 'package:flutter_test/flutter_test.dart';
import 'package:barfly/core/supabase_service.dart';
import 'package:barfly/core/config.dart';
import 'package:barfly/database/schema_creator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:barfly/core/user.dart' as profile_model;

void main() async {
  group('SupabaseService', () {
    late SupabaseClient client;
    late SupabaseService service;
    setUpAll(() async {
      final schemaCreator = SchemaCreator();
      await Config.load();
      client = Supabase.instance.client;
      await schemaCreator.createTables();      
      service = SupabaseService(client: client);      
    });
    

    tearDownAll(() async {      client.dispose();
    }); 

    test('service should not be null', () {
      expect(service, isNotNull);
    });

    test('initialize should initialize client', () {
      expect(service, isA<SupabaseService>());
      expect(client, isA<SupabaseClient>());
    });    
    
     test('SupabaseService should be connected', () {
      expect(service.client.auth.currentSession, isNotNull);
    });

    test('insertProfile inserts a new profile and checks if it can be retrieved', () async {      
      final testProfile = profile_model.User(
        id: 'test_id',
        email: 'test@email.com',
        username: 'test_user',
        password: 'test_password',
      );
      final id = await service.insertProfile(testProfile);
      final profile = await service.getProfile(id);
      expect(profile, isNotNull);
      expect(profile.username, equals('test_user'));
      expect(profile.email, equals('test@email.com'));
    });
  });
}
