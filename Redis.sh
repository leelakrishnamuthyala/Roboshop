echo -e "\e[33m >>>>>>>>>>>Install repo file<<<<<<<<<<< \e[0m"
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
echo -e "\e[33m >>>>>>>>>>>Enable required version<<<<<<<<<<<< \e[0m"
yum module enable redis:remi-6.2 -y
echo -e "\e[33m >>>>>>>>>>>install redis <<<<<<<<<<<<<< \e[0m"
yum install redis -y
echo -e "\e[33m >>>>>>>>>>>enable service <<<<<<<<<<< \e[0m"
systemctl enable redis
echo -e "\e[33m >>>>>>>>>>>Start Service <<<<<<<<<<<< \e[0m"
systemctl start redis
