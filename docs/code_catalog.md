# Code-Katalog des Projekts

## Ordner: src

Dieser Ordner enthält derzeit ein Python-Modul.

### Modul: `__init__.py`

*   **Beschreibung:** Initialisierungsdatei für das `src`-Paket.
*   **Inhalt:** Leer, dient zur Markierung des Ordners als Python-Paket.

## Ordner: lib

Dieser Ordner enthält den Großteil des Dart-Codes für die Flutter-App.

### Modul: `database_admin.dart`

*   **Klassen:**
    *   `DatabaseAdmin`:
        *   **Beschreibung:** Diese Klasse dient zur manuellen Verwaltung der MongoDB-Datenbank.
        *   **Attribute:**
            *   `client` (`MongoClient`): Der MongoDB-Client.
            *   `db` (`Db`): Die MongoDB-Datenbank.
        *   **Funktionen:**
            *   `DatabaseAdmin(String uri)`: Konstruktor, initialisiert den MongoDB-Client und die Datenbank.
            *   `connect()`: Stellt die Verbindung zur Datenbank her.
            *   `create_bar_data(String collectionName, List<BarData> data)`: Fügt eine Liste von `BarData`-Objekten zu einer angegebenen Kollektion hinzu.
            * `get_collection_names()`: Gibt eine Liste der Kollektionsnamen zurück.
            *   `close()`: Schließt die Datenbankverbindung.
*   **Importe:**
    *   `package:mongo_dart/mongo_dart.dart`
    *   `package:myapp/database/mongodb/bar_data.dart`
*   **Verwendungen:**
    *   Wird in Test-Dateien importiert und benutzt.

### Modul: `main.dart`

*   **Beschreibung**: Einstiegspunkt der App. Initialisiert die App und die Datenbanken.
    *   **Funktionen:**
        *   `main()`: Einstiegspunkt der App.
    *   **Klassen:**
        * `MyApp`
    *   **Variablen:**
        * `app`: eine Instanz der MyApp Klasse.
    *   **Importe:**
        *   `package:flutter/material.dart`
        *   `package:myapp/myapp.code-workspace`

### Modul: `myapp.code-workspace`

* **Beschreibung**: Enthält die Workspace Konfiguration für die Entwicklungsumgebung und definiert die IDE einstellungen.

### Ordner: `core`

#### Modul: `config.dart`

*   **Klassen:**
    *   `Config`:
        *   **Attribute:**
            *   `mongoDbUri`: Eine Konstante, die den MongoDB-Verbindungs-URI enthält.
            *   `supabaseUrl`: Eine Konstante, die die Supabase-URL enthält.
            *   `supabaseKey`: Eine Konstante, die den Supabase-Schlüssel enthält.
*   **Verwendungen:**
    *   Wird von anderen Dateien in `core` und `database` verwendet, um auf die Datenbankverbindungsdaten zuzugreifen.
    * Wird auch von anderen Modulen importiert.

#### Modul: `event.dart`

* **Beschreibung**: Definiert die `Event` Entität.
* **Klassen**
    * `Event`:
        * **Attribute**
            *   `id`: Id des Events.
            *   `name`: Name des Events.
            *   `description`: Beschreibungs des Events.
            * `pub`: Bar zu der das Event gehört.
            * `date`: Datum des Events.
        * **Funktionen**:
            * `toJson()`: wandelt ein Event Objekt in ein Json Objekt um.
            * `fromJson(Map<String, dynamic> json)`: wandelt ein Json Objekt in ein Event Objekt um.

#### Modul: `mongodb_constants.dart`

* **Beschreibung**: Definiert die Konstanten für die MongoDB Datenbank.

#### Modul: `mongodb_connection_exception.dart`

* **Beschreibung**: Definiert die Exception für Fehler in der MongoDB Verbindung.

#### Modul: `mongodb_exception.dart`

* **Beschreibung**: Definiert die Exception für allgemeine Fehler in der MongoDB.

#### Modul: `mongodb_service.dart`

*   **Klassen:**
    *   `MongoDBService`:
        *   **Beschreibung**: Diese Klasse verwaltet die Verbindung zur MongoDB Datenbank.
        *   **Attribute:**
            *   `_client` (`MongoClient`): Der MongoDB-Client.
            *   `_db` (`Db`): Die MongoDB-Datenbank.
        *   **Funktionen:**
            *   `MongoDBService()`: Konstruktor, initialisiert die Verbindung zur MongoDB-Datenbank.
            *   `connect()`: Stellt die Verbindung zur MongoDB-Datenbank her.
            *   `close()`: Schließt die MongoDB-Datenbankverbindung.
            *   `deleteMany()`: Löscht mehrere Dokumente aus der Datenbank
            *   `getCollection()`: Gibt die angegebene Collection zurück.
