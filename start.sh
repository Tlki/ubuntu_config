echo "Installing dependencies"
apt-get update
apt-get -y install git
apt-get -y install curl

echo "Installing vim..."
apt-get -y install vim

echo "Installing zsh"
apt-get -y install zsh
yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh) $USER

echo "Installing tmux..."
apt-get -y install tmux

echo "Installing powerline..."
sudo apt-get -y install powerline

echo "Moving zshrc to $HOME as .zshrc"
copy zshrc ~/.zshrc
echo "Moving tmux.conf to $HOME as .tmux.conf"
copy tmux.conf ~/.tmux.conf

# Cloning vundle plugin manager for vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Moving vimrc to $HOME as .vimrc"
copy vimrc ~/.vimrc

echo "Installing vim plugins"
vim +PluginInstall +qall

echo "Installing z command"
git clone http://github.com/rupa/z /tmp/z
mv /tmp/z/z.sh /usr/bin/

echo "You may have to reboot the system for the changes to take effect."
