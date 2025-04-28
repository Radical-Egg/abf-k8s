#!/bin/bash

[ -z $1 ] && exit 1

chart_path="$(dirname "$(realpath "$0")")/../charts/$1"


mkdir -p "${chart_path}/templates"

touch $chart_path/.helmignore
touch $chart_path/values.yaml
touch $chart_path/Chart.yaml
touch $chart_path/README.md

exit 0