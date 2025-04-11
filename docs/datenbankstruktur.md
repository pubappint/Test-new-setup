# MongoDB Schema für die `logs` Collection

## Collection Name: `logs`

## Felder

| Feld        | Datentyp | Beschreibung                                                                    |
| :---------- | :------- | :------------------------------------------------------------------------------ |
| `_id`       | `ObjectId` | Eindeutiger Identifikator für jedes Dokument (automatisch von MongoDB erstellt) |
| `timestamp` | `Date`     | Datum und Uhrzeit des Log-Eintrags                                           |
| `message`   | `String`   | Die eigentliche Log-Nachricht                                                 |
| `level`     | `String`   | Der Schweregrad des Logs (z.B. INFO, WARNING, ERROR)                         |
| `user`      | `String`   | Der Benutzer, der den Log ausgelöst hat.                                     |

# Supabase Schema

## Tabelle: `bars`

| Feld            | Datentyp           | Beschreibung                                               |
| :-------------- | :----------------- | :--------------------------------------------------------- |
| `id`            | `UUID` oder `INT`  | Eindeutiger Identifikator (Primary Key)                     |
| `name`          | `VARCHAR`          | Index                                                        |
| `address`       | `VARCHAR`        |                                                              |
| `city`          | `VARCHAR`        |                                                              |
| `opening_hours` | `VARCHAR`        |                                                              |
| `description`   | `VARCHAR`        |                                                              |
| `image`         | `VARCHAR`        |                                                              |
| `average_rating`| `NUMERIC`        |                                                              |

## Tabelle: `users`

| Feld     | Datentyp          | Beschreibung                                       |
| :------- | :---------------- | :------------------------------------------------- |
| `id`     | `UUID` oder `INT` | Eindeutiger Identifikator (Primary Key)            |
| `name`   | `VARCHAR`        | Index                                                        |
| `email`  | `VARCHAR`        |                                                               |
| `password` | `VARCHAR`        |                                                              |
| `avatar`     | `VARCHAR`        |                                                              |

## Tabelle: `events`

| Feld          | Datentyp          | Beschreibung                                                      |
| :------------ | :---------------- | :---------------------------------------------------------------- |
| `id`          | `UUID` oder `INT` | Eindeutiger Identifikator (Primary Key)                          |
| `bar_id`      | `UUID` oder `INT` | Foreign Key, Index                                                   |
| `name`        | `VARCHAR`        |                                                                    |
| `date`        | `TIMESTAMP`      | Index                                                              |
| `description` | `VARCHAR`        |                                                                    |
| `image`        | `VARCHAR`        |                                                              |

## Tabelle: `reviews`

| Feld     | Datentyp          | Beschreibung                                                |
| :------- | :---------------- | :---------------------------------------------------------- |
| `id`     | `UUID` oder `INT` | Eindeutiger Identifikator (Primary Key)                    |
| `bar_id` | `UUID` oder `INT` | Fremdschlüssel, verweist auf `bars.id`                  |
| `user_id`| `UUID` oder `INT` | Fremdschlüssel, verweist auf `users.id`                        |
| `text`    | `VARCHAR`        |                                                                    |
| `rating`  | `INT`            |                                                                    |
| `date` | `TIMESTAMP` | |


## Tabelle: `favorites`

| Feld     | Datentyp          | Beschreibung                                                   |
| :------- | :---------------- | :------------------------------------------------------------- |
| `id`     | `UUID` oder `INT` | Eindeutiger Identifikator (Primary Key)                       |
| `bar_id` | `UUID` oder `INT` | Fremdschlüssel, verweist auf `bars.id`                     |
| `user_id`| `UUID` oder `INT` | Fremdschlüssel, verweist auf `users.id`                         |
| `date`| `TIMESTAMP` | Das Datum an dem die Bar als Favorit markiert wurde |



## Beziehungen zwischen den Schemas

Es gibt keine direkten Beziehungen zwischen den Datenbanken.

Die einzige Verbindung zwischen den Schemas besteht über den Benutzer.

