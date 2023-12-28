# Подготовка к выполнению

Sonar 

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/b8064ec1-803d-4668-ad80-408d04c84039)

Nexus

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/065c7423-79a2-4218-9ffc-4394bf462770)

Знакомоство с SonarQube
---
Создайте новый проект, название произвольное

Исходник проекта на management хосте в каталоге  /root/ans/netologi/ans/09-ci-03-cicd/example/
Генерю токен
![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/a5b8f233-26d1-4c23-9675-8b24b70597bd)

На management-хосте скачиваем и устанавливаем пакет sonar-scanner, который нам предлагает скачать сам sonarqube по ссылке

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/bd13fe09-6fe9-43ee-8d25-518891cf81d3)


      root@vn-VirtualBox:~/ans/netologi/ans/09-ci-03-cicd# wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.7.0.2747-linux.zip
      --2023-12-28 10:36:13--  https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.7.0.2747-linux.zip
      Resolving binaries.sonarsource.com (binaries.sonarsource.com)... 108.156.22.35, 108.156.22.103, 108.156.22.43, ...
      Connecting to binaries.sonarsource.com (binaries.sonarsource.com)|108.156.22.35|:443... connected.
      HTTP request sent, awaiting response... 200 OK
      Length: 43162003 (41M) [application/zip]
      Saving to: ‘sonar-scanner-cli-4.7.0.2747-linux.zip’
      
      sonar-scanner-cli-4.7.0.2747-linux.zip  100%[==============================================================================>]  41,16M   941KB/s    in 41s

      2023-12-28 10:36:54 (1,01 MB/s) - ‘sonar-scanner-cli-4.7.0.2747-linux.zip’ saved [43162003/43162003]

В корневом каталоге проекта создаём файл sonar-project.properties со следующим содержимым. Вносим в файл свойств проекта имя проекта и его уникальный токен.
![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/22097217-5d77-4beb-a6ef-58a4d4fb71f1)

Делаем так, чтобы binary был доступен через вызов в shell. Для этого меняем переменную PATH.
     
      root@vn-VirtualBox:~/ans/netologi/ans/09-ci-03-cicd/sonar/sonar-scanner-4.7.0.2747-linux# export PATH=$PATH:~/ans/netologi/ans/09-ci-03-cicd/sonar/sonar-scanner-4.7.0.2747-linux/bin

Редактируем настройки сканера, указывая на удаленный хост с сервером SONAR-QUBE в облаке YC.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/2bf3a094-7d91-4e6e-9ccc-a9f5c6e90e6b)

Проверяем работу сканера. Обязательно переходим в корень проекта и запускаем sonar-scanner --version

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/b185f5e2-d776-4f7f-8c33-96460e52306f)

Запускаем анализатор против кода из директории example с дополнительным ключом -Dsonar.coverage.exclusions=fail.py
Результат в интерфейсе - файл fail.py проигнорирован

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/711753ac-602d-460a-baba-26691dd3941f)

Запускаем без ключа и затем исправляем ошибки, которые он выявил(включая warnings).

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/146a6bcb-3856-4764-ba6d-a24aa8b1fc3d)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/19ae62d7-6a60-4186-8f4f-1d44673fb3a1)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/f852a150-685a-4ce6-9e0e-8f423a9f5722)

-- Отключаем опцию SCM

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/2d59b898-a393-4764-95dc-e54c437e669c)

Указываем явно тестируемые версии Python в файле /opt/sonar-scanner/conf/sonar-scanner.properties

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/5e117739-e060-412b-aa1c-73840bdd3232)


![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/6395cfa8-67a3-40ab-a599-23968421c6a9)

















