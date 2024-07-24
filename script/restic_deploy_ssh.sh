#!/bin/bash

scriptDir="$(dirname $0)"

resticShSource="$(dirname $scriptDir)"/restic/restic.sh
resticInSource="$(dirname $scriptDir)"/restic/restic_includes.txt
resticExSource="$(dirname $scriptDir)"/restic/restic_excludes.txt
resticEnvSource="$(dirname $scriptDir)"/vault/restic.env
resticSource="{$resticShSource, $resticInSource, $resticExSource, $resticEnvSource}"

targetLocation="/root/restic"
scp "$resticSource" "$SSH_USER"@"$IPV4_ADDR":"$targetLocation"
echo done

#resticTmpDir="$(dirname $scriptDir)"/resticTmp
#mkdir "$resticTmpDir"

#cp "$resticShSource" "$resticTmpDir"
#cp "$resticInSource" "$resticTmpDir"
#cp "$resticExSource" "$resticTmpDir"
#cp "$resticEnvSource" "$resticTmpDir"

#scp -r "$resticTmpdir"/* "$SSH_USER"@"$IPV4_ADDR":"$targetLocation"

#rm -drf "$resticTmpDir"
#echo done