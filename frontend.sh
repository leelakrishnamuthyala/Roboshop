yum install nginx -y
systemctl enable nginx
systemctl start nginx
rm -rf /usr/share/nginx/html/*
curl -o /tmp/frontend.zip https://roboshop.artifacts.s3.amazon.com/frontend.zip
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

cp roboshop.config /etc/nginx/default.d/roboshop.conf

systemctl restart nginx