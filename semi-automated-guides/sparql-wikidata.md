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

[Link para esta query](https://query.wikidata.org/#%23%20Retorna%20lista%20de%20itens%20que%20s%C3%A3o%20parte%20de%20animal%20organ%20%28Q24060765%29%0A%23%20Item%20de%20referencia%3A%20heart%20%28Q1072%29%20https%3A%2F%2Fwww.wikidata.org%2Fwiki%2FQ1072%0A%23%0A%23%20Idiomas%20escolhidos%3A%0A%23%20%201%29%20Idiomas%20oficiais%20da%20ONU%2C%20por%20ordem%20alfab%C3%A9tica%20do%20c%C3%B3digo%20de%20idioma%20iso639-2%0A%23%20%202%29%20Idiomas%20mais%20falados%20na%20CPLP%20%28vide%20https%3A%2F%2Fcplp.etica.ai%2F%29%20mais%20Esperanto%20e%20Latim%2C%20por%20ordem%20alfab%C3%A9tica%20c%C3%B3digo%20de%20idioma%20iso639-3%0A%23%0A%23%20TODO%3A%20a%20query%20ainda%20esta%20retornando%20poucos%20valores.%20O%20ideal%20seria%20o%20%0A%23%20%20%20%20%20%20%20mais%20pr%C3%B3ximo%20de%20tudo%20que%20poderia%20ser%20citado%20relacionado%20a%20corpo%20humano%0A%23%20%20%20%20%20%20%20mesmo%20que%20tenhamos%20que%20quebrar%20em%20mais%20de%20um%20dataset%20%28fititnt%2C%202020-12-17%2008%3A38%20BRT%29%0A%23%20TODO%3A%20a%20query%20deveria%20retornar%20apenas%20o%20valor%20de%20texto%20%28ex%3A%20Q1072%29%2C%20mas%20esta%20retornando%20URL%20%28fititnt%2C%202020-12-17%2008%3A38%20BRT%29%0A%23%20NOTE%3A%20based%20on%20Q1072%2C%20some%20IDs%20are%20not%20added%20on%20this%20example%20%28at%20least%20not%20yet%29%3A%20P5019%2C%20P1296%2C%20P1256%2C%20P6573%2C%20P6900%2C%20P1245%2C%20P3417%2C%20Q1072%2C%20P7827%0ASELECT%0A%20%20%20%20%3Fitem%0A%20%20%20%20%23%20%3Fid%0A%20%20%20%20%23%20%3Fitem_code_v_wikidata%0A%20%20%20%20%3Fitem_code_v_au_aev%0A%20%20%20%20%3Fitem_code_v_babelnet%0A%20%20%20%20%3Fitem_code_v_cz_nkp%0A%20%20%20%20%3Fitem_code_v_cz_psh%0A%20%20%20%20%3Fitem_code_v_de_brendaenzymes%0A%20%20%20%20%3Fitem_code_v_de_gnd%0A%20%20%20%20%3Fitem_code_v_fipat_ta2%0A%20%20%20%20%3Fitem_code_v_fipat_ta98_id%0A%20%20%20%20%3Fitem_code_v_fipat_ta98_latin%0A%20%20%20%20%3Fitem_code_v_fi_yso%0A%20%20%20%20%3Fitem_code_v_freebase%0A%20%20%20%20%3Fitem_code_v_fr_pactols%0A%20%20%20%20%3Fitem_code_v_fr_universalis%0A%20%20%20%20%3Fitem_code_v_it_bncf%0A%20%20%20%20%3Fitem_code_v_it_treccani%0A%20%20%20%20%3Fitem_code_v_jp_ndl%0A%20%20%20%20%3Fitem_code_v_kbpedia%0A%20%20%20%20%3Fitem_code_v_no_snl%0A%20%20%20%20%3Fitem_code_v_ontobee_xao%0A%20%20%20%20%3Fitem_code_v_ru_greo%0A%20%20%20%20%3Fitem_code_v_uberon%0A%20%20%20%20%3Fitem_code_v_uk_britannica%0A%20%20%20%20%3Fitem_code_v_us_jstor%0A%20%20%20%20%3Fitem_code_v_us_mag%0A%20%20%20%20%3Fitem_code_v_us_mesh%0A%20%20%20%20%3Fitem_code_v_us_umls_cui%0A%20%20%20%20%3Fitem_name_v_wikidata_i_ar%0A%20%20%20%20%3Fitem_name_v_wikidata_i_en%0A%20%20%20%20%3Fitem_name_v_wikidata_i_es%0A%20%20%20%20%3Fitem_name_v_wikidata_i_fr%0A%20%20%20%20%3Fitem_name_v_wikidata_i_ru%0A%20%20%20%20%3Fitem_name_v_wikidata_i_zh%0A%20%20%20%20%3Fitem_name_v_wikidata_i_epo%0A%20%20%20%20%3Fitem_name_v_wikidata_i_lat%0A%20%20%20%20%3Fitem_name_v_wikidata_i_por%0A%20%20%20%20%3Fitem_name_v_wikidata_i_tet%0A%20%20%20%20%3Fitem_name_v_wikidata_i_yue%0AWHERE%0A%7B%0A%20%20%20%20%23%20%3Fitem%20wdt%3AP279%20wd%3AQ25449120%20.%20%23%20human%20organ%20%28Q25449120%29%2C%205%20resultados%20em%202020%20%28pouco%29%0A%20%20%20%20%3Fitem%20wdt%3AP279%20wd%3AQ24060765%20.%20%23%20animal%20organ%20%28Q24060765%29%2C%2034%20resuldados%20em%202020%20%28aidna%20pouco%29%0A%20%20%20%20%0A%20%20%20%20%23%20Australian%20Educational%20Vocabulary%20ID%2C%20vocabulary.curriculum.edu.au%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP7033%20%3Fitem_code_v_au_aev%20%7D%20.%0A%0A%20%20%20%20%23%20BabelNet%2C%20babelnet.org%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP2581%20%3Fitem_code_v_babelnet%20%7D%20.%0A%0A%20%20%20%20%23%20National%20Library%20of%20the%20Czech%20Republic%2C%20nkp.cz%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP691%20%3Fitem_code_v_cz_nkp%20%7D%20.%0A%0A%20%20%20%20%23%20Czech%20Technical%20Library%20ID%2C%20psh.techlib.cz%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP1051%20%3Fitem_code_v_cz_psh%20%7D%20.%0A%0A%20%20%20%20%23%20Brenda%20Tissue%20Ontology%2C%20www.brenda-enzymes.org%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP5501%20%3Fitem_code_v_de_brendaenzymes%20%7D%20.%0A%0A%20%20%20%20%23%20German%20National%20Library%20ID%2C%20dnb.de%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP227%20%3Fitem_code_v_de_gnd%20%7D%20.%0A%0A%20%20%20%20%23%20Terminologia%20Anatomica%20second%20edition%20%282019%29%20identifier%2C%20ta2viewer.openanatomy.org%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP7173%20%3Fitem_code_v_fipat_ta2%20%7D%20.%0A%0A%20%20%20%20%23%20Terminologia%20Anatomica%2098%20ID%2C%20unifr.ch%2Fifaa%2F%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP1323%20%3Fitem_code_v_fipat_ta98_id%20%7D%20.%0A%0A%20%20%20%20%23%20Terminologia%20Anatomica%2098%20Latin%20preferred%20term%2C%20unifr.ch%2Fifaa%2F%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP3982%20%3Fitem_code_v_fipat_ta98_latin%20%7D%20.%0A%0A%20%20%20%20%23%20General%20Finnish%20Ontology%20YSO%2C%20yso.fi%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP2347%20%3Fitem_code_v_fi_yso%20%7D%20.%0A%0A%20%20%20%20%23%20Freebase%20ID%20%28still%20accessible%20via%20Google%29%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP646%20%3Fitem_code_v_freebase%20%7D%20.%0A%0A%20%20%20%20%23%20Encyclop%C3%A6dia%20Universalis%20ID%2C%20universalis.fr%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP3219%20%3Fitem_code_v_fr_universalis%20%7D%20.%0A%0A%20%20%20%20%23%20PACTOLS%20thesaurus%20ID%2C%20pactols.frantiq.fr%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP4212%20%3Fitem_code_v_fr_pactols%20%7D%20.%0A%0A%20%20%20%20%23%20National%20Central%20Library%20of%20Florence%2C%20bncf.firenze.sbn.it%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP508%20%3Fitem_code_v_it_bncf%20%7D%20.%0A%0A%20%20%20%20%23%20Enciclopedia%20Italiana%20Treccani%2C%20treccani.it%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP3365%20%3Fitem_code_v_it_treccani%20%7D%20.%0A%0A%20%20%20%20%23%20National%20Diet%20Library%20of%20Japan%2C%20ndl.go.jp%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP349%20%3Fitem_code_v_jp_ndl%20%7D%20.%0A%0A%20%20%20%20%23%20KBpedia%20knowledge%20graph%2C%20kbpedia.org%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP8408%20%3Fitem_code_v_kbpedia%20%7D%20.%0A%0A%20%20%20%20%23%20Store%20norske%20leksikon%20ID%2C%20snl.no%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP4342%20%3Fitem_code_v_no_snl%20%7D%20.%0A%0A%20%20%20%20%23%20Xenopus%20Anatomy%20Ontology%2C%20ontobee.org%2Fontology%2FXAO%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP4495%20%3Fitem_code_v_ontobee_xao%20%7D%20.%0A%0A%20%20%20%20%23%20Great%20Russian%20Encyclopedia%20Online%2C%20bigenc.ru%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP2924%20%3Fitem_code_v_ru_greo%20%7D%20.%0A%0A%20%20%20%20%23%20Uberon%2C%20uberon.org%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP1554%20%3Fitem_code_v_uberon%20%7D%20.%0A%0A%20%20%20%20%23%20Encyclop%C3%A6dia%20Britannica%20Online%2C%20britannica.com%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP1417%20%3Fitem_code_v_uk_britannica%20%7D%20.%0A%0A%20%20%20%20%23%20Medical%20JSTOR%2C%20jstor.org%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP3827%20%3Fitem_code_v_us_jstor%20%7D%20.%0A%0A%20%20%20%20%23%20Microsoft%20Academic%20Graph%20%28MAG%29%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP6366%20%3Fitem_code_v_us_mag%20%7D%20.%0A%0A%20%20%20%20%23%20Medical%20Subject%20Headings%20%28MeSH%29%2C%20nlm.nih.gov%2Fmesh%2F%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP486%20%3Fitem_code_v_us_mesh%20%7D%20.%0A%0A%20%20%20%20%23%20NLM%20Unified%20Medical%20Language%20System%20%28UMLS%29%20controlled%20biomedical%20vocabulary%20unique%20identifier%2C%20nlm.nih.gov%2Fresearch%2Fumls%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP2892%20%3Fitem_code_v_us_umls_cui%20%7D%20.%0A%0A%20%20%20%20%23%20Item%2C%20by%20label%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fitem_name_v_wikidata_i_ar%20filter%20%28lang%28%3Fitem_name_v_wikidata_i_ar%29%20%3D%20%22ar%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fitem_name_v_wikidata_i_en%20filter%20%28lang%28%3Fitem_name_v_wikidata_i_en%29%20%3D%20%22en%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fitem_name_v_wikidata_i_es%20filter%20%28lang%28%3Fitem_name_v_wikidata_i_es%29%20%3D%20%22es%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fitem_name_v_wikidata_i_fr%20filter%20%28lang%28%3Fitem_name_v_wikidata_i_fr%29%20%3D%20%22fr%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fitem_name_v_wikidata_i_ru%20filter%20%28lang%28%3Fitem_name_v_wikidata_i_ru%29%20%3D%20%22ru%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fitem_name_v_wikidata_i_zh%20filter%20%28lang%28%3Fitem_name_v_wikidata_i_zh%29%20%3D%20%22zh%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fitem_name_v_wikidata_i_epo%20filter%20%28lang%28%3Fitem_name_v_wikidata_i_epo%29%20%3D%20%22eo%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fitem_name_v_wikidata_i_lat%20filter%20%28lang%28%3Fitem_name_v_wikidata_i_lat%29%20%3D%20%22la%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fitem_name_v_wikidata_i_por%20filter%20%28lang%28%3Fitem_name_v_wikidata_i_por%29%20%3D%20%22pt%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fitem_name_v_wikidata_i_tet%20filter%20%28lang%28%3Fitem_name_v_wikidata_i_tet%29%20%3D%20%22tet%22%29%20%7D%20.%0A%20%20%20%20OPTIONAL%20%7B%20%3Fitem%20rdfs%3Alabel%20%3Fitem_name_v_wikidata_i_yue%20filter%20%28lang%28%3Fitem_name_v_wikidata_i_yue%29%20%3D%20%22yue%22%29%20%7D%20.%0A%7D)

<!--
- Os seguintes identificadores parecem estar offline em 2020, por isso não vão
  ser adicionados
    - Brockhaus Enzyklopädie online ID https://en.wikipedia.org/wiki/Brockhaus_Enzyklop%C3%A4die
-->

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
# TODO: a query deveria retornar apenas o valor de texto (ex: Q1072), mas esta retornando URL (fititnt, 2020-12-17 08:38 BRT)
# NOTE: based on Q1072, some IDs are not added on this example (at least not yet): P5019, P1296, P1256, P6573, P6900, P1245, P3417, Q1072, P7827
SELECT
    ?item
    # ?id
    # ?item_code_v_wikidata
    ?item_code_v_au_aev
    ?item_code_v_babelnet
    ?item_code_v_cz_nkp
    ?item_code_v_cz_psh
    ?item_code_v_de_brendaenzymes
    ?item_code_v_de_gnd
    ?item_code_v_fipat_ta2
    ?item_code_v_fipat_ta98_id
    ?item_code_v_fipat_ta98_latin
    ?item_code_v_fi_yso
    ?item_code_v_freebase
    ?item_code_v_fr_pactols
    ?item_code_v_fr_universalis
    ?item_code_v_it_bncf
    ?item_code_v_it_treccani
    ?item_code_v_jp_ndl
    ?item_code_v_kbpedia
    ?item_code_v_no_snl
    ?item_code_v_ontobee_xao
    ?item_code_v_ru_greo
    ?item_code_v_uberon
    ?item_code_v_uk_britannica
    ?item_code_v_us_jstor
    ?item_code_v_us_mag
    ?item_code_v_us_mesh
    ?item_code_v_us_umls_cui
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
    
    # Australian Educational Vocabulary ID, vocabulary.curriculum.edu.au
    OPTIONAL { ?item wdt:P7033 ?item_code_v_au_aev } .

    # BabelNet, babelnet.org
    OPTIONAL { ?item wdt:P2581 ?item_code_v_babelnet } .

    # National Library of the Czech Republic, nkp.cz
    OPTIONAL { ?item wdt:P691 ?item_code_v_cz_nkp } .

    # Czech Technical Library ID, psh.techlib.cz
    OPTIONAL { ?item wdt:P1051 ?item_code_v_cz_psh } .

    # Brenda Tissue Ontology, www.brenda-enzymes.org
    OPTIONAL { ?item wdt:P5501 ?item_code_v_de_brendaenzymes } .

    # German National Library ID, dnb.de
    OPTIONAL { ?item wdt:P227 ?item_code_v_de_gnd } .

    # Terminologia Anatomica second edition (2019) identifier, ta2viewer.openanatomy.org
    OPTIONAL { ?item wdt:P7173 ?item_code_v_fipat_ta2 } .

    # Terminologia Anatomica 98 ID, unifr.ch/ifaa/
    OPTIONAL { ?item wdt:P1323 ?item_code_v_fipat_ta98_id } .

    # Terminologia Anatomica 98 Latin preferred term, unifr.ch/ifaa/
    OPTIONAL { ?item wdt:P3982 ?item_code_v_fipat_ta98_latin } .

    # General Finnish Ontology YSO, yso.fi
    OPTIONAL { ?item wdt:P2347 ?item_code_v_fi_yso } .

    # Freebase ID (still accessible via Google)
    OPTIONAL { ?item wdt:P646 ?item_code_v_freebase } .

    # Encyclopædia Universalis ID, universalis.fr
    OPTIONAL { ?item wdt:P3219 ?item_code_v_fr_universalis } .

    # PACTOLS thesaurus ID, pactols.frantiq.fr
    OPTIONAL { ?item wdt:P4212 ?item_code_v_fr_pactols } .

    # National Central Library of Florence, bncf.firenze.sbn.it
    OPTIONAL { ?item wdt:P508 ?item_code_v_it_bncf } .

    # Enciclopedia Italiana Treccani, treccani.it
    OPTIONAL { ?item wdt:P3365 ?item_code_v_it_treccani } .

    # National Diet Library of Japan, ndl.go.jp
    OPTIONAL { ?item wdt:P349 ?item_code_v_jp_ndl } .

    # KBpedia knowledge graph, kbpedia.org
    OPTIONAL { ?item wdt:P8408 ?item_code_v_kbpedia } .

    # Store norske leksikon ID, snl.no
    OPTIONAL { ?item wdt:P4342 ?item_code_v_no_snl } .

    # Xenopus Anatomy Ontology, ontobee.org/ontology/XAO
    OPTIONAL { ?item wdt:P4495 ?item_code_v_ontobee_xao } .

    # Great Russian Encyclopedia Online, bigenc.ru
    OPTIONAL { ?item wdt:P2924 ?item_code_v_ru_greo } .

    # Uberon, uberon.org
    OPTIONAL { ?item wdt:P1554 ?item_code_v_uberon } .

    # Encyclopædia Britannica Online, britannica.com
    OPTIONAL { ?item wdt:P1417 ?item_code_v_uk_britannica } .

    # Medical JSTOR, jstor.org
    OPTIONAL { ?item wdt:P3827 ?item_code_v_us_jstor } .

    # Microsoft Academic Graph (MAG)
    OPTIONAL { ?item wdt:P6366 ?item_code_v_us_mag } .

    # Medical Subject Headings (MeSH), nlm.nih.gov/mesh/
    OPTIONAL { ?item wdt:P486 ?item_code_v_us_mesh } .

    # NLM Unified Medical Language System (UMLS) controlled biomedical vocabulary unique identifier, nlm.nih.gov/research/umls
    OPTIONAL { ?item wdt:P2892 ?item_code_v_us_umls_cui } .

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