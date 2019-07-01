#!/bin/bash

cd $HOME
rm -Rf ubuntu-scripts
git clone https://github.com/adam-mcdaniel/ubuntu-scripts

echo "$HOME/ubuntu-scripts/bashrc/*.sh" >> $HOME/.bashrc
$HOME/ubuntu-scripts/one-time/*.sh
