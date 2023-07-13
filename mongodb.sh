yum remove mongobd
echo -e "\e[32m >>>>>>>>>>>>>>>>copy repo file<<<<<<<<<<<<<<<<\e[0m"
cp mongo.repo /etc/yum.repos.d/mongo.repo
echo -e "\e[32m >>>>>>>>>>>>>>>>Install mongodb<<<<<<<<<<<<<<<<\e[0m"
yum install mongodb-org -y
echo -e "\e[32m >>>>>>>>>>>>>>>>change the local host<<<<<<<<<<<<<<<<\e[0m"
sed -i -e 's|127.0.0.1|0.0.0.0|' /etc/mongod.conf
echo -e "\e[32m >>>>>>>>>>>>>>>>Enable Service<<<<<<<<<<<<<<<<\e[0m"
systemctl enable mongod
echo -e "\e[32m >>>>>>>>>>>>>>>>Start Service<<<<<<<<<<<<<<<<\e[0m"
systemctl start mongod
