# Python PostgreSQL Performance Tools

Python port of [Heroku PG Extras](https://github.com/heroku/heroku-pg-extras) with several additions and improvements. The goal of this project is to provide powerful insights into the PostgreSQL database for Python apps that are not using the Heroku PostgreSQL plugin.

Queries can be used to obtain information about a Postgres instance, that may be useful when analyzing performance issues. This includes information about locks, index usage, buffer cache hit ratios and vacuum statistics.

## Requirements

Python 3.8+

## Installation

<div class=«termy»>

```console
$ pip install pgperf
---> 100%
Successfully installed pgperf
```

</div>



Some of the queries (e.g., `calls` and `outliers`) require [pg_stat_statements](https://www.postgresql.org/docs/current/pgstatstatements.html) extension enabled.

You can check if it is enabled in your database by running:

<div class=«termy»>

```console
❯ pgperf server additional extensions
```
</div>

You should see the similar line in the output:

<div class=«termy»>

```console
| pg_stat_statements | 1.7 | 1.7 | track execution statistics of all SQL statements executed |
```

</div>

## Использование

Пожалуйста, отредактируйте конфигурацию в вашей домашней директории, имя файла .pgperf.yml

``yaml
prod:
  db:
    сервер: 127.0.0.1
    порт: 5432
    db: prod_db_name
    пользователь: prod_db_user
    пароль: prod_db_pass
```

Вы можете запускать любые команды, вы можете увидеть все доступные команды:

<div class=«termy»>

``console
pgperf --help
Использование: pgperf [OPTIONS] COMMAND [ARGS]...                                     
                                                                               
 Python-порт [Heroku PG Extras](https://github.com/heroku/heroku-pg-extras) 
 с некоторыми дополнениями и улучшениями.                                      
 Цель этого проекта - предоставить мощные возможности работы с базой данных PostgreSQL  
 для приложений на Python, которые не используют плагин Heroku PostgreSQL.     
                                                                               
Параметры ───────────────────────────────────────────────────────────────────╮
--conf TEXT │
│ --install-completion Завершение установки для текущей оболочки. │
│ --show-completion Показать завершение для текущей оболочки, чтобы │
│ скопировать его или настроить установку.    │
│ --help Показать сообщение и выйти. │
╰─────────────────────────────────────────────────────────────────────────────╯
╭─ Команды ──────────────────────────────────────────────────────────────────╮
│ all-locks Список всех текущих блокировок в вашей базе данных │
│ blocking Получить все утверждения, которые в настоящее время удерживают блокировки │
│ в вашей базе данных │
│ buffercache-stats Получить всю статистику буферного кэша │
│ buffercache-usage Получить все данные об использовании буферного кэша │
│ cache-hits Получить все хиты кэша │
│ вызовы Получить запросы, которые имеют наибольшую частоту │
│ выполнения │ │
│ calls-legacy Получить запросы, которые имеют наибольшую частоту │ │ выполнения.
│ выполнения │
│ index Index Informations │
│ locks Queries with active exclusive locks │
│ long-running-queries All queries longer than five minutes by descending │
│ duration │
│ outliers Queries that have longest execution time in aggregate │
│ server Server Informations │
│ table Table Informations │
│ version │
╰─────────────────────────────────────────────────────────────────────────────╯

```
</div>


### Информация о сервере PostgreSQL
<div class=«termy»>

``console
❯ pgperf server --help
                                                                               
 Использование: pgperf server [OPTIONS] COMMAND [ARGS]...                              
                                                                               
 Информация о сервере                                                           
                                                                               
╭─ Опции ───────────────────────────────────────────────────────────────────╮
│ --verbose --no-verbose [по умолчанию: no-verbose] │
│ --debug --no-debug [по умолчанию: no-debug] │
│ --conf TEXT │
│ --help Показать сообщение и выйти │
╰─────────────────────────────────────────────────────────────────────────────╯
╭─ Команды ──────────────────────────────────────────────────────────────────╮
│ active-conections Список всех активных соединений в эти моменты в вашей │
│ базе данных │
Дополнительные модули Дополнительные модули │
│ configuration Server configuration information │
│ db-settings Get the DB Settings │
│ kill-all Kill all the active database connections │
│ ssl-used Check if SSL connection is used │
│ stats The Statistics Collector. PostgreSQL's statistics │
│ collector is a subsystem that supports collection and │
│ reporting of information about server activity.          │
│ vacuum-stats Dead rows and whether an automatic vacuum is expected to │
│ be triggered │
╰─────────────────────────────────────────────────────────────────────────────╯

``` 
</div>

#### PostgreSQL Server Additional Information

<div class=«termy»>

```console
❯ pgperf server additional --help
                                                                               
 Usage: pgperf server additional [OPTIONS] COMMAND [ARGS]...                   
                                                                               
 Дополнительные поставляемые модули                                                   
                                                                               
╭─ Опции ───────────────────────────────────────────────────────────────────╮
│ --verbose --no-verbose [по умолчанию: no-verbose] │
│ --debug --no-debug [по умолчанию: no-debug] │
│ --conf TEXT │
│ --help Показать сообщение и выйти │
╰─────────────────────────────────────────────────────────────────────────────╯
╭─ Команды ──────────────────────────────────────────────────────────────────╮
│ add-all-recommended-extensions Добавление расширений [sslinfo, pg_buffercache, │
│ pg_stat_statements] к вашей базе данных │
│ расширения Получение доступных и установленных расширений │
╰─────────────────────────────────────────────────────────────────────────────╯
``` 
</div>

#### Конфигурация сервера PostgreSQL 

<div class=«termy»>

``консоль
❯ pgperf server configuration --help
                                                                               
 Использование: pgperf server configuration [OPTIONS] COMMAND [ARGS]...                
                                                                               
 Информация о конфигурации сервера                                              
                                                                               
Опции ───────────────────────────────────────────────────────────────────╮
│ --verbose --no-verbose [по умолчанию: no-verbose] │
│ --debug --no-debug [по умолчанию: no-debug] │
│ --conf TEXT │
│ --help Показать сообщение и выйти │
╰─────────────────────────────────────────────────────────────────────────────╯
╭─ Команды ──────────────────────────────────────────────────────────────────╮
│ authentication Показать конфигурацию аутентификации │
│ connection-settings Показать конфигурацию параметров подключения │
│ disk Show Kernel Resource Usage configuration │
│ file-locations Показать конфигурацию размещения файлов │
│ kernel Show Kernel configuration │
│ memory Show Memory configuration │
│ replication Server Replication information │
│ show-all Show all Server configuration │
│ ssl Show Authentication configuration │
│ vacuum Show Cost-based Vacuum Delay configuration │
│ writer Show Background Writer configuration │
╰─────────────────────────────────────────────────────────────────────────────╯
``` 
</div>

### Статистика сервера PostgreSQL

<div class=«termy»>

``console
❯ pgperf server stats --help
                                                                               
 Использование: pgperf server stats [OPTIONS] COMMAND [ARGS]...                        
                                                                               
 Сборщик статистики. Сборщик статистики PostgreSQL - это подсистема.    
 that supports collection and reporting of information about server activity.  
                                                                               
╭─ Options ───────────────────────────────────────────────────────────────────╮
│ --verbose --no-verbose [по умолчанию: no-verbose] │
│ --debug --no-debug [по умолчанию: no-debug] │
│ --conf TEXT │
│ --help Показать сообщение и выйти │
╰─────────────────────────────────────────────────────────────────────────────╯
╭─ Commands ──────────────────────────────────────────────────────────────────╮
│ collected Collected Statistics Views │
│ dinamic Динамические представления статистики │
╰─────────────────────────────────────────────────────────────────────────────╯
``` 
</div>

### Сбор статистики сервера PostgreSQL

<div class=«termy»>

``console
❯ pgperf server stats collected --help
                                                                               
 Использование: pgperf server stats collected [OPTIONS] COMMAND [ARGS]...              
                                                                               
 Представления собранной статистики                                                    
                                                                               
╭─ Опции ───────────────────────────────────────────────────────────────────╮
│ --verbose --no-verbose [по умолчанию: no-verbose] │
│ --debug --no-debug [по умолчанию: no-debug] │
│ --conf TEXT │
│ --help Показать сообщение и выйти │
╰─────────────────────────────────────────────────────────────────────────────╯
╭─ Команды ──────────────────────────────────────────────────────────────────╮
│ all-indexes Одна строка для каждого индекса в текущей базе данных, │
│ показывающая статистику обращений к конкретному │
│ │ индексу. Подробности см. в pg_stat_all_indexes.
│ (Совместимо с PostgresSQL >= 11.0 ) │ │
│ all-tables Одна строка для каждой таблицы в текущей базе данных, │
│ показывающая статистику обращений к конкретной │
│ │ таблице.  Подробности см. в pg_stat_all_tables.
│ (совместимо с PostgresSQL >= 11.0 ) │ │
│ архиватор Только одна строка, показывающая статистику о деятельности процесса WAL │ │ │ архиватора.
│ │ деятельности процесса архиватора.  См. pg_stat_archiver для │
│ │ подробностей. ( Совместимо с PostgresSQL >= 11.0 ) │ │
│ bgwriter Только одна строка, показывающая статистику о фоновой │
│ активности процесса записи.  См. pg_stat_bgwriter для │ │ подробностей.
│ │ подробностей. ( Совместимо с PostgresSQL >= 11.0 ) │ │
│ базы данных Одна строка на базу данных, показывающая общую │ │ статистику базы данных.
│ │ │ статистику.  Подробности см. в pg_stat_database.
│ (Совместимо с PostgresSQL >= 11.0 ) │ │
│ конфликты баз данных Одна строка на базу данных, показывающая статистику по всей базе данных │ │ данных.
│ об отмене запросов из-за конфликтов с восстановлением на │
│ │ резервных серверах.  См. pg_stat_database_conflicts для │ │ подробностей.
│ │ подробности. (Совместимо с PostgresSQL >= 11.0 ) │ │
│ io-all-indexes Одна строка для каждого индекса в текущей базе данных, │
│ показывает статистику ввода/вывода по данному конкретному индексу.  │
│ Подробности см. в разделе pg_statio_all_indexes. (Совместимо │
│ с PostgresSQL >= 11.0 ) │ │
│ io-all-sequences Одна строка для каждой последовательности в текущей базе данных, │
│ показывающая статистику ввода-вывода по данной конкретной │
│ последовательности. Подробности см. в pg_statio_all_sequences.    │
│ (Совместимо с PostgresSQL >= 11.0 ) │ │
│ io-all-tables Одна строка для каждой таблицы в текущей базе данных, │
│ показывающая статистику ввода-вывода для данной конкретной таблицы.   │
│ Подробности см. в разделе pg_statio_all_tables. (Совместимо с │
│ PostgresSQL >= 11.0 ) │ │
│ io-sys-indexes То же, что и pg_statio_all_indexes, за исключением того, что отображаются только │ │ индексы на системных таблицах.
│ индексов в системных таблицах. (Совместимо с │
│ PostgresSQL >= 11.0 ) │
│ io-sys-sequences Аналогично pg_statio_all_sequences, за исключением того, что показываются только │ │ системные последовательности.
│ системные последовательности. (В настоящее время системные │
│ последовательностей не определено, поэтому это представление всегда пустое).  │
│ (Совместимо с PostgresSQL >= 11.0 ) │ │
│ io-sys-tables Аналогично pg_statio_all_tables, за исключением того, что отображаются только системные │ │ таблицы.
│ таблицы. (Совместимо с PostgresSQL >= 11.0 │
│ )                                                      │
│ io-user-indexes Аналогично pg_statio_all_indexes, за исключением того, что показываются только │ │ индексы на пользовательских таблицах.
│ индексов на пользовательских таблицах. (Совместимо с │
│ PostgresSQL >= 11.0 ) │
│ io-user-sequences Аналогично pg_statio_all_sequences, за исключением того, что показываются только пользовательские │ │ последовательности.
│ последовательности. (Совместимо с PostgresSQL >= │ │
│ 11.0 ) │
│ io-user-tables Аналогично pg_statio_all_tables, за исключением того, что отображаются только пользовательские │ │ таблицы.
│ таблицы. (Совместимо с PostgresSQL >= 11.0 │
│ )                                                      │
│ sys-indexes Аналогично pg_stat_all_indexes, за исключением того, что показываются только индексы │ │ системных таблиц.
│ на системных таблицах. (Совместимо с │
│ PostgresSQL >= 11.0 ) │ │
│ пользовательские функции Одна строка для каждой отслеживаемой функции, показывающая статистику │
│ о выполнении этой функции. См.
│ pg_stat_user_functions для получения подробной информации. (Совместимо с │
│ PostgresSQL >= 11.0 ) │
│ user-tables То же, что и pg_stat_all_tables, за исключением того, что отображаются только пользовательские │
│ таблиц. (Совместимо с PostgresSQL >= 11.0 │
│ )                                                      │
│ xact-all-tables Аналогично pg_stat_all_tables, но подсчитывает действия, │
│ выполненные на данный момент в текущей транзакции (которые │
│ еще не включены в pg_stat_all_tables и связанные с ними │
│ представления). Колонки для количества живых и мертвых строк │
│ и действий по вакуумированию и анализу в этом │ │ представлении отсутствуют.
│ представлении. (Совместимо с PostgresSQL >= 11.0 ) │
│ xact-user-functions Аналогично pg_stat_user_functions, но учитывает только │ │ вызовы во время текущей транзакции (совместимо с PostgresSQL >= 11 0).
│ вызовы во время текущей транзакции (которые не │
│ еще не включены в pg_stat_user_functions). (Совместимо │
│ with PostgresSQL >= 11.0 ) │
│ xact-user-tables Same as pg_stat_xact_all_tables, except that only user │
│ tables are shown. (Compatible with PostgresSQL >= 11.0 │
│ )                                                      │
╰─────────────────────────────────────────────────────────────────────────────╯

``` 
</div>

### PostgreSQL Server Stats Dinamic

<div class=«termy»>

```console
❯ pgperf server stats dinamic --help
                                                                               
 Usage: pgperf server stats dinamic [OPTIONS] COMMAND [ARGS]...                
                                                                               
 Dynamic Statistics Views                                                      
                                                                               
╭─ Опции ───────────────────────────────────────────────────────────────────╮
│ --verbose --no-verbose [по умолчанию: no-verbose] │
│ --debug --no-debug [по умолчанию: no-debug] │
│ --conf TEXT │
│ --help Показать сообщение и выйти │
╰─────────────────────────────────────────────────────────────────────────────╯
╭─ Команды ──────────────────────────────────────────────────────────────────╮
│ активность Одна строка для каждого серверного процесса, показывающая информацию, относящуюся │
│ с текущей деятельностью этого процесса, например, состояние │
│ │ │ и текущий запрос.  Подробности см. в разделе pg_stat_activity. ( │
│ >= PostgresSQL 11.0 ) │ │
│ progress-vacuum Одна строка для каждого бэкенда (включая рабочий autovacuum │ │ процесс), выполняющего VACU.
│ │ │ процессы), выполняющих VACUUM, показывая текущий прогресс. ( │
│ >= PostgresSQL 11.0 ) │ │
│ репликация Одна строка для каждого процесса-отправителя WAL, показывающая статистику о │
│ репликации на подключенный резервный сервер этого отправителя.   │
│ Подробности см. в разделе pg_stat_replication. ( >= PostgresSQL │
│ 11.0 ) │
│ ssl Одна строка для каждого соединения (обычного и репликации), показывающая │
│ │ информация о SSL, используемом в данном соединении. ( >= │
│ │ PostgresSQL 11.0 ) Подробности см. в pg_stat_ssl. │ │ │
│ statements-reset pg_stat_statements_reset сбрасывает статистику, собранную │ │ до этого момента.
│ далеко с помощью pg_stat_statements ( >= PostgresSQL 11.0) │
│ подписка По крайней мере одна строка для каждой подписки, показывающая информацию │
│ о работниках подписки.  См.
│ │ pg_stat_subscription для получения подробной информации. ( >= PostgresSQL 11.0 │
│ ) │
│ wal-receiver Только одна строка, показывающая статистику о приемнике WAL │
│ │ │ с подключенного сервера этого приемника. See │
│ pg_stat_wal_receiver for details. ( >= PostgresSQL 11.0 │
│ ) │
╰─────────────────────────────────────────────────────────────────────────────╯

```
</div>

### PostgreSQL Table Information
<div class=«termy»>

```console
❯ pgperf table --help
                                                                               
 Usage: pgperf table [OPTIONS] COMMAND [ARGS]...                               
                                                                               
 Table Informations                                                            
                                                                               
╭─ Options ───────────────────────────────────────────────────────────────────╮
│ --verbose --no-verbose [default: no-verbose] │
│ --debug --no-debug [default: no-debug] │
│ --conf TEXT │
│ --help Show this message and exit. │
╰─────────────────────────────────────────────────────────────────────────────╯
╭─ Команды ──────────────────────────────────────────────────────────────────╮
│ bloat Оценка пространства таблицы «bloat», выделенного для отношения │
│ которое заполнено мертвыми кортежами и которое еще предстоит освободить │
│ cache-hit Вычисляет коэффициент попадания в кэш при чтении таблиц │
│ index-scans Количество сканирований индекса по таблице в порядке убывания │
│ index-size Общий размер всех индексов по каждой таблице, в порядке убывания │
│ размеру │
│ records-rank Все таблицы и количество строк в каждой из них, упорядоченные по │ │ порядку.
Количество строк по убыванию
│ seq-scans Количество последовательных сканирований по таблице в порядке убывания │
│ size Размер таблиц (без учета индексов), в порядке убывания по размеру │
│ size-with-index Размер таблиц (включая индексы), убывающий по размеру │
╰─────────────────────────────────────────────────────────────────────────────╯

``` 
</div>

### Информация об индексах PostgreSQL
<div class=«termy»>

``console
❯ pgperf index --help
                                                                               
 Использование: pgperf index [OPTIONS] COMMAND [ARGS]...                               
                                                                               
 Информация об индексе                                                            
                                                                               
╭─ Опции ───────────────────────────────────────────────────────────────────╮
│ --verbose --no-verbose [по умолчанию: no-verbose] │
│ --debug --no-debug [по умолчанию: no-debug] │
│ --conf TEXT │
│ --help Показать сообщение и выйти │
╰─────────────────────────────────────────────────────────────────────────────╯
╭─ Команды ──────────────────────────────────────────────────────────────────╮
│ all Перечислить все индексы с соответствующими таблицами и │
│ столбцами │
│ cache-hit Рассчитывает коэффициент попадания в кэш при чтении индексов │
│ duplicate Показывает несколько индексов, имеющих одинаковый набор столбцов, одинаковые │
│ opclass, выражение и предикат.                              │
│ null Find indexes with a high ratio of NULL values │
│ scans Number of scans performed on indexes │
│ size The size of indexes, descending by size, in MB. │
│ total-size Total size of all indexes in MB │
│ unused Unused and almost unused indexes. Ordered by their size │
│ relative to the number of index scans. Exclude indexes of very │
│ small tables (less than 5 pages), where the planner will almost │
│ invariably select a sequential scan, but may not in the future │
│ as the table grows │
│ usage Index hit rate (effective databases are at 99% and up) │
╰─────────────────────────────────────────────────────────────────────────────╯

``` 
</div>
