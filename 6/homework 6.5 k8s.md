# Задание 1.
![изображение](https://user-images.githubusercontent.com/107613708/208246675-09a8f8aa-f420-4ada-a9f6-3d50953d4b24.png)

# Задание 2.
![изображение](https://user-images.githubusercontent.com/107613708/208246965-9305d77b-5c95-4e74-99bc-15db1fa1bb2b.png)

![изображение](https://user-images.githubusercontent.com/107613708/208246995-2d936990-6845-4943-8ef7-deee60c2171c.png)

![изображение](https://user-images.githubusercontent.com/107613708/208247435-3caca425-f102-4b58-85e1-337c77c21f63.png)

# Задание 3.
kubectl exec -it redis-9f87ddf8b-hzxtq -- ps aux

kubectl logs --since=5m redis-9f87ddf8b-hzxtq

kubectl delete -f redis.yaml && sudo kubectl delete -f srv.yaml

kubectl port-forward pod/redis-9f87ddf8b-hzxtq 54321:6379



---------------------------------------------------------


### Задание 1.

Запустите кубернетес локально, используя k3s или minikube на свой выбор.
Добейтесь стабильной работы всех системных контейнеров.

*В качестве ответа пришлите скриншот результата выполнения команды kubectl get po -n kube-system*

------
### Задание 2.


Есть файл с деплоем:

```
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: redis
spec:
  selector:
    matchLabels:
      app: redis
  replicas: 1
  template:
    metadata:
      labels:
        app: redis
    spec:
      containers:
      - name: master
        image: bitnami/redis
        env:
         - name: REDIS_PASSWORD
           value: password123
        ports:
        - containerPort: 6379
```

------

Измените файл так, чтобы:

- redis запускался без пароля;
- создайте Service, который будет направлять трафик на этот Deployment;
- версия образа redis была зафиксирована на 6.0.13.

Запустите Deployment в своем кластере и добейтесь его стабильной работы.

  *Приведите ответ в виде получившегося файла.*

------
### Задание 3.
Напишите команды kubectl для контейнера из предыдущего задания:
- выполнения команды ps aux внутри контейнера;
- просмотра логов контейнера за последние 5 минут;
- удаления контейнера;
- проброса порта локальной машины в контейнер для отладки.
