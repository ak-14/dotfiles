# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew bundle --no-lock

# bash
sudo /bin/bash -c "echo /usr/local/bin/bash >> /etc/shells"
chsh -s /usr/local/bin/bash

# nvim config
mkdir -p $HOME/.config/nvim

# symlink dotfiles
ln -s $HOME/dotfiles/bashrc $HOME/.bashrc
ln -s $HOME/dotfiles/sensible.bash $HOME/.sensible.bash
ln -s $HOME/dotfiles/tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/init.vim $HOME/.config/nvim/init.vim
ln -s $HOME/dotfiles/gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/gitignore_global $HOME/.gitignore_global
ln -s $HOME/dotfiles/settings.json $HOME/Library/Application\ Support/Code/User/settings.json

# fzf
$(brew --prefix)/opt/fzf/install

# heroku
heroku autocomplete --refresh-cache

# tmux-256color
# https://gist.github.com/bbqtd/a4ac060d6f6b9ea6fe3aabe735aa9d95
brew install ncurses
/usr/local/opt/ncurses/bin/infocmp tmux-256color > tmux-256color.info
/usr/local/opt/ncurses/bin/infocmp xterm-256color > xterm-256color.info
tic -xe tmux-256color tmux-256color.info
tic -o $HOME/.terminfo/ xterm256-color.info

# keyrepeat speed
defaults write -g InitialKeyRepeat -int 12
defaults write -g KeyRepeat -int 1
