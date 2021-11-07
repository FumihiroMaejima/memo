# React - creat-react-app

---


# make environmental


# ローカル環境にreactを入れる。

```shell-sesshion
$ npm install -g create-react-app
$ create-react-app --version
4.0.1
```

# プロジェクトの作成

```shell-sesshion
$ npm create-react-app react-test --template typescript
```
# devサーバーの起動

```shell-sesshion
$ yarn start
```
# 整形ツールの設定
## インストール
```shell-sesshion
$ yarn add -D husky lint-staged prettier
```

# prettierrcを追加する

```JSON
{
  "semi": false,
  "arrowParens": "always",
  "singleQuote": true
}
```
## tsconfig.jsonの設定の追加（絶対パス指定）

```JSON
  "compilerOptions": {
    "baseUrl": "src",
  }
```

## package.jsonにlint-stagedの設定を追加

```JSON
  "lint-staged": {
    "*.{ts,tsx}": [
      "eslint --cache --fix",
      "prettier --write"
    ]
  }
```
---
