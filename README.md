# my dotfiles
bashrc, vimrc, init.vim, etc  

## download  

Execute "git clone" command.  

```bash
$ git clone https://github.com/szkny/dotfiles.git ~/dotfiles
```

## install  

To create symbolic link, please execute following command.  
[**NOTE**] the script *dotfilesLink.sh* remove some config files!  

```bash
$ ~/dotfiles/dotfilesLink.sh
```

If you use vim-plug, you can make development environment by following command in neovim.
([Vim-plug](https://github.com/junegunn/vim-plug))
```
:PlugInstall
```
