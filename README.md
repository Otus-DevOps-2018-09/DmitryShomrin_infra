# DmitryShomrin_infra
DmitryShomrin Infra repository
***
Подключение к `bastion` и `someinternalhost`: 
```
bastion_IP = 35.241.145.116
someinternalhost_IP = 10.132.0.3
```
Подключение в одну команду:
```
ssh -o ProxyCommand="ssh NetEng@35.241.145.116 nc %h %p" NetEng@10.132.0.3
```

Для подключения командой `ssh someinternalhost` в файл `.ssh/config` нужно добавить:
```
Host someiternalhost
hostname 10.132.0.3
port 22
user NetEng
ProxyCommand ssh NetEng@35.241.145.116 nc %h %p
```

***
Homework #4
Тестовое приложение:
```
testapp_IP = 35.240.4.85
testapp_port = 9292
```
Дополнительное задание:
Создание инстанса с запуском стартап скрипта
```
gcloud compute instances create reddit-app \
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --zone=europe-west1-d \
  --metadata-from-file=startup-script=./startup_script.sh
```
Создание правила из консоли с помощью gcloud:
```
gcloud compute firewall-rules create default-puma-server \
  --allow tcp:9292 \
  --source-ranges 0.0.0.0/0 \
  --target-tags puma-server
```
***
Homework #5
Рассмотрены 2 подхода: Fry и Bake
ubuntu16.json - Fry
immutable.json - Bake
