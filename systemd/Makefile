all: install

.PHONY: install
install:
	mkdir -p ~/.config/systemd/user
	cp update-wireguard-peers.service ~/.config/systemd/user/update-wireguard-peers.service
	cp update-wireguard-peers.timer ~/.config/systemd/user/update-wireguard-peers.timer
	cp update-wireguard-peers.sh ~/.config/systemd/user/update-wireguard-peers.sh
	systemctl --user daemon-reload
	systemctl --user enable --now update-wireguard-peers.timer

.PHONY: uninstall
uninstall:
	systemctl --user disable --now update-wireguard-peers.timer
	systemctl --user daemon-reload
	rm ~/.config/systemd/user/update-wireguard-peers.service
	rm ~/.config/systemd/user/update-wireguard-peers.timer
	rm ~/.config/systemd/user/update-wireguard-peers.sh
