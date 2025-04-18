---

**App-Konzept: Bar-Finder**

**Filter:**

*   **Umkreis:**
    *   **Filtertyp:** Schieberegler
    *   **Wertebereich:** 0 Meter bis 50 Kilometer
    *   **Funktionsweise:** Der Nutzer kann den gewünschten Umkreis stufenlos mit einem Schieberegler zwischen 0 und 50 Kilometern einstellen.
*   **Preisniveau:**
    *   **Filtertyp:** Kategorien
    *   **Kategorien:** €, €€, €€€€ (vier Stufen)
    *   **Funktionsweise:** Die Kategorisierung erfolgt relativ zu allen anderen angezeigten Bars, unter Berücksichtigung aller aktiven Filter.
*   **Bierangebot:**
    *   **Ergänzung durch Nutzer:**
        *   **Möglichkeit zum Anlegen:** Nutzer können komplett neue Biersorten mit allen erforderlichen Informationen anlegen, falls diese noch nicht vorhanden sind.
        *   **Bearbeitung bestehender Einträge:** Nutzer können vorhandene Informationen zu Biersorten ergänzen oder editieren.
        *   **Prinzip:** Ähnlich wie Wikipedia.
    *   **Datenstruktur**:
        *   **Brauerei**:
            *   Wird in einer separaten Liste gepflegt.
            *   Die Liste kann über den Namen der Brauerei hinaus weitere Informationen enthalten.
            *   Es wird die möglichkeit geben, neue Brauereien an zu legen.
        *   **Sorte**:
            *   Name: Freitext.
            *   Verknüpfung: Fixe Verknüpfung zu anderen relevanten Tabellen (z.B. Brauerei, Bierarten).
            *   Bierarten: Es soll eine Liste von Bierarten geben, um die Suche zu erleichtern.
        *   **Größe**:
            *   Feste Liste mit Standardgrößen.
            *   Die Liste ist erweiterbar, falls neue Größen hinzugefügt werden müssen.
        *   **Zapf/Flasche**:
            *   Auswahlmöglichkeit zwischen "Vom Fass" und "Flasche".
            *   Enge Verknüpfung mit der Größe oder gemeinsame Pflege in einer Tabelle.
        *   **Preis**:
            *   Der Preis wird pro Größe angegeben.
    *   **Filterung**:
        *   Biersorte (z.B. Pils, Weizen, IPA)
        *   Brauerei (z.B. Augustiner, Paulaner)
        *   Zapf/Flasche (z.B. Vom Fass, Flasche)
*   **Öffnungszeit / "Jetzt geöffnet":**
    *   **Filtertyp:** Zwei separate Filter
        *   **"Jetzt geöffnet"-Filter:**
            *   **Typ:** Boolean (An/Aus)
            *   **Funktionsweise:** Zeigt nur Bars an, die zum aktuellen Zeitpunkt geöffnet haben.
        *   **Zeitraum-Filter:**
            *   **Typ:** Schieberegler
            *   **Funktionsweise:** Ermöglicht die Auswahl eines Zeitraums (z.B. 18:00 - 02:00 Uhr). Die App zeigt dann Bars an, die in diesem Zeitraum geöffnet haben.
*   **Event:**
    *   **"Event aktiv"-Button:**
        *   **Funktion:** Genereller Schalter.
        *   **Anzeige:** Zeigt alle Bars mit laufenden Events an, unabhängig von der Event-Art.
    *   **Event-Anzeige auf der Karte:**
        *   **Keine spezielle Markierung:** Auf der Karte gibt es keine gesonderte Kennzeichnung für Bars mit aktiven Events.
        *   **Filterabhängig:** Die Anzeige von Bars mit Events wird ausschließlich durch den aktiven Filter "Event aktiv" gesteuert.
    *   **Event-Detailansicht:**
        *   **Möglichkeit 1: Auswahl auf der Karte:**
            *   Der Nutzer wählt eine Bar auf der Karte aus.
            *   Es werden Detailinformationen zur Bar angezeigt.
            *   Unter den Detailinformationen zur Bar wird das aktive Event (falls vorhanden) angezeigt.
        *   **Möglichkeit 2: Listendarstellung:**
            *   Der Nutzer kann sich eine Liste der Bars mit aktiven Events anzeigen lassen.
            *   Die Liste enthält dann die wichtigsten Informationen zum Event und zur Bar.
    *   **Event-Arten:**
        *   **Beispielhafte Liste:**
            *   Live-Musik
            *   DJ
            *   Themenabende
            *   Sportübertragungen
        *   **Erweiterbarkeit:** Die Liste der Event-Arten ist in der Entwicklung erweiterbar.

**Bar-Profil:**

    *   **Zusätzliche Informationen (geplant, aber nicht im ersten Entwurf):**
        *   Bilder der Bar
        *   Beschreibungstext der Bar
        *   Bewertungen und Kommentare
    *   **Barbetreiber-Verwaltung:**
        *   Barbetreiber sollen ihre Profile selbst verwalten und aktualisieren können.
        *   Kennzeichnung: Informationen, die vom Barbetreiber stammen, sollen entsprechend gekennzeichnet werden.
    *   **Favoriten:**
        *   Nutzer können Bars als Favoriten markieren.
        *   Favorisierte Bars werden in einer Merkliste gespeichert.

