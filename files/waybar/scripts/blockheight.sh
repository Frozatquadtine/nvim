#!/bin/bash

price="$(wget 'https://api.binance.com/api/v3/ticker/price?symbol=BTCUSDT' -q -O - | jq -r .price)"
price_thb="$(wget 'https://api.bitkub.com/api/market/asks?sym=thb_btc&lmt=1' -q -O - | jq -r .result.[0].[3])"
rounded_Price=$(printf "%'.0f\n" "${price}")
price_sats_per_bath=$(echo "1000 / ($price_thb / 100000)" | bc)

if [[ ! ${rounded_Price} -eq 0 ]]; then
	echo " $rounded_Price\$ 1฿=${price_sats_per_bath}⚡" >"$HOME/.config/waybar/scripts/BTCUSD"
fi

price=$(curl -sX GET "https://blockchain.info/q/getblockcount" -H "accept: application/json")

if [[ -n ${price} && ${price} -gt 0 ]]; then
	echo "$price" >"$HOME/.config/waybar/scripts/blockheight"
fi

block=$(cat "$HOME/.config/waybar/scripts/blockheight")
btc_price=$(cat "$HOME/.config/waybar/scripts/BTCUSD")

printf "$block\n$btc_price"
