# DmitryShomrin_infra
DmitryShomrin Infra repository

Подключение к bastion: 35.241.145.116
someinternalhost: 10.132.0.3

Подключение в одну команду:
ssh -o ProxyCommand="ssh NetEng@35.241.145.116 nc %h %p" NetEng@10.132.0.3

Для подключения командой "ssh someinternalhost" в файл .ssh/config нужно добавить:
Host someiternalhost
hostname 10.132.0.3
port 22
user NetEng
ProxyCommand ssh Radio@35.207.138.155 nc %h %p