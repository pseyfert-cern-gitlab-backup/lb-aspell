#!/bin/bash
echo "checking file $1"
if [[ $(cat $1 | aspell list -t -d en_GB -p ./.aspell.en.pws | wc -l) -eq 0 ]]
then
  exit 0
else
  echo "spellcheck of $1 failed due to:"
  cat $1 | aspell list -t -d en_GB -p ./.aspell.en.pws | tee -a spelling-mistakes.txt
  exit 1
fi
