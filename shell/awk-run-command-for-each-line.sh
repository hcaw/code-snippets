## tags: awk, sed

# This will take the input to awk (in this case a list of commands that can be run on `jenv`)
#   and for each of them, pipe them into `sh`, and print the output.
# Each of the outputs are visually separated by a row of hyphens.

jenv commands | awk '{print "jenv help "$1"; echo '-----------------------'"}' | sh

# This alternate version will run the `file` command on each file in a directory.

ls -al | awk '{print "file "$9"; echo '---------------------------------------'"}' | sh

# This extension of the previous command also uses `sed` to remove the first line of the output from ls,
#   then `sed` again to *remove directories* from the output:
#   - In both the examples sed is first used with '1d'
#     - "1" is the "sed address" used to select the first input line as the "pattern space"
#     - "d" is a function which deletes the pattern space (and starts the next cycle)
#   - In the next sed command the first example uses `-n` which means "don't send to the stdout as usual",
#     then a regex which matches when a "d" is at the start of the line.
#     The "!p" is a combination of two functions
#       - "!" which means apply the function which follows only when the pattern is NOT matched.
#       - "p" which means, write the pattern space to stdout.
#   - The second example is similar to the first sed command (`sed '1d'`), in that the delete function is used.
#     It works by using a regex which matches all lines which start with a "d", then deleting them and moving on.

ls -al | sed '1d' | sed -n '/^d/!p' | awk '{print "file "$9"; echo '---------------------------------------'"}' | sh
# OR
ls -al | sed '1d' | sed '/^d/d' | awk '{print "file "$9"; echo '---------------------------------------'"}' | sh