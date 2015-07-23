# Dotfiles
Backing up my dotfiles, using this guide:

* http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

Also includes `git-aware-prompt`, from here:

* https://github.com/jimeh/git-aware-prompt

## How to set up
On a newly set up machine here's how to set up and use the repo.

1. Clone the repository to your home directory. Make sure you include submodules by using the `--recursive` flag. This will also clone `git-aware-prompt`.

  ```
  cd ~
  git clone --recursive https://github.com/olafurg/dotfiles.git
  ```

  You should then have this repository under `/home/username/dotfiles` and `git-aware-prompt` ready to go as well.

2. Now `cd` into `dotfiles` and run the setup script.

  ```
  cd dotfiles
  ./makesymlinks.sh
  ```

That's it! Restart your terminal and you're good to go.

## Adding new files to monitor
If you're adding new dotfiles to include in the package make sure to add them to the list in `makesymlinks.sh` but without the leading dot. E.g. if you want to include a file called `.settings-file`, located in your home directory:

1. Copy the file into the repo:
  ```
  cd ~
  cp .settings-file dotfiles/settings-file
  ```

2. Add the file name to the `files` list in `makesymlinks.sh`, also without the leading dot.
