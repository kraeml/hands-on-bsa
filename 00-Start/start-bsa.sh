#!/bin/bash

set -xe

sudo lxc-create --template ubuntu --name bsa-bashy
sudo lxc-update-config -c /var/lib/lxc/bsa-bashy/config
sudo lxc-start --name bsa-bashy
sudo lxc-ls --fancy bsa-bashy
