# liam-erd-sample

Liam ERD を使用して MySQl の ERD を作成するサンプルです

## 前提

- Docker Bake が利用可能な状態であること

## 使い方

1. 環境変数の設定

```sh
$ cp .env.example .env
```

2. コンテナのビルド

```sh
$ make build
```

3. データベースの起動

```sh
$ make up
```

4. テーブルの作成

```sh
$ make migrate
```

5. データベースのスキーマから ERD を作成

```sh
$ make build-erd
```

6. ERD を表示

```sh
$ make view-erd
```
