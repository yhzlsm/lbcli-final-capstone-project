# Only one tx in block 243,821 signals opt-in RBF. What is its txid?
block_hash=$(bitcoin-cli -signet getblockhash "243821")
block=$(bitcoin-cli -signet getblock "$block_hash" 2)
echo "$block" | jq -r '.tx[] | .txid' | while read txid; do
  tx=$(bitcoin-cli -signet getrawtransaction "$txid" 1)
  is_rbf=$(echo "$tx" | jq 'any(.vin[]; .sequence < 4294967294)')
  if [ "$is_rbf" = "true" ]; then
    echo "$txid"
  fi
done