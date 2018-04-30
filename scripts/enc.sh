#!/bin/bash

if [ "$1" = "v-puppetnode2" ]; then
    #echo "environment: testing"
    cat /etc/puppetlabs/code/scripts/testserver.conf
else
    echo "environment: production"
fi
