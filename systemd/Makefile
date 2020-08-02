all: install

.PHONY: install
install:
	cp update-wireguard-peers.service /etc/systemd/system/update-wireguard-peers.service
	cp update-wireguard-peers.timer   /etc/systemd/system/update-wireguard-peers.timer
	cp update-wireguard-peers.sh      /etc/systemd/system/update-wireguard-peers.sh
	systemctl daemon-reload
	systemctl enable --now update-wireguard-peers.timer

.PHONY: uninstall
uninstall:
	systemctl disable --now update-wireguard-peers.timer
	systemctl daemon-reload
	rm /etc/systemd/system/update-wireguard-peers.service
	rm /etc/systemd/system/update-wireguard-peers.timer
	rm /etc/systemd/system/update-wireguard-peers.sh
