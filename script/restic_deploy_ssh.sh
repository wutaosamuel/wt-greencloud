#!/bin/bash

scriptDir="$(dirname $0)"
configFile="$(dirname $scriptDir)"/vault/machine.txt

source $configFile
export IPV4_ADDR=$IPV4_ADDR

resticShSource="$(dirname $scriptDir)"/restic/restic.sh
resticInSource="$(dirname $scriptDir)"/restic/restic_includes.txt
resticExSource="$(dirname $scriptDir)"/restic/restic_excludes.txt
resticEnvSource="$(dirname $scriptDir)"/vault/restic_env.txt

#targetLocation="."
targetLocation="/root/restic"
resticShDestination="$targetLocation"/restic.sh
resticInDestination="$targetLocation"/restic_includes.txt
resticExDestination="$targetLocation"/restic_excludes.txt
resticEnvDestination="$targetLocation"/restic_env.txt

resticShContent="$(cat $resticShSource)"
resticInContent="$(cat $resticInSource)"
resticExContent="$(cat $resticExSource)"
resticEnvContent="$(cat $resticEnvSource)"

echo "$resticShContent" > "$resticShDestination"
echo "$resticInContent" > "$resticInDestination"
echo "$resticExContent" > "$resticExDestination"
echo "$resticEnvContent" > "$resticEnvDestination"