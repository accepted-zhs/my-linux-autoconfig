#!/bin/bash
git pull
cat ~/my-linux-autoconfig/templates/myconfig.vim >> ~/.vimrc.custom.config
cat ~/my-linux-autoconfig/templates/cpp.cpp > ~/.vim/plugged/prepare-code/snippet/snippet.cpp


