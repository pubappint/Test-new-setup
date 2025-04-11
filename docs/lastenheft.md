---

**Lastenheft: Bar-Finder-App**

**1. Einleitung**

*   **1.1 Projektbezeichnung:** Bar-Finder-App
*   **1.2 Ziel des Projekts:** Entwicklung einer mobilen App, die es Nutzern ermöglicht, Bars in ihrer Umgebung zu finden, zu filtern und detaillierte Informationen zu erhalten. Die App soll außerdem die Community durch nutzergenerierte Inhalte und Bewertungen stärken.
*   **1.3 Zielgruppe:** Personen, die auf der Suche nach Bars sind, insbesondere Bierliebhaber, Eventbesucher und Nachtschwärmer.
*   **1.4 Kontext:** Das Dokument beschreibt die Anforderungen und Funktionen, die für die Bar-Finder-App definiert wurden.

**2. Funktionale Anforderungen**

*   **2.1 Filter:**
    *   **2.1.1 Umkreis:**
        *   **Funktion:** Schieberegler zur Auswahl des gewünschten Umkreises (0-50 km).
        *   **Anforderung:** Stufenlose Einstellung des Umkreises möglich.
    *   **2.1.2 Preisniveau:**
        *   **Funktion:** Auswahl von Preisniveaus (€, €€, €€€€).
        *   **Anforderung:** Relative Kategorisierung zum Angebot.
    *   **2.1.3 Bierangebot:**
        *   **Funktion:** Filterung nach Biersorte, Brauerei, Zapf/Flasche.
        *   **Anforderung:** Nutzer können neue Biersorten und Brauereien hinzufügen/bearbeiten.
    *   **2.1.4 Öffnungszeit:**
        *   **Funktion:** "Jetzt geöffnet"-Filter (Boolean) und Zeitraum-Filter (Schieberegler).
        *   **Anforderung:** Anzeige von Bars, die im ausgewählten Zeitraum geöffnet haben.
    *   **2.1.5 Event:**
        *   **Funktion:** "Event aktiv"-Button.
        *   **Anforderung:** Anzeige aller Bars mit laufenden Events, Detailansicht über Karte oder Liste.
*   **2.2 Bar-Profil:**
    *   **2.2.1 Zusätzliche Informationen:**
        *   **Funktion:** Anzeige von Bildern, Beschreibungstexten, Bewertungen und Kommentaren.
        *   **Anforderung:** Geplant für spätere Implementierung.
    *   **2.2.2 Barbetreiber-Verwaltung:**
        *   **Funktion:** Möglichkeit zur Verwaltung und Aktualisierung des eigenen Profils durch den Barbetreiber.
        *   **Anforderung:** Kennzeichnung der vom Barbetreiber stammenden Informationen.
    *   **2.2.3 Favoriten:**
        *   **Funktion:** Markieren von Bars als Favoriten.
        *   **Anforderung:** Speicherung der Favoriten in einer Merkliste.
*   **2.3 Nutzerprofile:**
    *   **2.3.1 Pflichtangaben:**
        *   **Funktion:** E-Mail-Adresse, Passwort, Benutzername.
        *   **Anforderung:** Sichere Speicherung der Passwörter.
    *   **2.3.2 Optionale Angaben/Präferenzen:**
        *   **Funktion:** Musik-Vorlieben, Bier-Vorlieben, Favoriten, Bewertungen, Events.
        *   **Anforderung:** Filterung der Nutzer nach ihren Vorlieben möglich.
    *   **2.3.3 Follow Funktion:**
        * **Funktion:** Möglichkeit zum Folgen anderer Nutzer.
        * **Anforderung:** Nicht im ersten Entwurf enthalten.
     * **2.3.4 Empfehlungen basierend auf übereinstimmenden Interessen**
      * **Funktion**: Das System zeigt passenden Nutzern die Favoriten der jeweils anderen an.
      * **Anforderung:** Soll erst später implementiert werden.
*   **2.4 Bewertungen und Kommentare:**
    *   **2.4.1 Bewertungssystem:**
        *   **Funktion:** Likes für Bars.
        *   **Anforderung:** Späteres erweitertes System mit Punkten für verschiedene Kriterien.
    *   **2.4.2 Kommentare:**
        *   **Funktion:** Kommentarfunktion für Bars.
        *   **Anforderung:** Moderation der Kommentare.
*   **2.5 Datenbank-Befüllung:**
    *   **2.5.1 Regionale Begrenzung:**
        *   **Funktion:** Beschränkung auf Deutschland (Beta-Phase).
        *   **Anforderung:** Möglichkeit zur späteren Ausweitung.
    *   **2.5.2 Datenquelle:**
        *   **Funktion:** OpenStreetMap (OSM).
        *   **Anforderung:** Einheitliche Datenstruktur, Community-basierte Datengenerierung, keine realen Kosten.
    * **2.5.3 Verifizierung**
      * **Funktion:** Sicherstellung korrekter Daten.
      * **Anforderung:** **Stufe 1: Moderation:** Moderatoren filtern und löschen offensichtlich falsche Einträge. **Stufe 2: Community-Verifizierung:** Zusätzliche Verifizierung durch andere Nutzer.
