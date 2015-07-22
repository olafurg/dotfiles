# Dotfiles collection
Backing up my dotfiles, using this guide: 

* http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

Also using `git-aware-prompt`, from here:

* https://github.com/jimeh/git-aware-prompt

Everything should be included in this script though.

## How to set up
On a newly set up machine here's how to set up and use the repo.

1. Check out the repository to your home directory.

  `git clone <repo-link>`

  You should have the dotfiles directory in `/home/username/dotfiles`.

2. `cd` into the repository and run `./makesymlinks.sh`

That's it. Restart the command line and you should be good.

## Adding new files to monitor
If you're adding new dotfiles make sure to add them to the list in `makesymlinks.sh`.
