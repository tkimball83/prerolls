#!/bin/bash

set -euo pipefail
shopt -s nullglob

dest=/data/prerolls
sources=(fiverr ivipid priyansh)

repo_root=$(cd "$(dirname "$0")/.." && pwd)

files=()
for source in "${sources[@]}"
do
  for file in "${repo_root}/${source}"/*.mp4
  do
    files+=("${dest}/${source}/$(basename "${file}")")
  done
done

if [[ ${#files[@]} -eq 0 ]]
then
  echo "ERROR: no .mp4 files found under ${repo_root}" >&2
  exit 1
fi

(IFS=';'; printf '%s\n' "${files[*]}")