*   **Variablen:**
    * `_client`: eine Instanz der `MongoClient` Klasse.
    * `_db`: eine Instanz der `Db` Klasse.
*   **Importe:**
    *   `package:mongo_dart/mongo_dart.dart`
    *   `package:myapp/core/config.dart`
    *   `package:myapp/database/mongodb/bar.dart`
    *   `package:myapp/database/mongodb/event.dart`
*   **Verwendungen:**
    *   Wird in Testdateien importiert und zum Testen der Datenbankfunktionalität genutzt.
    * Wird von anderen Modulen importiert.

#### Modul: `pub.dart`

* **Beschreibung**: Definiert die `Pub` Entität.
* **Klassen**
    * `Pub`:
        * **Attribute**
            *   `id`: Id der Bar.
            *   `name`: Name der Bar.
            *   `address`: Adresse der Bar.
        * **Funktionen**:
            * `toJson()`: wandelt ein Pub Objekt in ein Json Objekt um.
            * `fromJson(Map<String, dynamic> json)`: wandelt ein Json Objekt in ein Pub Objekt um.

#### Modul: `supabase_service.dart`

*   **Klassen:**
    *   `SupabaseService`:
        *   **Beschreibung**: Diese Klasse verwaltet die Verbindung zur Supabase Datenbank.
        *   **Attribute:**
            *   `client` (`SupabaseClient`): Der Supabase Client.
        *   **Funktionen:**
            *   `SupabaseService()`: Konstruktor, initialisiert die Verbindung zu Supabase.
            * `getAllPubs()`: holt sich alle Pubs aus Supabase.
            * `getPub(String id)`: holt sich einen Pub anhand der Id aus Supabase.
            * `addNewPub(Pub pub)`: fügt ein neues Pub zur Supabase hinzu.
            * `getAllReviews()`: holt sich alle Reviews aus Supabase.
            * `addNewReview(Review review)`: fügt eine neue Review zur Supabase hinzu.
            * `addNewBeer(Beer beer)`: fügt ein neues Bier zur Supabase hinzu.
            * `getAllBeers()`: holt sich alle Biere aus Supabase.
            * `addNewBrewery(Brewery brewery)`: fügt eine neue Brauerei zur Supabase hinzu.
            * `getAllBreweries()`: holt sich alle Brauereien aus Supabase.
            * `addNewFavorite(Favorite favorite)`: fügt ein neues Favorit zu Supabase hinzu.
            * `getAllFavorites()`: holt sich alle Favoriten aus Supabase.
            * `addNewFollow(Follow follow)`: fügt ein neues Follow zu Supabase hinzu.
            * `getAllFollows()`: holt sich alle Follows aus Supabase.
            * `close()`: Schließt die Verbindung zu Supabase.
*   **Variablen:**
    * `client`: eine Instanz der `SupabaseClient` Klasse.
*   **Importe:**
    *   `package:supabase_flutter/supabase_flutter.dart`
    * `package:myapp/core/config.dart`
    * `package:myapp/database/supabase/pub.dart`
    * `package:myapp/database/supabase/review.dart`
    * `package:myapp/database/supabase/beer.dart`
    * `package:myapp/database/supabase/brewery.dart`
    * `package:myapp/database/supabase/favorite.dart`
    * `package:myapp/database/supabase/follow.dart`
*   **Verwendungen:**
    *   Wird in Testdateien importiert und zum Testen der Datenbankfunktionalität genutzt.
    * Wird von anderen Modulen importiert.

#### Modul: `user.dart`

*   **Klassen:**
    *   `User`:
        *   **Beschreibung**: Stellt einen User dar.
        *   **Attribute:**
            *   `id`: Benutzer-ID.
            *   `name`: Benutzername.
            *   `email`: E-Mail-Adresse des Benutzers.
*   **Verwendungen:**
    *   Wird von anderen Dateien in `core` verwendet.
    * Wird von anderen Modulen importiert.

#### Modul: `database_entity.dart`

* **Beschreibung**: Definiert die `DatabaseEntity` Entität.

#### Modul: `database_service.dart`

* **Beschreibung**: Definiert die `DatabaseService` Entität.

#### Modul: `log.dart`

* **Beschreibung**: Definiert die `Log` Klasse.

#### Modul: `validation.dart`

* **Beschreibung**: Enthält Validierungs Funktionen.

### Ordner: `services`

