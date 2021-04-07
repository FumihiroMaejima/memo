# Cron Memo

---

# rootユーザーのcrontabの設定の確認

```shell-session
$ su
# crontab -l
# Laravel scheduled Comannd
# * * * * * php /var/www/html/project/artisan schedule:run >> /dev/null 2>&1

# execution shell script
0 */1 * * * /bin/bash /root/slack/test.sh >> /dev/null 2>&1
```

---

# 現状のcrontabのファイルの確認

```shell-session
# ls -l /var/spool/cron/root
-rw------- 1 root root 207  7月 30  2019 /var/spool/cron/root

# cat /var/spool/cron/root
# Laravel scheduled Comannd
# * * * * * php /var/www/html/project/artisan schedule:run >> /dev/null 2>&1

# execution shell script
0 */1 * * * /bin/bash /root/slack/test.sh >> /dev/null 2>&1

```

# 設定ファイルの編集

```shell-session

# vim /usr/local/etc/crontab.conf
# Laravel scheduled Comannd
# * * * * * php /var/www/html/project/artisan schedule:run >> /dev/null 2>&1

# execution shell script
0 */1 * * * /bin/bash /root/slack/test.sh >> /dev/null 2>&1
```

---

# 設定ファイルの読み込み

```shell-session
# crontab /usr/local/etc/crontab.conf
# crontab -l
```

---



# Title

```shell-session

```

## List
- list1

- list2

- list3

---