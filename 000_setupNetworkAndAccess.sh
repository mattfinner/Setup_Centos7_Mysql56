# Dont run

# Setup network
nmcli d # find ethernet interface id
nmtui # confogure interface
# Set a static IP but leave network interface as Automatic

# Install nano
yum install -y nano
yum install -y ntpd
systemctl start ntpd
yum install net-tools
yum install -y wget

# Disable firewall
systemctl disable firewalld
systemctl stop firewalld

# Disable SELinux
nano /etc/sysconfig/selinux # reboot after

# Install OpenSSH
yum -y install openssh-server openssh-clients

# Create SSH Keys - name your keys and create passsphrase
ssh-keygen

# Move public key into ssh dir - name
mkdir .ssh
chmod 700 .ssh
cat home_mysql56.pub > ~/.ssh/authorized_keys
chmod 600 .ssh/authorized_keys
# Copy off the private key and use putty to generate .ppk

# Disable root logins
sudo nano /etc/ssh/sshd_config
# Set - "PasswordAuthentication no" and "PermitRootLogin no"
