#!/bin/bash

FILES=(*)

for UPDATE_PATH in "${FILES[@]}"; do
	if [[ $UPDATE_PATH != "update.sh" ]]; then
		cp ~/.config/"$UPDATE_PATH"/ -r .
		echo "Updated $UPDATE_PATH"
	fi
done
