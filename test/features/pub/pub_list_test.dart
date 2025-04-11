import 'package:barfly/features/pub/pub_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:barfly/core/supabase_service.dart';

class MockMongoDBService extends Mock {
  Future<List<Map<String, dynamic>>> getPubs() async => [];
}

class MockDatabaseConnection extends Mock {
  SupabaseService get getSupabaseService => SupabaseService();
}

class FakePubs extends Fake {}


void main() {
  registerFallbackValue(FakePubs());

  final mockDatabaseConnection = MockDatabaseConnection();
  final mockMongoDBService = MockMongoDBService();

  group('PubListPage', () {
    setUp(() {
      reset(mockMongoDBService);
      when(() => mockDatabaseConnection.getSupabaseService).thenReturn(mockDatabaseConnection.getSupabaseService);
      when(() => mockMongoDBService.getPubs()).thenAnswer((_) async => [      
        {'id': '1', 'name': 'Pub 1', 'address': 'Address 1', 'openingHours': '10:00 - 22:00'},
        {'id': '2', 'name': 'Pub 2', 'address': 'Address 2', 'openingHours': '12:00 - 23:00'},
      ]);
    });

    testWidgets('renders PubListPage correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: PubListPage(),
      ));

      expect(find.byType(PubListPage), findsOneWidget);
    });

    testWidgets('loads pub data correctly', (WidgetTester tester) async {
      when(() => mockDatabaseConnection.getSupabaseService).thenReturn(mockDatabaseConnection.getSupabaseService);      
      when(() => mockMongoDBService.getPubs()).thenAnswer((_) async => [
        {'id': '1', 'name': 'Pub 1', 'address': 'Address 1', 'openingHours': '10:00 - 22:00'},
        {'id': '2', 'name': 'Pub 2', 'address': 'Address 2', 'openingHours': '12:00 - 23:00'},
      ]);

      await tester.pumpWidget(MaterialApp(
        home: PubListPage(),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Pub 1'), findsOneWidget);
      expect(find.text('Pub 2'), findsOneWidget);
      expect(find.text('Address 1'), findsOneWidget);
      expect(find.text('Address 2'), findsOneWidget);
      expect(find.text('10:00 - 22:00'), findsOneWidget);
      expect(find.text('12:00 - 23:00'), findsOneWidget);
    });

    testWidgets('displays error when loading fails', (WidgetTester tester) async {
        when(() => mockDatabaseConnection.getSupabaseService).thenReturn(mockDatabaseConnection.getSupabaseService);
      when(() => mockMongoDBService.getPubs()).thenThrow(Exception('Failed to load pubs'));

      await tester.pumpWidget(MaterialApp(
        home: PubListPage(),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Failed to load pubs'), findsOneWidget);
    });
  });
}