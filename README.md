# Запуск программы
Для того, чтобы начать пользоваться сайтом на локальном компьютере, необходимо на Linux проделать следующие действия:
1. Включить VPN
2. git clone https://github.com/Dashkere404/Moviemap_back.git
3. cd Moviemap_back
4. chmod +x deploy.sh
5. ./deploy.sh
6. В другом терминале:
7. cd Moviemap_front_result
8. npm run dev
9. Переходите по ссылке, которая появляется в этом терминале
10. По ссылке будет доступен сайт, по команде Fn+F12 доступны логи действий пользователя на сайте
## Возможная проблема:
![image](https://github.com/user-attachments/assets/d42628d5-1c52-492f-bb44-8cdf682da57a)
## Решение:
Напишите в терминале: 
python3 -m venv venv
source venv/bin/activate
Этот скрипт создаст виртуальное окружение, позволяющее установить все зависимости
## Возможная проблема:
![image](https://github.com/user-attachments/assets/6663b2d3-f23b-4144-bddb-290d699b994e)
## Решение:
Напишите в терминале:
sudo apt update
sudo apt install -y nodejs npm
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
source ~/.bashrc 
## Возможная проблема:
![image](https://github.com/user-attachments/assets/ec6958df-73b1-491f-8d7a-3ced8d74d5b6)
## Решение:
Напишите в терминале:
npm install -g vite
Если же не помогло, то напишите:
npm install vite --save-dev


