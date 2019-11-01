# Replace all instances of a regex inside a given file

# MacOS (BSD-style `sed`)
sed -i '' 's/oldphrase/newphrase/g' file.txt
# Linux (Unix-style `sed`)
sed -i 's/oldphrase/newphrase/g' file.txt

