#!/bin/bash
cd /etc/systemd/system/
touch puma-server.service
echo "[Unit]" >> puma-server.service
echo "Description=start reddit-app" >> puma-server.service
echo "" >> puma-server.service
echo "[Service]" >> puma-server.service
echo "ExecStart=/usr/local/bin/puma-server" >> puma-server.service
echo "Type=forking" >> puma-server.service
echo "" >> puma-server.service
echo "[Install]" >> puma-server.service
echo "WantedBy=multi-user.target" >> puma-server.service
cd /usr/local/bin/
touch puma-server
echo "#!/bin/bash" >> puma-server
echo "cd /home/appuser/reddit" >> puma-server
echo "puma -d" >> puma-server
chmod +x /usr/local/bin/puma-server
systemctl daemon-reload
systemctl enable puma-server
systemctl start puma-server
