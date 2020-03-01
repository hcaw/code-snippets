## tags: find

# Warning: only tested this on MacOS

# Lists the count of files inside each directory, useful for when uploads are taking ages for dropbox etc.

# One-liner

find . -maxdepth 1 -type d -print0 | while read -d '' -r dir; do num=$(find "$dir" -ls | wc -l); printf "%5d files in directory %s\n" "$num" "$dir"; done
