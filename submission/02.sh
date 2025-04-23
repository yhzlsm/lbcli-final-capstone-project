# How many new outputs were created by block 243,825?
block_hash=$(bitcoin-cli -signet getblockhash "243825")
block=$(bitcoin-cli -signet getblock "$block_hash" 2)
transactions=$(echo $block | jq '.tx')
count=$(echo $transactions | jq '[.[].vout | length] | add')
echo $count

