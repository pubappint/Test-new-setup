## Code-Snippets für den Verbindungsaufbau und Integrationstests

### Abhängigkeiten

**Supabase:**
```
bash
pip install supabase
```
**MongoDB:**
```
bash
pip install pymongo
```
**pytest:**
```
bash
pip install pytest
```
**python-dotenv**:
```
bash
pip install python-dotenv
```
### Supabase

**Verbindungsaufbau:**
```
python
from supabase import create_client, Client
from dotenv import load_dotenv
import os

load_dotenv()

def create_supabase_client() -> Client:
    url: str = os.getenv("SUPABASE_URL")
    key: str = os.getenv("SUPABASE_KEY")
    supabase: Client = create_client(url, key)
    return supabase
```
**Integrationstest (Supabase):**
```
python
import pytest
from supabase import Client
from your_module import create_supabase_client  # Ersetze your_module durch den Namen deiner Datei

def test_supabase_connection():
    supabase: Client = create_supabase_client()
    try:
        data = supabase.table("users").select("*").limit(1).execute()
        assert data.data is not None
    except Exception as e:
        pytest.fail(f"Verbindung zu Supabase fehlgeschlagen: {e}")
```
### MongoDB

**Verbindungsaufbau:**
```
python
from pymongo import MongoClient
from dotenv import load_dotenv
import os

load_dotenv()

def create_mongodb_client() -> MongoClient:
    connection_string: str = os.getenv("MONGODB_CONNECTION_STRING")
    client = MongoClient(connection_string)
    return client
```
**Integrationstest (MongoDB):**
```
python
import pytest
from pymongo import MongoClient
from your_module import create_mongodb_client  # Ersetze your_module durch den Namen deiner Datei

def test_mongodb_connection():
    client: MongoClient = create_mongodb_client()
    try:
        db = client["mydatabase"]  # Ersetze mydatabase durch deinen Datenbanknamen
        collection = db["logs"]  # Ersetze logs durch deinen Collectionnamen
        test_document = {"test": "test"}
        result = collection.insert_one(test_document)
        assert result.acknowledged is True
        collection.delete_one(test_document)
    except Exception as e:
        pytest.fail(f"Verbindung zu MongoDB fehlgeschlagen: {e}")

```
### Testumgebung einrichten

1.  **Virtuelle Umgebung erstellen:**
    *   Erstelle eine virtuelle Umgebung, um deine Projektabhängigkeiten zu isolieren. Verwende dazu `venv` oder `virtualenv`.
    *   **Beispiel:**
```
bash
        python3 -m venv .venv
        source .venv/bin/activate # Linux/Mac
        .venv\Scripts\activate # Windows
        
```
2.  **Abhängigkeiten installieren:**
    *   Installiere die benötigten Abhängigkeiten in deiner virtuellen Umgebung.
    *   **Beispiel:**
```
bash
        pip install -r requirements.txt
        
```
* Hierbei müssen alle oben definierten Abhängigkeiten in die Datei requirements.txt hinterlegt werden.
3. **.env Datei erstellen**:
    * Erstelle eine .env Datei.
    * Hier müssen alle wichtigen Verbindungsdaten hinterlegt werden.
    * Beispiel:
```
    SUPABASE_URL=YOUR_SUPABASE_URL
    SUPABASE_KEY=YOUR_SUPABASE_KEY
    MONGODB_CONNECTION_STRING=YOUR_MONGODB_CONNECTION_STRING
```
4.  **Testdateien erstellen:**
    *   Erstelle Dateien für deine Testfälle (z.B. `test_database.py`).
    *   Definiere die Funktionen wie oben beschrieben.
5.  **Tests ausführen:**
    *   Führe die Integrationstests mit `pytest` aus.
    *   **Beispiel:**
```
bash
        pytest
        
```
### Integrationstests ausführen

1. **Testdatei**: Alle Integrationstests müssen in einer Datei sein.
2. **Testfunktion**: Alle Testfunktionen müssen mit test_ beginnen.
3. **pytest**: Mit pytest können die Tests einfach ausgeführt werden.
4. **Ergebnisse**: Die Ergebnisse werden nach dem ausführen angezeigt.