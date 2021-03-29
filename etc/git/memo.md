# Git Memo

---

# Mac環境でアップグレードする方法

```shell--sesshion
$ brew upgrade git
```

---

# SSH経由でgithubリポジトリをclone

```shell--sesshion
$ git clone git@github.com:accountName/RepositoryName.git
```
---

# Commit メッセージの修正

コマンドを実行すると`vi`などで直前のコミットメッセージを修正出来る。

```shell--sesshion
$ git commit --amend
```

---

# リモートリポジトリの最新の履歴の取得

```shell--sesshion
$ git fetch origin develop
```

---

# (ローカルに履歴として残っている)リモートで削除されているリモートブランチの削除

```shell--sesshion
$ git fetch origin develop
```
---

# リモートリポジトリの最新の履歴の取得

```shell--sesshion
$ git fetch origin develop
```

---
# rebase

リベースされる対象のブランチを最新にして、変更が無い状態で下記のコマンドを実行されるとrebaseが実行される。


```shell--sesshion
$ git rebase develop
```

競合がある場合、競合を解決した上で下記のコマンドを実行すると続きのrebase処理を実行してくれる。

```shell--sesshion
$ git rebase --continue
```

失敗したrebaseの取り消し

```shell--sesshion
$ git rebase --aborts
```

---
# check global config

```shell--sesshion
$ git config --global -l
```



---
