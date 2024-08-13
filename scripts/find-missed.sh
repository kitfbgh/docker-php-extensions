#!/bin/bash

set -euo pipefail

function main() {
  local phpVer extName extVer extOS
  printf '' > missed.jsonl

  jq -r 'keys[]' versions.json | while read -r phpVer; do
    jq -r ".\"$phpVer\" | keys[]" versions.json | while read -r extName; do
      echo "Processing PHP$phpVer - $extName"
      jq -r ".\"$phpVer\".\"$extName\" | keys[] | select(. != \"latest\")" versions.json | while read -r extVer; do
        jq -r ".\"$phpVer\".\"$extName\".\"$extVer\"[]" versions.json | while read -r extOS; do
          if [ -f "history/$phpVer/$extName/$extVer/$extOS.json" ]; then
            continue
          fi

          printf '{"php":"%s","ext":"%s","ver":"%s","os":"%s"}\n' \
            "$phpVer" \
            "$extName" \
            "$extVer" \
            "$extOS" >> missed.jsonl
        done
      done
    done
  done
}

main
