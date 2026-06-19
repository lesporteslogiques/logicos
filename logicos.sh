#!/bin/bash
# Script d'installation des logiciels (et leurs extensions) de LogicOS

echo "Script d'installation de la suite logicielle LogicOS"
echo "Ce script est prévu pour les distributions basées sur Debian"
read -p "Souhaitez-vous débuter ? [oN] " ouinon

while true; do
    case $ouinon in
        [oO]* ) echo "cool, on y va alors"; break;;
        [nN]* ) echo "okay bah a plus alors"; exit;;
        * ) read -p "Erreur de saisie, voulez-vous lancer l'installation ? [oN] " ouinon;;
    esac
done

echo "haha installation go brr"

# Liste des logiciels installés avec APT
declare -a logicielapt=("terminator" "gnome-shell-extensions" "gnome-shell-extension-gsconnect" "syncthing" "git" \
"texlive-extra-utils" "poppler-utils" "pdfposter" "ffmpeg" "imagemagick" "sox" "audacity" "puredata" "plugdata" \
"chuck" "audacious" "supercollider" "mixxx" "qsynth" "furnace" "orca" "pilot" "liquidsoap" "jackd" "gimp" \
"inkscape" "inkscape-silhouette" "scribus" "fontforge" "krita" "python3" "python3-usb" "python3-matplotlib" \
"python3-tinycss2" "vlc" "kdenlive" "cheese" "obs-studio" "aegisub" "kicad" "arduino" "fritzing" "freecad" \
"openscad" "cura" "blender" "gmsh" "codium" "notepadqq" "python3-pip" "pipx" "python3-renpy" "libreoffice-common" \
"libreoffice-l10n-fr" "libreoffice-help-fr" "libfuse2")

# Emplacements choisis
# pour les applications non installées avec APT ou Snap
dossier=~/bin
# pour les icônes
icone=~/.icons

# Début du téléchargement et de l'installation
sudo apt-get update
#for i in "${logicielapt[@]}"; do
    # Installation des logiciels un par un, avec confirmation automatique
#    sudo apt-get -y install $i
#done
sudo apt-get -y install terminator gnome-shell-extensions gnome-shell-extension-gsconnect syncthing git\
 texlive-extra-utils poppler-utils pdfposter ffmpeg imagemagick sox audacity puredata plugdata chuck\
 audacious supercollider mixxx qsynth furnace orca pilot liquidsoap jackd gimp inkscape inkscape-silhouette\
 scribus fontforge krita python3 python3-usb python3-matplotlib python3-tinycss2 vlc kdenlive cheese obs-studio\
 aegisub kicad arduino fritzing freecad openscad cura blender gmsh codium notepadqq python3-pip pipx\
 python3-renpy libreoffice-common libreoffice-l10n-fr libreoffice-help-fr libfuse2
echo "Sacrée liste, hein ?"

