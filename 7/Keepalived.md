# Задание
Разверните топологию из лекции и выполните установку и настройку сервиса Keepalived.


---

vrrp_instance test {

state "name_mode"

interface "name_interface"

virtual_router_id "number id"

priority "number priority"

advert_int "number advert"

authentication {

auth_type "auth type"

auth_pass "password"

}

unicast_peer {

"ip address host"

}

virtual_ipaddress {

"ip address host" dev "interface" label "interface":vip

}

}

---

# Ответ

![изображение](https://user-images.githubusercontent.com/107613708/226870875-13ceaeee-de64-4f01-942d-166a8a9022e5.png)

![изображение](https://user-images.githubusercontent.com/107613708/226870927-aea04878-75a1-45be-8ccb-02cc5c337779.png)






