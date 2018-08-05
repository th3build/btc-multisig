#!/bin/bash

# set up
echo 'Enter the raw transaction, followed by [ENTER]:'
read TX

echo 'Enter first public key of multisig, followed by [ENTER]:'
read PUBKEY1

echo 'Enter second public key of multisig, followed by [ENTER]:'
read PUBKEY2

echo 'Enter your private key, followed by [ENTER]:'
read PRIVKEY


TX="$(bx input-sign $PRIVKEY "2 [$PUBKEY1] [$PUBKEY2] 2 checkmultisig" $TX)"
REDEEM="$(bx script-encode "2 [$PUBKEY1] [$PUBKEY2] 2 checkmultisig")"
echo 'signed transaction:' $TX
echo 'redeem script:'$REDEEM 
