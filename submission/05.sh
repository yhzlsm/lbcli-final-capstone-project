# How many satoshis did this transaction pay for fee?: b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb
transaction=$(bitcoin-cli -signet getrawtransaction "b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb" 2)
amount_vout=$(echo "$transaction" | jq -r ".vout | map(.value * 100000000) | add")
amount_vin=$(echo "$transaction" | jq -r ".vin | map(.prevout.value * 100000000) | add")
fee=$(echo "$amount_vin - $amount_vout" | bc)
echo "$fee"
