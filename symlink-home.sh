#!/bin/bash
# set -x

storage_home_path="/storage/luis-ecobee/"

echo "--- Starting to link $storage_home_path to $HOME ---"

for dir_links in $(find $storage_home_path -mindepth 1 -maxdepth 1 -type d);
do
    # is a directory and is not a symlink
    if [[ -d $HOME/$(basename $dir_links) && ! -L $HOME/$(basename $dir_links) ]]; then
        if [[ $HOME/$(basename $dir_links) == "$HOME/.gnupg" && ! -L $HOME/$(basename $dir_links) ]]; then
            mv $HOME/.gnupg $HOME/.gnupg.bak
        else
            rmdir $HOME/$(basename $dir_links)
            ln -s $dir_links ~/$(basename $dir_links)
        fi
        echo "$HOME/$(basename $dir_links) overwritten by link."
    elif [[ ! -d $HOME/$(basename $dir_links) && ! -L $HOME/$(basename $dir_links) ]]; then
        ln -s $dir_links ~/$(basename $dir_links)
        echo "$HOME/$(basename $dir_links) link created"
    # symlink already exists
    elif [[ -L $HOME/$(basename $dir_links) ]]; then
        echo "$HOME/$(basename $dir_links) already exists"
    fi
done

echo "--- Done linking $storage_home_path to $HOME ---"
