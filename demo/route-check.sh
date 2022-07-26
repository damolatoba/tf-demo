#!/bin/bash

eval "$(jq -r '@sh "the_list=\(.the_list)", "the_value=\(.the_value)"')"

# foreach route $the_list

# if [[ $route != $the_value ]]
# then
#         $routes+=("$route")
# fi

# routes=$the_list

# the_value=$the_value
# routes=()
# for route in ${the_list[@]}
# do
#     if [ $route = $the_value ]; then
#         # routes+=($route)
#         routes_list=("${the_list[@]/$route}")
#     fi
# done
# $the_list=("$the_list[@]")
# routes=("${routes[@]}")
# routes=${the_list[@]/"${the_value}"}

jq -n --arg routes "$the_list" \
      --arg the_value "$route" \
      '{"routes":$routes, "the_value":$the_value}'