import 'package:flutter_test/flutter_test.dart';
import 'package:barfly/core/mongodb_service.dart';
import 'package:barfly/core/supabase_service.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:barfly/core/config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

void main() async {
  if (File(".env").existsSync()) {
    await dotenv.load(fileName: ".env");
  }
  group('Concurrent Database Connection Test', () {
    late MongoDbService mongoDbService;
    late SupabaseService supabaseService;
    late SupabaseClient supabaseClient;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      await Supabase.initialize(url: Config.supabaseUrl(), anonKey: Config.supabaseAnonKey());
      supabaseClient = Supabase.instance.client;
      mongoDbService = MongoDbService();
      await mongoDbService.connect();
      supabaseService = SupabaseService(client: supabaseClient);
    });

    tearDown(() async {
      await mongoDbService.close();
      await supabaseService.close();
    });

    test('should only connect to MongoDB', () async {
      expect(mongoDbService.dbState, mongo.State.open, reason: 'MongoDB connection should be successful');
    });
  });
}
