# Задание 1

![изображение](https://user-images.githubusercontent.com/107613708/211808320-984ed101-a6bf-4cce-8ca9-c816e05a0856.png)

![изображение](https://user-images.githubusercontent.com/107613708/211808658-121098f8-229d-459d-a7b8-54bc3acae484.png)

![изображение](https://user-images.githubusercontent.com/107613708/211808795-00b93b4f-e145-43d0-8411-ba7dfc8b9a5a.png)

Тест и билд выполнены двумя джобами из подсказки.

# Задание 2

![изображение](https://user-images.githubusercontent.com/107613708/211819879-c00de6cf-f238-4d88-a9b7-97cee705c661.png)

![изображение](https://user-images.githubusercontent.com/107613708/211819949-7fa9ec49-46d5-45a5-8458-931544344619.png)

        pipeline {
            agent any
            stages {
                stage('Git') {
                    steps {git 'https://github.com/Vadim-Nazarov/git83.git'}
                }    
                stage('Build') {
                   steps {
                      sh 'docker build  .'
                  }
               }
           }
        }

# Задание 3

![изображение](https://user-images.githubusercontent.com/107613708/212040354-d8fa7fa0-d21c-444d-985c-b663c9145ec8.png)

Получилось запустить докер контейнер, но почему то по 8081 порту на сайт вебку не заходит, не пойму в чем причина(


