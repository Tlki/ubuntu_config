echo "Installing dependencies"
sudo apt-get update
sudo apt-get -y install make libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev build-essential git curl xsel python3-pip
python3 -m pip install --user pipx
python3 -m pipx ensurepath
python3 -m pip install flake8 # this is mainly for ALE (vim plugin)

echo "Installing vim..."
sudo apt-get -y install vim vim-gtk3

echo "Installing zsh"
sudo apt-get -y install zsh
yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh) $USER

echo "Installing tmux..."
sudo apt-get -y install tmux
git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm

echo "Installing powerline..."
sudo apt-get -y install powerline

echo "Moving zshrc to $HOME as .zshrc"
cp zshrc ~/.zshrc
echo "Moving tmux.conf to $HOME as .tmux.conf"
cp tmux.conf ~/.tmux.conf

# Cloning vundle plugin manager for vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Moving vimrc to $HOME as .vimrc"
cp vimrc ~/.vimrc

echo "Installing vim plugins"
vim +PluginInstall +qall

echo "Installing z command"
git clone http://github.com/rupa/z /tmp/z
sudo mv /tmp/z/z.sh /usr/bin/

echo "Installing zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Installing zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Installing pyenv and pyenv-virtualenv"
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

echo "You may have to reboot the system for the changes to take effect."
