#!/bin/bash -eux
if [[ $UPDATE  =~ true || $UPDATE =~ 1 || $UPDATE =~ yes ]]; then
    echo "==> Applying updates"
    urpmi --auto-update --auto

    # reboot
    echo "Rebooting the machine..."
    reboot
    sleep 60
fi
