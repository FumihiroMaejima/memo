# MySQL Memo

---

# ダンプの取り方

```shell-session
$ mysqldump -u userName -p DataBaseName > testDumpData_210630.sql
```

# ダンプのリストア

```shell-session
$ mysql -u userName -p -D DataBaseName < testDumpData_210630.sql
```

## List
- list1

- list2

- list3

---