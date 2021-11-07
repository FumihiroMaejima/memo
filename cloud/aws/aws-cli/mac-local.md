# aws-cli - mac local env

---

# Install aws-cli


## aws-cliの設定

`pyenv`のインストール

```Shell-session
$ git clone https://github.com/pyenv/pyenv.git ~/.pyenv

~ $ pyenv --version
pyenv 2.2.0-5-g54889eb8
```
`v2`から`~/.bashrc`に記載する推奨内容が変更されている。

### ~/.bash_profile

```Shell-session
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
```

### ~/.bashrc

```Shell-session
# pyenv
eval "$(pyenv init -)"
```

### 読み込み

```Shell-session
$ source ~/.bash_profile
```


### インストールバージョンのリスト

```Shell-session
$ pyenv versions
* system (set by $HOME/.pyenv/version)

$ pyenv install --list
```

### 指定したバージョンのインストール

```Shell-session
$ pyenv install 3.9.7
```

```Shell-session
$ pyenv global 3.9.7
$ pyenv local 3.9.7

$ python --version
Python 3.9.7
$ which python
$HOME/.pyenv/shims/python
```

### pipでaws-cliのインストール

```Shell-session
$ aws --version
aws-cli/1.21.7 Python/3.9.7 Darwin/19.6.0 botocore/1.22.7
```

PC再起動後にインストールしたバージョンを反映させる為に、dotfilesの設定を必ずする事。


### .awsの確認

*既にプロファイルが作成済みの場合

*プロファイル未作成の場合.awsのディレクトリの作成とパーミッションを付与する。

```Shell-session
$ mkdir .aws
$ chmod 766 .aws
$ cd ~/.aws
$ touch credentials
```

```Shell-session
$ cat ~/.aws/credentials
[default]
aws_access_key_id=xxxxxxxxxxxxxxxxxxxx
aws_secret_access_key=xxxxxxxxxxxxxxxxxxxx

[profile_name]
aws_access_key_id=xxxxxxxxxxxxxxxxxxxx
aws_secret_access_key=xxxxxxxxxxxxxxxxxxxx

$ cat ~/.aws/config
[default]
region=xxxxxxxxxxxxxxxxxxxx
output=json

[profile profile_name]
region=xxxxxxxxxxxxxxxxxxxx
```


### プロファイルの確認

```Shell-session
$ aws configure list
      Name                    Value             Type    Location
      ----                    -----             ----    --------
   profile                <not set>             None    None
access_key     ****************XXXX shared-credentials-file
secret_key     ****************XXXX shared-credentials-file
    region           xx-xxxxxxxxx-1      config-file    ~/.aws/config
```

プロファイル名の指定

```Shell-session
$ aws configure list --profile profile_name
      Name                    Value             Type    Location
      ----                    -----             ----    --------
   profile          　　profile_name           manual    --profile
access_key     ****************XXXX shared-credentials-file
secret_key     ****************XXXX shared-credentials-file
    region           xx-xxxxxxxxx-1      config-file    ~/.aws/config
```

### プロファイルの切り替え

`~/.bash_profile`に下記を追記

```Shell-session
$ vim ~/.bash_profile

# aws-cli
export AWS_PROFILE=profile_name

$ source ~/.bash_profile
```

### オプションの指定無しでプロファイルの確認

```Shell-session
$ aws configure list
      Name                    Value             Type    Location
      ----                    -----             ----    --------
   profile          　　profile_name           manual    --profile
access_key     ****************XXXX shared-credentials-file
secret_key     ****************XXXX shared-credentials-file
    region           xx-xxxxxxxxx-1      config-file    ~/.aws/config
```

amplifyを使用する場合はamplify用のプロファイルを設定しておく事。

### IAMユーザーやグループの確認

```Shell-session
$ aws iam list-users
$ aws iam list-groups
```

### S3の確認

```Shell-session
$ aws s3 ls
```

### cloudfrontのディストリビューションの設定確認

```Shell-session
$ aws cloudfront get-distribution-config --id ${DISTRIBUTION_ID}
```

### cloudformationのスタックの確認

```Shell-session
$ aws cloudformation list-stacks
```


---