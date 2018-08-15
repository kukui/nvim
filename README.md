copy this folder to .config

link things so they're where I expect them to be
```bash
ln -s ~/config/nvim ~/.vimrc
ln -s ~/.config/nvim/vim ~/.vim
```

replace vi with links to nvim

install https://github.com/junegunn/vim-plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
