import 'package:barfly/core/supabase_service.dart';
import 'package:barfly/core/user.dart' as user_model;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:barfly/core/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:barfly/services/database_connection.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  late SupabaseService supabaseService;
  late DatabaseConnection databaseConnection;

  setUpAll(
    () async {
    await Config.load();
    await dotenv.load(fileName: ".env");
    SharedPreferences.setMockInitialValues({});
   await Supabase.initialize(
        url: dotenv.get('SUPABASE_URL', fallback: ""),
       anonKey: dotenv.get('SUPABASE_ANON_KEY'),
    );
    supabaseService = SupabaseService(client: Supabase.instance.client);    
    databaseConnection = DatabaseConnection(supabaseService: supabaseService);
    },
  );

  tearDownAll(() async {
    await databaseConnection.closeConnections();
  });
  group('Database Tests', () {
    group('Supabase User Tests', () {
      test(
        'insertProfile inserts a new profile and checks if it can be retrieved',
        () async {
        final testProfile = user_model.User(
          id: 'test_id_2',
          email: 'test@email.com',
          username: 'test_user',
          password: 'test_password',
        );
        final id = await supabaseService.insertProfile(testProfile);
        final profile = await supabaseService.getProfile(id);

        expect(profile.id, equals(testProfile.id));
        expect(profile.email, equals(testProfile.email));
        expect(profile.username, equals(testProfile.username));
        expect(profile.password, equals(testProfile.password));
      });
    });
  });
}
