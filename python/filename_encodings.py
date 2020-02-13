# This just prints out the suspected encoding of each filename in a directory, recursively
# Needs more work to make it useful
# Used it on my Synology NAS after issues with various downloads, SMB/NFS/AFP etc. etc.

import sys
import os
import fnmatch
import chardet

badDir = "@eaDir"
for root, dirnames, filenames in os.walk(sys.argv[0]):
    for filename in filenames:
        fullpath = os.path.join(root, filename)
        if badDir.find(fullpath) == -1:
            print(chardet.detect(fullpath.encode())['encoding'], chardet.detect(fullpath.encode())['confidence'], " - ", fullpath)