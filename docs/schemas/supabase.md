# Supabase Schema

## Tabelle: Users

*   `id` (UUID, Primary Key)
*   `email` (Text, Eindeutig)
*   `username` (Text, Eindeutig)
*   `password` (Text)
*   `profile_picture_url` (Text, Optional)
*   `created_at` (Timestamp)
*   `music_preferences` (Text[], Optional)
*   `beer_preferences` (Text[], Optional)

## Tabelle: Follows

*   `follower_id` (UUID, Foreign Key -> Users)
*   `followed_id` (UUID, Foreign Key -> Users)
*   `created_at` (Timestamp)

## Tabelle: Bewertungen

*   `id` (UUID, Primary Key)
*   `bar_id` (UUID, Foreign Key -> Bars)
*   `user_id` (UUID, Foreign Key -> Users)
*   `rating` (Integer)
*   `comment` (String)
*   `created_at` (Timestamp)

## Tabelle: Brauereien

*   `id` (UUID, Primary Key)
*   `name` (String)
*   `created_at` (Timestamp)

## Tabelle: Biersorten

*   `id` (UUID, Primary Key)
*   `name` (String)
*   `created_at` (Timestamp)

## Tabelle: Favoriten

*   `id` (UUID, Primary Key)
*   `user_id` (UUID, Foreign Key -> Users)
*   `bar_id` (UUID, Foreign Key -> Bars)
*   `created_at` (Timestamp)

## Tabelle: Bars

*   `id` (UUID, Primary Key)
*   `name` (String)
*   `address` (String)
*   `latitude` (Double)
*   `longitude` (Double)
*   `opening_hours` (String)
*   `description` (String)
*   `avg_rating` (Double)
*   `price_level` (String)
*   `created_at` (Timestamp)