# Dotfiles
Backing up my dotfiles, using this guide:

* http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

Also includes `git-aware-prompt`, from here:

* https://github.com/jimeh/git-aware-prompt

## How to set up
On a newly set up machine here's how to set up and use the repo.

1. Clone the repository to your home directory.

  ```
  cd ~
  git clone https://github.com/olafurg/dotfiles.git
  ```

  You should then have the `dotfiles` directory in `/home/username/dotfiles`.

2. `cd` into `dotfiles` and run `./makesymlinks.sh`

  ```
  cd ~/dotfiles
  ./makesymlinks.sh
  ```

That's it. Restart the command line and you should be good.

## Adding new files to monitor
If you're adding new dotfiles to include in the package make sure to add them to the list in `makesymlinks.sh`.
