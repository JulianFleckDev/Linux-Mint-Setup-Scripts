# 1. Create the extension directory if it doesn't exist
mkdir -p ~/.local/share/cinnamon/extensions/

# 2. Navigate to that folder
cd ~/.local/share/cinnamon/extensions/

# 3. Clone the BlurCinnamon repository
git clone https://github.com/klangman/BlurCinnamon.git BlurCinnamon@klangman

#Update Extension list
gsettings get org.cinnamon enabled-extensions
gsettings set org.cinnamon enabled-extensions "['BlurCinnamon@klangman']"

#Apply
cinnamon --replace &

#-------------------------------
#Bloatware
sudo apt remove warpinator
sudo apt remove hypnotix
