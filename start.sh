echo "Installing dependencies"
apt-get update
apt-get -y install git
apt-get -y install curl
apt-get -y install xsel
apt-get -y install python3-pip
python3 -m pip install --user pipx
python3 -m pipx ensurepath
python3 -m pip install flake8 # this is mainly for ALE (vim plugin)

echo "Installing vim..."
apt-get -y install vim
apt-get -y install vim-gtk3

echo "Installing zsh"
apt-get -y install zsh
yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh) $USER

echo "Installing tmux..."
apt-get -y install tmux
git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm

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

echo "Installing zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Installing zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "You may have to reboot the system for the changes to take effect."
