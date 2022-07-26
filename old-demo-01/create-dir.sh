#!/bin/bash

create_dirs () {
    folders=(03-networks 04-gateways-and-ips 05-security-groups 06-ec2-instances 07-routes 08-s3-buckets 09-system-manager 10-logs 11-sns-topics 12-cloudwatch 13-backup-services)
    for i in "${folders[@]}"
    do
        mkdir $i
    done
}

# create_dirs