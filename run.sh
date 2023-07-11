sudo apt-get update
sudo apt-get install python3 python3-pip
pip install flask gunicorn
sudo apt-get install nginx

# TEST FLASK
flask run

# TEST GUNICORN
gunicorn -w 4 app:app

# ADD NGINX CONF FILE
sudo cp ~/storqm.conf /etc/nginx/sites-available/storqm.conf

# ADD CONF FILE TO THE ENABLED SITES LIST
sudo ln -s /etc/nginx/sites-available/storqm.conf /etc/nginx/sites-enabled

# TEST NGINX
sudo nginx -t

# RESTART NGINX
sudo systemctl restart nginx

# ADD NGINX SERVICE
sudo cp ~/storqm.service /etc/systemd/system/storqm.service

# START APP
sudo systemctl start storqm
sudo systemctl enable storqm