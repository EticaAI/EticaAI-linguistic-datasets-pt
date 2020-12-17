# sparql-wikidata.md

- Este arquivo usa o https://query.wikidata.org/
- Veja https://github.com/HXL-CPLP/forum/issues/36 e https://github.com/HXL-CPLP/forum/issues/34
  para mais detalhes.
- Veja https://github.com/HXL-CPLP/forum/issues/43

<!-- TOC -->

- [sparql-wikidata.md](#sparql-wikidatamd)
    - [Exemplos de queries](#exemplos-de-queries)
        - [Retorne propriedades de países e territórios da Wikidata (Wikipedia)](#retorne-propriedades-de-países-e-territórios-da-wikidata-wikipedia)
        - [Informações sobre itens que são partes do corpo humano](#informações-sobre-itens-que-são-partes-do-corpo-humano)

<!-- /TOC -->


## Exemplos de queries

### Retorne propriedades de países e territórios da Wikidata (Wikipedia)

[Link para esta query](https://query.wikidata.org/#%23%20Retorna%20todos%20os%20pa%C3%ADses%2Fterrit%C3%B3rios%20que%20tenham%20propriedade%20%273166-1%20alpha-2%27%0A%23%20e%20j%C3%A1%20exibe%20informa%C3%A7%C3%B5es%20adicionais%20para%20fazer%20concilia%C3%A7%C3%A3o%20com%20dados%20do%20HXL-CPLP%0A%23%20TODO%3A%20pegar%20mais%20algumas%20propriedades%2C%20como%20nomes%20oficiais%2C%20capital%2C%20etc%0ASELECT%0A%20%20%3Fcountry_code_v_iso2%0A%20%20%3Fcountry_code_v_iso3%0A%20%20%3Fcountry_code_v_isonum%0A%20%20%3Fcountry_code_v_m49%0A%20%20%3Fcountry_code_v_wikidata_p3916%0A%20%20%3Fcountry_code_v_wikidata_p402%0A%20%20%3Fcountry_code_v_wikidata_p3024%0A%20%20%3Fcountry%20%3FcountryLabel%0A%20%20%23%20%3Fcountry_name_officialname%0A%20%20%23%20%28GROUP_CONCAT%28%3Fcountry_name_officialname%20%3B%20separator%20%3D%20%22%7C%22%29%20AS%20%3Fcountry_name_officialnames%29%0AWHERE%0A%7B%0A%20%20%20%20%3Fcountry%20wdt%3AP297%20%3Fcountry_code_v_iso2%20.%0A%20%20%20%20%3Fcountry%20wdt%3AP298%20%3Fcountry_code_v_iso3%20.%0A%20%20%20%20OPTIONAL%20%7B%0A%20%20%20%20%20%20%20%20%3Fcountry%20wdt%3AP299%20%3Fcountry_code_v_isonum%20.%0A%20%20%20%20%7D%0A%20%20%20%20OPTIONAL%20%7B%0A%20%20%20%20%20%20%20%20%3Fcountry%20wdt%3AP2082%20%3Fcountry_code_v_m49%20.%0A%20%20%20%20%7D%0A%20%20%20%20%23%20UNESCO%20Thesaurus%20ID%0A%20%20%20%20OPTIONAL%20%7B%0A%20%20%20%20%20%20%20%20%3Fcountry%20wdt%3AP3916%20%3Fcountry_code_v_wikidata_p3916%20.%0A%20%20%20%20%7D%0A%20%20%20%20%23%20OpenStreetMap%20relation%20ID%0A%20%20%20%20OPTIONAL%20%7B%0A%20%20%20%20%20%20%20%20%3Fcountry%20wdt%3AP402%20%3Fcountry_code_v_wikidata_p402%20.%0A%20%20%20%20%7D%0A%20%20%20%20%23%20International%20Telecommunication%20Union%20radiocommunication%20division%0A%20%20%20%20OPTIONAL%20%7B%0A%20%20%20%20%20%20%20%20%3Fcountry%20wdt%3AP3024%20%3Fcountry_code_v_wikidata_p3024%20.%0A%20%20%20%20%7D%0A%20%20%20%20%23OPTIONAL%20%7B%0A%20%20%20%20%23%20%20%20%20%3Fcountry%20wdt%3AP1448%20%3Fcountry_name_officialname%20.%0A%20%20%20%20%23%7D%0A%20%20%20%20%0A%20%20%20%20SERVICE%20wikibase%3Alabel%20%7B%20bd%3AserviceParam%20wikibase%3Alanguage%20%22pt%22%20%7D%0A%20%20%20%20%23%20SERVICE%20wikibase%3Alabel%20%7B%20bd%3AserviceParam%20wikibase%3Alanguage%20%22es%22%20%7D%0A%20%20%20%20%23%20SERVICE%20wikibase%3Alabel%20%7B%20bd%3AserviceParam%20wikibase%3Alanguage%20%22en%22%20%7D%0A%20%20%20%20%23%20SERVICE%20wikibase%3Alabel%20%7B%20bd%3AserviceParam%20wikibase%3Alanguage%20%22fr%22%20%7D%0A%20%20%20%20%23%20SERVICE%20wikibase%3Alabel%20%7B%20bd%3AserviceParam%20wikibase%3Alanguage%20%22sw%22%20%7D%0A%20%20%20%20%23%20SERVICE%20wikibase%3Alabel%20%7B%20bd%3AserviceParam%20wikibase%3Alanguage%20%22tet%22%20%7D%0A%20%20%20%20%23%20SERVICE%20wikibase%3Alabel%20%7B%20bd%3AserviceParam%20wikibase%3Alanguage%20%22yue%22%20%7D%0A%7D%0AORDER%20BY%20ASC%28%3Fcountry_code_v_iso2%29)

```sql
# Retorna todos os países/territórios que tenham propriedade '3166-1 alpha-2'
# e já exibe informações adicionais para fazer conciliação com dados do HXL-CPLP
# TODO: pegar mais algumas propriedades, como nomes oficiais, capital, etc
SELECT
  ?country_code_v_iso2
  ?country_code_v_iso3
  ?country_code_v_isonum
  ?country_code_v_m49
  ?country_code_v_wikidata_p3916
  ?country_code_v_wikidata_p402
  ?country_code_v_wikidata_p3024
  ?country ?countryLabel
  # ?country_name_officialname
  # (GROUP_CONCAT(?country_name_officialname ; separator = "|") AS ?country_name_officialnames)
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
    #OPTIONAL {
    #    ?country wdt:P1448 ?country_name_officialname .
    #}
    
    SERVICE wikibase:label { bd:serviceParam wikibase:language "pt" }
    # SERVICE wikibase:label { bd:serviceParam wikibase:language "es" }
    # SERVICE wikibase:label { bd:serviceParam wikibase:language "en" }
    # SERVICE wikibase:label { bd:serviceParam wikibase:language "fr" }
    # SERVICE wikibase:label { bd:serviceParam wikibase:language "sw" }
    # SERVICE wikibase:label { bd:serviceParam wikibase:language "tet" }
    # SERVICE wikibase:label { bd:serviceParam wikibase:language "yue" }
}
ORDER BY ASC(?country_code_v_iso2)

```

A query abaixo já começa a exibir replicados (por causa do
`?country wdt:P1448 ?country_name_officialname .`).

```sql
SELECT
  ?country_code_v_iso2
  ?country_code_v_iso3
  ?country_code_v_isonum
  ?country_code_v_m49
  ?country_code_v_wikidata_p3916
  ?country_code_v_wikidata_p402
  ?country_code_v_wikidata_p3024
  ?country ?countryLabel
  ?country_name_officialname
  # (GROUP_CONCAT(?country_name_officialname ; separator = "|") AS ?country_name_officialnames)
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

# } GROUP BY ?country_code_v_iso2
ORDER BY ASC(?country_code_v_iso2)
# LIMIT 10

```

### Informações sobre itens que são partes do corpo humano


```sql
# Rascunho
```