#### Modul: `database_connection.dart`

*   **Klassen:**
    * `DatabaseConnection`:
        * **Beschreibung**: Diese Klasse dient als Brücke zu den verschiedenen Datenbanken.
        * **Funktionen:**
            * `DatabaseConnection()`: Konstruktor der Klasse.
            * `connectToMongoDB(String uri)`: Stellt die Verbindung zu der MongoDB her.
            * `connectToSupabase(String url, String key)`: Stellt die Verbindung zu der Supabase her.
*   **Importe:**
    *   `package:myapp/core/mongodb_service.dart`
    *   `package:myapp/core/supabase_service.dart`
    *   `package:myapp/core/config.dart`
*   **Verwendungen:**
    * Wird von anderen Modulen importiert.

### Ordner: `database`

#### Unterordner: `mongodb`

##### Modul: `bar_data.dart`

*   **Klassen:**
    *   `BarData`:
        *   **Attribute:**
            *   `id`: Id der Bar.
            *   `name`: Name der Bar.
            *   `adresse`: Adresse der Bar.
        * **Funktionen:**
            * `toJson()`: wandelt ein BarData Objekt in ein Json Objekt um.
            * `fromJson(Map<String, dynamic> json)`: wandelt ein Json Objekt in ein BarData Objekt um.
*   **Verwendungen:**
    *   Wird von `database_admin.dart` verwendet, um `BarData`-Objekte zu verarbeiten.
    * Wird von anderen Modulen importiert.

##### Modul: `event.dart`

*   **Klassen:**
    *   `Event`:
        *   **Attribute:**
            *   `id`: Id des Events.
            *   `name`: Name des Events.
            *   `description`: Beschreibungs des Events.
            * `pub`: Bar zu der das Event gehört.
            * `date`: Datum des Events.
        * **Funktionen:**
            * `toJson()`: wandelt ein Event Objekt in ein Json Objekt um.
            * `fromJson(Map<String, dynamic> json)`: wandelt ein Json Objekt in ein Event Objekt um.
*   **Verwendungen:**
    *   Wird von `mongodb_service.dart` verwendet, um Event Objekte zu verarbeiten.
    * Wird von anderen Modulen importiert.

##### Modul: `pub.dart`

*   **Klassen:**
    *   `Pub`:
        *   **Attribute:**
            *   `id`: Id der Bar.
            *   `name`: Name der Bar.
            *   `address`: Adresse der Bar.
        * **Funktionen:**
            * `toJson()`: wandelt ein Pub Objekt in ein Json Objekt um.
            * `fromJson(Map<String, dynamic> json)`: wandelt ein Json Objekt in ein Pub Objekt um.
*   **Verwendungen:**
    *   Wird von `mongodb_service.dart` verwendet, um Pub Objekte zu verarbeiten.
    * Wird von anderen Modulen importiert.

##### Modul: `mongodb_constants.dart`

* **Beschreibung**: Definiert die Konstanten für die MongoDB Datenbank.

##### Modul: `mongodb_log.dart`

* **Beschreibung**: Definiert die Log Klasse für MongoDB.

#### Unterordner: `supabase`

##### Modul: `bar.dart`

*   **Klassen:**
    *   `Bar`:
        *   **Attribute:**
            *   `id`: Id der Bar.
            *   `name`: Name der Bar.
            *   `address`: Adresse der Bar.
        * **Funktionen:**
            * `toJson()`: wandelt ein Bar Objekt in ein Json Objekt um.
            * `fromJson(Map<String, dynamic> json)`: wandelt ein Json Objekt in ein Bar Objekt um.
*   **Verwendungen:**
    *   Wird von anderen Modulen benutzt.
    * Wird von anderen Modulen importiert.

##### Modul: `beer.dart`

*   **Klassen:**
    *   `Beer`:
        *   **Attribute:**
            *   `id`: Id des Biers.
            *   `name`: Name des Biers.
            *   `brewery`: Brauerei des Biers.
        * **Funktionen:**
            * `toJson()`: wandelt ein Beer Objekt in ein Json Objekt um.
            * `fromJson(Map<String, dynamic> json)`: wandelt ein Json Objekt in ein Beer Objekt um.
*   **Verwendungen:**
    *   Wird von `supabase_service.dart` verwendet, um Beer Objekte zu verarbeiten.
    * Wird von anderen Modulen importiert.

##### Modul: `brewery.dart`

