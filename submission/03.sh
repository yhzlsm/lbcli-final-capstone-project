# Which tx in block 216,351 spends the coinbase output of block 216,128?
block_hash_coinbase=$(bitcoin-cli -signet getblockhash "216128")
block_coinbase=$(bitcoin-cli -signet getblock "$block_hash_coinbase" 2)
coinbase_txid=$(echo "$block_coinbase" | jq -r '.tx[0].txid')
block_hash=$(bitcoin-cli -signet getblockhash 216351)
block_data=$(bitcoin-cli -signet getblock "$block_hash" 2 | jq '.tx')
spending_txid=$(echo "$block_data" | jq -r --arg coinbase_txid "$coinbase_txid" '.[] | select(.vin[].txid == $coinbase_txid) | .txid')
echo $spending_txid
