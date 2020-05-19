curl -u admin:admin -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' http://10.50.14.232:21000/api/atlas/v2/search/basic?query=static_information | python -m json.tool
