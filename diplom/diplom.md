## Цели:

1. Подготовить облачную инфраструктуру на базе облачного провайдера Яндекс.Облако.
2. Запустить и сконфигурировать Kubernetes кластер.
3. Установить и настроить систему мониторинга.
4. Настроить и автоматизировать сборку тестового приложения с использованием Docker-контейнеров.
5. Настроить CI для автоматической сборки и тестирования.
6. Настроить CD для автоматического развёртывания приложения.

---
## Этапы выполнения:


### Создание облачной инфраструктуры

Для начала необходимо подготовить облачную инфраструктуру в ЯО при помощи [Terraform](https://www.terraform.io/).

Особенности выполнения:

- Бюджет купона ограничен, что следует иметь в виду при проектировании инфраструктуры и использовании ресурсов;
Для облачного k8s используйте региональный мастер(неотказоустойчивый). Для self-hosted k8s минимизируйте ресурсы ВМ и долю ЦПУ. В обоих вариантах используйте прерываемые ВМ для worker nodes.

Предварительная подготовка к установке и запуску Kubernetes кластера.

1. Создайте сервисный аккаунт, который будет в дальнейшем использоваться Terraform для работы с инфраструктурой с необходимыми и достаточными правами. Не стоит использовать права суперпользователя
2. Подготовьте [backend](https://www.terraform.io/docs/language/settings/backends/index.html) для Terraform:  
   а. Рекомендуемый вариант: S3 bucket в созданном ЯО аккаунте(создание бакета через TF)
   б. Альтернативный вариант:  [Terraform Cloud](https://app.terraform.io/)  
3. Создайте VPC с подсетями в разных зонах доступности.
4. Убедитесь, что теперь вы можете выполнить команды `terraform destroy` и `terraform apply` без дополнительных ручных действий.
5. В случае использования [Terraform Cloud](https://app.terraform.io/) в качестве [backend](https://www.terraform.io/docs/language/settings/backends/index.html) убедитесь, что применение изменений успешно проходит, используя web-интерфейс Terraform cloud.

Ожидаемые результаты:

1. Terraform сконфигурирован и создание инфраструктуры посредством Terraform возможно без дополнительных ручных действий.
2. Полученная конфигурация инфраструктуры является предварительной, поэтому в ходе дальнейшего выполнения задания возможны изменения.

# 1 ОТВЕТ Создание облачной инфраструктуры

Конфигурация Terraform 

![изображение](https://github.com/user-attachments/assets/45a401b8-40c9-4038-96fc-61f26b39202e)

результат terraform apply:

![изображение](https://github.com/user-attachments/assets/f42984e8-04a7-41f4-af2e-4ddff8f3ca38)

![изображение](https://github.com/user-attachments/assets/4ffabdc5-af99-4ed3-9516-d6d0e39af58d)

![изображение](https://github.com/user-attachments/assets/3f9aa714-6500-4e66-a17c-84745bed62e3)

![изображение](https://github.com/user-attachments/assets/8519dab6-b39a-4c17-a5a0-5196c20a531b)

### Создание Kubernetes кластера

На этом этапе необходимо создать [Kubernetes](https://kubernetes.io/ru/docs/concepts/overview/what-is-kubernetes/) кластер на базе предварительно созданной инфраструктуры.   Требуется обеспечить доступ к ресурсам из Интернета.

Это можно сделать двумя способами:

1. Рекомендуемый вариант: самостоятельная установка Kubernetes кластера.  
   а. При помощи Terraform подготовить как минимум 3 виртуальных машины Compute Cloud для создания Kubernetes-кластера. Тип виртуальной машины следует выбрать самостоятельно с учётом требовании к производительности и стоимости. Если в дальнейшем поймете, что необходимо сменить тип инстанса, используйте Terraform для внесения изменений.  
   б. Подготовить [ansible](https://www.ansible.com/) конфигурации, можно воспользоваться, например [Kubespray](https://kubernetes.io/docs/setup/production-environment/tools/kubespray/)  
   в. Задеплоить Kubernetes на подготовленные ранее инстансы, в случае нехватки каких-либо ресурсов вы всегда можете создать их при помощи Terraform.
2. Альтернативный вариант: воспользуйтесь сервисом [Yandex Managed Service for Kubernetes](https://cloud.yandex.ru/services/managed-kubernetes)  
  а. С помощью terraform resource для [kubernetes](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/kubernetes_cluster) создать **региональный** мастер kubernetes с размещением нод в разных 3 подсетях      
  б. С помощью terraform resource для [kubernetes node group](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/kubernetes_node_group)

# 2 ОТВЕТ Создание Kubernetes кластера

Для развертывания использую Kubespray по пути 1-б

Клоним репозиторий git clone https://github.com/kubernetes-sigs/kubespray.git

При создании облачной инфрасруктуры создали файл [hosts.yaml](https://github.com/Vadim-Nazarov/netologi/blob/main/diplom/ansible/inventory/hosts.yaml) для ansible плейбука

Выполняем запуск плейбука kubespray   

      root@admin1-VirtualBox:~/dip/kubespray# ansible-playbook -i /root/dip/ansible/inventory/hosts.yaml cluster.yml -b

Результат отработки плейбука

![изображение](https://github.com/user-attachments/assets/3cd8d743-be6d-43b5-9c46-13aade78d39a)

Проверяем на master

![изображение](https://github.com/user-attachments/assets/092c94d1-d4bd-4fe7-8040-0eca767c1fcc)

### Создание тестового приложения

Для перехода к следующему этапу необходимо подготовить тестовое приложение, эмулирующее основное приложение разрабатываемое вашей компанией.

Способ подготовки:

1. Рекомендуемый вариант:  
   а. Создайте отдельный git репозиторий с простым nginx конфигом, который будет отдавать статические данные.  
   б. Подготовьте Dockerfile для создания образа приложения.  
2. Альтернативный вариант:  
   а. Используйте любой другой код, главное, чтобы был самостоятельно создан Dockerfile.

Ожидаемый результат:

1. Git репозиторий с тестовым приложением и Dockerfile.
2. Регистри с собранным docker image. В качестве регистри может быть DockerHub или [Yandex Container Registry](https://cloud.yandex.ru/services/container-registry), созданный также с помощью terraform.

# 3 ОТВЕТ Создание тестового приложения

Создал [index.html](https://github.com/Vadim-Nazarov/netologi/blob/main/diplom/app/index.html) 

[Dockerfile](https://github.com/Vadim-Nazarov/netologi/blob/main/diplom/app/Dockerfile)

Собрал образ 

![изображение](https://github.com/user-attachments/assets/24a32442-32f5-44a7-9ae4-f17b18cb8fbc)

Запустил контейнер

![изображение](https://github.com/user-attachments/assets/3d6d3124-9cd0-4374-9207-d09128104b7f)

![изображение](https://github.com/user-attachments/assets/14bbe8ab-ac0d-46d9-a88a-1c6aa2780963)

![изображение](https://github.com/user-attachments/assets/e58b7a97-810a-4ba2-9bff-5cecfbfbd054)

Запушил в Dockerhub

![изображение](https://github.com/user-attachments/assets/b1bb0285-0fb1-466e-b074-9276a94511d0)

![изображение](https://github.com/user-attachments/assets/da610b30-4c97-45e2-a9c7-41347ee0b787)











