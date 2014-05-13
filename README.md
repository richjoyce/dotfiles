Adding a vim plugin
-------------------

```bash
homeshick cd dotfiles
git submodule add https://github.com/user/vim-plugin.git home/.vim/bundle/vim-plugin
homeshick link dotfiles
```

Deploying YCM to a new computer:
```bash
homeshick cd dotfiles
cd home/.vim/bundle/YouCompleteMe/
git submodule update --init --recursive
cp -r third_party/* ~/.vim/bundle/third_party/
cd ~/.vim/bundle/YouCompleteMe/
./install.sh
```
