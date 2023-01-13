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

![изображение](https://user-images.githubusercontent.com/107613708/212318641-0e6717c1-236e-4da8-b9bd-8e46e9ae8968.png)

![изображение](https://user-images.githubusercontent.com/107613708/212318695-29ee1b77-0e1f-4da1-ba93-912d965e3f81.png)

![изображение](https://user-images.githubusercontent.com/107613708/212318751-60412f52-8f58-4195-b745-78e81ab6d04e.png)






