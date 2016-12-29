#!/usr/bin/env bash
BASE_DIR=$PWD

## Find those files that are older than a month
find "$BASE_DIR" -maxdepth 1  -type f |
 while IFS= read -r file; do
    ## Get the file's modification year
    year="$(stat -f '%Sm' -t '%y' "$file")"

    ## Get the file's modification month
    month="$(stat -f '%Sm' -t '%m' "$file")"

    ## Create the directories if they don't exist. The -p flag
    ## makes 'mkdir' create the parent directories as needed so
    ## you don't need to create $year explicitly.
    [[ ! -d "$BASE_DIR/$month/$day/$hour" ]] && mkdir -p "$BASE_DIR/$year/$month";

    ## Move the file
    mv "$file" "$BASE_DIR/$year/$month/"
done
