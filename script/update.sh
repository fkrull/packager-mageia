#!/bin/bash -eux

if [[ $ENABLE_UPDATE_MEDIA  =~ true || $ENABLE_UPDATE_MEDIA =~ 1 || $ENABLE_UPDATE_MEDIA =~ yes ]]; then
    echo "==> Enabling update source"
    urpmi.update --no-ignore "Core Updates"
fi

if [[ $UPDATE  =~ true || $UPDATE =~ 1 || $UPDATE =~ yes ]]; then
    echo "==> Applying updates"
    urpmi --auto-update --auto

    # reboot
    echo "Rebooting the machine..."
    reboot
    sleep 60
fi
