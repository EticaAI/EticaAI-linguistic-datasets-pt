# sparql-wikidata.md

> Este arquivo é um rascunho. Veja https://github.com/HXL-CPLP/forum/issues/36 e
  https://github.com/HXL-CPLP/forum/issues/34
  

- https://query.wikidata.org/

## Exemplos de queries

[Link para esta query](https://query.wikidata.org/#%23%20Retorna%20todos%20os%20pa%C3%ADses%2Fterrit%C3%B3rios%20que%20tenham%20propriedade%20%273166-1%20alpha-2%27%0A%23%20e%20j%C3%A1%20exibe%20informa%C3%A7%C3%B5es%20adicionais%20para%20fazer%20concilia%C3%A7%C3%A3o%20com%20dados%20do%20HXL-CPLP%0ASELECT%20%3Fcountry_code_v_iso2%20%3Fcountry_code_v_iso3%20%3Fcountry_code_v_isonum%20%3Fcountry%20%3FcountryLabel%20%3Fpopulation%0AWHERE%0A%7B%0A%20%20%20%20%3Fcountry%20wdt%3AP297%20%3Fcountry_code_v_iso2%20.%0A%20%20%20%20%3Fcountry%20wdt%3AP298%20%3Fcountry_code_v_iso3%20.%0A%20%20%20%20%3Fcountry%20wdt%3AP299%20%3Fcountry_code_v_isonum%20.%0A%20%20%20%20SERVICE%20wikibase%3Alabel%20%7B%20bd%3AserviceParam%20wikibase%3Alanguage%20%22en%22%20%7D%0A%7D%0AORDER%20BY%20ASC%28%3FcountryLabel%29)

```sql
# Retorna todos os países/territórios que tenham propriedade '3166-1 alpha-2'
# e já exibe informações adicionais para fazer conciliação com dados do HXL-CPLP
SELECT ?country_code_v_iso2 ?country_code_v_iso3 ?country_code_v_isonum ?country_code_v_m49 ?country_code_v_wikidata_p3916 ?country_code_v_wikidata_p402 ?country_code_v_wikidata_p3024 ?country ?countryLabel ?population
WHERE
{
    ?country wdt:P297 ?country_code_v_iso2 .
    ?country wdt:P298 ?country_code_v_iso3 .
    OPTIONAL {
        ?country wdt:P299 ?country_code_v_isonum .
    }
    OPTIONAL {
        ?country wdt:P2082 ?country_code_v_m49 .
    }
    # UNESCO Thesaurus ID
    OPTIONAL {
        ?country wdt:P3916 ?country_code_v_wikidata_p3916 .
    }
    # OpenStreetMap relation ID
    OPTIONAL {
        ?country wdt:P402 ?country_code_v_wikidata_p402 .
    }
    # International Telecommunication Union radiocommunication division
    OPTIONAL {
        ?country wdt:P3024 ?country_code_v_wikidata_p3024 .
    }
    
    SERVICE wikibase:label { bd:serviceParam wikibase:language "en" }
}
ORDER BY ASC(?country_code_v_iso2)
```

A query abaixo já começa a exibir replicados (por causa do
`?country wdt:P1448 ?country_name_officialname .`).

```sql
# Retorna todos os países/territórios que tenham propriedade '3166-1 alpha-2'
# e já exibe informações adicionais para fazer conciliação com dados do HXL-CPLP
SELECT ?country_code_v_iso2 ?country_code_v_iso3 ?country_code_v_isonum ?country_code_v_m49 ?country_code_v_wikidata_p3916 ?country_code_v_wikidata_p402 ?country_code_v_wikidata_p3024 ?country ?countryLabel ?country_name_officialname
WHERE
{
    ?country wdt:P297 ?country_code_v_iso2 .
    ?country wdt:P298 ?country_code_v_iso3 .
    OPTIONAL {
        ?country wdt:P299 ?country_code_v_isonum .
    }
    OPTIONAL {
        ?country wdt:P2082 ?country_code_v_m49 .
    }
    # UNESCO Thesaurus ID
    OPTIONAL {
        ?country wdt:P3916 ?country_code_v_wikidata_p3916 .
    }
    # OpenStreetMap relation ID
    OPTIONAL {
        ?country wdt:P402 ?country_code_v_wikidata_p402 .
    }
    # International Telecommunication Union radiocommunication division
    OPTIONAL {
        ?country wdt:P3024 ?country_code_v_wikidata_p3024 .
    }
    OPTIONAL {
        ?country wdt:P1448 ?country_name_officialname .
    }
    
    SERVICE wikibase:label { bd:serviceParam wikibase:language "en" }
  
}
ORDER BY ASC(?country_code_v_iso2)
```