Die Supabase Tabelle `users` ist mit der MongoDB Collection `logs` über das Feld `user` verbunden. In der MongoDB Collection wird der Name des Benutzers gespeichert.

## Diagramm der Tabellen Beziehungen

+----------+        1:n       +----------+
|   bars   | <-------------- |  events  |
+----------+                 +----------+
     ^                        
     |                        
     | 1:n                    
     |                        
+----------+        1:n       +----------+
| reviews  | <-------------- |  users   |
+----------+                 +----------+
     ^                        
     |                        
     | 1:n                    
     |                        
+----------+                 
|favorites |                 
+----------+

## Beschreibung der Beziehungen zwischen den Tabellen

### Primärschlüssel (Primary Keys)

Jede Tabelle in Supabase hat einen Primärschlüssel (Primary Key). Dieser dient dazu, jeden Eintrag in der Tabelle eindeutig zu identifizieren. In unserem Fall ist das in jeder Tabelle das Feld `id`. Es kann entweder den Datentyp `UUID` oder `INT` haben.

### Fremdschlüssel (Foreign Keys)

Die Fremdschlüssel (Foreign Keys) verweisen auf den Primärschlüssel (Primary Key) einer anderen Tabelle. Durch die Fremdschlüssel können wir eine Verbindung zwischen den Tabellen herstellen.

*   **`events`**
    *   `bar_id`: Dies ist ein Fremdschlüssel, der auf die `id` in der `bars`-Tabelle verweist. Er zeigt an, in welcher Bar das Event stattfindet.
*   **`reviews`**
    *   `bar_id`: Dies ist ein Fremdschlüssel, der auf die `id` in der `bars`-Tabelle verweist. Er zeigt an, welche Bar bewertet wurde.
    *   `user_id`: Dies ist ein Fremdschlüssel, der auf die `id` in der `users`-Tabelle verweist. Er zeigt an, welcher Benutzer die Bewertung geschrieben hat.
*   **`favorites`**
    *   `bar_id`: Dies ist ein Fremdschlüssel, der auf die `id` in der `bars`-Tabelle verweist. Er zeigt an, welche Bar als Favorit gespeichert wurde.
    *   `user_id`: Dies ist ein Fremdschlüssel, der auf die `id` in der `users`-Tabelle verweist. Er zeigt an, welcher Benutzer die Bar als Favorit gespeichert hat.

### Beziehungen

*   **`bars` und `events`**
    *   Eine Bar (`bars`) kann mehrere Events (`events`) haben. Dies wird durch die 1:n-Beziehung (eins-zu-viele) dargestellt. Die `bar_id` in der `events`-Tabelle stellt die Verbindung her.
*   **`bars` und `reviews`**
    *   Eine Bar (`bars`) kann mehrere Bewertungen (`reviews`) haben. Dies wird durch die 1:n-Beziehung dargestellt. Die `bar_id` in der `reviews`-Tabelle stellt die Verbindung her.
* **`users` und `reviews`**
    * Ein Benutzer (`users`) kann mehrere Bewertungen (`reviews`) schreiben. Dies wird durch die 1:n-Beziehung dargestellt. Die `user_id` in der `reviews`-Tabelle stellt die Verbindung her.
*   **`bars` und `favorites`**
    *   Eine Bar (`bars`) kann von mehreren Benutzern als Favorit (`favorites`) gespeichert werden. Dies wird durch die 1:n-Beziehung dargestellt. Die `bar_id` in der `favorites`-Tabelle stellt die Verbindung her.
* **`users` und `favorites`**
    * Ein Benutzer (`users`) kann mehrere Bars als Favoriten (`favorites`) speichern. Dies wird durch die 1:n-Beziehung dargestellt. Die `user_id` in der `favorites`-Tabelle stellt die Verbindung her.

### Indizes

Indizes verbessern die Suchgeschwindigkeit in den Tabellen.

* **bars**:
    * `name`
* **users**:
    * `name`
* **events**:
    * `date`
    * `bar_id`
* **reviews**:
    * `bar_id`
    * `user_id`
* **favorites**:
    * `bar_id`
    * `user_id`
