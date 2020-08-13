yum install -y wget
mkdir /home/zabbix
mkdir /home/zabbix/log
cd /home/zabbix
wget https://www.zabbix.com/downloads/4.0.23/zabbix_agent-4.0.23-linux-3.0-amd64-static.tar.gz

tar -xzvf zabbix_agent-4.0.23-linux-3.0-amd64-static.tar.gz
cd /home/zabbix/conf


cp zabbix_agentd.conf zabbix_agentd.conf_old

sed -i "s/^Server=127.0.0.1/Server={$ip}/" zabbix_agentd.conf
sed -i "s/^ServerActive=127.0.0.1/ServerActive={$ip}/" zabbix_agentd.conf
sed -i "s/^Hostname=Zabbix server/#Hostname=Zabbix server/" zabbix_agentd.conf
sed -i "s/^LogFile=\/tmp\/zabbix_agentd.log/LogFile=\/home\/zabbix\/log\/zabbix_agentd.log/" zabbix_agentd.conf
sed -i "s/^# EnableRemoteCommands=0/EnableRemoteCommands=1/" zabbix_agentd.conf
sed -i "s/^# AllowRoot=0/AllowRoot=1/" zabbix_agentd.conf




echo "cd /home/zabbix/sbin" > /home/zabbix/sbin/start.sh
echo "./zabbix_agentd -c /home/zabbix/conf/zabbix_agentd.conf" >> /home/zabbix/sbin/start.sh
chmod 755 /home/zabbix/sbin/start.sh

/home/zabbix/sbin/start.sh
