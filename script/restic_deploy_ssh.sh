#!/bin/bash

scriptDir="$(dirname $0)"

resticShSource="$(dirname $scriptDir)"/restic/restic.sh
resticInSource="$(dirname $scriptDir)"/restic/restic_includes.txt
resticExSource="$(dirname $scriptDir)"/restic/restic_excludes.txt
resticEnvSource="$(dirname $scriptDir)"/vault/restic.env

#targetLocation="."
#targetLocation="/root/restic"
targetLocation="$(dirname $scriptDir)"/test
resticShDestination="$targetLocation"/restic.sh
resticInDestination="$targetLocation"/restic_includes.txt
resticExDestination="$targetLocation"/restic_excludes.txt
resticEnvDestination="$targetLocation"/restic.env

resticShContent="$(cat $resticShSource)"
resticInContent="$(cat $resticInSource)"
resticExContent="$(cat $resticExSource)"
resticEnvContent="$(cat $resticEnvSource)"

# TODO: check target directory exist
sshCMD="$(cat << sshCMDEnd
echo "$resticShContent" > "$resticShDestination";
echo "$resticInContent" > "$resticInDestination";
echo "$resticExContent" > "$resticExDestination";
echo "$resticEnvContent" > "$resticEnvDestination";
sshCMDEnd
)"

configFile="$(dirname $scriptDir)"/vault/machine.txt
source $configFile

ssh "$SSH_USER"@"$IPV4_ADDR" "$sshCMD"
echo done
