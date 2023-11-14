Описание работы Playbook
----
playbook устанавливает clichouse и vector на две виртуальные машины Centos7 docker, собранные с помощью docker-compose файла, запускает службу clichouse-server и vector, а также создает базу logs в clichouse

---

В каталоге group_vars задаются необходимые версии дистрибутивов 
- vector_version - версия vector
- clickhouse_version - версия clickhous

### Install Clickhouse

Качаются пакеты, устанвливается Clickhouse

### Install vector

Скачиваются пакеты, устанавливается vector. 
происходит запуск служб

Для запуска playbook необходимо:

- запустить из docker-compose.yml файла две виртуальные машины

      docker-compose up
  
- запустить ansible-playbook

        ansible-playbook -i inventory/prod.yml site.yml