# Création des différents dossiers qui serviront aux logiciels qui ne sont pas installés avec APT
# Dossier logicos à la racine du répertoire utilisateur pour centraliser les fichiers téléchargés
mkdir ~/logicos
sleep 1
# Création du dossier pour les logiciels installés en-dehors de APT et Snap
mkdir $dossier
sleep 1
# Création du dossier pour les icônes
mkdir $icone
sleep 1
cp icone/* $icone/
cd ~/logicos

# Balena Etcher
wget https://github.com/balena-io/etcher/releases/download/v2.1.6/balena-etcher_2.1.6_amd64.deb
# 1. Extraction du paquet
#dpkg-deb -R balena-etcher_2.1.6_amd64.deb etcher-fix
# 2. Mise à jour de la dépendance avec le nom compatible avec Debian 13
#sed -i 's/libgdk-pixbuf2.0-0/libgdk-pixbuf-2.0-0/g' etcher-fix/DEBIAN/control
# 3. Rebuild
#dpkg-deb -b etcher-fix balena-etcher-fixed_2.1.6_amd64.deb
# 4. Installer
#sudo apt-get -y install ./balena-etcher-fixed_2.1.6_amd64.deb
sudo apt-get -y install ./balena-etcher_2.1.6_amd64.deb
echo "Voilà, Etcher est installé"
sleep 1

# ImHex
wget https://github.com/WerWolv/ImHex/releases/download/v1.38.1/imhex-1.38.1-arm64.AppImage -P $dossier/imhex-1.38.1

# Reaper
wget https://www.reaper.fm/files/7.x/reaper774_linux_x86_64.tar.xz
tar -xf reaper774_linux_x86_64.tar.xz
echo "Lancement du script d'installation de Reaper..."
sleep 1
./reaper774_linux_x86_64/install-reaper.sh
echo "Installation de Reaper terminée"
sleep 1

# Automatonism
wget https://www.automatonism.com/s/Automatonism-31.zip
7z x Automatism-31.zip -o./automatism
mkdir $dossier/automatism-3.1
mv automatism/Automatism\ 3.1/* $dossier/automatism-3.1/

# /!\ Installation de SonicPi désactivée en attendant de s'assurer que ce dernier puisse être compilé et installé correctement
# Sonic Pi
# Installation des dépendances et des outils pour build
#echo "sudo apt-get install -y build-essential git libssl-dev ruby-dev elixir erlang-dev erlang-xmerl \
#qt6-tools-dev qt6-tools-dev-tools libqt6svg6-dev libqt6opengl6-dev supercollider-server sc3-plugins-server \
#alsa-utils  libasound2-dev cmake ninja-build pipewire-jack libspa-0.2-jack qt6-wayland libwayland-dev \
#libxkbcommon-dev libegl1-mesa-dev libx11-dev libxft-dev libxext-dev qpwgraph compton m4 libaubio-dev libpng-dev \
#libboost-all-dev librtmidi-dev"
# Clonage du dépot Github
#echo "git clone --recurse-submodules https://github.com/sonic-pi-net/sonic-pi.git $dossier/sonicpi-4.6"
# On se met dans le bon dossier avant de build
#echo "cd $dossier/sonicpi-4.6/app"
# Et hop, on lance le script pour build
#echo "./linux-build-all.sh"
#cd ~/logicos


# Soundthread
wget https://github.com/j-p-higgins/SoundThread/releases/download/v0.4.0-beta/SoundThread_v0-4-0-beta_linux_x86_64.tar.gz
tar -xf SoundThread_v0-4-0-beta_linux_x86_64.tar.gz
mkdir $dossier/soundthread-0.4.0
mv SoundThread_v0-4-0-beta_linux_x86_64/* $dossier/soundthread-0.4.0/

# Rack
wget https://vcvrack.com/downloads/RackFree-2.6.6-lin-x64.zip
mkdir $dossier/rack-2.6.6
7z x RackFree-2.6.6-lin-x64.zip
mv Rack2Free/* $dossier/rack-2.6.6/

# Ink/stitch
wget https://github.com/inkstitch/inkstitch/releases/latest/download/inkstitch_3.2.2_amd64.deb
sudo apt-get -y install ./inkstitch_3.2.2_amd64.deb

# Friction
wget https://github.com/friction2d/friction/releases/download/v1.0.0-rc.3/Friction-1.0.0-rc.3-x86_64.AppImage \
-P $dossier/friction-1.0

# Jubler
wget https://github.com/teras/Jubler/releases/download/v9.0.1/Jubler-9.0.1-x86_64.AppImage \
-P $dossier/jubler-9.0.1

# Arduino
wget https://downloads.arduino.cc/arduino-ide/arduino-ide_2.3.10_Linux_64bit.AppImage -P $dossier/arduino-2.3.10

# Vpype
pipx install vpype[all]

# Processing
echo "Installation de Snap"
sleep 1
sudo apt-get -y install snapd
sleep 1
echo "Installation de Processing"
sleep 1
sudo snap install processing --classic
echo "Installation de Processing terminée"
sleep 1
echo "Installation de VS Codium"
sudo snap install codium --classic
echo "VS Codium installé"
sleep 1

# GBStudio
wget https://github.com/chrismaltby/gb-studio/releases/download/v4.3.1/gb-studio-linux.AppImage -P $dossier/gbstudio-4.3.1

# LibreSprite
wget https://github.com/LibreSprite/LibreSprite/releases/download/v1.1/libresprite-development-linux-x86_64.zip
7z x libresprite-development-linux-x86_64.zip
mkdir $dossier/libresprite-1.1
mv LibreSprite-x86_64.AppImage $dossier/libresprite-1.1/

# Tiled
wget https://github.com/mapeditor/tiled/releases/download/v1.12.2/Tiled-1.12.2_Linux_x86_64.AppImage -P $dossier/tiled-1.12.2

# Godot
wget https://github.com/godotengine/godot/releases/download/4.6.3-stable/Godot_v4.6.3-stable_linux.x86_64.zip
7z x Godot_v4.6.3-stable_linux.x86_64.zip
mkdir $dossier/godot-4.6.3
mv Godot_v4.6.3-stable_linux.x86_64 $dossier/godot-4.6.3/

# Twine
wget https://github.com/klembot/twinejs/releases/download/2.12.0/Twine-2.12.0-Linux-x64.zip
mkdir twine-2.12
7z x Twine-2.12.0-Linux-x64.zip -o./twine-2.12
mv twine-2.12 $dossier/

# Logseq
wget https://github.com/logseq/logseq/releases/download/0.10.15/Logseq-linux-x64-0.10.15.AppImage -P $dossier/logseq-0.10.15


# Création des icônes dans le lanceur
declare -a nomraccourci=("imhex" "automatonism" "soundthread" "rack" "friction" "jubler" "arduino" "gbstudio" \
"libresprite" "tiled" "godot" "twine" "logseq" "bitsy")
declare -a nomlogiciel=("ImHex" "Automatonism" "SoundThread" "Rack" "Friction" "Jubler" "Arduino 2-3-10" \
"GB Studio" "LibreSprite" "Tiled" "Godot" "Twine" "Logseq" "Bitsy")
declare -a logicielnonapt=("$dossier/imhex-1.38.1/imhex-1.38.1-arm64.AppImage" "puredata $dossier/automatism-3.1/main.pd" "$dossier/soundthread-0.4.0/SoundThread.x86_64" \
"$dossier/rack-2.6.6/Rack" "$dossier/friction-1.0/Friction-1.0.0-rc.3-x86_64.AppImage" "$dossier/jubler-9.0.1/Jubler-9.0.1-x86_64.AppImage" \
"$dossier/arduino-2.3.10/arduino-ide_2.3.10_Linux_64bit.AppImage" "$dossier/gbstudio-4.3.1/gb-studio-linux.AppImage" \
"$dossier/libresprite-1.1/LibreSprite-x86_64.AppImage" "$dossier/tiled-1.12.2/Tiled-1.12.2_Linux_x86_64.AppImage" \
"$dossier/godot-4.6.3/Godot_v4.6.3-stable_linux.x86_64" "$dossier/twine-2.12/twine" "$dossier/logseq-0.10.15/Logseq-linux-x64-0.10.15.AppImage" \
"firefox https://www.bitsy.org/")

cd ~/.local/share/applications
nb=-1
# On compte le nombre de logiciels dans la liste au-dessus (méthode probablement utilisée à l'avenir pour la liste APT)
for j in "${logicielnonapt[@]}"; do
    nb+=$((nb + 1))
done
for i in $(seq 0 $nb); do
    touch ${nomraccourci[$i]}.desktop
    cat << EOF >> ${nomraccourci[$i]}.desktop
[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=${nomlogiciel[$i]}
Exec=${logicielnonapt[$i]}
Icon=$icone/${nomraccourci[$i]}.png
EOF
done

update-desktop-database ~/.local/share/applications

echo "L'installation des logiciels est terminée"
