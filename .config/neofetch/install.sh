# Remove old neofetch config
rm -rf ~/.config/neofetch

# Create directory
mkdir ~/.config/neofetch
mkdir ~/.config/neofetch/normal ~/.config/neofetch/small

# Copy config and image
cp normal.conf ~/.config/neofetch/normal/config.conf
cp normal_logo ~/.config/neofetch/normal/logo
cp normal_logo_agro ~/.config/neofetch/normal/logo_agro
cp small.conf ~/.config/neofetch/small/config.conf
cp small_logo ~/.config/neofetch/small/logo

# Remove source directory
cd ..
rm -rf neofetch-config
