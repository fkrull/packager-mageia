# Packer templates for Mageia
Packer templates to build Vagrant base boxes for Mageia. Currently only for
VirtualBox.

Build somewhat like this:

```
$ packer build -var-file mageia6-64.json -var version=6.20170907 mageia.json
```

You'll have to take out or adjust the Vagrant Cloud tag.
