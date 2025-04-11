import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static Future<void> load() async {
    await dotenv.load();
  }

  static String getMongoUri() {
    return dotenv.env['MONGODB_URL']!;
  }

  static String supabaseUrl() {
    return dotenv.env['SUPABASE_URL']!;
  }

  static String supabaseAnonKey() {
    return dotenv.env['SUPABASE_ANON_KEY']!;
  }
}

