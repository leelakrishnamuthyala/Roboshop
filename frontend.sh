echo -e "\e[31m >>>>>>>>Install Nginx<<<<<<<< \e[0m"
yum install nginx -y
echo -e "\e[31m >>>>>>>>Enable Nginx Service<<<<<<<< \e[0m"
systemctl enable nginx
echo -e "\e[31m >>>>>>>>Start Nginx Service<<<<<<<< \e[0m"
systemctl start nginx
echo -e "\e[31m >>>>>>>>remove Nginx configuration<<<<<<<< \e[0m"
rm -rf /usr/share/nginx/html/*
echo -e "\e[31m >>>>>>>>download the frontend app<<<<<<<< \e[0m"
cd
curl -o /tmp/frontend.zip https://roboshop.artifacts.s3.amazon.com/frontend.zip
echo -e "\e[31m >>>>>>>>nginx path <<<<<<<< \e[0m"
cd /usr/share/nginx/html
echo -e "\e[31m >>>>>>>>unzip the frontend<<<<<<<< \e[0m"
unzip /tmp/frontend.zip
echo -e "\e[31m >>>>>>>>copy configuration file<<<<<<<< \e[0m"
cp roboshop.config /etc/nginx/default.d/roboshop.conf
echo -e "\e[31m >>>>>>>>Restart Nginx services<<<<<<<< \e[0m"
systemctl restart nginx