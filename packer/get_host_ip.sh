#!/bin/bash

mkdir -p /tmp/packer
echo "Gathering host IP for Ansible..."
if [ $PACKER_BUILDER_TYPE == 'googlecompute' ]
then
    host_ip=$(
        gcloud compute instances describe $INSTANCE_NAME \
            --zone=$GC_ZONE |
        grep 'natIP' |
        awk -F ':' '{print $2}' |
        sed -r 's/\s//g'
    )
else
    echo "Invalid hostname."
    exit 1
fi

echo "hostname: $host_ip" > /tmp/packer/$PACKER_BUILDER_TYPE.yml
