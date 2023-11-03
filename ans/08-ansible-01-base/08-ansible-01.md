[Домашнее задание](https://github.com/netology-code/mnt-homeworks/tree/MNT-video/08-ansible-01-base)

Ответ 
1. Попробуйте запустить playbook на окружении из test.yml, зафиксируйте значение, которое имеет факт some_fact для указанного хоста при выполнении playbook.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/bfc5d1b4-3295-446c-ae6e-2b200e4f49e2)

some_fact=12

2. Найдите файл с переменными (group_vars), в котором задаётся найденное в первом пункте значение, и поменяйте его на all default fact.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/33195cb1-bd28-45df-a4a6-0dfdca00d7e5)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/42cf6a99-5117-488a-aa0f-3f532add6671)

3. Воспользуйтесь подготовленным (используется docker) или создайте собственное окружение для проведения дальнейших испытаний.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/f8e0cf0b-131c-4618-bb85-b03307c18440)

4. Проведите запуск playbook на окружении из prod.yml. Зафиксируйте полученные значения some_fact для каждого из managed host.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/efc3f4e2-c228-4f87-99f4-ce597d2f0d40)

5. Добавьте факты в group_vars каждой из групп хостов так, чтобы для some_fact получились значения: для deb — deb default fact, для el — el default fact.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/2d3001da-8cd3-4f3a-b210-8fc39cb8195b)

6. Повторите запуск playbook на окружении prod.yml. Убедитесь, что выдаются корректные значения для всех хостов.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/498fe451-cb23-4f5b-b1a2-e1720533e2ec)

7. При помощи ansible-vault зашифруйте факты в group_vars/deb и group_vars/el с паролем netology.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/28fc9526-848c-4a45-8bf3-1605b42e88e1)

8. Запустите playbook на окружении prod.yml. При запуске ansible должен запросить у вас пароль. Убедитесь в работоспособности.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/f6f2e37c-1327-412f-beb4-fadfdde12374)

9. Посмотрите при помощи ansible-doc список плагинов для подключения. Выберите подходящий для работы на control node.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/128373b5-561d-4066-9137-a08fb46f16b9)

10. В prod.yml добавьте новую группу хостов с именем local, в ней разместите localhost с необходимым типом подключения.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/4dfd0a28-120c-4232-a180-c7deb45cc5ca)

11. Запустите playbook на окружении prod.yml. При запуске ansible должен запросить у вас пароль. Убедитесь, что факты some_fact для каждого из хостов определены из верных group_vars.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/8c782180-2e16-4890-a2e9-e4056211fe3b)




   


 


