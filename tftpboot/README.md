# Goals
My overarching goal for this project are to minimize the amount of "manual" work needed to deploy servers. The configs in this folder represent the files in my `/var/lib/tftpboot` folder on a separate system on my network.

# Other Steps
1. Download the latest iso from Ubuntu and put in the root of `/var/lib/tftpboot`. Update `/var/lib/tftpboot/grub/grub.cfg` to match the proper ISO file downloaded.
2. An example dnsmasq config is located at the root of this folder. I'm using dnsmasq as the tftp server.
3. An example Apache tftp.conf file is located in the root of this folder. This needs to be placed in `/etc/apache2/conf-available` and linked in `/etc/apache2/conf-enabled`

# Miscellaneous Notes
1. Getting the initial `user-data` file located in each server's folder can be done by doing a manual installation of the server using ISO and then getting the file from `/var/log/installer/autoinstall-user-data` from the resulting system.
2. The `initrd` and `vmlinuz` files in the `/var/lib/tftpboot/pxelinux` folder were extracted from an Ubuntu ISO.
3. The deployment depends on these files being available on a web server.  I've deployed apache to the node and included the apache config file at the root of the tftpboot folder.


# Reference links
Links that were helpful in putting this together

- https://askubuntu.com/questions/1235723/automated-20-04-server-installation-using-pxe-and-live-server-image/1239021#1239021
- https://discourse.ubuntu.com/t/please-test-autoinstalls-for-20-04/15250
