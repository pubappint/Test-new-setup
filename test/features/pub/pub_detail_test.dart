import 'package:mocktail/mocktail.dart';
import 'package:barfly/features/pub/pub_detail.dart';  
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MockMongoDBService extends Mock {
    Future<Map<String, dynamic>> getPub(dynamic id) async => {};
  }

class FakePubId extends Fake {

}

void main() {
  registerFallbackValue(FakePubId());

  group('PubDetailPage', () {
    late MockMongoDBService mockMongoDBService;

    setUp(() {
      mockMongoDBService = MockMongoDBService();
    });

    testWidgets('renders PubDetailPage correctly', (WidgetTester tester) async {
      when(() => mockMongoDBService.getPub(any())).thenAnswer((_) async => {
            'id': '1',
            'name': 'Test Pub',
            'address': 'Test Address',
            'openingHours': '10:00 - 22:00'
          });

      await tester.pumpWidget(MaterialApp(
        home: PubDetailPage(pubId: '1'),
      ));

      expect(find.byType(PubDetailPage), findsOneWidget);
    });

    testWidgets('loads pub data correctly', (WidgetTester tester) async {
      when(() => mockMongoDBService.getPub(any())).thenAnswer((_) async => {
            'id': '1',
            'name': 'Test Pub',
            'address': 'Test Address',
            'openingHours': '10:00 - 22:00'
          });

      await tester.pumpWidget(MaterialApp(
        home: PubDetailPage(pubId: '1'),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Test Pub'), findsOneWidget);
      expect(find.text('Test Address'), findsOneWidget);
      expect(find.text('10:00 - 22:00'), findsOneWidget);
    });

    testWidgets('displays error when loading fails',
        (WidgetTester tester) async {
      when(() => mockMongoDBService.getPub(any())).thenThrow(Exception('Failed to load pub'));

      await tester.pumpWidget(MaterialApp(
        home: PubDetailPage(pubId: '1'),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Failed to load pub'), findsOneWidget);
    });
  });
}