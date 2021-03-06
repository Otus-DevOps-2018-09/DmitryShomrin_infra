[![Build Status](https://travis-ci.com/Otus-DevOps-2018-09/DmitryShomrin_infra.svg?branch=master)](https://travis-ci.com/Otus-DevOps-2018-09/DmitryShomrin_infra)
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
***
Homework #6
Terraform-1
При добавлении web_user вручную терраформ не знает об изменениях и при повторном apply удалит пользователя, созданного вручную. Если ключ уже есть и выполняется terraform apply, то terraform выдаст ошибку.

lb.tf создает балансировщик нагрузки, при отключении одного инстанса доступ к приложению не прерывается.

***
Homework #7
Terraform-2
Выполнено:
 - определил ресурс файервола
 - импортировал существующую инфраструктуру в terraform
 - разобрался с зависимостями ресурсов
 - разбил ресурс на две ВМ: приложение и базу данных
 - разбил конфигурацию на модули


Задание со *
Настроил хранение стейтов в бакетах
Задание со *
Использовал provisioner в модулях db и app для деплоя приложения

***
Homework #8
Ansible-1
Выполнено:
 - Установил Ansible
 - Созданы файлы inventory и inventory.yml
 - заданы настройки в ansible.cfg
 - Написан и запущен playbook для копирования файлов с удаленного репозитория

 При первом запуске playbook'а ansible не сделал никаких изменения т.к. файлы уже были загружены раньше.
 При повторном запуске playbook выполнился и скачал файлы из репозитория.

 ***
 Homework #9
 Ansible-2
 Выполнено:
  - Обновил файл .gitignore
  - Написал playbook с одним task, запуская этапы с помощью тэгов или --limit
  - Написал playbook с несколькими task
  - Разбил один playbook на три: app.yml, db.yml, deploy.yml
  - Изменил provisioners в packer и пересобрал образы

  ***
  Homework #10
  Ansible-3
  Выполнено:
   - Написаны роли для развертывания приложения и бд
   - Использована роль из Ansible galaxy
   - Настроено проксирование http трафика к приложению
   - Добавлены пользователи с помощью playbook'а
   - Зашифрованы файлы с паролями и именами пользователей

   Задание со **
   - packer validate для всех шаблонов
   - terraform validate и tflint для окружений stage и prod
   - ansible-lint для плейбуков Ansible
   - в README.md добавлен бейдж с статусом билда

  ***
  Homework #11
  Ansible-4
  Выполнено:
   - Установлен VirtualBox и Vagrant
   - Написан Vagrantfile
   - Развернуто локальное окружение
   - При помощи Molecule протестирована роль db
   - Переделаны packer_app.yml и packer_db.yml под запуск ролей app и db
  
  Задание со *:
   - Настроено проксирование приложения с помощью nginx
