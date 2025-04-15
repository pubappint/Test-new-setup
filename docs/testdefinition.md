# Testdefinition für die Bar-Finder-App

Diese Testdefinition basiert auf der in `docs/teststrategie.md` formulierten Teststrategie und definiert die konkreten Tests, die für die Bar-Finder-App angelegt werden sollen.

## 1. Unit-Tests

*   **Ziel:** Überprüfung der kleinsten, isolierten Einheiten.
*   **Fokus:** Logik, Algorithmen, Datenverarbeitung.
*   **Zu testende Aspekte:**
    *   **Filterlogik:**
        *   Korrekte Anwendung von Filtern (Umkreis, Preisniveau, Bierangebot, Öffnungszeiten, Events).
        *   Kombination von Filtern.
        *   Handhabung von ungültigen Filterwerten.
        *   Korrekte Abfrage von bestimmten Filtern.
    *   **Berechnungen:**
        *   Distanzberechnung zwischen Benutzer und Bars.
        *   Berechnung des Durchschnittspreises für Preisniveau.
        *   Berechnung des Durchschnitts von den Bewertungen.
    *   **Datenvalidierung:**
        *   Validierung von Eingabedaten (z.B. korrekte E-Mail-Formatierung, Passwortstärke).
        *   Validierung von Bar-Daten.
        *   Validierung von Event-Daten.
        *   Validierung von Nutzer-Daten.
    *   **Datenverarbeitung:**
        *   Die Daten aus der Datenbank werden richtig verarbeitet und weiter gegeben.
        *   Überprüfung ob nur die richtige Art von Daten gegeben werden.

*   **Beispiele:**
    *   `testFilterByRadius()`: Testet, ob die Filterung nach Umkreis korrekt funktioniert.
    *   `testFilterByPriceLevel()`: Testet, ob die Filterung nach Preisniveau korrekt funktioniert.
    *   `testCalculateDistance()`: Testet die Berechnung der Distanz zwischen zwei Koordinaten.
    *   `testValidateEmailFormat()`: Testet die Validierung der E-Mail-Formatierung.
    *   `testValidateBarData()`: Testet die Validierung der Bar Daten.
    *   `testFilterByBrewery()`: Testet, ob nach Brauerei gefiltert werden kann.
    *   `testFilterByBeerType()`: Testet, ob nach Biersorte gefiltert werden kann.
    *   `testFilterByTapOrBottle()`: Testet, ob nach Zapf/Flasche gefiltert werden kann.

## 2. Widget-Tests

*   **Ziel:** Überprüfung einzelner Widgets auf Verhalten und Darstellung.
*   **Fokus:** UI-Logik, Rendering, Interaktion.
*   **Zu testende Aspekte:**
    *   **Bar-Detailansicht:**
        *   Korrekte Anzeige aller Informationen (Name, Adresse, Öffnungszeiten, Beschreibung, Bilder, etc.).
        *   Korrekte Darstellung des Bewertungssystems.
        *   Korrekte Darstellung der Kommentare.
        *   Korrekte Anzeige der Öffnungszeiten.
    *   **Filter-Widgets:**
        *   Korrekte Darstellung der Filteroptionen.
        *   Korrekte Reaktion auf Benutzereingaben (z.B. Schieberegler, Checkboxen).
        *   Korrekte Aktualisierung der Anzeige nach Filteränderung.
    *   **Karten-Widget:**
        *   Korrekte Anzeige der Karte.
        *   Korrekte Darstellung der Bar-Marker.
    *   **Listen-Widget:**
        *   Korrekte Darstellung der Listen.
        *   Korrekte Reaktion auf Benutzereingaben.
    *   **Navigations-Widget**
        *   Das Navigations-Widget zeigt die richtige Seite an.
    *   **Login/Register**
        *   Die Formularfelder für Login und Register sind vorhanden.
        *   Die Felder zeigen die richtige Art der Eingabe.

*   **Beispiele:**
    *   `testBarDetailsDisplay()`: Testet die korrekte Anzeige der Bar-Details.
    *   `testFilterWidgetsInteraction()`: Testet die Interaktion mit den Filter-Widgets.
    *   `testMapWidgetMarkers()`: Testet die korrekte Darstellung der Bar-Marker auf der Karte.
    *   `testListWidgetDisplay()`: Testet die korrekte Darstellung der Listen.
    *   `testNavigationWidget()`: Testet ob die Navigation zu der richtigen Seite navigiert.
    *   `testLoginForm()`: Testet ob das Login Formular vorhanden ist.
    *   `testRegisterForm()`: Testet ob das Register Formular vorhanden ist.

## 3. Integrationstests

*   **Ziel:** Überprüfung des Zusammenspiels verschiedener Komponenten.
*   **Fokus:** Kommunikation, Datenübergabe, UI-Integration.
*   **Zu testende Aspekte:**
    *   **Filter-Integration:**
        *   Zusammenspiel von Filter-Widgets, Filterlogik und Datenservice.
        *   Korrekte Filterung der Bars basierend auf den ausgewählten Filtern.
    *   **UI-Daten-Integration:**
        *   Korrekte Anzeige von gefilterten und ungefilterten Daten.
        *   Korrekte Aktualisierung der UI nach Filteränderungen.
    *   **Datenübergabe:**
        *   Korrekte Übergabe von Bar-Daten von der Datenbank zur UI.
        *   Korrekte Übergabe von Nutzerdaten.
        *   Korrekte Übergabe von Event Daten.
    *   **Datenbank:**
        *   Die Verbindung zu beiden Datenbanken funktioniert.

