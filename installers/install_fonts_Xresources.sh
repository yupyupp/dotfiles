echo "##### Running install_fonts_Xresources.sh #####"
echo "--- Running font installer ---"
../resources/powerline-fonts/install.sh
echo "--- Fonts installed ---"

echo "--- Backing up Xresources ---"
mv ~/.Xresources ~/.Xresources.old
echo "--- ~/.Xresources moved to ~/.Xresources.old ---"

echo "---Installing .Xresources ---"
cp ../.Xresources ~/.Xresources
echo "--- Xresources Installed ---"
echo "##### install_fonts_Xresources.sh Finished #####"
