#!/bin/bash -eux

SSH_USER=${SSH_USERNAME:-vagrant}
SSH_USER_HOME=${SSH_USER_HOME:-/home/${SSH_USER}}

if [[ $PACKER_BUILDER_TYPE =~ virtualbox ]]; then
    echo "==> Installing VirtualBox guest additions"
    kernel_pkg=$(uname -r | sed -e 's/\(.\+\)-\(.\+\)-\(.\+\)/kernel-\2-devel-\1-\3/')
    urpmi --auto $kernel_pkg gcc

    VBOX_VERSION=$(cat $SSH_USER_HOME/.vbox_version)
    mount -o loop $SSH_USER_HOME/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
    sh /mnt/VBoxLinuxAdditions.run
    umount /mnt
    rm -rf $SSH_USER_HOME/VBoxGuestAdditions_$VBOX_VERSION.iso
    rm -f $SSH_USER_HOME/.vbox_version

    echo "==> Removing packages needed for building guest tools"
    urpme --auto $kernel_pkg gcc
fi
