# sparql-wikidata.md

- Este arquivo usa o https://query.wikidata.org/
- Veja https://github.com/HXL-CPLP/forum/issues/36 e https://github.com/HXL-CPLP/forum/issues/34
  para mais detalhes.
- Veja https://github.com/HXL-CPLP/forum/issues/43

<!-- TOC -->

- [sparql-wikidata.md](#sparql-wikidatamd)
    - [Ajuda](#ajuda)
    - [Exemplos de queries](#exemplos-de-queries)
        - [Retorne propriedades de países e territórios da Wikidata (Wikipedia)](#retorne-propriedades-de-países-e-territórios-da-wikidata-wikipedia)
            - [Alternativa 1](#alternativa-1)
            - [Alternativa 2](#alternativa-2)
        - [Informações sobre itens que são partes do corpo humano](#informações-sobre-itens-que-são-partes-do-corpo-humano)

<!-- /TOC -->

## Ajuda
- _How to get Wikidata labels in more than one language?_
  - https://stackoverflow.com/questions/43258341/how-to-get-wikidata-labels-in-more-than-one-language
  - https://en.wikiversity.org/wiki/Research_in_programming_Wikidata/Countries#List_of_countries

## Exemplos de queries

### Retorne propriedades de países e territórios da Wikidata (Wikipedia)

#### Alternativa 1

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

#### Alternativa 2


```sql
# instance of: human organ (Q25449120)
# A lista de linguas é baseada 1) nas 6 oficiais da ONU 2) nas mais comuns na CPLP https://cplp.etica.ai/
#
# Retorna todos os países/territórios que tenham propriedade '3166-1 alpha-2'
# Idiomas escolhidos:
#  1) Idiomas oficiais da ONU, por ordem alfabética do iso2
#  2) Idiomas mais falados na CPLP, por ordem alfabética, vide https://cplp.etica.ai/
#
# TODO: considerar obter propriedades adicionais, como nome oficial, capital, etc (fititnt, 2020-12-17 03:47 BRT)

SELECT
    ?item_v_wikidata
    ?country_name_v_wikidata_i_ar
    ?country_name_v_wikidata_i_en
    ?country_name_v_wikidata_i_es
    ?country_name_v_wikidata_i_fr
    ?country_name_v_wikidata_i_ru
    ?country_name_v_wikidata_i_zh
    ?country_name_v_wikidata_i_pt
    ?country_name_v_wikidata_i_tet
    ?country_name_v_wikidata_i_yue
WHERE
{
    ?item wdt:P297 ?country_code_v_iso2 .
    ?item wdt:P297 ?country_code_v_iso2 .
    ?item wdt:P298 ?country_code_v_iso3 .
    OPTIONAL { ?item wdt:P299 ?country_code_v_isonum } .
    
    OPTIONAL { ?item wdt:P2082 ?country_code_v_m49 } .

    # UNESCO Thesaurus ID
    OPTIONAL { ?item wdt:P3916 ?country_code_v_wikidata_p3916 } .
    
    # OpenStreetMap relation ID
    OPTIONAL { ?item wdt:P402 ?country_code_v_wikidata_p402 } .

    # International Telecommunication Union radiocommunication division
    OPTIONAL { ?item wdt:P3024 ?country_code_v_wikidata_p3024 } .

    # Country, by label
    OPTIONAL { ?item rdfs:label ?country_name_v_wikidata_i_ar filter (lang(?country_name_v_wikidata_i_ar) = "ar") } .
    OPTIONAL { ?item rdfs:label ?country_name_v_wikidata_i_en filter (lang(?country_name_v_wikidata_i_en) = "en") } .
    OPTIONAL { ?item rdfs:label ?country_name_v_wikidata_i_es filter (lang(?country_name_v_wikidata_i_es) = "es") } .
    OPTIONAL { ?item rdfs:label ?country_name_v_wikidata_i_fr filter (lang(?country_name_v_wikidata_i_fr) = "fr") } .
    OPTIONAL { ?item rdfs:label ?country_name_v_wikidata_i_ru filter (lang(?country_name_v_wikidata_i_ru) = "ru") } .
    OPTIONAL { ?item rdfs:label ?country_name_v_wikidata_i_zh filter (lang(?country_name_v_wikidata_i_zh) = "zh") } .
    OPTIONAL { ?item rdfs:label ?country_name_v_wikidata_i_pt filter (lang(?country_name_v_wikidata_i_pt) = "pt") } .
    OPTIONAL { ?item rdfs:label ?country_name_v_wikidata_i_tet filter (lang(?country_name_v_wikidata_i_tet) = "tet") } .
    OPTIONAL { ?item rdfs:label ?country_name_v_wikidata_i_yue filter (lang(?country_name_v_wikidata_i_yue) = "yue") } .
}
```

<!--

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

-->

### Informações sobre itens que são partes do corpo humano


