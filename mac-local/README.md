# Mac Local Setup Memo

my mac local setup memo.

2021/11/20 現在

---

# アカウント

既存のappleアカウントを使ってアカウントを作成した。

パスワードは異なるものを設定する必要がある。

# セットアップ

rosetta
⇨公式で記載されているので入れておいて問題無し。
[公式](https://support.apple.com/ja-jp/HT211861)



# 初期設定

キーボードの`caps lock`を`control`に変更する。

Pointerやトラックパッド、スクロールの速さを設定しておくとよい。


`Install command line developer tool`
のインストールが結構時間かかる。


# .gitconfigのバックアップ

finderでファイルを移動させても特に問題無かった。

.gitconfigのパーミッションは`644`,

ownerとgroupは`user-name staff`になっている事

```shell-sesshion
$ chmod 644 .gitconfig
```

ユーザー名を変更前のPCと変えている場合は.gitconfigは中のパスを弄る必要がある。


sorcetreeの設定が追加されている為これも削除しておく。

## 最小設定

```shell-sesshion
[core]
        editor = vim
        excludesfile = /Users/user_name/.gitignore_global
[user]
        email = your.address@example.com
        name = Your_Name
```


---
# .awsのバックアップ

ディレクトリごとコピペしてくると権限が変わっている可能性がある為正しく設定する。

.awsディレクトリは`700`,
config,credentialsは`600`

ownerとgroupは全て`user-name staff`になっている事

```shell-sesshion
$ chmod -R 755 .aws
$ chmod 600 .aws/config
$ chmod 600 .aws/credentials
```

---
# .sshのバックアップ

ディレクトリごとコピペしてくると権限が変わっている可能性がある為正しく設定する。

.sshディレクトリは`700`,
config,known_hostsは`644`,
公開鍵は`644`,
秘密鍵は`600`,
.pemも`600`

ownerとgroupは全て`user-name staff`になっている事


```shell-sesshion
$ chmod -R 700 .ssh
$ chmod 644 .ssh/config
$ chmod 644 .ssh/known_hosts
$ chmod 644 .ssh/id_rsa.pub
$ chmod 600 .ssh/id_rsa
```

---

# ローカルのデスクトップにdevディレクトリのシンボリックリンクを貼る

開発で使うリポジトリはここにcloneしてくる。

```shell-sesshion
ln -sv ~/dev ~/Desktop/
```

---


# dotfilesの設定

シンボリックリンクの作成

```shell-sesshion
ln -sv ~/path/dotfiles/.zshrc ~/
ln -sv ~/path/dotfiles/.zprofile ~/
```

リンクの解除

```shell-sesshion
unlink ~/.zshrc
unlink ~/.zprofile
```

---


# アプリのインストール
vscodeなどをインストールする。

vscode は$CODEでパスを通せる様にしておく。
拡張機能一括インスールバッチは確認のダイアログが出たが問題無く動いてインストール出来た。
./vscode-extension.sh


複数タブ表示する為に下記の設定を`false`にする
```shell-sesshion
workbench.editor.enablePreview: false
```

---


# slack
インストール後にログインすれば使える様になる。

---

# Docker Desktop

dmgからインストールするだけで利用出来る。
mysqlのイメージは現状arch設定を指定する必要がある。

---

# その他重要な設定
メール
Excel
セキュリティソフトなど


メールは受信設定だけでもしておくとよい。
gmailアカウントはimapで設定するとsmtp設定を入力する必要が無くなっていた。

---

# Homebrew

下記のコマンドを実行する。
```shell-sesshion
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

インストール後に下記のコマンドを実行して.zprofileに反映する。

```shell-sesshion
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/user_name/.zprofile
```

.zprofileの更新(不要な宣言はコメントアウトしておく。)
```shell-sesshion
$ source ~/.zprofile
```

brew commandが使えるようになる。

---

# PHP

```shell-sesshion
$ brew search php@7
$ brew search php@8
==> Formulae
php@8.0 ✔
```

```shell-sesshion
$ brew install php@8.0
```

## edit ~/.bash_profile & reload

for PATH setting & composer setting.

```shell-sesshion
$ echo 'export PATH="/usr/local/opt/apr/bin:$PATH"' >> ~/.bash_profile
$ echo 'alias composer="php -d memory_limit=-1 /usr/local/bin/composer"' >> ~/.bash_profile
$ source ~/.bash_profile
```

## start PHP service

```shell-sesshion
$ brew services start php
==> Successfully started `php` (label: homebrew.mxcl.php)
```

これでphpが利用出来る。
phpはOSのアップグレードでパスが変わっているっぽい。

```shell-sesshion
% which php
/opt/homebrew/bin/php
/opt/homebrew/opt/php/sbin/
```


---

# composer

```shell-sesshion
$ brew install openssl
```

```shell-session
$ curl -sS https://getcomposer.org/installer | php
```

```shell-session
$ ls
composer.phar
$ mv composer.phar /usr/local/bin/composer
```

```shell-session
$ composer --version
Composer version 1.10.4 2020-04-09 17:05:50
```

composer は概ねメモ通り
mvするときにリネームの為にsudoが必要だった。

---

# nvm

```shell-sesshion
$ git clone https://github.com/creationix/nvm.git ~/.nvm
```

```shell-sesshion
$ source ~/.nvm/nvm.sh
```

## edit ~/.bash_profile or zprofile

```shell-sesshion
$ vim ~/.bash_profile

# nvm
if [[ -s ~/.nvm/nvm.sh ]] ; then
    source ~/.nvm/nvm.sh ;
fi
nvm use stable
```

or

```shell-sesshion
[[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh
nvm use stable
```


```shell-sesshion
$ source ~/.nvm/nvm.sh
$ source ~/.bash_profile
or
$ source ~/.zprofile
```

```shell-sesshion
$ nvm --version
0.33.1
```

```shell-session
$ nvm ls-remote
```

m1対応がv16からとのこと。

v16.13.0   (Latest LTS: Gallium)

```shell-session
$ nvm install 16.13.0
$ nvm use 16.13.0
```

typescript等を入れる前にaws-cliを入れておく。

---

# aws-cli
しっかりパスを通さないとpythonが2.7になる。

確実に`source ~/.zprofile`を必ず実施すること。

```shell-session
$ pip install awscli
```

---

# npm packageのインストール

```shell-session
$ npm install -g yarn typescript create-react-app @aws-amplify/cli
$ yarn global add @vue/cli
```

---

# git-flow

```shell-session
$ brew install git-flow
```

---

# swagger-codegen

```shell-session
$ brew install swagger-codegen
```


------------------------------------------------------

# ブラウザからダウンロードしたアプリケーション
```shell-session
GoogleChrome
FireFox
SublimeText
iTerm2
VsCode
Slack
Docker
Sourcetree
dbeaver
Figma
Postman
Notion
```

------------------------------------------------------

# cliでダウンロードしたパッケージ
```shell-session
nodebrew
php
composer
openssl
pyenv
awscli
nvm
npm packages(yarn, tsc etc)
git-flow
swagger-codegen
```

openssl,git-flow,swagger-codegenは`homebrew`でインストールする

```shell-session
$ brew install openssl
$ brew install git-flow
$ pip install awscli
```


------------------------------------------------------

# chromeの拡張機能
```shell-session
vue-devtool
react-devtool
lighthouse
```


-------------------


---


