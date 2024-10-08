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

![изображение](https://github.com/user-attachments/assets/335acc57-51ef-444a-93bc-4d242d80314f)

![изображение](https://github.com/user-attachments/assets/8e4a44c9-2d25-4198-ba59-311e80719e75)

![изображение](https://github.com/user-attachments/assets/0020fa39-081a-48dd-a451-c2293d1196e6)


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

![изображение](https://github.com/user-attachments/assets/95156190-67f4-470c-9fc9-12f5ff8f4951)


Запустил контейнер

![изображение](https://github.com/user-attachments/assets/1008069d-dccb-43ed-8521-67a3320a9fbf)

![изображение](https://github.com/user-attachments/assets/b092a74c-bc67-462b-b89e-42a36c05e3cc)


Запушил в Dockerhub

![изображение](https://github.com/user-attachments/assets/58c1eb12-549a-4a71-aca5-e02e73b0c696)

![изображение](https://github.com/user-attachments/assets/f9387b08-18d7-41de-b16d-9075de55890f)

## Подготовка cистемы мониторинга и деплой приложения

Развернем систему мониторинга с помощью Kube-Prometheus

Клонируем на мастер репозиторий

      git clone https://github.com/prometheus-operator/kube-prometheus.git

sudo kubectl apply --server-side -f manifests/setup
sudo kubectl apply -f manifests/

![изображение](https://github.com/user-attachments/assets/5c9d9a1e-c68d-4066-8a85-823272059049)

![изображение](https://github.com/user-attachments/assets/083d1e3e-2238-432f-8389-fb9d49a926b8)

Сетевая политика применена

![изображение](https://github.com/user-attachments/assets/d192f3bd-e19a-4cd6-b3f3-932f6317ea68)

Можно зайти в Grafana можно по любому из адресов node1, node2, master

![изображение](https://github.com/user-attachments/assets/241eb2ec-dde9-452f-be99-bd51414e0e0e)

Далее [задиплоем](https://github.com/Vadim-Nazarov/netologi/blob/main/diplom/app/depl_nginx.yml) наше приложение в кластере Kubernetes

![изображение](https://github.com/user-attachments/assets/3cf49770-33d9-4c1f-855e-60bd3c18e501)

при переходе по любому адресу нод видим состояние, порт задан в диплойменте

http://158.160.18.237:30080/

http://89.169.134.37:30080/

http://84.252.133.28:30080/

![изображение](https://github.com/user-attachments/assets/27426d9f-65cf-49f4-9c86-499cf847a49b)






















