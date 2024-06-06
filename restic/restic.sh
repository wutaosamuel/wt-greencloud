#!/bin/bash

#!/bin/bash

# restic_test
#restic -r /root/tmp/restic_test --verbose backup --files-from /root/restic/restic_includes.txt --exclude-file /root/restic/restic_excludes.txt

# restic
resticDir="$(dirname $0)"
envFile="$resticDir"/restic_env.txt

source $envFile
export B2_ACCOUNT_ID=$B2_ACCOUNT_ID
export B2_ACCOUNT_KEY=$B2_ACCOUNT_KEY

restic -r b2:greencloud:restic_backup --verbose backup --files-from /root/restic/restic_includes.txt --exclude-file /root/restic/restic_excludes.txt