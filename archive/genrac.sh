# Reprise de la partie génération de raccourcis du script principal

# Création des raccourcis dans le lanceur
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

for i in {0..13}; do
    cat << EOF > ${nomraccourci[$i]}.desktop
[Desktop Entry]
Type=Application
Name=${nomlogiciel[$i]}
Exec=${logicielnonapt[$i]}
Icon=$icone/${nomraccourci[$i]}.png
Terminal=false
EOF
echo "Raccourci pour ${nomlogiciel[$i]}"
done

update-desktop-database ~/.local/share/applications