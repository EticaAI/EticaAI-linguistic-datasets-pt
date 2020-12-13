#!/bin/sh
# shellcheck disable=SC2164

#### Frictionless Data preview _________________________________________________

# Usa localmente o data.okfn.org-new com conteúdo que estiver em
#     http://git.workspace.localhost/EticaAI/EticaAI-linguistic-datasets-pt-data/

cd /workspace/git/okfn/data.okfn.org-new
node app.js

# Em outro terminal, use
#     http://localhost:5000/tools/view?url=http%3A%2F%2Fgit.workspace.localhost%2FEticaAI%2FEticaAI-linguistic-datasets-pt-data%2F


#### hxl-preview, quick-charts-sandbox/ ________________________________________
# http://git.workspace.localhost/HXLStandard/hxl-preview/hxl-preview.html
#    http://git.workspace.localhost/HXLStandard/hxl-preview/hxl-preview.html?url=https%3A%2F%2Fraw.githubusercontent.com%2FHXLStandard%2Fhxl-cookbook%2Fmaster%2Fdocs%2Fexamples%2Freordering-columns-01.csv#style=table&row=0


# Using the official repositories instead of local copy
xdg-open https://hxlstandard.github.io/hxl-preview/hxl-preview.html
xdg-open https://hxlstandard.github.io/quick-charts-sandbox/



#### Wikipedia and Wikidata tools / GSuite _____________________________________
# @see https://gsuite.google.com/u/1/marketplace/app/wikipedia_and_wikidata_tools/595109124715
# @see https://github.com/tomayac/wikipedia-tools-for-google-spreadsheets