import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:integration_test/integration_test.dart';
import 'package:barfly/services/database_connection.dart';
import 'package:barfly/core/config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  group('Database Connection Integration Tests', () {
    testWidgets('testDatabaseConnection with correct URI',
        (WidgetTester tester) async {
      final DatabaseConnection databaseConnection = DatabaseConnection();
      await databaseConnection.connectToDatabases();

      expect(databaseConnection.mongoDbService.getDb().isConnected, true);
      expect(Supabase.instance.client.auth.currentSession != null, true);
      await databaseConnection.closeConnections();
    });

    testWidgets('testDatabaseConnection with incorrect URI',
        (WidgetTester tester) async {
      final DatabaseConnection databaseConnection = DatabaseConnection();
      final wrongUri = 'mongodb://wrongUri';
        final mongoUri = Config.getMongoUri();
        dotenv.testLoad(fileInput: 'MONGODB_URL=$wrongUri');
      try {
        await databaseConnection.connectToDatabases();
        fail('Expected an exception to be thrown');
      } catch (e) {
          expect(e, isA<Exception>());
      } finally {
        dotenv.testLoad(fileInput: 'MONGODB_URL=$mongoUri');
          await databaseConnection.closeConnections();
      }
    });
  });
}