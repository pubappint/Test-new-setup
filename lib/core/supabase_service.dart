import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:barfly/core/user.dart' as user_model;
import 'package:barfly/core/pub.dart';

class SupabaseService {
  final SupabaseClient client;

  SupabaseService({required this.client});

  
  
  Future<void> close() async {
  }
  // Inserts a profile into the 'profiles' table.
  Future<String> insertProfile(user_model.User user) async {
    final response = await client.from('profiles').insert({
      'id': user.id,
      'email': user.email,
      'username': user.username,
      'password': user.password
    }).select();
    return response[0]['id'].toString();
  }

  // Retrieves a profile from the 'profiles' table based on their ID.
  Future<user_model.User> getProfile(String id) async {
    final response =
        await client.from('profiles').select().eq('id', id).single();
    return user_model.User(
      id: response['id'],
      email: response['email'],
      username: response['username'],
      password: response['password'],
    );
  }
  
  // Retrieves all pubs from the 'pub' table.
  Future<List<Pub>> getAllPubs() async {
    final response = await client.from('pub').select();
    return response.map((pub) => Pub.fromJson(pub)).toList();
  }





}
