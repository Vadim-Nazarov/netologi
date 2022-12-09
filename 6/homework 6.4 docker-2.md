# Задание 1.

Docker Compose — это инструментальное средство, входящее в состав Docker. Оно разработано для помощи в определении и совместном использовании многоконтейнерных приложений. С помощью Docker Compose можно создать 1 YAML-файл для определения служб и с помощью одной команды запустить и остановить все, что нужно при развертывании многоконтейнерных приложений.

![изображение](https://user-images.githubusercontent.com/107613708/206642358-e8ef57f8-d582-4c99-9568-4389a3f1c6a4.png)

# Задание 2.
![изображение](https://user-images.githubusercontent.com/107613708/206644328-9c705936-ad77-462d-ae35-83ff7dfd3dcf.png)

# Задание 3.
![изображение](https://user-images.githubusercontent.com/107613708/206650552-be081d60-2de2-433c-9e46-95ec24442806.png)

# Задание 4.
![изображение](https://user-images.githubusercontent.com/107613708/206654121-7fc1837d-dc13-487c-b8d6-703e38ed8b08.png)

![изображение](https://user-images.githubusercontent.com/107613708/206654272-7554df55-e070-46fc-a824-4fc895ca3a12.png)

# Задание 5.
![изображение](https://user-images.githubusercontent.com/107613708/206661430-356ed019-6cc1-4e2f-9387-53a3398f0e86.png)

# Задание 6.
![изображение](https://user-images.githubusercontent.com/107613708/206668144-63792b90-3f81-40ab-914c-89849c9e0033.png)

# Задание 7.
![изображение](https://user-images.githubusercontent.com/107613708/206669330-98d3f8e1-0bdc-4c60-937e-1fa845b5b4ee.png)

    version: '3'
    services:
      nazarovvd-netology-db:
        image: postgres:latest # Образ, который мы будем использовать
        container_name: nazarovvd-netology-db # Имя, которым будет называться наш контейнер
        ports: # Порты, которые мы пробрасываем с нашего докер сервера внутрь контейнера
          - 5432:5432
        volumes: # Папка, которую мы пробросим с докер сервера внутрь контейнера
          - ./pg_data:/var/lib/postgresql/data/pgdata
        environment: # Переменные среды
          POSTGRES_PASSWORD: nazarovvd12!3!! # Задаём пароль от пользователя postgres
          POSTGRES_DB: nazarovvd_db # БД которая сразу же будет создана
         PGDATA: /var/lib/postgresql/data/pgdata # Путь внутри контейнера, где будет папка pgdata
        networks:
          nazarovvd-my-netology-hw:
           ipv4_address: 172.22.0.2
        restart: always
    
      pgadmin:
        links: - nazarovvd-netology-db
        image: dpage/pgadmin4
        container_name: nazarovvd-pgadmin
        environment:
          PGADMIN_DEFAULT_EMAIL: nazarovvd@mail.me
          PGADMIN_DEFAULT_PASSWORD: nazarovvd12!3!!
        ports:
          - 61231:80
        networks:
          nazarovvd-my-netology-hw:
            ipv4_address: 172.22.0.3
        restart: always
    
     zabbix-server:
       image: zabbix/zabbix-server-pgsql
        links:
         - nazarovvd-netology-db
         - pdadmin
       container_name: nazarovvd-zabbix-netology
       environment:
          DB_SERVER_HOST: '172.22.0.2'
          POSTGRES_USER: postgres
          POSTGRES_PASSWORD: nazarovvd12!3!!
        ports:
          - 10051:10051
        networks:
          nazarovvd-my-netology-hw:
           ipv4_address: 172.22.0.4
        restart: always
      
     zabbix_wgui:
        image: zabbix/zabbix-web-apache-pgsql
       links:
          - nazarovvd-netology-db
          - zabbix-server
          - pgadmin
       container_name: nazarovvd-netology_zabbix_frontend
       environment:
          DB_SERVER_HOST: '172.22.0.2'
          POSTGRES_USER: 'postgres'
          POSTGRES_PASSWORD: nazarovvd12!3!!
          ZBX_SERVER_HOST: "zabbix_wgui"
          PHP_TZ: "Europe/Moscow"
       ports:
          - "80:8080"
          - "443:8443"
        networks:
         nazarovvd-my-netology-hw:
           ipv4_address: 172.22.0.5
       restart: always
    
    networks:
      nazarovvd-my-netology-hw:
       driver: bridge
        ipam:
         config:
         - subnet: 172.22.0.0/24

![изображение](https://user-images.githubusercontent.com/107613708/206680918-40a8fe6d-3aed-49ad-b80c-2c17cef5a864.png)



# Задание 8.

![изображение](https://user-images.githubusercontent.com/107613708/206682138-3a2498f6-270c-4756-b60a-d8a21591cbaf.png)

