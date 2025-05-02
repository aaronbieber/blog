opts := "-rvz --delete"
exclude := "--exclude '.git*' --exclude '.*' --exclude '\\#*\\#' --exclude Makefile --exclude justfile"
src := "./public/"
dest := "airborne@10.20.10.40:/var/www/blog.aaronbieber.com/htdocs/"

build:
    hugo --cleanDestinationDir -e production

deploy: build
    rsync {{ opts }} {{ exclude }} {{ src }} {{ dest }}
