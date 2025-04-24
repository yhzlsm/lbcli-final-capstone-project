# what block height was this tx mined ?
transaction=49990a9c8e60c8cba979ece134124695ffb270a98ba39c9824e42c4dc227c7eb
block_hash=$(bitcoin-cli -signet getrawtransaction $transaction 1 | jq -r '.blockhash')
block_header=$(bitcoin-cli -signet getblockheader "$block_hash")
echo "$block_header " | jq -r '.height'