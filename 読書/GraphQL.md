# GraphQL の 勉強

```graphql
type Query {
  # 呼び出せるクエリ
  # 引数や戻り値の型を定義する
  me: User
  user(id: ID!): User
}

# 型を指定
type User {
  name: String
  age: Int
}
```

### リゾルバの簡単な例

どんな風に値を取得してくるか、具体的なものはリゾルバに書く

```ts
const resolvers = {
  Query: {
    me: () => ({ name: "Taro", age: 20 }),
    user: (_parent, args) => ({ name: `User${args.id}`, age: 30 }),
  },
};
```

---

### クライアントから叩くクエリの例

```graphql
query {
  me {
    # 欲しいフィールドだけ指定できる
    name
  }

  user(id: "1") {
    name
    age
  }
}
```

## 良い点

- 無駄なデータの取得を削減できる (エンドポイントを追加せず)
- フロントでリクエスト送る時にレスポンスの型が分かる
- 画面の描画に必要なすべての情報を、一度のレスポンスで受け取れる

## Apollo Client

GraphQL でもキャッシュを上手く制御するために利用する

## 疑問

### リゾルバに所謂ビジネスロジック的なのと DB などへのアクセスどちらも書いてしまっていいの？

-> リゾルバはコントローラーみたいな役目と考える
