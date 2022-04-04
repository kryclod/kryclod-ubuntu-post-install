# --------------------------------------------------// initial setup //--------------------------------------------- #
sudo apt-get update && sudo apt-get update dist-upgrade
# include latin america keyboard
sudo locale-gen es_AR.UTF-8

# --------------------------------------------------// tools section //--------------------------------------------- #
# must-have tools
sudo apt-get install net-tools wget curl software-properties-common apt-transport-https hwinfo aptitude build-essential hddtemp lm-sensors nvme-cli -y
# git
sudo apt install wget git -y
# sound
sudo apt-get --purge remove linux-sound-base alsa-base alsa-utils -y
# nala apt manager
wget https://gitlab.com/volian/nala/uploads/c9f5102f7f831118744ff23d9a4e726c/nala_0.7.1_amd64.deb -O ~/Downloads/nala.deb
sudo apt install ./nala.deb -y
# flatpack
sudo apt install flatpak -y
sudo apt install gnome-software -y
sudo apt install gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo -y
# neofetch
sudo apt install neofetch -y
mkdir ~/.config/neofetch/
mkdir ~/.config/neofetch/ascii
cp ~/kryclod-ubuntu-post-install/neofetch/kartanus-ascii-sword.txt ~/.config/neofetch/ascii
cp ~/kryclod-ubuntu-post-install/neofetch/config.conf  ~/.config/neofetch/
# tty-clock
sudo apt install tty-clock -y
# media codecs
sudo apt install ubuntu-restricted-extras -y
# work with files
sudo apt install rar unrar p7zip-full p7zip-rar -y

# --------------------------------------------------// software //----------------------------------------------- #
cd ~/Downloads
# zoom
wget https://zoom.us/client/latest/zoom_amd64.deb -O zoom.deb; sudo apt install ./zoom.deb -y
# google-chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O google-stable.deb; sudo apt install ./google-stable.deb -y
# spotify
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt-get install spotify-client -y
# discord
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo apt install ./discord.deb -y
# okular
sudo apt-get install okular -y
# synaptic
sudo apt install synaptic -y
# ulauncher 
sudo add-apt-repository ppa:agornostal/ulauncher && sudo apt update && sudo apt install ulauncher -y
mkdir -p ~/.config/ulauncher/user-themes
cp -r ~/kryclod-ubuntu-post-install/ulauncher/WhiteSur-Dark-ulauncher/ ~/.config/ulauncher/user-themes/
# marktext
wget https://github.com/marktext/marktext/releases/download/v0.17.1/marktext-amd64.deb
sudo apt install ./marktext-amd64.deb
# --------------------------------------------------// development //--------------------------------------------- #
# alacritty
sudo add-apt-repository ppa:aslatter/ppa -y; sudo apt update -y && sudo apt install alacritty -y
# nodejs v16
curl -sL https://deb.nodesource.com/setup_16.x 596 | sudo -E bash -
sudo apt update -y; sudo apt-get install nodejs -y
# npm
sudo aptitude install npm -y && sudo npm install npm@latest -y
# vscode
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update -y && sudo apt install code
# nvim
sudo apt-get install nvim -y
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cp ~/kryclod-ubuntu-post-install/neovim/init.vim ~/.config/nvim
# ranger
sudo apt install ranger -y
# install ranger dev icons
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
echo "default_linemode devicons" >> $HOME/.config/ranger/rc.conf 
# starship
sudo snap install starship
mv ~/kryclod-ubuntu-post-install/starship/starship.toml ~/.config
# zsh
sudo apt install zsh -y
chsh -s $(which zsh) 
grep zsh /etc/passwd
cp -R ~/kryclod-ubuntu-post-install/zsh/.zshrc ~/
# --------------------------------------------------// customization //--------------------------------------------- #
# tweaks and config
sudo apt install gnome-tweaks && sudo apt install gnome-shell-extensions && sudo apt install chrome-gnome-shell -y
mkdir ~/.themes && mkdir ~/.icons
cp -R ~/dev/repo/kryclod-ubuntu-post-install/customization/parcatheme/ ~/.themes/
cp -R ~/dev/repo/kryclod-ubuntu-post-install/customization/parcacursor/ ~/.icons/
cp -R ~/dev/repo/kryclod-ubuntu-post-install/customization/McMojave-circle-red/ ~/.icons/
cp -R ~/dev/repo/kryclod-ubuntu-post-install/customization/McMojave-circle-red-dark/ ~/.icons/
# interface
gsettings set org.gnome.desktop.interface gtk-theme "parcatheme"
gsettings set org.gnome.desktop.interface cursor-theme 'parcacursor'
gsettings set org.gnome.desktop.interface icon-theme 'McMojave-circle-red-dark'
gsettings set org.gnome.shell.extensions.user-theme name "parcatheme"
gsettings set org.gnome.desktop.interface text-scaling-factor .7
# favorite apps
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed s/.$//), 'firefox.desktop', 'spotify.desktop', 'org.gnome.Nautilus.desktop', 'google-chrome.desktop', 'com.alacritty.Alacritty.desktop', 'code.desktop']"
# fonts
sudo cp -r ~/kryclod-ubuntu-post-install/assets/fonts/*/*.ttf /usr/share/fonts
sudo apt install fonts-firacode -y
# extensions
cd ~/Downloads
# extensions -> freon
git clone https://github.com/UshakovVasilii/gnome-shell-extension-freon.git
cd gnome-shell-extension-freon
glib-compile-schemas freon@UshakovVasilii_Github.yahoo.com/schemas/
mkdir -p ~/.local/share/gnome-shell/extensions
cp -r freon@UshakovVasilii_Github.yahoo.com ~/.local/share/gnome-shell/extensions/
gnome-extensions enable freon@UshakovVasilii_Github.yahoo.com
# background
sudo cp -R ~/kryclod-ubuntu-post-install/assets/img/bg-liquid-red.jpg //usr/share/backgrounds/
gsettings set org.gnome.desktop.background picture-uri file:////usr/share/backgrounds/bg-liquid-red.jpg
gsettings set org.gnome.desktop.screensaver picture-uri file:////usr/share/backgrounds/bg-liquid-red.jpg 
# hide icons
gsettings set org.gnome.shell.extensions.desktop-icons show-trash false
gsettings set org.gnome.shell.extensions.desktop-icons show-home false
# alacritty config
cp ~/kryclod-ubuntu-post-install/alacritty/alacritty.yml ~/.config/alacritty/
# --------------------------------------------------// clean seaction //--------------------------------------------- #
cd ~/Downloads
sudo killall snap-store -y
sudo apt-get autoclean -y
sudo apt-get autoremove -y
sudo apt-get clean -y
sudo rm *.deb
