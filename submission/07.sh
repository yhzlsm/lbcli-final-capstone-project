# what is the coinbase tx in this block 243,834
block_hash=$(bitcoin-cli -signet getblockhash "243834")
block=$(bitcoin-cli -signet getblock "$block_hash" 2)
echo "$block" | jq -r '.tx[0].txid'