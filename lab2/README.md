# Лабораторная работа 2

**Название:** "Разработка драйверов блочных устройств"

**Цель работы:** 

получить знания и навыки разработки драйверов блочных устройств для операционной системы Linux. 

## Описание функциональности драйвера

Драйвер создаёт виртуальный жесткий диск в оперативной  памяти с размером 50 Мбайт. 
Созданный диск должен быть разбит на три первичных раздела с размерами 10Мбайт, 25Мбайт и  15Мбайт.

## Инструкция по сборке
**требуемая версия ядра:** 4.15

Выполнить
```bash
sudo apt install build-essential linux-headers-`uname -r`
make
```

## Инструкция пользователя

для загрузки модуля выпонлить 
```bash
make load
```

для выгрузки модуля 
```bash
make unload
```
проверить, что драйвер загрузился без ошибок командой 
```bash
dmesg
```
## Примеры использования
Выполнить команду `fdisk -l`

Ожидаемый результат
Device      Boot Start    End Sectors Size Id Type
/dev/lab2p1       2048  22527   20480  10M 83 Linux
/dev/lab2p2      22528  73727   51200  25M 83 Linux
/dev/lab2p3      70144 100863   30720  15M 83 Linux


mkfs.fat 4.1 (2017-01-24)
mkfs.fat 4.1 (2017-01-24)
mkfs.fat 4.1 (2017-01-24)
mkdir: cannot create directory ‘/mnt/disk1’: File exists
mkdir: cannot create directory ‘/mnt/disk2’: File exists
mkdir: cannot create directory ‘/mnt/disk3’: File exists
5+0 records in
5+0 records out
5242880 bytes (5.2 MB, 5.0 MiB) copied, 0.346236 s, 15.1 MB/s
5+0 records in
5+0 records out
5242880 bytes (5.2 MB, 5.0 MiB) copied, 0.323299 s, 16.2 MB/s
5+0 records in
5+0 records out
5242880 bytes (5.2 MB, 5.0 MiB) copied, 0.248044 s, 21.1 MB/s
Copying files within virtual disk
5.00MiB 0:00:00 [ 666MiB/s] [================================>] 100%            
5.00MiB 0:00:00 [ 253MiB/s] [================================>] 100%            
5.00MiB 0:00:00 [ 276MiB/s] [================================>] 100%            
5+0 records in
5+0 records out
5242880 bytes (5.2 MB, 5.0 MiB) copied, 0.277405 s, 18.9 MB/s
5+0 records in
5+0 records out
5242880 bytes (5.2 MB, 5.0 MiB) copied, 0.234923 s, 22.3 MB/s
5+0 records in
5+0 records out
5242880 bytes (5.2 MB, 5.0 MiB) copied, 0.267828 s, 19.6 MB/s
Copying files from virtual file to real disk
mkdir: cannot create directory ‘/tmp/io’: File exists
5.00MiB 0:00:00 [1.44GiB/s] [================================>] 100%            
5.00MiB 0:00:00 [ 490MiB/s] [================================>] 100%            
5.00MiB 0:00:00 [ 505MiB/s] [================================>] 100%
