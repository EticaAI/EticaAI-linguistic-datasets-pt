# sparql-wikidata.md

- Este arquivo usa o https://query.wikidata.org/
- Veja https://github.com/HXL-CPLP/forum/issues/36 e https://github.com/HXL-CPLP/forum/issues/34
  para mais detalhes.
- Veja https://github.com/HXL-CPLP/forum/issues/43

<!-- TOC -->

- [sparql-wikidata.md](#sparql-wikidatamd)
    - [Ajuda](#ajuda)
    - [Queries de uso prático](#queries-de-uso-prático)
        - [Queries de exemplo](#queries-de-exemplo)
        - [Retorne propriedades de países e territórios da Wikidata (Wikipedia)](#retorne-propriedades-de-países-e-territórios-da-wikidata-wikipedia)
            - [Alternativa 1](#alternativa-1)
            - [Alternativa 2](#alternativa-2)
        - [Informações sobre itens que são partes do corpo humano](#informações-sobre-itens-que-são-partes-do-corpo-humano)
        - [Informações sobre órgãos de animais](#informações-sobre-órgãos-de-animais)
    - [Queries de exemplo](#queries-de-exemplo-1)

<!-- /TOC -->

## Ajuda
- _How to get Wikidata labels in more than one language?_
  - https://stackoverflow.com/questions/43258341/how-to-get-wikidata-labels-in-more-than-one-language
  - https://en.wikiversity.org/wiki/Research_in_programming_Wikidata/Countries#List_of_countries

## Queries de uso prático

### Queries de exemplo

```sql
# Query simples, usara para exemplo do https://query.wikidata.org/
# Veja também: https://www.wikidata.org/wiki/Wikidata:SPARQL_query_service/queries/examples
# Retorna todos os países/territórios que tenham propriedade '3166-1 alpha-2'
SELECT
    ?item
    ?country_code_v_iso2
    ?item_name_v_wikidata_i_en
    ?item_name_v_wikidata_i_por
WHERE
{
    ?item wdt:P297 ?country_code_v_iso2 .

    # Item, by label
    OPTIONAL { ?item rdfs:label ?item_name_v_wikidata_i_en filter (lang(?item_name_v_wikidata_i_en) = "en") } .
    OPTIONAL { ?item rdfs:label ?item_name_v_wikidata_i_por filter (lang(?item_name_v_wikidata_i_por) = "pt") } .
}
ORDER BY ASC(?country_code_v_iso2)
```

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

[Link para esta query](https://query.wikidata.org/#%23%20Retorna%20todos%20os%20pa%C3%ADses%2Fterrit%C3%B3rios%20que%20tenham%20propriedade%20%273166-1%20alpha-2%27%0A%23%0A%23%20Idiomas%20escolhidos%3A%0A%23%20%201%29%20Idiomas%20oficiais%20da%20ONU%2C%20por%20ordem%20alfab%C3%A9tica%20do%20c%C3%B3digo%20de%20idioma%20iso639-2%0A%23%20%202%29%20Idiomas%20mais%20falados%20na%20CPLP%20%28vide%20https%3A%2F%2Fcplp.etica.ai%2F%29%20mais%20Esperanto%20e%20Latim%2C%20por%20ordem%20alfab%C3%A9tica%20c%C3%B3digo%20de%20idioma%20iso639-3%0A%23%0A%23%20TODO%3A%20considerar%20obter%20propriedades%20adicionais%2C%20como%20nome%20oficial%2C%20capital%2C%20etc%20%28fititnt%2C%202020-12-17%2003%3A47%20BRT%29%0A%0ASELECT%0A%20%20%20%20%3Fitem_v_wikidata%0A%20%20%20%20%3Fcountry_name_v_wikidata_i_ar%0A%20%20%20%20%3Fcountry_name_v_wikidata_i_en%0A%20%20%20%20%3Fcountry_name_v_wikidata_i_es%0A%20%20%20%20%3Fcountry_name_v_wikidata_i_fr%0A%20%20%20%20%3Fcountry_name_v_wikidata_i_ru%0A%20%20%20%20%3Fcountry_name_v_wikidata_i_zh%0A%20%20%20%20%3Fcountry_name_v_wikidata_i_epo%0A%20%20%20%20%3Fcountry_name_v_wikidata_i_lat%0A%20%20%20%20%3Fcountry_name_v_wikidata_i_por%0A%20%20%20%20%3Fcountry_name_v_wikidata_i_tet%0A%20%20%20%20%3Fcountry_name_v_wikidata_i_yue%0AWHERE%0A%7B%0A%20%20%20%20%3Fitem%20wdt%3AP297%20%3Fcountry_code_v_iso2%20.%0A%20%20%20%20%3Fitem%20wdt%3AP297%20%3Fcountry_code_v_iso2%20.%0A%20%20%20%20%3Fitem%20wdt%3AP298%20%3Fcountry_code_v_iso3%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP299%20%3Fcountry_code_v_isonum%20%7D%20.%0A%20%20%20%20%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP2082%20%3Fcountry_code_v_m49%20%7D%20.%0A%0A%20%20%20%20%23%20UNESCO%20Thesaurus%20ID%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP3916%20%3Fcountry_code_v_wikidata_p3916%20%7D%20.%0A%20%20%20%20%0A%20%20%20%20%23%20OpenStreetMap%20relation%20ID%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP402%20%3Fcountry_code_v_wikidata_p402%20%7D%20.%0A%0A%20%20%20%20%23%20International%20Telecommunication%20Union%20radiocommunication%20division%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP3024%20%3Fcountry_code_v_wikidata_p3024%20%7D%20.%0A%0A%20%20%20%20%23%20Country%2Fterritory%2C%20by%20label%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fcountry_name_v_wikidata_i_ar%20filter%20%28lang%28%3Fcountry_name_v_wikidata_i_ar%29%20%3D%20%22ar%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fcountry_name_v_wikidata_i_en%20filter%20%28lang%28%3Fcountry_name_v_wikidata_i_en%29%20%3D%20%22en%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fcountry_name_v_wikidata_i_es%20filter%20%28lang%28%3Fcountry_name_v_wikidata_i_es%29%20%3D%20%22es%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fcountry_name_v_wikidata_i_fr%20filter%20%28lang%28%3Fcountry_name_v_wikidata_i_fr%29%20%3D%20%22fr%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fcountry_name_v_wikidata_i_ru%20filter%20%28lang%28%3Fcountry_name_v_wikidata_i_ru%29%20%3D%20%22ru%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fcountry_name_v_wikidata_i_zh%20filter%20%28lang%28%3Fcountry_name_v_wikidata_i_zh%29%20%3D%20%22zh%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fcountry_name_v_wikidata_i_epo%20filter%20%28lang%28%3Fcountry_name_v_wikidata_i_epo%29%20%3D%20%22eo%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fcountry_name_v_wikidata_i_lat%20filter%20%28lang%28%3Fcountry_name_v_wikidata_i_lat%29%20%3D%20%22la%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fcountry_name_v_wikidata_i_por%20filter%20%28lang%28%3Fcountry_name_v_wikidata_i_por%29%20%3D%20%22pt%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fcountry_name_v_wikidata_i_tet%20filter%20%28lang%28%3Fcountry_name_v_wikidata_i_tet%29%20%3D%20%22tet%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fcountry_name_v_wikidata_i_yue%20filter%20%28lang%28%3Fcountry_name_v_wikidata_i_yue%29%20%3D%20%22yue%22%29%20%7D%20.%0A%7D)


```sql
# Retorna todos os países/territórios que tenham propriedade '3166-1 alpha-2'
#
# Idiomas escolhidos:
#  1) Idiomas oficiais da ONU, por ordem alfabética do código de idioma iso639-2
#  2) Idiomas mais falados na CPLP (vide https://cplp.etica.ai/) mais Esperanto e Latim, por ordem alfabética código de idioma iso639-3
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
    ?country_name_v_wikidata_i_epo
    ?country_name_v_wikidata_i_lat
    ?country_name_v_wikidata_i_por
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

    # Country/territory, by label
    OPTIONAL { ?item rdfs:label ?country_name_v_wikidata_i_ar filter (lang(?country_name_v_wikidata_i_ar) = "ar") } .
    OPTIONAL { ?item rdfs:label ?country_name_v_wikidata_i_en filter (lang(?country_name_v_wikidata_i_en) = "en") } .
    OPTIONAL { ?item rdfs:label ?country_name_v_wikidata_i_es filter (lang(?country_name_v_wikidata_i_es) = "es") } .
    OPTIONAL { ?item rdfs:label ?country_name_v_wikidata_i_fr filter (lang(?country_name_v_wikidata_i_fr) = "fr") } .
    OPTIONAL { ?item rdfs:label ?country_name_v_wikidata_i_ru filter (lang(?country_name_v_wikidata_i_ru) = "ru") } .
    OPTIONAL { ?item rdfs:label ?country_name_v_wikidata_i_zh filter (lang(?country_name_v_wikidata_i_zh) = "zh") } .
    OPTIONAL { ?item rdfs:label ?country_name_v_wikidata_i_epo filter (lang(?country_name_v_wikidata_i_epo) = "eo") } .
    OPTIONAL { ?item rdfs:label ?country_name_v_wikidata_i_lat filter (lang(?country_name_v_wikidata_i_lat) = "la") } .
    OPTIONAL { ?item rdfs:label ?country_name_v_wikidata_i_por filter (lang(?country_name_v_wikidata_i_por) = "pt") } .
    OPTIONAL { ?item rdfs:label ?country_name_v_wikidata_i_tet filter (lang(?country_name_v_wikidata_i_tet) = "tet") } .
    OPTIONAL { ?item rdfs:label ?country_name_v_wikidata_i_yue filter (lang(?country_name_v_wikidata_i_yue) = "yue") } .
}
```


### Informações sobre itens que são partes do corpo humano
- Com relação a órgãos, coração é um modelo de itens com mais detalhes
  - <https://www.wikidata.org/wiki/Q1072>
- TA98 Latin term: Latin name for anatomical subject as described in Terminologia Anatomica 98
  - https://www.wikidata.org/wiki/Property:P3982

### Informações sobre órgãos de animais

[Link para esta query](https://query.wikidata.org/#%23%20Retorna%20lista%20de%20itens%20que%20s%C3%A3o%20parte%20de%20animal%20organ%20%28Q24060765%29%0A%23%20Item%20de%20referencia%3A%20heart%20%28Q1072%29%20https%3A%2F%2Fwww.wikidata.org%2Fwiki%2FQ1072%0A%23%0A%23%20Idiomas%20escolhidos%3A%0A%23%20%201%29%20Idiomas%20oficiais%20da%20ONU%2C%20por%20ordem%20alfab%C3%A9tica%20do%20c%C3%B3digo%20de%20idioma%20iso639-2%0A%23%20%202%29%20Idiomas%20mais%20falados%20na%20CPLP%20%28vide%20https%3A%2F%2Fcplp.etica.ai%2F%29%20mais%20Esperanto%20e%20Latim%2C%20por%20ordem%20alfab%C3%A9tica%20c%C3%B3digo%20de%20idioma%20iso639-3%0A%23%0A%23%20TODO%3A%20a%20query%20ainda%20esta%20retornando%20poucos%20valores.%20O%20ideal%20seria%20o%20%0A%23%20%20%20%20%20%20%20mais%20pr%C3%B3ximo%20de%20tudo%20que%20poderia%20ser%20citado%20relacionado%20a%20corpo%20humano%0A%23%20%20%20%20%20%20%20mesmo%20que%20tenhamos%20que%20quebrar%20em%20mais%20de%20um%20dataset%20%28fititnt%2C%202020-12-17%2008%3A38%20BRT%29%0A%23%20TODO%3A%20a%20query%20deveria%20retornar%20apenas%20o%20valor%20de%20texto%2C%20mas%20esta%20retornando%20URL%20%28fititnt%2C%202020-12-17%2008%3A38%20BRT%29%0ASELECT%0A%20%20%20%20%3Fitem%0A%20%20%20%20%23%20%3Fid%0A%20%20%20%20%23%20%3Fitem_code_v_wikidata%0A%20%20%20%20%3Fitem_name_v_wikidata_i_ar%0A%20%20%20%20%3Fitem_name_v_wikidata_i_en%0A%20%20%20%20%3Fitem_name_v_wikidata_i_es%0A%20%20%20%20%3Fitem_name_v_wikidata_i_fr%0A%20%20%20%20%3Fitem_name_v_wikidata_i_ru%0A%20%20%20%20%3Fitem_name_v_wikidata_i_zh%0A%20%20%20%20%3Fitem_name_v_wikidata_i_epo%0A%20%20%20%20%3Fitem_name_v_wikidata_i_lat%0A%20%20%20%20%3Fitem_name_v_wikidata_i_por%0A%20%20%20%20%3Fitem_name_v_wikidata_i_tet%0A%20%20%20%20%3Fitem_name_v_wikidata_i_yue%0AWHERE%0A%7B%0A%20%20%20%20%23%20%3Fitem%20wdt%3AP279%20wd%3AQ25449120%20.%20%23%20human%20organ%20%28Q25449120%29%2C%205%20resultados%20em%202020%20%28pouco%29%0A%20%20%20%20%3Fitem%20wdt%3AP279%20wd%3AQ24060765%20.%20%23%20animal%20organ%20%28Q24060765%29%2C%2034%20resuldados%20em%202020%20%28aidna%20pouco%29%0A%20%20%20%20%23%20%3Fitem%20wdt%3AP279%20%3Fid%20%23%20animal%20organ%20%28Q24060765%29%2C%2034%20resuldados%20em%202020%20%28aidna%20pouco%29%0A%0A%20%20%20%20%23%20Item%2C%20by%20label%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fitem_name_v_wikidata_i_ar%20filter%20%28lang%28%3Fitem_name_v_wikidata_i_ar%29%20%3D%20%22ar%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fitem_name_v_wikidata_i_en%20filter%20%28lang%28%3Fitem_name_v_wikidata_i_en%29%20%3D%20%22en%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fitem_name_v_wikidata_i_es%20filter%20%28lang%28%3Fitem_name_v_wikidata_i_es%29%20%3D%20%22es%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fitem_name_v_wikidata_i_fr%20filter%20%28lang%28%3Fitem_name_v_wikidata_i_fr%29%20%3D%20%22fr%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fitem_name_v_wikidata_i_ru%20filter%20%28lang%28%3Fitem_name_v_wikidata_i_ru%29%20%3D%20%22ru%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fitem_name_v_wikidata_i_zh%20filter%20%28lang%28%3Fitem_name_v_wikidata_i_zh%29%20%3D%20%22zh%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fitem_name_v_wikidata_i_epo%20filter%20%28lang%28%3Fitem_name_v_wikidata_i_epo%29%20%3D%20%22eo%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fitem_name_v_wikidata_i_lat%20filter%20%28lang%28%3Fitem_name_v_wikidata_i_lat%29%20%3D%20%22la%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fitem_name_v_wikidata_i_por%20filter%20%28lang%28%3Fitem_name_v_wikidata_i_por%29%20%3D%20%22pt%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fitem_name_v_wikidata_i_tet%20filter%20%28lang%28%3Fitem_name_v_wikidata_i_tet%29%20%3D%20%22tet%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fitem_name_v_wikidata_i_yue%20filter%20%28lang%28%3Fitem_name_v_wikidata_i_yue%29%20%3D%20%22yue%22%29%20%7D%20.%0A%7D)

```sql
# Retorna lista de itens que são parte de animal organ (Q24060765)
# Item de referencia: heart (Q1072) https://www.wikidata.org/wiki/Q1072
#
# Idiomas escolhidos:
#  1) Idiomas oficiais da ONU, por ordem alfabética do código de idioma iso639-2
#  2) Idiomas mais falados na CPLP (vide https://cplp.etica.ai/) mais Esperanto e Latim, por ordem alfabética código de idioma iso639-3
#
# TODO: a query ainda esta retornando poucos valores. O ideal seria o 
#       mais próximo de tudo que poderia ser citado relacionado a corpo humano
#       mesmo que tenhamos que quebrar em mais de um dataset (fititnt, 2020-12-17 08:38 BRT)
# TODO: a query deveria retornar apenas o valor de texto, mas esta retornando URL (fititnt, 2020-12-17 08:38 BRT)
SELECT
    ?item
    # ?id
    # ?item_code_v_wikidata
    ?item_name_v_wikidata_i_ar
    ?item_name_v_wikidata_i_en
    ?item_name_v_wikidata_i_es
    ?item_name_v_wikidata_i_fr
    ?item_name_v_wikidata_i_ru
    ?item_name_v_wikidata_i_zh
    ?item_name_v_wikidata_i_epo
    ?item_name_v_wikidata_i_lat
    ?item_name_v_wikidata_i_por
    ?item_name_v_wikidata_i_tet
    ?item_name_v_wikidata_i_yue
WHERE
{
    # ?item wdt:P279 wd:Q25449120 . # human organ (Q25449120), 5 resultados em 2020 (pouco)
    ?item wdt:P279 wd:Q24060765 . # animal organ (Q24060765), 34 resuldados em 2020 (aidna pouco)
    # ?item wdt:P279 ?id # animal organ (Q24060765), 34 resuldados em 2020 (aidna pouco)

    # Item, by label
    OPTIONAL { ?item rdfs:label ?item_name_v_wikidata_i_ar filter (lang(?item_name_v_wikidata_i_ar) = "ar") } .
    OPTIONAL { ?item rdfs:label ?item_name_v_wikidata_i_en filter (lang(?item_name_v_wikidata_i_en) = "en") } .
    OPTIONAL { ?item rdfs:label ?item_name_v_wikidata_i_es filter (lang(?item_name_v_wikidata_i_es) = "es") } .
    OPTIONAL { ?item rdfs:label ?item_name_v_wikidata_i_fr filter (lang(?item_name_v_wikidata_i_fr) = "fr") } .
    OPTIONAL { ?item rdfs:label ?item_name_v_wikidata_i_ru filter (lang(?item_name_v_wikidata_i_ru) = "ru") } .
    OPTIONAL { ?item rdfs:label ?item_name_v_wikidata_i_zh filter (lang(?item_name_v_wikidata_i_zh) = "zh") } .
    OPTIONAL { ?item rdfs:label ?item_name_v_wikidata_i_epo filter (lang(?item_name_v_wikidata_i_epo) = "eo") } .
    OPTIONAL { ?item rdfs:label ?item_name_v_wikidata_i_lat filter (lang(?item_name_v_wikidata_i_lat) = "la") } .
    OPTIONAL { ?item rdfs:label ?item_name_v_wikidata_i_por filter (lang(?item_name_v_wikidata_i_por) = "pt") } .
    OPTIONAL { ?item rdfs:label ?item_name_v_wikidata_i_tet filter (lang(?item_name_v_wikidata_i_tet) = "tet") } .
    OPTIONAL { ?item rdfs:label ?item_name_v_wikidata_i_yue filter (lang(?item_name_v_wikidata_i_yue) = "yue") } .
}
```

## Queries de exemplo

```sql
# Query simples, usara para exemplo do https://query.wikidata.org/
# Veja também: https://www.wikidata.org/wiki/Wikidata:SPARQL_query_service/queries/examples
#
# Retorna todos os países/territórios que tenham propriedade '3166-1 alpha-2'
SELECT
    ?item
    ?country_code_v_iso2
    ?item_name_v_wikidata_i_en
    ?item_name_v_wikidata_i_por
WHERE
{
    ?item wdt:P297 ?country_code_v_iso2 .

    # Item, by label
    OPTIONAL { ?item rdfs:label ?item_name_v_wikidata_i_en filter (lang(?item_name_v_wikidata_i_en) = "en") } .
    OPTIONAL { ?item rdfs:label ?item_name_v_wikidata_i_por filter (lang(?item_name_v_wikidata_i_por) = "pt") } .
}
ORDER BY ASC(?country_code_v_iso2)
```


```sql
# Query simples, usara para exemplo do https://query.wikidata.org/
# Veja também: https://www.wikidata.org/wiki/Wikidata:SPARQL_query_service/queries/examples
#
# Retorna todos os países/territórios que tenham propriedade '3166-1 alpha-2',
# porem restringe aos que tem também são parte da propedade South America (Q18)
SELECT
    ?item
    ?country_code_v_iso2
    ?item_name_v_wikidata_i_en
    ?item_name_v_wikidata_i_por
WHERE
{
    # Requer que o item também seja parte de um atributo, como South America (Q18)
    #  part of (P361) South America (Q18)
    ?item wdt:P361 wd:Q18 .

    ?item wdt:P297 ?country_code_v_iso2 .

    # Item, by label
    OPTIONAL { ?item rdfs:label ?item_name_v_wikidata_i_en filter (lang(?item_name_v_wikidata_i_en) = "en") } .
    OPTIONAL { ?item rdfs:label ?item_name_v_wikidata_i_por filter (lang(?item_name_v_wikidata_i_por) = "pt") } .
}
ORDER BY ASC(?country_code_v_iso2)
```