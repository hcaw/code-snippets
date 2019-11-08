## tags: for, mv

# Works in bash (or zsh etc.)
# The below command will find all files or directories which begin with `did-`
#   and rename them by replacing `did-` with `envoy-` and leaving the rest of the filename the same
# 
# NOTE: `for` will only search in the current working directory

for d in did-*; do mv "$d" "${d/did-/envoy-}"; done