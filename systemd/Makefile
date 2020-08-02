all: install

.PHONY: install
install:
	mkdir -p ~/.config/systemd/user
	cp update-authorized-keys.service ~/.config/systemd/user/update-authorized-keys.service
	cp update-authorized-keys.timer ~/.config/systemd/user/update-authorized-keys.timer
	cp update-authorized-keys.sh ~/.config/systemd/user/update-authorized-keys.sh
	systemctl --user daemon-reload
	systemctl --user enable --now update-authorized-keys.timer

.PHONY: uninstall
uninstall:
	systemctl --user disable --now update-authorized-keys.timer
	systemctl --user daemon-reload
	rm ~/.config/systemd/user/update-authorized-keys.service
	rm ~/.config/systemd/user/update-authorized-keys.timer
	rm ~/.config/systemd/user/update-authorized-keys.sh
