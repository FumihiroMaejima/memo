# Go - mac local env

---

# Install goenv
## install

```shell-sesshion
$ git clone https://github.com/syndbg/goenv.git ~/.goenv
Cloning into '/Users/fandm/.goenv'...
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
```

## install latest version
```shell-sesshion
$ goenv install 1.15.6
Downloading go1.15.6.darwin-amd64.tar.gz...
-> https://golang.org/dl/go1.15.6.darwin-amd64.tar.gz
Installing Go Darwin 64bit 1.15.6...
Installed Go Darwin 64bit 1.15.6 to /Users/fandm/.goenv/versions/1.15.6
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
}s
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