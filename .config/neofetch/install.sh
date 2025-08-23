# Remove old neofetch config
rm -rf ~/.config/neofetch/

# Create directory
mkdir ~/.config/neofetch/
mkdir ~/.config/neofetch/logos/ ~/.config/neofetch/cfgs/

# Copy configs and logos
cp default.conf ~/.config/neofetch/cfgs/default.conf
cp small.conf ~/.config/neofetch/cfgs/small.conf
cp logo_default ~/.config/neofetch/logos/logo_default
cp logo_aggre ~/.config/neofetch/logos/logo_aggre
cp logo_small ~/.config/neofetch/logos/logo_small

# Remove source directory
cd ..
rm -rf neofetch-config/
