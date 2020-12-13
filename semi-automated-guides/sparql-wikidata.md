# sparql-wikidata.md

> Este arquivo é um rascunho. Veja https://github.com/HXL-CPLP/forum/issues/36 e
  https://github.com/HXL-CPLP/forum/issues/34
  

- https://query.wikidata.org/

## Exemplos de queries

```sql
# Isto aqui retorna lista simples de códigos de países por iso2. No caso esta
# forçando idioma ingles, sem fallback.

#Find ISO 3166-1 alpha-2 country codes
SELECT ?code ?country ?countryLabel
WHERE
{
        ?country wdt:P297 ?code .
        SERVICE wikibase:label { bd:serviceParam wikibase:language "en" }
}
ORDER BY ASC(?countryLabel)
```

```sql
## Um dos exemplo da documentação padrão

#Subproperties of location (P276)
#Subproperties of location (P276)
SELECT DISTINCT ?subProperties ?subPropertiesLabel WHERE {
  ?subProperties wdt:P1647* wd:P276.
  SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE],en". }
}
```


```sql
## Um dos exemplo da documentação padrão

#Subproperties of location (P276)
#Subproperties of location (P276)
SELECT DISTINCT ?subProperties ?subPropertiesLabel WHERE {
  ?subProperties wdt:P1647* wd:P276.
  SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE],en". }
}
```


```sql
# @see https://www.wikidata.org/wiki/Wikidata:SPARQL_query_service/queries/examples#Properties_grouped_by_their_parent_property
#Properties grouped by their parent property
#TODO: should display links and numeric ids
#defaultView:Tree
SELECT ?property2 ?property2Label ?property1 ?property1Label WHERE {
  ?property1 rdf:type wikibase:Property. #not replaceable with wikibase:Item, wikibase:Statement, wikibase:Reference at WDQS
                                         #https://www.mediawiki.org/wiki/Wikibase/Indexing/RDF_Dump_Format#WDQS_data_differences
  ?property1 wdt:P1647 ?property2.
  SERVICE wikibase:label { bd:serviceParam wikibase:language "en". }
}
```

[Link para esta query](https://query.wikidata.org/#%23%20Retorna%20todos%20os%20pa%C3%ADses%2Fterrit%C3%B3rios%20que%20tenham%20propriedade%20%273166-1%20alpha-2%27%0A%23%20e%20j%C3%A1%20exibe%20informa%C3%A7%C3%B5es%20adicionais%20para%20fazer%20concilia%C3%A7%C3%A3o%20com%20dados%20do%20HXL-CPLP%0ASELECT%20%3Fcountry_code_v_iso2%20%3Fcountry_code_v_iso3%20%3Fcountry_code_v_isonum%20%3Fcountry%20%3FcountryLabel%20%3Fpopulation%0AWHERE%0A%7B%0A%20%20%20%20%3Fcountry%20wdt%3AP297%20%3Fcountry_code_v_iso2%20.%0A%20%20%20%20%3Fcountry%20wdt%3AP298%20%3Fcountry_code_v_iso3%20.%0A%20%20%20%20%3Fcountry%20wdt%3AP299%20%3Fcountry_code_v_isonum%20.%0A%20%20%20%20SERVICE%20wikibase%3Alabel%20%7B%20bd%3AserviceParam%20wikibase%3Alanguage%20%22en%22%20%7D%0A%7D%0AORDER%20BY%20ASC%28%3FcountryLabel%29)

```sql
# Retorna todos os países/territórios que tenham propriedade '3166-1 alpha-2'
# e já exibe informações adicionais para fazer conciliação com dados do HXL-CPLP
SELECT ?country_code_v_iso2 ?country_code_v_iso3 ?country_code_v_isonum ?country ?countryLabel ?population
WHERE
{
    ?country wdt:P297 ?country_code_v_iso2 .
    ?country wdt:P298 ?country_code_v_iso3 .
    ?country wdt:P299 ?country_code_v_isonum .
    SERVICE wikibase:label { bd:serviceParam wikibase:language "en" }
}
ORDER BY ASC(?countryLabel)
```