*   **Beispiele:**
    *   `testFilterIntegration()`: Testet das Zusammenspiel der Filter-Widgets mit der Filterlogik und dem Datenservice.
    *   `testDataDisplayAfterFiltering()`: Testet die korrekte Anzeige der gefilterten Bars in der UI.
    *   `testBarDataTransfer()`: Testet die korrekte Übergabe von Bar-Daten von der Datenbank zur UI.
    *   `testDatabaseConnection()`: Testet die Verbindung zu der MongoDB und Supabase.

## 4. Datenbanktests

*   **Ziel:** Überprüfung der Interaktion mit der Datenbank.
*   **Fokus:** Datenkonsistenz, Datenintegrität, Abfragen.
*   **Zu testende Aspekte:**
    *   **Bar-Abfragen:**
        *   Korrekte Abfrage von Bars nach verschiedenen Kriterien.
        *   Korrekte Abfrage von Bar-Details.
        *   Korrekte Abfrage von Favoriten
        *   Korrekte Abfrage von Bewertung
    *   **Event-Abfragen:**
        *   Korrekte Abfrage von Events für eine bestimmte Bar.
        *   Korrekte Abfrage von allen Events.
    *   **Nutzer-Abfragen:**
        *   Korrekte Abfrage von Nutzerprofilen.
    *   **Datenänderungen:**
        *   Korrekte Anlage von Bars in der Datenbank.
        *   Korrekte Anlage von Events in der Datenbank.
        *   Korrekte Anlage von neuen Nutzern.
        *   Korrektes hinzufügen von neuen Bewertungen.
        *   Korrektes hinzufügen von neuen Favoriten.
        *   Korrektes löschen von Einträgen.

*   **Beispiele:**
    *   `testGetBarsByFilter()`: Testet die korrekte Abfrage von Bars basierend auf Filtern.
    *   `testGetBarDetails()`: Testet die korrekte Abfrage der Details einer bestimmten Bar.
    *   `testGetEventsForBar()`: Testet die korrekte Abfrage der Events für eine bestimmte Bar.
    *   `testAddBar()`: Testet das korrekte Anlegen einer neuen Bar in der Datenbank.
    *   `testAddEvent()`: Testet das korrekte Anlegen eines neuen Events in der Datenbank.
    *   `testAddUser()`: Testet das korrekte Anlegen eines neuen Nutzers in der Datenbank.
    *   `testGetFavorits()`: Testet das korrekte abfragen der Favoriten.
    *   `testAddRating()`: Testet das korrekte hinzufügen einer neuen Bewertung.
    *   `testDeleteBar()`: Testet das korrekte löschen einer Bar.

## 5. UI-Tests/End-to-End-Tests (E2E)

*   **Ziel:** Überprüfung der gesamten App.
*   **Fokus:** Benutzer-Workflows, Funktionalität aus Benutzersicht.
*   **Zu testende Aspekte:**
    *   **Bar-Suche und -Filterung:**
        *   Kompletter Workflow: Suche nach Bars, Anwendung von Filtern, Anzeige der Ergebnisse, Anzeige von Details.
    *   **Favoriten:**
        *   Hinzufügen von Bars zu den Favoriten.
        *   Anzeige der Favoritenliste.
    *   **Bewertungen:**
        *   Bewertung einer Bar.
    *   **Anmelden/Registrieren:**
        *   Kompletter Workflow des Anmelde und Registrierungsprozess.
    *   **Navigation:**
        *   Testen der Navigation der App.

*   **Beispiele:**
    *   `testSearchAndFilterWorkflow()`: Testet den kompletten Workflow der Bar-Suche und -Filterung.
    *   `testAddToFavorites()`: Testet das Hinzufügen einer Bar zu den Favoriten.
    *   `testAddRating()`: Testet das hinzufügen einer Bewertung zu einer Bar.
    *   `testLogin()`: Testet den gesamten Login Prozess.
    *   `testRegister()`: Testet den gesamten Registrierungs Prozess.
    *   `testNavigation()`: Testet die Navigation zwischen den verschiedenen Seiten.

## MongoDB Teststrategie

Diese Teststrategie beschreibt, wie die verschiedenen Methoden in der `MongoDbService` Klasse getestet werden.

*   **connect()**: Hier wird getestet, ob eine Verbindung zur Datenbank hergestellt werden kann.
*   **close()**: Hier wird getestet, ob die Datenbank Verbindung korrekt geschlossen werden kann.
*   **insert()**: Hier wird getestet, ob ein Objekt korrekt in die Datenbank eingefügt werden kann.
    *   Zusätzlich wird hier auch überprüft, ob die Methode die richtige Id zurück gibt.
*   **getById()**: Hier wird getestet, ob ein Objekt mit der richtigen Id abgerufen werden kann.
*   **getAll()**: Hier wird getestet, ob alle Daten korrekt abgefragt werden.
*   **changeLogLevel()**: Hier wird getestet, ob die Log Level korrekt geändert werden können.
* **deleteMany()**: hier wird getestet, ob alle Einträge korrekt aus der Datenbank gelöscht werden.

Für jeden Test wird die Datenbank am anfang zurück gesetzt. So werden Probleme durch alte Daten vermieden.



