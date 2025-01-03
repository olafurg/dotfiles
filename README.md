# Dotfiles
Backing up my dotfiles, using this guide:

* http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

## How to set up
On a newly set up machine here's how to set up and use the repo.

1. Clone the repository to your home directory.

  ```
  cd ~
  git clone https://github.com/olafurg/dotfiles.git
  ```

  You should then have this repository under `/home/username/dotfiles`.

2. Now `cd` into `dotfiles` and run the setup script. Would be wise to review the script and make edits if you want to exclude/include some things for your machine.

  ```
  cd dotfiles
  ./setup.sh
  ```

To be sure, restart your terminal, run `./setup.sh` once more and restart again.

That's it! You should be good to go.

## Adding new files to monitor
If you're adding new dotfiles to include in the package make sure to add them to the list in `setup.sh`. E.g. if you want to include a file called `.settings-file`, located in your home directory:

1. Copy the file into the repo:
  ```
  cd ~
  cp .settings-file dotfiles/
  ```

2. Add the file name to the `files` list in `setup.sh`.
