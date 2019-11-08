## tags: rsync

# Copy a directory recursively, ignoring dotfiles

rsync -av --exclude=".*" src dest
