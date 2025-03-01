# IMPORTANT: This install script has only been tested on Arch Linux.
# Installation procedure may vary from distribution-to-distribution.

rm -rf /usr/share/plymouth/themes/PlymouthVista
cp -r $(pwd) /usr/share/plymouth/themes/PlymouthVista
plymouth-set-default-theme -R PlymouthVista