*   **2.6 Wegbeschreibung:**
    *   **Funktion:** Navigation zur ausgewählten Bar.
    *   **Anforderung:** Integration eines Kartendienstes.
*   **2.7 Pubcrawl-Planung:**
    *   **Funktion:** Planung von Pubcrawls.
    *   **Anforderung:** Möglichkeit zum Teilen von Pubcrawls.
*   **2.8 Reservierungen:**
    *   **Funktion:** Späteres Feature.
    *   **Anforderung:** Nicht im ersten Entwurf enthalten.

**3. Nicht-funktionale Anforderungen**

*   **3.1 Technologie-Stack:**
    *   **Programmiersprache:** Dart
    *   **Framework:** Flutter
    *   **Plattformen:** Android und iOS
*   **3.2 Datenbank:**
    *   **Relationale Daten:** Supabase
    *   **Nicht-relationale Daten:** MongoDB
    *   **Hosting:** Online (für beide Datenbanken)
*   **3.3 Schnittstellen:**
    *   **Kartendienst:** Leaflet (Karten), OSRM (Wegbeschreibung)
    *   **Soziale Netzwerke:** Späteres Feature.
    *   **Reservierungssysteme:** Späteres Feature.
*   **3.4 Monetarisierung:**
    *   **Aktuell:** Keine aktive Monetarisierung.
    *   **Spenden:** Option für Nutzer, freiwillig zu spenden.
    *   **Optionen für später:** Freemium-Modell, Affiliate-Marketing, Datenanalyse.
 *  **3.5 Design:**
    *   **Look:** Modern, clean.
    *   **Thema:** Bar, Bier, Geselligkeit.
    *   **Farbpalette:** Dunkles Blau oder Dunkelgrau mit Cremeweiß/Beige und Akzenten in Goldgelb/Bernsteinfarben oder ein Grün.
    *   **Typografie:** Serifenlose Schriftarten (z.B. Roboto, Open Sans, Montserrat) mit einer leicht verspielten Schrift für Überschriften.
    *   **Icons:** Minimalistisch, schlicht.
    *   **Layout:** Clean, aufgeräumt, grid-basiert.
    *   **Bilder:** Hochwertig, stimmungsvoll.
    *   **Animationen:** Dezent, flüssig.
     * **Gesamtkonzept**: Einfachheit und Informationsbeschaffung stehen hier im Vordergrund.

**4. Weitere Punkte:**

*   **4.1 Projektteam:**
    *   **Rollenverteilung:**
        *   [Dein Name]: Projektleitung, Fachliche Leitung
        *   KI-Assistent: Entwicklung, Technische Beratung
    *   **Aufgabenverteilung:**
        *   [Dein Name]: Definiert die Anforderungen und Features, trifft Entscheidungen, priorisiert Aufgaben, nimmt Teilaufgaben und das Endergebnis ab, gibt Fachliche Expertise für das Thema Bar und Bier.
        *   KI-Assistent: Setzt die technischen Anforderungen um, generiert Code, erstellt Dokumentation, leistet technische Unterstützung und gibt Vorschläge, gibt Technische Expertise für die Implementierung.
*   **4.2 Zeitplan:**
    *   **Meilensteine:**
        1.  **Meilenstein 1: Lastenheft vervollständigen**
        2.  **Meilenstein 2: Design und Wireframes**
        3.  **Meilenstein 3: Datenbankstruktur**
        4. **Meilenstein 4: Entwicklungsumgebung**
        5.  **Meilenstein 5: Erster Prototyp**
        6.  **Meilenstein 6: Überarbeitung**
        7. **Meilenstein 7: Erweiterung**
    *   **Hinweis:** Da es sich um ein Freizeitprojekt handelt, gibt es keine festen Deadlines. Die Meilensteine dienen der Strukturierung der Arbeit.
*   **4.3 Budget:**
    *   **Aktuell:** Bis zur Veröffentlichung der App werden keine kostenpflichtigen Dienste genutzt.
    *   **Später:** Die Möglichkeit zur Nutzung von kostenpflichtigen Diensten (z.B. für Supabase, MongoDB oder OSRM) wird offen gehalten, falls Einnahmen generiert werden.
    *   **Hinweis:** Aktuell wird auf kostenlose und Open-Source-Lösungen gesetzt.
