# sed command Memo

---

# ファイル内のテキストの指定した箇所を置き換えた状態で出力する

`/g`は全対象。

```shell-session
$ sed -e "s/target text/new text/g" path/to/sample.text
```

# 検索したファイル内で文字列を置き換える場合

`-i`オプションを追加する

```shell-session
$ sed -i -e "s/target text/new text/g" path/to/sample.text
```

`-i`オプションが使えない場合

別のファイル(新規)などに出力名はファイル名を変更する

```shell-session
$ sed -e "s/target text/new text/g" path/to/sample.text > path/to/sample.text
```

---
