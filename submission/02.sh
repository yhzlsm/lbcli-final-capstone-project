# How many new outputs were created by block 243,825?
block_hash=$(bitcoin-cli -signet getblockhash "243833")
block=$(bitcoin-cli -signet getblock "$block_hash" 2)
transactions=$(echo $block | jq '.tx')
vouts=$(echo $transactions | jq '.[].vout')
count=0
for i in $vouts
do
  count=$((count + 1))
done
echo $count