*   **4.4 Rechtliches:**
    *   **Zu beachtende Gesetze:**
        *   Datenschutzgrundverordnung (DSGVO)
        *   Telemediengesetz (TMG)
        *   Urheberrecht
        * Gesetz gegen den unlauteren Wettbewerb (UWG)
        * Jugendschutzgesetz (JuSchG)
        * Lizenzrecht
    *   **Konkrete Punkte:**
        *   Datenschutzerklärung
        *   Impressum
        *   Einwilligung zur Datenverarbeitung
        * Einwilligung für Cookies
        * Nutzungsbedingungen
        * Rechte an Inhalten
        * Moderation von Inhalten
        * Jugendschutz
    * **Werbung**
      * Beachten des UWG
    *   **Hinweis:** Es ist notwendig, sich im Detail mit den genannten Gesetzen auseinanderzusetzen und rechtliche Beratung in Anspruch zu nehmen.
*   **4.5 Ansprechpartner:**
    *   **Ansprechpartner:**
        *   [Dein Name]: Alleiniger Ansprechpartner für alle Belange des Projekts.
        *   KI-Assistent: Technischer Ansprechpartner und Unterstützer.
    * **Verantwortlichkeiten:**
        * [Dein Name]: Projektleitung, Fachliche Leitung, Entscheidungsträger, Ansprechpartner für alle externen und internen Belange.
        * KI-Assistent: Technische Unterstützung, Entwicklung, Dokumentation.

**5. Glossar:**

*   **Lastenheft:** Ein Dokument, das die Anforderungen an ein Projekt beschreibt.
*   **Pflichtenheft:** Ein Dokument, das die technische Umsetzung eines Projekts beschreibt.
*   **Wireframe:** Ein schematischer Entwurf einer App oder Website, der das Layout und die Navigation darstellt.
*   **Mockup:** Ein detaillierterer Entwurf einer App oder Website, der das Design und die Interaktion zeigt.
*   **Prototyp:** Eine erste, funktionsfähige Version einer App oder Website.
*   **Frontend:** Der Teil einer App oder Website, der vom Nutzer gesehen und bedient wird.
*   **Backend:** Der Teil einer App oder Website, der im Hintergrund arbeitet (z.B. Datenbank, Server).
*   **API:** Eine Schnittstelle, über die verschiedene Software-Systeme miteinander kommunizieren können.
*   **Leaflet:** Eine Open-Source-JavaScript-Bibliothek für interaktive Karten.
*   **OSRM:** Ein Open-Source-Routing-Service.
*   **Supabase:** Eine Open-Source-Alternative zu Firebase.
*   **MongoDB:** Eine NoSQL-Datenbank.
* **Flutter**: Ein Framework, das es ermöglicht, Apps für mehrere Systeme zu entwickeln.
* **Dart**: Die Programmiersprache in der Flutter geschrieben ist.
* **DSGVO**: Datenschutz-Grundverordnung.
* **TMG**: Telemediengesetz.
* **UWG**: Gesetz gegen den unlauteren Wettbewerb.
* **JuSchG**: Jugendschutzgesetz.
* **OpenStreetMap (OSM)**: Eine freie Weltkarte.
* **Pubcrawl**: Kneipentour.
* **Freemium**: Ein Modell, in dem Basis Funktionen kostenlos sind und andere Funktionen bezahlt werden müssen.
* **Affiliate-Marketing**: Provisionen durch Vermittlung von Nutzern.
* **NoSQL**: Eine nicht relationale Datenbank.

**6. Dokumenten Historie:**

| Version | Datum       | Autor       | Beschreibung                                                                                                                                                                   |
| :------ | :---------- | :---------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1.0     | [Aktuelles Datum] | KI-Assistent | Erstellung des Lastenhefts basierend auf den vorherigen Diskussionen und dem App-Konzept.                                                                                              |
| 1.1     | [Aktuelles Datum] | KI-Assistent | Ergänzung des Punktes "4.1 Projektteam".                                                                                                                                       |
| 1.2     | [Aktuelles Datum] | KI-Assistent | Ergänzung des Punktes "4.2 Zeitplan".                                                                                                                                        |
| 1.3     | [Aktuelles Datum] | KI-Assistent | Ergänzung des Punktes "4.3 Budget".                                                                                                                                         |
| 1.4     | [Aktuelles Datum] | KI-Assistent | Ergänzung des Punktes "4.4 Rechtliches".                                                                                                                                       |
| 1.5     | [Aktuelles Datum] | KI-Assistent | Ergänzung des Punktes "4.5 Ansprechpartner".                                                                                                                                  |
| 1.6     | [Aktuelles Datum] | KI-Assistent | Ergänzung des Punktes "5. Glossar".                                                                                                                                       |
| 1.7     | [Aktuelles Datum] | KI-Assistent | Ergänzung des Punktes "6. Dokumenten Historie".                                                                                                                              |
---