## tags: find

# Recursively delete all directories matching given pattern (prune is necessary to stop recursing into deleted dirs!)

find . -name 'directory_name' -type d -prune -exec rm -rf '{}' +

# Extra:
# If you need to remove `node_modules`, then you could use [this](https://github.com/voidcosmos/npkill)

npx npkill
