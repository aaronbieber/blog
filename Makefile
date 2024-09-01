# Makefile for deploying blog.aaronbieber.com.

OPTS=-rovz --delete
EXCLUDE=--exclude '.git*' --exclude '.*' --exclude '\#*\#' --exclude Makefile
SRC=./public/
DEST=airborne@10.20.10.40:/var/www/blog.aaronbieber.com/htdocs/

build:
	hugo --cleanDestinationDir

deploy: build
	rsync $(OPTS) $(EXCLUDE) $(SRC) $(DEST)
