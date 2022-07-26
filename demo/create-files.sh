#!/bin/bash

files=(00-providers.tf 01-data.tf 02-main.tf 03-variables.tf 04-locals.tf 05-outputs.tf)

clone_repos () {
	local list=("$@")
	for i in "${list[@]}"
	do
		echo $i
		printf "Creating\n"
		touch $i
		
		printf "Complete\n-------------\n\n"
	done
}

clone_repos "${files[@]}"