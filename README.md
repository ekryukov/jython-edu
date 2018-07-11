# Jython

## Все примеры и саму статью можно найти в репозитарии https://github.com/ekryukov/jython-edu
```bash
git clone https://github.com/ekryukov/jython-edu.git
```

## Определение

Jython - реализация Python на Java. Одновременно является и компилятором
и интерпретатором.
Проект уже достаточно зрелый - первый выпуск вышел еще в 2001 году.

Текущая версия на оффсайте - 2.7.0 (что по синтаксису соответствует Python2.7),
в репозитариях maven можно найти сборку 2.7.1

Основное использование Jython - запуск скриптов Python на машинах,
где изначально не было реализации Python/Cython (AIX, Solaris, HP-UX).

Для некоторых систем до сих пор доступна только коммерческая версия ActivePython.

Так как Jython может быть запущен с помощью всего одной библиотеки, этим
решается проблема совместимости скриптов на разных версиях Python.

Какие еще плюсы есть у Jython?

1. из-за использования Java VM в Jython нет GIL
2. Jython может использовать в импорте как нативные Python модули, так и Java библиотеки - это реальная киллер-фича Jython

Минусы:
1. Последняя версия Jython соответствует Python 2.7,  судьба реализации Python3 до недавнего времени была неясна, хотя в последнее время появились обнадеживающие подвижки в этом направлении. Желающие могут посмотреть репозитарий проекта - jython3 repository
2. Холодный старт скриптов на Jython (особенно,  если в проекте используются внешние библиотеки) занимает много времени.
3. В реализации Jython по понятным причинам отсутствуют модули, написанные на Си

## Установка
У Jython есть инсталлятор, после которого любой jython/python-скрипт  можно запускать командой jython имя_файла.py Также jython можно запускать, как java библиотеку (jython=standalone) и именно этот способ мы рассмотрим в статье.

Особенность двух вариантов установки - у полной версии есть pip, через который можно ставить остальные пакеты:

```python
  jython -m ensurepip
```

если использовать Jython в качестве отдельной библиотеки, то внешние модули придется скачать вручную.

Пример запуска скрипта с помощью библиотеки:
1. создадим папку проекта proj1 и папку для библиотек  lib

```bash
mkdir -p lib
```


2. скачаем в папку lib библиотеку jython:

```bash
 curl -o lib/jython.jar http://search.maven.org/remotecontent?filepath=org/python/jython-standalone/2.7.1/jython-standalone-2.7.1.jar
```

## Запуск

1. создадим простой проверочный скрипт main.py

```python
import os
print os.getlogin() # 2.7
```

2. Запустим наш скрипт с помощью такой строки запуска:

```bash
java ${JVM_ARGS} -cp lib/jython.jar -Dpython.cachedir.skip=false org.python.util.jython main.py "$@"
```

в JVM_ARGS можно прописать параметры для  Java - память и прочие лимиты (если скрипт простой - можно и не прописывать).

## Примеры использования

### Использование модулей Python
Как уже говорилось выше, скрипты Jython могут использовать сторонние пакеты
Python, кроме тех, которые написаны на Си.
Вы можете скачать нужные модули и использовать их также, как вы используете собственные модули.

#### Пример (папка 1-use-python в репозитарии)
Ниже пример использования модуля requests (c зависимостями).

Файл 1-use-pyhon/run.sh:
```bash
#!/usr/bin/env bash


curl -o requests.tar.gz https://files.pythonhosted.org/packages/54/1f/782a5734931ddf2e1494e4cd615a51ff98e1879cbe9eecbdfeaf09aa75e9/requests-2.19.1.tar.gz
tar xzvf requests.tar.gz
rm requests.tar.gz
mv requests-2.19.1/requests ./
rm -rf requests-2.19.1

curl -o urllib3.tar.gz https://files.pythonhosted.org/packages/3c/d2/dc5471622bd200db1cd9319e02e71bc655e9ea27b8e0ce65fc69de0dac15/urllib3-1.23.tar.gz
tar xzvf urllib3.tar.gz
rm urllib3.tar.gz
mv urllib3-1.23/urllib3 ./
rm -rf urllib3-1.23

curl -o chardet.tar.gz https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz
tar xzvf chardet.tar.gz
rm chardet.tar.gz
mv chardet-3.0.4/chardet ./
rm -rf chardet-3.0.4


curl -o certifi.tar.gz https://files.pythonhosted.org/packages/4d/9c/46e950a6f4d6b4be571ddcae21e7bc846fcbb88f1de3eff0f6dd0a6be55d/certifi-2018.4.16.tar.gz
tar xzvf certifi.tar.gz
rm certifi.tar.gz
mv certifi-2018.4.16/certifi ./
rm -rf certifi-2018.4.16

curl -o idna.tar.gz https://files.pythonhosted.org/packages/65/c4/80f97e9c9628f3cac9b98bfca0402ede54e0563b56482e3e6e45c43c4935/idna-2.7.tar.gz
tar xzvf idna.tar.gz
rm idna.tar.gz
mv idna-2.7/idna ./
rm -rf idna-2.7/idna ./


java ${JVM_ARGS} -cp ../lib/jython.jar -Dpython.cachedir.skip=false org.python.util.jython main.py "$@"
```




Запуск примера:
```bash
cd 1-use-python/
bash run.sh
```

По аналогии вы можете использовать любые модули Python. Главное, чтобы это были модули, написанные на Python и работающие на версии 2.7.0.


### Использование модулей Java
Другая возможность Jython - использование java модулей внутри python программы. По сути, можно стать Java-программистом, не зная Java ))
Рассмотрим пример:



## Где Jython лучше Python

### Пример многопоточки без GIL
### Пример работы с базой данных
### Пример работы с Git

