#!/bin/bash

# Ensure the system is up to date
sudo pacman -Syu --noconfirm

# Install basic tools using pacman
sudo pacman -S --noconfirm git neofetch ncdu vim bleachbit

# Install yay AUR helper
if ! command -v yay &> /dev/null
then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
fi

# Install additional software using yay
yay -S --noconfirm google-chrome brave-bin kitty
yay -S --noconfirm telegram-desktop
yay -S --noconfirm visual-studio-code-bin

echo "Installing nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

nvm install --lts


# List of Visual Studio Code extension names to install
extensions=("arcticicestudio.nord-visual-studio-code" "bradlc.vscode-tailwindcss" "burkeholland.simple-react-snippets" "donjayamanne.githistory" "dsznajder.es7-react-js-snippets" "eamodio.gitlens" "esbenp.prettier-vscode" "infeng.vscode-react-typescript" "ritwickdey.LiveServer" "steoates.autoimport" "streetsidesoftware.code-spell-checker" "VisualStudioExptTeam.intellicode-api-usage-examples" "VisualStudioExptTeam.vscodeintellicode" "vscode-icons-team.vscode-icons")
# Loop through the extensions and install each one
for extension in "${extensions[@]}"; do
    code --install-extension "$extension"
done
echo "Visual Studio Code extensions installation completed."

# Display a message indicating the installation is complete
echo "Basic apps and software installed successfully!"