**Nutzerprofile:**
    *   Nutzerprofile sind eine Grundvoraussetzung zur Nutzung der App.
        *   **Pflichtangaben:**
            *   E-Mail-Adresse
            *   Passwort (gesichert gespeichert)
            *   Benutzername
        *   **Optionale Angaben/Präferenzen:**
            *   **Musik-Vorlieben:** (z.B. Live-Musik, DJ, Charts, Rock, etc.)
            *   **Bier-Vorlieben:** (z.B. Pils, Weizen, IPA, Lager, etc.)
            *   **Favoriten:** (Liste der favorisierten Bars)
            *   **Bewertungen:** (Liste der abgegebenen Bewertungen für Bars)
            * **Aktive Events:** (Liste der Events an denen der Nutzer teilgenommen hat)
         *   **Filterung:** Die Nutzer können über diese Vorlieben gefiltert werden.
         *   **Erweiterbarkeit:** Die Liste der Vorlieben kann erweitert werden, um ein besseres Ergebnis zu liefern.
    * **Follow-Funktion:** Nicht im ersten Entwurf enthalten.
     * **Empfehlungen basierend auf übereinstimmenden Interessen:**  Spannendes Feature für später. Nutzer sollen Vorschläge für Bars erhalten, die ihren Interessen entsprechen.

**Bewertungen und Kommentare:**
* Es soll eine Möglichkeit geben, Bars zu bewerten und zu kommentieren.
*   **Bewertungssystem (erster Entwurf):**
    *   Likes
*   **Bewertungssystem (später):**
    *   Umfangreicheres System mit Punkten für:
        *   Service
        *   Qualität des Angebots
        *   Sauberkeit der Toiletten
        *   ... weitere Punkte sind denkbar
* **Moderation:** Die Kommentare der Nutzer sollen moderiert werden.

**Datenbank-Befüllung:**
    *   **Regionale Begrenzung:** Für eine Beta-Phase wird die Datenbank-Befüllung regional auf Deutschland begrenzt.
    *   **Datenquelle:**
        *   **OpenStreetMap (OSM):** Ausschließlich.
    * **Ziel:** Einheitliche Datenstruktur und Förderung der Community-basierten Datengenerierung.
    * **Keine realen Kosten:** Der Prototyp soll keine Kosten verursachen.
    * **Vorgehen:** Die Daten müssen nach der Beschaffung geprüft und angepasst werden.

**Wegbeschreibung/Navigation:**
    *   Es soll eine Funktion geben, die es dem Nutzer ermöglicht, sich zur Bar navigieren zu lassen.
*   **Pubcrawl-Planung (später):**
    *   Die Funktion soll erweiterbar sein, um einen Pubcrawl zu planen.
    *   Es soll die Möglichkeit geben, den geplanten Pubcrawl mit anderen Nutzern zu teilen.
**Reservierungen:**
    *   Nicht im ersten Entwurf enthalten.
    *   Späteres Feature.
**Datenverifizierung**
* Da wir uns nun auf die community verlassen, ist es umso wichtiger diese zu prüfen.
* Es soll eine überprüfung geben.
    *   **Stufe 1: Moderation:** Moderatoren filtern und löschen offensichtlich falsche Einträge.
    *   **Stufe 2: Community-Verifizierung:** Zusätzliche Verifizierung durch andere Nutzer.
---

**MongoDB Test Strategie und Probleme**

Die Tests für die MongoDB-Verbindung wurden mit dem Ziel entwickelt, die grundlegenden Operationen (CRUD - Create, Read, Update, Delete) zu überprüfen und sicherzustellen, dass die Datenbank korrekt angesprochen werden kann.

**Test Strategie**

1. **Verbindungstest:** Überprüfung, ob die App eine Verbindung zur MongoDB-Datenbank herstellen kann.
2. **Einfügetest (`insert`):** Test, ob ein neues Dokument erfolgreich in eine Collection eingefügt werden kann. Hier wird ebenfalls überprüft, ob die `_id` korrekt gespeichert und zurückgegeben wird.
3. **Abruftest (`getAll`):** Test, ob alle Dokumente einer Collection korrekt abgerufen werden können.
4. **Abruftest (`getById`):** Test, ob ein Dokument anhand seiner `_id` korrekt abgerufen werden kann.
5. **Löschtest (`deleteMany`)**: Test ob mehrere Dokumente gelöscht werden können.
6. **LogLevel Test**: Testet ob die Log Level angepasst werden können.
7. **Schließen der Verbindung:** Überprüfung, ob die Verbindung zur Datenbank korrekt geschlossen werden kann.

**Probleme**

