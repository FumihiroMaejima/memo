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

又は、

```shell-session
# crontab -l
```

# 現行の設定を別ファイルとして保存し、バックアップを取る。

```shell-session
# cp /var/spool/cron/root /usr/local/etc/crontab.conf
# cp /usr/local/etc/crontab.conf /usr/local/etc/crontab.conf.20210702
```

# 設定ファイルの編集

```shell-session

# vim /usr/local/etc/crontab.conf
# Laravel scheduled Comannd
# * * * * * php /var/www/html/project/artisan schedule:run >> /dev/null 2>&1

# execution shell script
0 */1 * * * /bin/bash /root/slack/test.sh >> /dev/null 2>&1
```

又は、

```shell-session
# crontab -e
```

---

# 設定ファイルの読み込み

```shell-session
# crontab /usr/local/etc/crontab.conf
# crontab -l
# ls -l /var/spool/cron/root
```

次回`crontab -e`で編集する際にこの設定ファイルが開かれる。

---



# Title

```shell-session

```

## List
- list1

- list2

- list3

---