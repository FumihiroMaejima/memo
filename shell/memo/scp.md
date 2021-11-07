# SCP Memo

---

# サーバーからファイルを受け取る時

```shell-session
$ scp -P portNumber -i ~/.ssh/keyName userName@ipAddress:/home/userName/test.sh ~/tmp/
```

---

# サーバーにファイルを渡す時

```shell-session
scp -P portNumber -i ~/.ssh/keyName /Users/localuser/tmp/test.sh userName@ipAddress:/home/userName/
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