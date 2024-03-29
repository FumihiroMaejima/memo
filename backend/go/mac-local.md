# Go - mac local env

---

# Install goenv
## install

`golang`のアップデートバージョンをローカルに反映する為には、都度`goenv`を下記の通りにインストールする必要がある。(既存の.goenvはリネームする必要がある。)

```shell-sesshion
$ git clone https://github.com/syndbg/goenv.git ~/.goenv
Cloning into '/Users/user-name/.goenv'...
remote: Enumerating objects: 136, done.
remote: Counting objects: 100% (136/136), done.
remote: Compressing objects: 100% (75/75), done.
remote: Total 14324 (delta 64), reused 103 (delta 48), pack-reused 14188
Receiving objects: 100% (14324/14324), 2.58 MiB | 1.00 MiB/s, done.
Resolving deltas: 100% (9730/9730), done.
```

## first setting of goenv

`zsh`の場合は、`~/.zshenv`または`~/.zshrc`

```shell-sesshion
$ echo 'export GOENV_ROOT="$HOME/.goenv"' >> ~/.bash_profile
$ echo 'export PATH="$GOENV_ROOT/bin:$PATH"' >> ~/.bash_profile
$ echo 'eval "$(goenv init -)"' >> ~/.bash_profile
```

## check varsion

```shell-sesshion
$ source ~/.bash_profile
$ goenv -v
goenv 2.0.0beta11
```

---

# Install Golang

## check installable version list

```shell-sesshion
$ goenv install -l
$ goenv install -l | tail -n 15
```

## install latest version

```shell-sesshion
$ goenv install 1.15.6
Downloading go1.15.6.darwin-amd64.tar.gz...
-> https://golang.org/dl/go1.15.6.darwin-amd64.tar.gz
Installing Go Darwin 64bit 1.15.6...
Installed Go Darwin 64bit 1.15.6 to /Users/user-name/.goenv/versions/1.15.6
```

## Copy Direcotory to $GOPATH

```shell-sesshion
$ cp -rf ~/.goenv/versions/1.16.6 ~/go/
```

## setting golang(GOPATH, GOROOT)

```shell-sesshion
$ echo 'export PATH="$GOROOT/bin/$PATH"' >> ~/.bash_profile
$ echo 'export PATH="$PATH:$GOPATH/bin"' >> ~/.bash_profile
$ source ~/.bash_profile
```

or `~/.zshenv,~/.zshrc`

## setting installed version to global

```shell-sesshion
$ goenv global 1.15.6
$ go version
go version go1.15.6 darwin/amd64
```

### extention VSCode package.

```Shell-session
> Go:  Install/Update Tools
```

## version up golang

`which go` で`/Users/username/go/`に格納されているバージョンを参照する事がある。

下記の通りにコピーすれば良い。(shellの再起動が必要な時もある。)

```shell-sesshion
$ cp -rf /Users/username/.goenv/versions/1.16.4 /Users/username/go/1.16.4
$ source ~/.bash_profile
$ goenv -v
goenv 2.0.0beta11
$ goenv versions
  system
* 1.16.4 (set by /Users/username/.goenv/version)
$ go version
go version go1.16.4 darwin/amd64
```

## setting GO111MODULE (for develop on another dir)

```shell-sesshion
$ go env -w GO111MODULE=on
$ go env GO111MODULE
on
```

---

# sample app

## initialized

```shell-sesshion
$ cd gotest
$ go mod init gotest
go: creating new go.mod: module gotest
$ ls
go.mod
$ mkdir add
$ cd add
$ go mod init add
go: creating new go.mod: module add
$ ls
go.mod
```

## make gotest/add/add.go

```shell-sesshion
$ vim add.go
```

```golangs
package add

// use uppercase letter
func Add(a, b int) int {
    return a + b
}
```

## make gotest/main.go

```shell-sesshion
$ cd ..
$ vim main.go
```

```golang
package main

import (
    "fmt"
    "os"
    "gotest/add"
    "strconv"
)

func main() {
    a, _ := strconv.Atoi(os.Args[1])
    b, _ := strconv.Atoi(os.Args[2])
    fmt.Println(add.Add(a, b))
}
```

## edit gotest/go.mod

```shell-sesshion
$ cd ..
$ vim go.mod
```

```golang
module gotest

go 1.15
replace gotest/add => ./add
```

## build

```shell-sesshion
$ go build -o test-app main.go
go: found gotest/add in gotest/add v0.0.0-00010101000000-000000000000
$ ls
add   go.mod  main.go  test-app
```

## execute app

```shell-sesshion
$ ./test-app 1 3
4
$ ./test-app 25 45
70
```

---