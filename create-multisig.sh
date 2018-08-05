#!/bin/sh

# Create 2 public keys
PRIVKEY1="$(bx seed | bx ec-new)"
PUBKEY1="$( echo $PRIVKEY1 | bx ec-to-public)"
ADDY1="$( echo $PUBKEY1 | bx ec-to-address)"

echo '========Keys========'
echo 'Private Key 1:' $PRIVKEY1
echo 'Public Key 1:' $PUBKEY1
echo 'Bitcoin Address 1:' $ADDY1
echo '\n'

echo 'Enter the counterparty public key:'
read PUBKEY2
echo 'Public Key 2:' $PUBKEY2
echo '\n'

# Create Multisig
MULTISIG="$(bx script-to-address "2 [$PUBKEY1] [$PUBKEY2] 2 checkmultisig")"

echo '========MultiSig========'
echo 'Multisig Address:' $MULTISIG