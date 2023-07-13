echo -e "\e[33m >>>>>>>>>>>>download the nodejs RPM setup<<<<<<<<<<<<<<< \e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo -e "\e[33m >>>>>>>>>>>>install nodejs<<<<<<<<<<<<< \e[0m"
yum install nodejs -y
echo -e "\e[33m >>>>>>>>>>>>Add userid for the Project<<<<<<<<<<<<<< \e[0m"
useradd roboshop
echo -e "\e[33m >>>>>>>>>>>>Project folder created<<<<<<<<<<<<< \e[0m"
mkdir /app
echo -e "\e[33m >>>>>>>>>>>>download the project<<<<<<<<<<<<< \e[0m"
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
echo -e "\e[33m >>>>>>>>>>>>unzip the project<<<<<<<<<<<<<< \e[0m"
cd /app
unzip /tmp/user.zip
echo -e "\e[33m >>>>>>>>>>>>Install the project<<<<<<<<<<<<<< \e[0m"
npm install
echo -e "\e[33m >>>>>>>>>>>>Copy the service<<<<<<<<<<<<<< \e[0m"
cp user.service /etc/systemd/system/user.service
echo -e "\e[33m >>>>>>>>>>>>reload the Service<<<<<<<<<<<<<< \e[0m"
systemctl daemon-reload
echo -e "\e[33m >>>>>>>>>>>>Enable the service<<<<<<<<<<<<<< \e[0m"
systemctl enable user
echo -e "\e[33m >>>>>>>>>>>>Start the Service<<<<<<<<<<<<<< \e[0m"
systemctl start user
echo -e "\e[33m >>>>>>>>>>>>Copy the repo file<<<<<<<<<<<<<< \e[0m"
cp mongo.repo /etc/yum.repos.d/mongo.repo
echo -e "\e[33m >>>>>>>>>>>>Install mongo db<<<<<<<<<<<<<< \e[0m"
yum install mongodb-org-shell -y
echo -e "\e[33m >>>>>>>>>>>>dns added to the schema<<<<<<<<<<<<<< \e[0m"
mongo --host </app/schema/user.js