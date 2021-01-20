# Git Memo

---

# Commit メッセージの修正

コマンドを実行すると`vi`などで直前のコミットメッセージを修正出来る。

```shell--sesshion
$ git commit --amend
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

---