*   **Klassen:**
    *   `Brewery`:
        *   **Attribute:**
            *   `id`: Id der Brauerei.
            *   `name`: Name der Brauerei.
            * `location`: Ort der Brauerei.
        * **Funktionen:**
            * `toJson()`: wandelt ein Brewery Objekt in ein Json Objekt um.
            * `fromJson(Map<String, dynamic> json)`: wandelt ein Json Objekt in ein Brewery Objekt um.
*   **Verwendungen:**
    *   Wird von `supabase_service.dart` verwendet, um Brewery Objekte zu verarbeiten.
    * Wird von anderen Modulen importiert.

##### Modul: `favorite.dart`

*   **Klassen:**
    *   `Favorite`:
        *   **Attribute:**
            *   `id`: Id des Favoriten.
            *   `user`: User des Favoriten.
            * `pub`: Bar des Favoriten.
        * **Funktionen:**
            * `toJson()`: wandelt ein Favorite Objekt in ein Json Objekt um.
            * `fromJson(Map<String, dynamic> json)`: wandelt ein Json Objekt in ein Favorite Objekt um.
*   **Verwendungen:**
    *   Wird von `supabase_service.dart` verwendet, um Favorite Objekte zu verarbeiten.
    * Wird von anderen Modulen importiert.

##### Modul: `follow.dart`

*   **Klassen:**
    *   `Follow`:
        *   **Attribute:**
            *   `id`: Id des Follows.
            *   `follower`: Follower des Follows.
            * `followed`: Gefolgter des Follows.
        * **Funktionen:**
            * `toJson()`: wandelt ein Follow Objekt in ein Json Objekt um.
            * `fromJson(Map<String, dynamic> json)`: wandelt ein Json Objekt in ein Follow Objekt um.
*   **Verwendungen:**
    *   Wird von `supabase_service.dart` verwendet, um Follow Objekte zu verarbeiten.
    * Wird von anderen Modulen importiert.

##### Modul: `pub.dart`

*   **Klassen:**
    *   `Pub`:
        *   **Attribute:**
            *   `id`: Id der Bar.
            *   `name`: Name der Bar.
            * `location`: Ort der Bar.
        * **Funktionen:**
            * `toJson()`: wandelt ein Pub Objekt in ein Json Objekt um.
            * `fromJson(Map<String, dynamic> json)`: wandelt ein Json Objekt in ein Pub Objekt um.
*   **Verwendungen:**
    *   Wird von `supabase_service.dart` verwendet, um Pub Objekte zu verarbeiten.
    * Wird von anderen Modulen importiert.

##### Modul: `review.dart`

*   **Klassen:**
    *   `Review`:
        *   **Attribute:**
            *   `id`: Id des Reviews.
            *   `user`: User des Reviews.
            * `pub`: Bar des Reviews.
            * `rating`: Bewertung des Reviews.
            * `text`: Text des Reviews.
        * **Funktionen:**
            * `toJson()`: wandelt ein Review Objekt in ein Json Objekt um.
            * `fromJson(Map<String, dynamic> json)`: wandelt ein Json Objekt in ein Review Objekt um.
*   **Verwendungen:**
    *   Wird von `supabase_service.dart` verwendet, um Review Objekte zu verarbeiten.
    * Wird von anderen Modulen importiert.

##### Modul: `users.dart`

*   **Klassen:**
    *   `Users`:
        *   **Attribute:**
            *   `id`: Id des Users.
            *   `name`: Name des Users.
*   **Verwendungen:**
    *   Wird von anderen Modulen benutzt.
    * Wird von anderen Modulen importiert.

## Ordner: features

Dieser Ordner enthält die Dart-Dateien, die die einzelnen Features der App implementieren.

### Ordner: `event`

#### Modul: `event_detail.dart`

*   **Klassen:**
    *   Enthält Klassen und Widgets für die Detailansicht eines Events.
* **Verwendungen**:
    * Wird von anderen Modulen importiert.

#### Modul: `event_list.dart`

*   **Klassen:**
    *   Enthält Klassen und Widgets für die Liste der Events.
* **Verwendungen**:
    * Wird von anderen Modulen importiert.

### Ordner: `pub`

#### Modul: `pub_detail.dart`

*   **Klassen:**
    *   Enthält Klassen und Widgets für die Detailansicht eines Pubs.
* **Verwendungen**:
    * Wird von anderen Modulen importiert.

#### Modul: `pub_list.dart`

*   **Klassen:**
    *   Enthält Klassen und Widgets für die Liste der Pubs.
* **Verwendungen**:
    * Wird von anderen Modulen importiert.

### Ordner: `auth`

#### Ordner: `login`

##### Modul: `login_form.dart`

* **Klassen**:
    * `LoginForm`: Widget, das das Login-Formular darstellt.
