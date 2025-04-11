import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:barfly/core/config.dart';

// Service class for interacting with Supabase.
class SupabaseService {
  late final SupabaseClient client;

  // Initializes the Supabase connection.
  Future<void> initialize() async {
    await Supabase.initialize(
      url: Config.supabaseUrl(), 
      anonKey: Config.supabaseAnonKey(), 
    );
    client = Supabase.instance.client;    
  }
  Future<void> close() async {    
  }
}