Bei der Implementierung der Tests sind mehrere Probleme aufgetreten, die in mehreren Iterationen behoben werden mussten. Das größte Problem war die korrekte Handhabung der `ObjectId`. Am Anfang wurde diese als String verwendet, obwohl diese ein Objekt war. Dies führte zu Problemen beim Einfügen und Abrufen der Dokumente. Ebenfalls gab es Probleme, da die Object Id immer wieder umgewandelt wurde. Um diese Fehler zu vermeiden, müssen wir in den Tests und den Methoden darauf achten, das nicht umgewandelt wird.
Ein weiteres Problem war das Zurücksetzen der Datenbank vor jedem Test. Am Anfang wurde nicht beachtet, dass die Tests parallel laufen, und sich dadurch überschneiden. Dies wurde durch eine Löschung aller Dokumente vor jedem Test behoben.
Ebenso gab es Probleme mit der Implementierung der Methoden. Hier gab es öfter Fehler, da Methoden aufgerufen wurden, die es nicht gab.

Nach vielen Iterationen und Anpassungen können nun alle Tests für die MongoDB korrekt durchgeführt werden.

**Supabase Init Test**

Um sicherzustellen, dass die Verbindung zur Supabase-Datenbank korrekt initialisiert wird, haben wir einen Test in `main.dart` hinzugefügt. Dieser Test überprüft, ob die Supabase-Verbindung erfolgreich hergestellt wurde, wenn die App startet. Diese Änderung dient als Grundlage, um weitere Funktionen von Supabase zu testen.

**Concurrent Database Connection Test**

Um sicherzustellen, dass sowohl die MongoDB- als auch die Supabase-Datenbank parallel korrekt initialisiert werden können, wurde der Testfall `concurrent_database_connection_test.dart` erstellt. Dieser Test überprüft, ob beide Datenbankverbindungen gleichzeitig aufgebaut werden können und am Ende korrekt geschlossen werden. Dazu werden die `initialize()` und `close()` Methoden der Datenbank-Services aufgerufen und deren `isConnected` Status überprüft.


Die Tests zur sicherstellung der Verbindungen zu den einzelen Datenbanken befinden sich in den Dateien "test/database/mongodb_connection_test.dart" und "test/database/supabase_connection_test.dart". Diese stellen sicher, dass die Verbindung zu den jeweiligen Datenbanken einzeln erfolgreich aufgebaut werden kann. Mit der Datei "test/core/concurrent_database_connection_test.dart" ist sicher gestellt, dass die Verbindungen auch parallel aufgebaut werden können. Dies wurde in mehreren Iterationen geprüft. Das Ergebnis ist, dass die Verbindungen sowohl einzeln, als auch paralell ohne Probleme aufgebaut werden können.




**Supabase Init Test**
Um sicherzustellen, dass die Verbindung zur Supabase-Datenbank korrekt initialisiert wird, haben wir einen Test in `main.dart` hinzugefügt. Dieser Test überprüft, ob die Supabase-Verbindung erfolgreich hergestellt wurde, wenn die App startet. Diese Änderung dient als Grundlage, um weitere Funktionen von Supabase zu testen.



**Weitere offene Punkte:**

*   **Technologie-Stack:**
    *   **Programmiersprache:** Dart
    *   **Framework:** Flutter. Die Supabase-Datenbank wird direkt über das Flutter-Paket angesprochen.
    *   **Plattformen:** Android und iOS
*   **Datenbank:**
    *   **Relationale Daten:** Supabase. Die Verbindung zur Supabase Datenbank wird direkt mit dem Flutter-Paket hergestellt. Es wird **kein Python** benötigt, um mit der Supabase Datenbank zu interagieren.
    *   **Nicht-relationale Daten:** MongoDB
    *   **Hosting:** Online (für beide Datenbanken)
*   **Schnittstellen:**
     * **Supabase**: Für die Interaktion mit Supabase wird das Flutter Paket verwendet.
    * **Python:** Es wird **kein** Python verwendet.
    *   **Kartendienst:**
        *   **Leaflet:** Für die Darstellung der Karte.
        *   **OSRM:** Für die Wegbeschreibung.
    * **Soziale Netzwerke:**
        * Keine Schnittstelle im ersten Entwurf.
        * Späteres Feature.
    *   **Reservierungssysteme:**
        *   Keine Schnittstelle im ersten Entwurf.
        *   Späteres Feature.
*   **Monetarisierung:**
    *   **Aktuell:** Keine aktive Monetarisierung.
    *   **Spenden:** Option für Nutzer, freiwillig zu spenden.
    *   **Optionen für später:**
        *   **Freemium-Modell:** Premium-Features gegen Bezahlung.
        *   **Affiliate-Marketing:** Provisionen durch Vermittlung.
     * **Datenanalyse**: Eine weitere Möglichkeit, die für später interessant ist.
     * **Werbung**: Möglich, soll aber vorerst nicht verwendet werden.
*   **Design:**
    *   Gibt es schon Design-Vorstellungen? Wie soll die App aussehen und sich anfühlen?

---
