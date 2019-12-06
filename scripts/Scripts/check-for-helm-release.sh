#!/bin/bash

curr_releases() {
  export HELM_TILLER_SILENT=true
  releases=$(helm tiller run -- helm ls | cut -d " " -f 1 | awk '{if(NR!=1) print $0}')
  export HELM_TILLER_SILENT=false
  echo $releases
}

releases1="$(curr_releases)"
if [[ -z ${releases1} ]]; then
    echo "empty"
else
    echo $releases1
    echo $HELM_TILLER_SILENT
fi