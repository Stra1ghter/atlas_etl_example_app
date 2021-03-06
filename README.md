# Atlas REST-API Beispiele
Um die Beispiele korrekt zu verwenden ist eine Linux-Shell (z.B. Bash), cURL und Python erforderlich.
Die Beispiele verwenden die aktuelle v2-Version der REST-API. 


## Umgebungsvariablen
Um die Aufrufe richtig nutzen zu können, sollten zunächst auf die richtigen Umgebungsvariablen in der Shell abgeändert werden. Folgende Umgebungsvariablen sind um die korrekten Werte für das spezifische Atlas-System zu ersetzen.
```
ATLAS_BASE_URL=http://10.50.14.232:21000/api/atlas/v2
ATLAS_USER=admin
ATLAS_PASSWORD=admin
```


## Atlas durchsuchen 
Um die JSON-Resultate lesbar zu durchsuchen, empfiehlt es sich die Antworten der jeweiligen Request per Pipe an das ```json.tool```-Modul und ```grep``` weiterzuleiten. Die Anfragen sollten also nach folgendem Format aufgebaut sein: 
```
<request> | python -m json.tool | grep -B 3 -A 3 <regex>
```

**Verfügbare Typdefinitionen auflisten**:
```
curl -u $ATLAS_USER:$ATLAS_PASSWORD -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' "$ATLAS_BASE_URL/types/typedefs"
```

**Vorhandene Entitäten im System suchen:**
```
curl -u $ATLAS_USER:$ATLAS_PASSWORD -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' "$ATLAS_BASE_URL/search/basic?query=*&limit=10"
```


## Typen erzeugen
**Web-API-Typ erzeugen:**
```
curl -u $ATLAS_USER:$ATLAS_PASSWORD -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' "$ATLAS_BASE_URL/types/typedefs" -d "@./typedef_api.json"
```

**Beispiel-GET-Request um nach erzeugtem WEB-API Typ suchen:**
```
curl -u $ATLAS_USER:$ATLAS_PASSWORD -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' "$ATLAS_BASE_URL/types/typedefs" | python3 -m json.tool | grep -B 3 -A 3 web_api
```

Der Python-Script-Typ kann mit dem gleichen Aufruf, wie der des Web-API-Typs, erzeugt werden. Der JSON-Inhalt des Data Parameters von cURL (-d) muss entsprechend auf die andere Datei abgeändert werden.

## Entitäten erzeugen
Entitäten können über den ```/v2/entity```-Endpunkt angelegt werden.

**Web-API-Entität erzeugen:**
```
curl -u $ATLAS_USER:$ATLAS_PASSWORD -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' "$ATLAS_BASE_URL/entity" -d "@./web_api_entity.json"
```

**Beispiel-GET-Request um nach der erzeugten Entität zu suchen:**
```
curl -u $ATLAS_USER:$ATLAS_PASSWORD -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' "$ATLAS_BASE_URL/search/basic?query=Engie&limit=10"
```

Um mehrere Entitäten gleichzeitig zu erzeugen, ist der ```/v2/entity/bulk```-Endpoint nutzbar.

**Python-Script-Entität erzeugen (die referenzierten GUIDs müssen zuvor auf schon angelegte Entitäten geändert werden):**
```
curl -u $ATLAS_USER:$ATLAS_PASSWORD -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' "$ATLAS_BASE_URL/entity/bulk" -d "@./python_script_entity.json"
```
