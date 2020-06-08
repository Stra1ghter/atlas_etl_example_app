# Atlas REST-API Beispiele
Um die Beispiele korrekt zu verwenden ist eine Linux-Shell (z.B. Bash), cURL und Python erforderlich.

## Umgebungsvariablen
Um die Aufrufe richtig nutzen zu können, sollten zunächst die richtigen Umgebungsvariablen auf der Shell gesetzt werden. Folgende Umgebungsvariablen sind um die korrekten Werte für das spezifische Atlas-System zu ersetzen.
```
ATLAS_BASE_URL=http://10.50.14.232:21000/api/atlas/v2
ATLAS_USER=admin
ATLAS_PASSWORD=admin
```

## Beispiel GET-Requets
Um die JSON-Resultate lesbar zu durchsuchen, empfiehlt es sich die Antworten der jeweiligen Request per Pipe an das ```json.tool```-Modul und ```grep``` weiterzuleiten. Die Anfragen sollten also nach folgendem Format aufgebaut sein: 
```
<request> | python -m json.tool | grep -B 3 -A 3 <regex>
```
**Verfügbare Typdefinitionen**:
```
curl -u $ATLAS_USER:$ATLAS_PASSWORD -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' "$ATLAS_BASE_URL/types/typedefs"
```
**Vorhandene Entitäten im System:**
```
curl -u $ATLAS_USER:$ATLAS_PASSWORD -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' "$ATLAS_BASE_URL/entity/bulk"
```

## Typen erzeugen
