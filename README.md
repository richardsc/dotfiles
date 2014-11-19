# dotfiles repository

This repo contains my dot and configuration files. The idea here is that I can keep such things consistent between multiple machines (office Desktop and laptop).

# Initial Deployment

The `makesymlinks.sh` script first backs up any dotfiles it finds in `~/` to `~/dotfiles_old` (creating the directory if necessary), and then creates symbolic links to the files in the git repo. The script is based on one that I found [here][1]

[1]: http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

# To do

I have a few bash functions gleaned from various places that currently reside in my `~/bin/` directory, and are not under version control. These should be added to this repo. They include

* [ ] bashmarks.sh
* [ ] t.py
* [ ] displayreadme
* [ ] v
* [ ] tree
* [ ] rterm
* [ ] mterm
* [ ] pdf-rotate-docdel
* [ ] pdf-rotate-docdel-nocover
* [ ] markdown ?
