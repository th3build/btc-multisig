#!/bin/bash

# User input for multisig address to spend
echo 'Enter multisig address to spend, followed by [ENTER]'
read ADDY
echo 'multisig:' $ADDY

# Transaction to spend
echo 'Enter transaction to spend, followed by [ENTER]'
read UTXO
echo 'utxo:' $UTXO

# Address to send to
echo 'Enter address to spend to, followed by [ENTER]'
read NEWADDY
echo 'new address:' $NEWADDY

# Amount to send
echo 'Amount to send, followed by [ENTER]'
read AMOUNT
echo 'amount:' $AMOUNT

# Change to return to multisig
echo 'Amount to return to multisig, followed by [ENTER]'
read CHANGE
echo 'change:' $CHANGE

# Make tx
TX="$(bx tx-encode -i $UTXO:1 -o $NEWADDY:$AMOUNT)"

echo '\n'
echo '========Unsigned Transaction========'
echo 'raw:'$TX
bx tx-decode $TX

# Add sigs
echo 'Enter first signature, followed by [ENTER]:'
read SIG1

echo 'Enter second signature, followed by [ENTER]:'
read SIG2

echo 'Enter redeem script, followed by [ENTER]:'
read REDEEM

# create final transaction
FINALTX="$(bx input-set "zero [$SIG1] [$SIG2] [$REDEEM]" $TX)"

echo '\n'
echo '========Signed Final Transaction========'
echo 'raw:'$FINALTX
bx tx-decode $FINALTX
