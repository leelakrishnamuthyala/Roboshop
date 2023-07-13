yum remove mongobd
echo -e "\e[32m >>>>>>>>>>>>>>>>copy repo file<<<<<<<<<<<<<<<<\e[0m"
cp mongo.repo /etc/yum.repos.d/mongo.repo
yum install mongodb-org -y
sed -i -e 's|127.0.0.1|0.0.0.0|' /etc/mongod.conf
systemctl enable mongod
systemctl start mongod
