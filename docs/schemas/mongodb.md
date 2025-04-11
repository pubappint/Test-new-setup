# MongoDB Schema - Korrigiert

## Collection: Events

*   `_id` (ObjectId, Primary Key)
*   `bar_id` (UUID, Foreign Key -> Bars in Supabase)
*   `name` (String)
*   `description` (String)
*   `start_time` (Timestamp)
*   `end_time` (Timestamp)
*   `created_at` (Timestamp)

## Collection: Bar_Data

*   `bar_id` (UUID, Foreign Key -> Bars)
*   `images` (String[])
*   `brewerys` (String[])
*   `beer_types` (String[])
*   `tap_or_bottle` (String[])
*   `created_at` (Timestamp)
