#!/bin/bash

while getopts s: option
do
    case "${option}"
        in
            s) SECRETS_FILE=${OPTARG};;
    esac
done

packer build \
    -var-file=$SECRETS_FILE \
    $3

