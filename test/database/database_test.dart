import 'package:barfly/core/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:barfly/core/mongodb_service.dart';
import 'package:barfly/core/supabase_service.dart';
import 'package:mocktail/mocktail.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() async{
  final sharedPreferences = MockSharedPreferences();

  late MongoDBService mongoDBService;
  late SupabaseService service;
  await Config.load(); 

  when(
      () => sharedPreferences.setString(any(), any()),
    ).thenAnswer((_) async => true);
  when(() => sharedPreferences.getString(any())).thenReturn('foo');
  SharedPreferences.setMockInitialValues({});


  setUpAll(() async {
    mongoDBService = MongoDBService();
    service = SupabaseService();
    await service.initialize();
    await mongoDBService.connect();
    // Kurze Pause, um sicherzustellen, dass die asynchrone Initialisierung abgeschlossen ist
    await Future.delayed(Duration(seconds: 1));
  });
  
  
  tearDownAll(() async {
    await mongoDBService.close(); });
  group('Database Tests', () {

    group('Supabase Tests', () {
        test('Supabase client should not be null', () async {
          expect(service.client, isNotNull);
      });

    });
  
    group('MongoDB Tests', () {
      test('MongoDBService should not be null', () async {
        expect(mongoDBService, isNotNull);
      });
    });
  });

}