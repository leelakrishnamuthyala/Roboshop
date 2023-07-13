echo -e "/e[32m >>>>>>>>>>>>>>Download nodejs RPM<<<<<<<<<<<<<< /e[0m "
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo -e "/e[32m >>>>>>>>>>>>>>Install nodejs<<<<<<<<<<<<<< /e[0m "
yum install nodejs -y
echo -e "/e[32m >>>>>>>>>>>>>>Add user to project <<<<<<<<<<<<<< /e[0m "
useradd roboshop
echo -e "/e[32m >>>>>>>>>>>>>>Create project Directory <<<<<<<<<<<<<< /e[0m "
rm -rf app
mkdir /app
echo -e "/e[32m >>>>>>>>>>>>>>Download the project path <<<<<<<<<<<<<< /e[0m "
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app
echo -e "/e[32m >>>>>>>>>>>>>>Unzip the project <<<<<<<<<<<<<< /e[0m "
unzip /tmp/catalogue.zip
cd /app
echo -e "/e[32m >>>>>>>>>>>>>>Install the project <<<<<<<<<<<<<< /e[0m "
npm install
echo -e "/e[32m >>>>>>>>>>>>>>Copy the Service <<<<<<<<<<<<<< /e[0m "
cd
cp /home/centos/Roboshop/catalogue.service /etc/systemd/system/catlogue.service
echo -e "/e[32m >>>>>>>>>>>>>>load the services <<<<<<<<<<<<<< /e[0m "
systemctl daemon-reload
echo -e "/e[32m >>>>>>>>>>>>>>Start the Service <<<<<<<<<<<<<< /e[0m "
systemctl start catalogue
echo -e "/e[32m >>>>>>>>>>>>>>create the repo file <<<<<<<<<<<<<< /e[0m "
cp /home/centos/Roboshop/mongo.repo /etc/yum.repos.d/mongo.repo
echo -e "/e[32m >>>>>>>>>>>>>>Install mongodb <<<<<<<<<<<<<< /e[0m "
yum install mongodb-org-shell -y
echo -e "/e[32m >>>>>>>>>>>>>>Add the schema <<<<<<<<<<<<<< /e[0m "
mongo --host 172.31.85.30 </app/schema/catalogue.js