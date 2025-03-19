#!/bin/bash

# duplicate if .env does not exist
if [ ! -f .env ]; then
  cp .env.example .env
fi

# use .env
. .env

# create swap and specify swap size(in MB)
sudo dd if=/dev/zero of=${SWAP_FILE} bs=1M count=${SWAP_SIZE}

# secure swap file mod as suggested
chmod 0600 ${SWAP_FILE}

# format swap
mkswap ${SWAP_FILE}

# set swapon
swapon ${SWAP_FILE}

# mount swap automatically when linux is rebooted.
echo "/mnt/$swapFile swap swap defaults 0 0" >> /etc/fstab
