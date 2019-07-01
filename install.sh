#!/bin/bash

cd $HOME
git clone https://github.com/adam-mcdaniel/ubuntu-scripts

echo "$HOME/ubuntu-scripts/bashrc/*.sh" >> $HOME/.bashrc
$HOME/ubuntu-scripts/one-time/*.sh