* **Verwendungen**:
    * Wird von `login_page.dart` verwendet.

##### Modul: `login_page.dart`

* **Klassen**:
    * `LoginPage`: Widget, das die Login-Seite darstellt.
* **Verwendungen**:
    * Wird von anderen Modulen importiert.

#### Ordner: `profile`

##### Modul: `profile_page.dart`

* **Klassen**:
    * `ProfilePage`: Widget, das die Profilseite darstellt.
* **Verwendungen**:
    * Wird von anderen Modulen importiert.

#### Ordner: `register`

##### Modul: `register_form.dart`

* **Klassen**:
    * `RegisterForm`: Widget, das das Registrierungsformular darstellt.
* **Verwendungen**:
    * Wird von `register_page.dart` verwendet.

##### Modul: `register_page.dart`

* **Klassen**:
    * `RegisterPage`: Widget, das die Registrierungsseite darstellt.
* **Verwendungen**:
    * Wird von anderen Modulen importiert.

## Ordner: test

Dieser Ordner enthält Testdateien für die Flutter-App.

### Ordner: `core`

#### Modul: `concurrent_database_connection_test.dart`

* **Funktionen:**
    * Enthält Testfunktionen um die parallele Verbindung der Datenbanken zu testen.

#### Modul: `mongodb_service_test.dart`

*   **Funktionen:**
    *   Enthält Testfunktionen für den `MongoDBService`.
* **Importe:**
    *   `package:flutter_test/flutter_test.dart`
    *   `package:myapp/core/mongodb_service.dart`
    *   `package:myapp/database/mongodb/bar.dart`
    *   `package:myapp/database/mongodb/event.dart`
    * `package:myapp/core/config.dart`
* **Verwendungen**:
    * Enthält Testfunktionen, die die Funktionalitäten aus `mongodb_service.dart` aufrufen.

#### Modul: `supabase_initializer_test.dart`

* **Funktionen:**
    * Enthält Testfunktionen um die Initialisierung der Supabase Verbindung zu testen.

#### Modul: `supabase_service_test.dart`

*   **Funktionen:**
    *   Enthält Testfunktionen für den `SupabaseService`.
* **Importe:**
    *   `package:flutter_test/flutter_test.dart`
    *   `package:myapp/core/supabase_service.dart`
    *   `package:myapp/database/supabase/bar.dart`
    *   `package:myapp/database/supabase/beer.dart`
    *   `package:myapp/database/supabase/brewery.dart`
    *   `package:myapp/database/supabase/favorite.dart`
    *   `package:myapp/database/supabase/follow.dart`
    *   `package:myapp/database/supabase/pub.dart`
    *   `package:myapp/database/supabase/review.dart`
    * `package:myapp/core/config.dart`
* **Verwendungen**:
    * Enthält Testfunktionen, die die Funktionalitäten aus `supabase_service.dart` aufrufen.

### Ordner: `database`

#### Modul: `mongodb_connection_test.dart`

* **Funktionen:**
    * Enthält Testfunktionen für die MongoDB Verbindung.

#### Modul: `supabase_connection_test.dart`

* **Funktionen:**
    * Enthält Testfunktionen für die Supabase Verbindung.

#### Modul: `database_test.dart`

* **Funktionen:**
    * Enthält Testfunktionen für die Datenbank.

### Ordner: `widget`

#### Modul: `test_bar_details.dart`

* **Verwendungen**:
    * Enthält Testfunktionen für die Darstellung der Bar Details.

#### Modul: `test_filter_widgets.dart`

* **Verwendungen**:
    * Enthält Testfunktionen für die Darstellung der Filter Widgets.

#### Modul: `test_list_widget.dart`

* **Verwendungen**:
    * Enthält Testfunktionen für die Darstellung der Liste Widgets.

#### Modul: `test_login_register.dart`

* **Verwendungen**:
    * Enthält Testfunktionen für die Darstellung des Login und Register Widgets.

#### Modul: `test_map_widget.dart`

* **Verwendungen**:
    * Enthält Testfunktionen für die Darstellung des Map Widgets.

#### Modul: `test_navigation_widget.dart`

* **Verwendungen**:
    * Enthält Testfunktionen für die Darstellung der Navigation Widgets.

### Ordner: `features`

#### Ordner: `pub`

##### Modul: `pub_detail_test.dart`

* **Verwendungen**:
    * Enthält Testfunktionen für das pub_detail feature.

##### Modul: `pub_list_test.dart`

* **Verwendungen**:
    * Enthält Testfunktionen für das pub_list feature.