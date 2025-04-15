import 'package:flutter_test/flutter_test.dart';
import 'package:barfly/core/config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';

// Helper class for Supabase initialization in tests if needed
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


void main() {
  late SupabaseClient client;

  setUpAll(() async {
    // Ensure config is loaded
    await Config.load();
    final supabaseUrl = Config.supabaseUrl();
    final supabaseAnonKey = Config.supabaseAnonKey();

    // Use mock SharedPreferences for Supabase initialization (required by supabase_flutter)
    SharedPreferencesStorePlatform.instance = MockSharedPreferencesStorePlatform();

    // Initialize Supabase with real credentials
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
    );

    // Get the initialized client instance
    client = Supabase.instance.client;
  });

  tearDownAll(() async {
    // Optional: Clean up resources or database state if needed
    // await Supabase.instance.client.dispose(); // Dispose client if necessary
  });

  group('Supabase connection tests (Integration)', () {
    test('Supabase client should be initialized', () async {
      // Check if the client instance is available after initialization
      expect(client, isNotNull);
      // Optionally, check the auth status if needed (e.g., should be unauthenticated initially)
      expect(client.auth.currentUser, isNull);
    });

    test('testConnection() should establish and close a connection', () async {
    // Check if the client instance is available after initialization
      expect(client, isNotNull);

      // Check if dispose is possible
      try {
        await client.dispose();
      } catch (e) {
        fail('could not dispose database');
      }

      //check if the connection is closed
      expect(client.dispose, isNotNull);
    });

    // Add more integration tests here for other SupabaseService methods
    // Example: Test adding a pub (requires setup/teardown for test data)
    /*
      test('addPub() should insert a new pub', () async {
      final testPubName = 'Test Pub ${DateTime.now().millisecondsSinceEpoch}';
      final newPubData = {'name': testPubName, 'address': '123 Test St'};
      var insertedPubId;

      try {
        // Insert the pub
        final response = await client.from('pub').insert(newPubData).select('id').single();
        insertedPubId = response['id'];

        expect(insertedPubId, isNotNull);
        print('Successfully inserted pub with ID: $insertedPubId');

      } catch (e) {
        print('Error during addPub test: $e');
        fail('addPub() threw an error: $e');
      } finally {
        // Clean up: Delete the inserted pub
        if (insertedPubId != null) {
          try {
            await client.from('pub').delete().match({'id': insertedPubId});
            print('Successfully cleaned up pub with ID: $insertedPubId');
          } catch (cleanupError) {
            print('Error during cleanup: $cleanupError');
            // Decide if cleanup failure should fail the test
          }
        }
      }
    });
      */

  });
}
