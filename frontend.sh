echo -e "/e[31m >>>>>>install nginx<<<<<<<<< \e[0m"
yum install nginx -y
echo -e "/e[31m >>>>>>enable service <<<<<<<<< \e[0m"
systemctl enable nginx
echo -e "/e[31m >>>>>>start service<<<<<<<<< \e[0m"
systemctl start nginx
echo -e "/e[31m >>>>>>remove the files<<<<<<<<< \e[0m"
rm -rf /usr/share/nginx/html/*
echo -e "/e[31m >>>>>>download the files<<<<<<<<< \e[0m"
curl -o /tmp/frontend.zip https://roboshop.artifacts.s3.amazon.com/frontend.zip
echo -e "/e[31m >>>>>>enter the path<<<<<<<<< \e[0m"
cd
cd /usr/share/nginx/html
echo -e "/e[31m >>>>>>unzip the frontend<<<<<<<<< \e[0m"
unzip /tmp/frontend.zip
echo -e "/e[31m >>>>>>roboshop conf<<<<<<<<< \e[0m"
cp roboshop.config /etc/nginx/default.d/roboshop.conf
echo -e "/e[31m >>>>>>restart service<<<<<<<<< \e[0m"
systemctl restart nginx