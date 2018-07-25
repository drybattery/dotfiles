#!/bin/sh

# neovim (0.2.2)
if [ -L ~/.config/nvim/init.vim ]; then rm ~/.config/nvim/init.vim;fi
if [ -L ~/.config/nvim/vimrc ]; then rm ~/.config/nvim/vimrc;fi
if [ -L ~/.config/nvim/ftplugin ]; then rm ~/.config/nvim/ftplugin;fi
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/nvim/vimrc ~/.config/nvim
ln -sf ~/dotfiles/nvim/ftplugin ~/.config/nvim

# python syntax checker & formatter
if [ -L ~/.config/flake8 ]; then rm ~/.config/flake8;fi
if [ -L ~/.config/yapf ]; then rm ~/.config/yapf;fi
mkdir -p ~/.config
ln -sf ~/dotfiles/python_syntax_checker/flake8 ~/.config/flake8
ln -sf ~/dotfiles/python_syntax_checker/yapf ~/.config

# # vim (8.0.1283)
# if [ -L ~/.vimrc ]; then rm ~/.vimrc;fi
# if [ -L ~/.vim/vimrc ]; then rm ~/.vim/vimrc;fi
# mkdir -p ~/.vim
# ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
# ln -sf ~/dotfiles/vim/vimrc ~/.vim
#
# # bash
# # ln -sf ~/dotfiles/bashrc ~/.bashrc
#
# # tmux
# if [ -L ~/.tmux.conf ]; then rm ~/.tmux.conf;fi
# ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf
