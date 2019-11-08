## tags: find

# Disclaimer: This may only work in zsh!

# Recursively delete all directories matching given pattern

find . -type d -name 'directory_name' -exec rm -r {} +