# Datenbankstruktur

## Einführung

Dieses Dokument beschreibt die Strukturen der beiden verwendeten Datenbanken: MongoDB (NoSQL) und Supabase (SQL). Es erläutert die Schemata, Tabellen, Attribute und Beziehungen zwischen den Tabellen.

## MongoDB Schema

MongoDB ist eine dokumentenorientierte NoSQL-Datenbank. Es gibt keine feste Struktur für die Daten. Die Collection wird dynamisch erstellt.
### Collection Name:   Die Collection wird dynamisch bei der erstellung der Logeinträge erstellt.
### Felder
| Feld        | Datentyp | Beschreibung                                                                    |
| :---------- | :------- | :------------------------------------------------------------------------------ |
| `_id`       | `ObjectId` | Eindeutiger Identifikator für jedes Dokument (automatisch von MongoDB erstellt) |
| `timestamp` | `Date`     | Datum und Uhrzeit des Log-Eintrags                                           |
| `message`   | `String`   | Die eigentliche Log-Nachricht                                                 |
| `level`     | `String`   | Der Schweregrad des Logs (z.B. INFO, WARNING, ERROR)                         |
| `user`      | `String`   | Der Benutzer, der den Log ausgelöst hat.                                     |

## Supabase Schema

Supabase ist eine relationale SQL-Datenbank. Die Daten sind in Tabellen organisiert.
### Tabelle: `pubs`
| Feld            | Datentyp           | Beschreibung                                               |
| :-------------- | :----------------- | :--------------------------------------------------------- |
| `id`            | `UUID`  | Eindeutiger Identifikator (Primary Key)                     |
| `name`          | `VARCHAR`          | Index                                                        |
| `address`       | `VARCHAR`        |                                                              |
| `city`          | `VARCHAR`        |                                                              |
| `opening_hours` | `VARCHAR`        |                                                              |
| `description`   | `VARCHAR`        |                                                              |
| `image`         | `VARCHAR`        |                                                              |
| `average_rating`| `NUMERIC`        |                                                              |
### Tabelle: `users`
| Feld     | Datentyp          | Beschreibung                                       |
| :------- | :---------------- | :------------------------------------------------- |
| `id`     | `UUID` | Eindeutiger Identifikator (Primary Key)            |
| `name`   | `VARCHAR`        | Index                                                        |
| `email`  | `VARCHAR`        |                                                               |
### Tabelle: `events`
| Feld          | Datentyp          | Beschreibung                                                      |
| :------------ | :---------------- | :---------------------------------------------------------------- |
| `id`          | `UUID` | Eindeutiger Identifikator (Primary Key)                          |
| `name`        | `VARCHAR`        |                                                                    |
| `date`        | `TIMESTAMP`      | Index                                                              |
| `description` | `VARCHAR`        |                                                                    |
| `image`        | `VARCHAR`        |                                                              |
### Tabelle: `reviews`
| Feld     | Datentyp          | Beschreibung                                                |
| :------- | :---------------- | :---------------------------------------------------------- |
| `id`     | `UUID` | Eindeutiger Identifikator (Primary Key)                    |
| `pub_id` | `UUID` | Fremdschlüssel, verweist auf `pubs.id`                  |
| `user_id`| `UUID` | Fremdschlüssel, verweist auf `users.id`                        |
| `text`    | `VARCHAR`        |                                                                    |
| `rating`  | `INT`            |                                                                    |
| `date` | `TIMESTAMP` | |
### Tabelle: `favorites`
| Feld     | Datentyp          | Beschreibung                                                   |
| :------- | :---------------- | :------------------------------------------------------------- |
| `id`     | `UUID` | Eindeutiger Identifikator (Primary Key)                       |
| `pub_id` | `UUID` | Fremdschlüssel, verweist auf `pubs.id`                     |
| `user_id`| `UUID` | Fremdschlüssel, verweist auf `users.id`                         |
| `date`| `TIMESTAMP` | Das Datum an dem die Bar als Favorit markiert wurde |
### Tabelle: `beers`
| Feld       | Datentyp | Beschreibung                               |
| :--------- | :------- | :----------------------------------------- |
| `id`       | `UUID`   | Eindeutiger Identifikator (Primary Key)  |
| `name`     | `VARCHAR` |                                            |
| `brewery_id` | `UUID`   | Fremdschlüssel, verweist auf `breweries.id` |
### Tabelle: `breweries`
| Feld     | Datentyp | Beschreibung                                     |
| :------- | :------- | :----------------------------------------------- |
| `id`     | `UUID`   | Eindeutiger Identifikator (Primary Key)        |
| `name`   | `VARCHAR` |                                                  |
|`location`| `VARCHAR` |                                                  |
### Tabelle: `follows`
| Feld        | Datentyp | Beschreibung                                                                    |
| :---------- | :------- | :------------------------------------------------------------------------------ |
| `id`          | `UUID` | Eindeutiger Identifikator (Primary Key) |
| `follower_id` | `UUID` | Fremdschlüssel, verweist auf `users.id`. ID des Benutzers, der folgt.|
| `followed_id` | `UUID` | Fremdschlüssel, verweist auf `users.id`. ID des Benutzers, dem gefolgt wird. |

## Beziehungen zwischen den Schemas

Es gibt keine direkte Verbindung zwischen den beiden Datenbanken. Es handelt sich um zwei Datenbanken, eine NoSql und eine SQL Datenbank.

## Diagramm der Tabellen Beziehungen

Das folgende Diagramm zeigt die Beziehungen zwischen den Tabellen in der Supabase-Datenbank. Es gibt kein Diagramm für die MongoDB, da sie keine feste Struktur hat.

+----------+        1:n       +----------+
|   pubs   | <-------------- |  events  |
+----------+                 +----------+
     ^                             |
     |     1:n                 |
+----------+        1:n       +----------+
| reviews  | <-------------- |  users   |
+----------+                 +----------+
     ^                           ^
     |                           | 1:n
     |                       1:n
+----------+       +---------+        +-----------+
|favorites |       |follows| <--------|   users   |
+----------+       +---------+        +-----------+
   ^                      ^
   |                      |
   1:n                  1:n
+---------+       +-----------+
|  beers  | <-----| breweries|
+---------+       +-----------+