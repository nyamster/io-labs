# Лабораторная работа 3

**Название:** "Разработка драйверов сетевых устройств"

**Цель работы:** получить знания и навыки разработки драйверов сетевых интерфейсов для операционной системы Linux

## Описание функциональности драйвера

* Драйвер создает виртуальный сетевой интерфейс в ОС Linux.

* Созданный сетевой интерфейс перехватывает пакеты родительского интерфейса.

* Имеется возможность просмотра статистики работы созданного интерфейса.

### Трафик, подлежащий перехату:

* Пакеты протокола UDP, содержащие конкретные данные (строку). Вывести строку.
 
* Содержимое строки определяется исполнителями.

* Состояние разбора пакетов выводится в файл в директории /proc

## Инструкция по сборке

1. make

2. insmod lab3.ko

## Инструкция пользователя

**Проверить наличие интерфейса:**

$ ifconfig

**Проверить сообщения в файле-интерфейсе:**

$ cat /proc/var4


## Примеры использования

$echo "hello" | nc -u 224.0.0.251 2222

dmesg
