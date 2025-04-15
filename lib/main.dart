import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:barfly/services/database_connection.dart';
import 'package:barfly/core/supabase_service.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
      url: dotenv.get('SUPABASE_URL'),
      anonKey: dotenv.get('SUPABASE_ANON_KEY'));
  final supabaseService = SupabaseService(client: Supabase.instance.client);
  final DatabaseConnection databaseConnection = DatabaseConnection(supabaseService: supabaseService);
  
  await databaseConnection.connectToDatabases();  


  await databaseConnection.addLog("timestamp","test","info","system");
  
  runApp(const MyApp());  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF192A56);

    return MaterialApp(
      title: 'Barfly App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          brightness: Brightness.dark,
          primary: primaryColor,
          surface: const Color(0xFF000000),          
        ),
        useMaterial3: true,
      ),
      home: const Scaffold(backgroundColor: Color(0xFF000000), body: StartPageWireframe(),) ,
    );
  }
}

class RatingPageWireframe extends StatelessWidget {
  const RatingPageWireframe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rating Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // List of Likes (Placeholder)
            const Text('Likes:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('- Like 1'),
            const Text('- Like 2'),
            const Text('- Like 3'),
            const SizedBox(height: 20),
            // Comment Function
            const Text('Comment:', style: TextStyle(fontWeight: FontWeight.bold)),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Write a comment...',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PubcrawlPlanningPageWireframe extends StatelessWidget {
  const PubcrawlPlanningPageWireframe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pubcrawl Planning'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Pubcrawl Name Field
            const TextField(
              decoration: InputDecoration(
                labelText: 'Pubcrawl Name',
              ),
            ),
            const SizedBox(height: 20),
            // List of Bars (Placeholder)
            const Text('List of Bars:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('- Bar 1'),
            const Text('- Bar 2'),
            const Text('- Bar 3'),
            const SizedBox(height: 20),
            // Share Button
            ElevatedButton(
              onPressed: () {},
              child: const Text('Share Pubcrawl'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPageWireframe extends StatelessWidget {
  const LoginPageWireframe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Email Field
            const TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 20),
            // Password Field
            const TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true, // Hide password
            ),
            const SizedBox(height: 20),
            // Login Button
            ElevatedButton(onPressed: () {}, child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}

class UserProfilePageWireframe extends StatelessWidget {
  const UserProfilePageWireframe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[300], // Placeholder color
                  shape: BoxShape.circle,
                ),
                child: const Center(child: Text('Profile\nPicture')),
              ),
            ),
            const SizedBox(height: 16),
            // Username
            const Center(
              child: Text(
                'Username',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            // Email
            const Center(child: Text('email@example.com')),
            const SizedBox(height: 16),
            // Optional Information/Preferences
            const Text('Optional Information/Preferences:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('- Music Preferences'),
            const Text('- Beer Preferences'),
            const SizedBox(height: 16),
            // Favorites List
            const Text('Favorites List:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            // Placeholder for favorites list items
            const Text('- Favorite Bar 1'),
            const Text('- Favorite Bar 2'),
            const SizedBox(height: 16),
            // Follow Function
            const Text('Follow Function:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: () {}, child: const Text('Follow')),
          ],
        ),
      ),
    );
  }
}

class BarDetailPageWireframe extends StatelessWidget{
  const BarDetailPageWireframe({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barfly App - Bar Detailseite'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name
            const Text(
              'Bar Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Address
            const Text('Bar Address'),
            const SizedBox(height: 16),
            // Images (Placeholder)
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3, // Example: 3 placeholder images
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      width: 150,
                      color: Colors.grey[300], // Placeholder color
                      child: const Center(child: Text('Image')),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            // Description
            const Text('Bar Description...'),
            const SizedBox(height: 16),
            // Opening Hours
            const Text('Opening Hours: 10:00 - 23:00'),
            const SizedBox(height: 16),
            // Ratings
            const Text('Ratings: 4.5 Stars'),
            const SizedBox(height: 16),
            // Comments (Placeholder)
            const Text('Comments:'),
            const Text('Comment 1...'),
            const Text('Comment 2...'),
            const SizedBox(height: 16),
            // Favorite Button
            ElevatedButton(onPressed: () {}, child: const Text('Favorite')),
            const SizedBox(height: 8),
            // Directions Button
            ElevatedButton(onPressed: () {}, child: const Text('Directions')),
          ],
        ),
      ),
    );
  }
}

class StartPageWireframe extends StatefulWidget {
  const StartPageWireframe({super.key});

  @override
  State<StartPageWireframe> createState() => _StartPageWireframeState();
}

class _StartPageWireframeState extends State<StartPageWireframe> {
  double _radius = 10;
  bool _nowOpen = false;
  double _openingTimeStart = 0;
  double _openingTimeEnd = 24;
  String? _selectedPriceLevel;
  String? _selectedBeerOffer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barfly App - Startseite'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Umkreis Filter
            Text('Umkreis: ${_radius.toStringAsFixed(0)} km'),
            Slider(
              value: _radius,
              min: 0,
              max: 50,
              divisions: 50,
              label: _radius.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _radius = value;
                });
              },
            ),
            const SizedBox(height: 20),
            // Preisniveau Filter
            const Text('Preisniveau:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ['€', '€€', '€€€', '€€€€']
                  .map((level) => ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedPriceLevel = level;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedPriceLevel == level
                              ? Colors.blue
                              : null,
                        ),
                        child: Text(level),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 20),
            // Bierangebot Filter
            const Text('Bierangebot:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ['Pils', 'Weizen', 'IPA', 'Kölsch']
                  .map((beer) => ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedBeerOffer = beer;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedBeerOffer == beer
                              ? Colors.blue
                              : null,
                        ),
                        child: Text(beer),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 20),
            // Öffnungszeiten Filter
            Row(
              children: [
                const Text('Jetzt geöffnet'),
                Switch(
                    value: _nowOpen,
                    onChanged: (value) {
                      setState(() {
                        _nowOpen = value;
                      });
                    }),
              ],
            ),
            Text('Geöffnet von: ${_openingTimeStart.toStringAsFixed(0)} Uhr bis ${_openingTimeEnd.toStringAsFixed(0)} Uhr'),
            RangeSlider(
              values: RangeValues(_openingTimeStart, _openingTimeEnd),
              min: 0,
              max: 24,
              divisions: 24,
              labels: RangeLabels(_openingTimeStart.toStringAsFixed(0), _openingTimeEnd.toStringAsFixed(0)),
              onChanged: (RangeValues values) {
                setState(() {
                  _openingTimeStart = values.start;
                  _openingTimeEnd = values.end;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: const Text("Event")),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => const UserProfilePageWireframe()));
              },
              child: const Text("User Profile"),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPageWireframe()));
              },
              child: const Text("Login Page"),
            ),
             const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => const PubcrawlPlanningPageWireframe()));
              },
              child: const Text("Pubcrawl Planning Page"),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const RatingPageWireframe()));
              },
              child: const Text("Rating Page"),
            )
          ],
        ),
      ),
    );
  }
}
