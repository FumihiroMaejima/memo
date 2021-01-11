# Rust - mac local env

---

# Install Rust
## install sh.rustup.rs

default install is selection 1

```shell-sesshion
$ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

1) Proceed with installation (default)
2) Customize installation
3) Cancel installation
>1
・
・
・
Rust is installed now. Great!

To get started you need Cargo's bin directory ($HOME/.cargo/bin) in your PATH
environment variable. Next time you log in this will be done
automatically.

To configure your current shell, run:
source $HOME/.cargo/env
```


## reload cargp-env & check ersion

```shell-sesshion
$ source $HOME/.cargo/env


$ rustc --version
rustc 1.49.0 (e1884a8e3 2020-12-29)

$ rustup --version
rustup 1.23.1 (3df2264a9 2020-11-30)
info: This is the version for the rustup toolchain manager, not the rustc compiler.
info: The currently active `rustc` version is `rustc 1.49.0 (e1884a8e3 2020-12-29)`

$ rustup --version
rustup 1.23.1 (3df2264a9 2020-11-30)
info: This is the version for the rustup toolchain manager, not the rustc compiler.
info: The currently active `rustc` version is `rustc 1.49.0 (e1884a8e3 2020-12-29)`

```

## if you use zsh

```shell-sesshion
echo 'export PATH=$HOME/.cargo/bin:$PATH' >> ~/.zprofile(etc...)
```

---

# Demo of Rust

## make program

```rust:demo.rs
fn main() {
    println!("Demo Program");
}
```

## compile

```shell-sesshion
$ rustc demo.rs
```


## execution

```shell-sesshion
$ ./demo
Demo Program
```

---

# UnInstall Rust

```shell-sesshion
$ rustup self uninstall
```
---

