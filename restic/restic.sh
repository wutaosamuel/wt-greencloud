#!/bin/bash

# restic_test
#restic -r /root/tmp/restic_test --verbose backup --files-from /root/restic/restic_includes.txt --exclude-file /root/restic/restic_excludes.txt

# restic config directory
resticDir="$(dirname $0)"
envEnc="$resticDir"/restic_env.enc

# b2 account info
gpg -o "$resticDir"/restic.env --decrypt "$envEnc"
source "$resticDir"/restic.env
# export b2 environment
export B2_ACCOUNT_ID="$B2_ACCOUNT_ID"
export B2_ACCOUNT_KEY="$B2_ACCOUNT_KEY"

# restic
restic -r b2:greencloud:restic_backup --verbose backup --files-from "$resticDir"/restic_includes.txt --exclude-file "$resticDir"/restic_excludes.txt

# clean
rm "$resticDir"/restic.env