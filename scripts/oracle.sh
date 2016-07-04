# Installing the oracle XE DB

echo "Disabling IPv6 ####################################################"
# Disable ipv6
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf

# Disable firewall
service firewalld stop
chkconfig firewalld off

# Unzip first
yum -y install unzip bc libaio flex
mkdir /tmp/oracle
unzip /tmp/oracle/oracle-xe-11.2.0-1.0.x86_64.rpm.zip -d /tmp/oracle

# Install and configure oracle

cd /tmp/oracle/Disk1
rpm -ivh oracle-xe-11.2.0-1.0.x86_64.rpm
/etc/init.d/oracle-xe configure responseFile=/tmp/oracle/xe.rsp

# Add oracle environments to vagrant and oracle user

echo ". /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh" >> /home/vagrant/.bash_profile
su - -c 'echo ". /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh" >> ~/.bash_profile' oracle

# Run database init script

source /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh
echo exit | sqlplus -S system/manager@localhost/xe @/tmp/oracle/db_init.sql

# Cleanup
rm -rf /tmp/oracle

# Reboot
service sshd stop && reboot
