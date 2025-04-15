import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:barfly/core/config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Supabase Initializer Tests', () {
    setUpAll(() async {
      await Config.load();
      await dotenv.load(fileName: ".env");

      await Supabase.initialize(
        url: dotenv.get('SUPABASE_URL'),
        anonKey: dotenv.get('SUPABASE_ANON_KEY'),
      );
    });

    test('connection should be established', () async {
      expect(Supabase.instance.client.auth.currentSession, isNull);
    });
  });
}