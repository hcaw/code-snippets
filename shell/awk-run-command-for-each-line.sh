# This will take the input to awk (in this case a list of commands that can be run on `jenv`)
#     and for each of them, pipe them into 1`sh`, and print the output.
# Each of the outputs are visually separated by a row of hyphens.

jenv commands | awk '{print "jenv help "$1"; echo '-----------------------'"}' | sh

## This alternate version will run the `file` command on each file in a directory.

ls -al | awk '{print "file "$9"; echo '---------------------------------------'"}' | sh