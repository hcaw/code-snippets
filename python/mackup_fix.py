# I wrote this to fix the issue I had when I ended up with a load of broken links to "mackup"
# Needs tidying, might be able to make this useful for other related things

import sys
import os
import shutil
import errno

# Copies a dir or file
def copy(src, dest):
    try:
        shutil.copytree(src, dest)
    except OSError as e:
        # If the error was caused because the source wasn't a directory
        if e.errno == errno.ENOTDIR:
            shutil.copy(src, dest)
        else:
            print('Directory not copied. Error: %s' % e)

home = "/Users/harrywright/"
migrate_from = "/Users/harrywright/Backups/Mackup/"
old_link_root = "/Users/harrywright/Library/Mobile Documents/com~apple~CloudDocs/Backups/Mackup"

for root, dirnames, filenames in os.walk(home):
    for filename in filenames:
        fullpath = os.path.join(root, filename)
        if os.path.lexists(fullpath) and os.path.islink(fullpath) and os.readlink(fullpath).find(old_link_root) != -1:
            print("* Broken Mackup link found!:          ", fullpath)
            location_to_copy_from = fullpath.replace(home, migrate_from)
            os.remove(fullpath)
            copy(location_to_copy_from, fullpath)
            print(r"    |___\  SUCCESS!!!!")
            print("        /")
