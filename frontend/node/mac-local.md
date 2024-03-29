# Node.js - mac local env

---

if you use `nvm`, you don`t have to install `npm`.

`npm` has set automatically.

# Install nvm

```shell-sesshion
$ git clone https://github.com/creationix/nvm.git ~/.nvm
```

```shell-sesshion
$ source ~/.nvm/nvm.sh
```

## edit ~/.bash_profile

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


## reload setting files

```shell-sesshion
$ source ~/.nvm/nvm.sh
$ source ~/.bash_profile
```

```shell-sesshion
$ nvm --version
0.33.1
```

---

# Install Node.js
## check installable version list
```shell-sesshion
$ nvm ls-remote
```

## install latest version
```shell-sesshion
$ nvm install 12.20.0
or
$ nvm use 12.20.0
```

## using select version
```shell-sesshion
$ nvm use 12.20.0
or
$ nvm use stable
```

## setting to PATH

```shell-sesshion
$ vim ~/.bashrc

# Node.js
# export NODE_PATH=$NODE_PATH:/Users/user-name/.nvm/versions/node/v12.13.1/lib/node_modules
export NODE_PATH=_modules:/Users/user-name/.nvm/versions/node/v12.13.1/lib/node_modules
```

```shell-sesshion
$ source ~/.bashrc
```

```shell-sesshion
~ $ npm -v
6.14.8
~ $ node -v
v12.20.0
```


## install packages

###  List
1. yarn
2. vue-cli
3. TypeScript
4. create-react-app
5. aglio

```shell-sesshion
$ npm install -g yarn
$ yarn global add @vue/cli
$ npm install -g typescript
$ npm install -g create-react-app
$ npm install -g @aws-amplify/cli
$ npm install -g aglio --unsafe-perm
```

```shell-sesshion
$ npm install -g yarn typescript create-react-app @aws-amplify/cli aglio --unsafe-perm
$ yarn global add @vue/cli
```

---