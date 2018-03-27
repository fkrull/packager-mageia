#!/usr/bin/perl -cw
#
# You should check the syntax of this file before using it in an auto-install.
# You can do this with 'perl -cw auto_inst.cfg.pl' or by executing this file
# (note the '#!/usr/bin/perl -cw' on the first line).
$o = {
       'authentication' => {
           'sha512' => 1,
           'shadow' => 1
         },
       'autoExitInstall' => '1',
       'default_packages' => [
             'acpi',
			       'acpid',
			       'alsa-utils',
			       'aoss',
			       'aria2',
			       'basesystem',
			       'bash-completion',
			       'bc',
			       'coreutils-doc',
			       'cpupower',
			       'cronie-anacron',
			       'curl',
			       'dhcp-client',
			       'dmraid',
			       'dnf',
			       'dnf-plugins-core',
			       'dosfstools',
			       'drakx-net-text',
			       'gnupg',
			       'gpm',
			       'grub2-mageia-theme',
			       'harddrake',
			       'hdparm',
			       'hexedit',
			       'info',
			       'iwlwifi-agn-ucode',
			       'kernel-desktop-latest',
			       'kernel-firmware-nonfree',
			       'ldetect',
			       'lftp',
			       'lib64alsa-plugins',
			       'lib64glib-networking-gnutls',
			       'locales-en',
			       'lsof',
			       'lvm2',
			       'man-pages',
			       'mandi-ifw',
			       'mate-polkit',
			       'microcode',
			       'microcode_ctl',
			       'mtools',
			       'ntfs-3g',
			       'numlock',
			       'os-prober',
			       'p11-kit',
			       'perl-Hal-Cdroms',
			       'perl-Time-HiRes',
			       'plymouth',
			       'procmail',
			       'python3',
			       'python3-dbus',
			       'radeon-firmware',
			       'ralink-firmware',
			       'rtlwifi-firmware',
			       'sharutils',
			       'shorewall-ipv6',
			       'strace',
			       'sudo',
			       'tmpwatch',
			       'tree',
			       'usbutils',
			       'vim-minimal',
			       'xdg-user-dirs-gtk',

             'openssh-server',
           ],
       'enabled_media' => [
          'Core Release'
        ],
       'keyboard' => {
           'GRP_TOGGLE' => '',
           'KEYBOARD' => 'us'
         },
       'locale' => {
         'IM' => undef,
         'country' => 'US',
         'lang' => 'en_US',
         'langs' => {
          'en_US' => 1
        },
         'utf8' => 1
       },
       'net' => {
      'PROFILE' => 'default',
      'ethernet' => {},
      'ifcfg' => {
             'enp0s3' => {
               'BOOTPROTO' => 'dhcp',
               'BROADCAST' => '',
               'DEVICE' => 'enp0s3',
               'HWADDR' => undef,
               'METRIC' => 10,
               'NETMASK' => '255.255.255.0',
               'NETWORK' => '',
               'ONBOOT' => 'yes'
             }
           },
      'net_interface' => 'enp0s3',
      'network' => {
         'CRDA_DOMAIN' => 'US',
         'NETWORKING' => 'yes'
             },
      'resolv' => {
        'DOMAINNAME' => undef,
        'DOMAINNAME2' => undef,
        'DOMAINNAME3' => undef,
        'dnsServer' => undef,
        'dnsServer2' => undef,
        'dnsServer3' => undef
            },
      'type' => 'ethernet',
      'wireless' => {},
      'zeroconf' => {}
    },
       'partitioning' => {
         'auto_allocate' => '1',
         'clearall' => 1
       },
       'security' => 1,
       'security_user' => undef,
       'superuser' => {
      'gid' => '0',
      'home' => '/root',
      'password' => 'vagrant',
      'realname' => 'root',
      'shell' => '/bin/bash',
      'uid' => '0'
          },
       'timezone' => {
           'UTC' => 1,
           'ntp' => undef,
           'timezone' => 'UTC'
         },
       'users' => [
        {
          'gid' => undef,
          'groups' => [
            'wheel'
          ],
          'password' => 'vagrant',
          'icon' => 'default',
          'name' => 'vagrant',
          'realname' => undef,
          'shell' => '/bin/bash',
          'uid' => undef
        }
      ],
      'postInstall' => "
        echo 'ACCEPT net \$FW tcp 22' > /etc/shorewall/rules
        echo 'INCLUDE rules.drakx' >> /etc/shorewall/rules
        echo 'Defaults:vagrant !requiretty' > /etc/sudoers.d/vagrant
        echo '%vagrant ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/vagrant
        chmod 440 /etc/sudoers.d/vagrant
      "
     };
