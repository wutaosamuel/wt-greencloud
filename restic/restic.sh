#!/bin/bash

# restic_test
#restic -r /root/tmp/restic_test --verbose backup --files-from /root/restic/restic_includes.txt --exclude-file /root/restic/restic_excludes.txt

# restic config directory
resticDir="$(dirname $0)"
envEnc="$resticDir"/restic_env.enc

# b2 account info
accountID=
accountKEY=
passphrase=""
#read -s -p "Enter passphrase for b2 account: " passphrase
#echo ""
#envString="$(gpg --passphrase $passphrase --decrypt $envEnc)"
envString="$(gpg --decrypt $envEnc)"
echo "$envString"
source <(echo "$envString")
accountID="$B2_ACCOUNT_ID"
accountKEY="$B2_ACCOUNT_KEY"
if [ -z "$accountID" ]; then
	echo "B2 account ID is empty"
	exit 1
fi
if [ -z "$accountKEY" ]; then
	echo "B2 account KEY is empty"
	exit 1
fi
echo "B2_ACCOUNT_ID=$accountID"
echo "B2_ACCOUNT_KEY=$accountKEY"

# export b2 environment
export B2_ACCOUNT_ID="$accountID"
export B2_ACCOUNT_KEY="$accountKEY"

# restic
restic -r b2:greencloud:restic_backup --verbose backup --files-from "$resticDir"/restic_includes.txt --exclude-file "$resticDir"/restic_excludes.txt
