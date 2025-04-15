# Teststrategie für die Bar-Finder-App

**1. Ziele der Teststrategie**

*   Sicherstellung der Funktionalität der Bar-Finder-App gemäß den Anforderungen im Lastenheft.
*   Minimierung von Fehlern und Bugs, um eine hohe Benutzerzufriedenheit zu gewährleisten.
*   Sicherstellung der Stabilität und Zuverlässigkeit der App.
*   Gewährleistung einer hohen Codequalität durch kontinuierliche Tests.
*   Abdeckung aller wichtigen Funktionalitäten und Use Cases.
*   Frühes Erkennen von Fehlern im Entwicklungsprozess.
*   Sicherstellung, dass es keine Probleme im Zusammenspiel der Datenbank und der Module gibt.

**2. Testarten**

*   **Unit-Tests:**
    *   **Ziel:** Überprüfung der kleinsten, isolierten Einheiten (z.B. Funktionen, Methoden, Klassen) auf korrekte Funktionalität.
    *   **Fokus:** Logik, Algorithmen, Datenverarbeitung.
    *   **Framework:** Flutter's integriertes Test-Framework.
    *   **Beispiele:**
        *   Überprüfung der Filterlogik.
        *   Testen der Korrektheit von Berechnungen (z.B. Distanzberechnung).
        *   Validierung von Eingabedaten.
*   **Widget-Tests:**
    *   **Ziel:** Überprüfung einzelner Widgets (UI-Komponenten) auf korrektes Verhalten und Darstellung.
    *   **Fokus:** UI-Logik, Rendering, Interaktion.
    *   **Framework:** Flutter's Widget-Test-Framework.
    *   **Beispiele:**
        *   Testen der korrekten Anzeige von Bar-Details.
        *   Überprüfung der Interaktion mit Filtern.
        *   Testen der Navigation zwischen Screens.
*   **Integrationstests:**
    *   **Ziel:** Überprüfung des Zusammenspiels verschiedener Komponenten und Module.
    *   **Fokus:** Kommunikation zwischen Klassen, Services, UI-Integration.
    *   **Framework:** Flutter's Integrationstests.
    *   **Beispiele:**
        *   Testen des Zusammenspiels von UI, Filterlogik und Datenservice.
        *   Überprüfung der korrekten Datenübergabe zwischen verschiedenen Screens.
        *   Testen des Zusammenspiels von der MongoDB und Supabase.
    * **Ergänzung**: Hier sollten alle Bereiche die von integrationstests betroffen sind aufgeführt werden.
*   **Datenbanktests**
    *   **Ziel:** Überprüfung des korrekten Zusammenspiels mit der Datenbank, des anlegen von neuen Einträgen und dem löschen von Einträgen.
    *   **Fokus:** Datenkonsistenz, Datenintegrität, korrekte Abfragen.
    *   **Beispiele:**
        *   Testen der Abfragen für Pubs.
        *   Testen der Abfragen für Events.
        *   Testen des hinzufügens von neuen Pubs.
        *   Testen des hinzufügens von neuen Bieren.
        * **Ergänzung**: Hier sollten alle Tabellen die von Datenbanktests betroffen sind aufgeführt werden.
*   **UI-Tests/End-to-End-Tests (E2E):**
    *   **Ziel:** Überprüfung der gesamten App von Anfang bis Ende, wie ein Benutzer sie verwenden würde.
    *   **Fokus:** Korrekte Funktionalität aus Benutzersicht.
    *   **Framework:** Möglicherweise Drittanbieter-Tools, wenn nötig.
    *   **Beispiele:**
        *   Testen eines kompletten Workflows (z.B. Pubs suchen, filtern, Details anzeigen, bewerten).
        *   Überprüfung der korrekten Funktion der Favoritenliste.
    * **Ergänzung**: Es sollte hier genau auf die Wichtigkeit dieser Tests hingewiesen werden.
* **Ergänzung**: Es wurden bereits einige tests geschrieben.

**3. Testabdeckung**

*   **Funktionale Abdeckung:** Alle im Lastenheft definierten funktionalen Anforderungen werden durch Tests abgedeckt.
*   **Pfadabdeckung:** Alle wichtigen Pfade und Workflows durch die App werden getestet.
*   **Datenabdeckung:** Die Tests verwenden sowohl gültige als auch ungültige Daten, um die Robustheit zu gewährleisten.
*   **Positive- und Negative Tests:** Es wird sowohl positive als auch Negative Tests geben.
* **Ergänzung**: Die Abdeckung der Datenbanken sollte hier genauer beschrieben werden.

**4. Testumgebung**

*   **Entwicklungsumgebung:** Die Tests werden in der Entwicklungsumgebung ausgeführt.
*   **Simulatoren/Emulatoren:** Für Widget-Tests und E2E-Tests werden Simulatoren und Emulatoren verwendet.
*   **Echte Geräte:** Für E2E-Tests und Performance-Tests werden auch echte Geräte zum Einsatz kommen.

**5. Testdaten**

*   **Generierte Daten:** Für die Tests werden synthetische Daten generiert.
*   **Datenbank-Dumps:** Für Datenbanktests können Testdatenbanken mit spezifischen Datensätzen erstellt werden.

**6. Testdurchführung**

*   **Kontinuierliche Integration:** Die Tests werden automatisch bei jedem Commit ausgeführt (falls CI vorhanden).
*   **Manuelle Tests:** Zusätzliche manuelle Tests werden bei Bedarf durchgeführt.
*   **Regressionstests:** Nach jeder Änderung werden Regressionstests durchgeführt, um sicherzustellen, dass keine neuen Fehler eingeführt wurden.
* **Ergänzung**: Es sollte noch einmal genauer Beschrieben werden, wann Regressionstests ausgeführt werden sollen.

**7. Testdokumentation**

*   **Testfälle:** Für komplexe Szenarien werden detaillierte Testfälle dokumentiert.
*   **Testberichte:** Nach jeder Testausführung wird ein Testbericht erstellt.
*   **Teststrategie:** Die Teststrategie wird in der Dokumentation (in `docs/`) abgelegt.

**8. Verantwortlichkeiten**

*   Die Teststrategie wird vom Projektleiter erstellt und verwaltet.
*   Der KI-Assistent unterstützt beim Schreiben und Ausführen der Tests und beim erstellen der Dokumentation.

**9. Tools**

*   Flutter Test Framework
*   Flutter Driver (für E2E-Tests)
*   Evtl. Drittanbieter-Tools für UI-Tests
* **Ergänzung**: Es sollte hier noch genauer auf die Verwendung des Dart/Flutter Frameworks eingegangen werden.

**10. Metriken**

*   **Testabdeckung:** Prozentsatz der abgedeckten Anforderungen.
*   **Anzahl der gefundenen Fehler:** Anzahl der gefundenen Fehler pro Testdurchlauf.
*   **Zeitaufwand für Tests:** Zeit, die für die Testdurchführung benötigt wird.
*   **Anzahl der abgeschlossenen Test:** Anzahl der schon fertigen Tests.
* **Ergänzung**: Es könnten noch weitere Metriken hinzugefügt werden, wie z.B. die Anzahl der Datenbanktests.