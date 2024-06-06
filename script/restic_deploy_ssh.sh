#!/bin/bash

scriptDir="$(dirname $0)"
configFile="$(dirname $scriptDir)"/vault/machine.txt

source $configFile
export IPV4_ADDR=$IPV4_ADDR