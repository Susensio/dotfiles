function upgrade --description 'Upgrade system'
    sudo apt update &&
	sudo apt full-upgrade &&
	sudo apt autoremove -y &&
	sudo apt autoclean -y
end
