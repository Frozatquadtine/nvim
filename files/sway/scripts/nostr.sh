#!/usr/bin/bash

if [[ ! $(pidof nostr-relay-tray) ]]; then
	nostr-relay-tray &
else
	pkill nostr-relay-tray &
	nostr-relay-tray &
fi
