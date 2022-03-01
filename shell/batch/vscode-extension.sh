#!/bin/sh

# removedList=(
# coenraads.bracket-pair-colorizer # -- it had vscode default function by setting.
# )

# Visual Studio Code :: Package list
packagelist=(
arjun.swagger-viewer
bajdzis.vscode-database
bmewburn.vscode-intelephense-client
cjhowe7.laravel-blade
codezombiech.gitignore
dbaeumer.vscode-eslint
vdonjayamanne.githistory
dsznajder.es7-react-js-snippets
eamodio.gitlens
ecmel.vscode-html-css
ecodes.vscode-phpmd
editorconfig.editorconfig
eg2.tslint
eg2.vscode-npm-script
emallin.phpunit
felixfbecker.php-debug
felixfbecker.php-intellisense
formulahendry.terminal
golang.go
gruntfuggly.todo-tree
hediet.vscode-drawio
ikappas.phpcs
leizongmin.node-module-intellisense
linyang95.php-symbols
mechatroner.rainbow-csv
mikestead.dotenv
ms-azuretools.vscode-docker
ms-ceintl.vscode-language-pack-ja
ms-vscode-remote.remote-containers
ms-vscode-remote.remote-ssh
ms-vscode-remote.remote-ssh-edit
ms-vscode-remote.remote-ssh-explorer
msjsdiag.debugger-for-chrome
octref.vetur
pkief.material-icon-theme
recca0120.vscode-phpunit
redhat.vscode-yaml
rexebin.dracula
rokoroku.vscode-theme-darcula
ryu1kn.partial-diff
sachittandukar.laravel-5-snippets
shakram02.bash-beautify
shardulm94.trailing-spaces
vincaslt.highlight-matching-tag
vscode-icons-team.vscode-icons
vuetifyjs.vuetify-vscode
wwm.better-align
jebbs.plantuml
graphql.vscode-graphql
evilz.vscode-reveal
)

for i in ${packagelist[@]}; do
  code --install-extension $i
done