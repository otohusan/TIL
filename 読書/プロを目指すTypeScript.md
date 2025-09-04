# プロを目指すTypeScript

## 1

### typeScriptコンパイラの役割
- 型チェック
- トランスパイル（JavaScriptに変換する、型をなくし、新しい構文を古い構文にしている）

## 2

### 数値リテラル
- プログラムの中にある`1`みたいなものは数値リテラルという
- 2進数数値リテラルがあったり、1e5みたいに書けば指数を表したものもある

### 文字列から数値への変換
- `Number("文字列")` のほかに `+文字列` でも変換できる

### == と ===

- `==` は暗黙の型変換を行ってから比較する
- 使い道としては、 `x == null` と書けば  `x === null || x === undefined` の省略になるらしい

## 3

### 変数名の省略
オブジェクトのプロパティ名と変数名が同じ場合は、変数名の記述を省略できる

```ts
const name = "Taro";
const age = 20;
const user = { name, age }; // { name: "Taro", age: 20 }
```

### スプレッド構文
オブジェクトのコピーに使える

```ts
const obj1 = { a: 1, b: 2 };
const obj2 = { ...obj1 }; // obj2はobj1のコピー
```

ネストしたオブジェクトは、外側のオブジェクトだけスプレッド構文でコピーしても内側は参照になってるから注意

```ts
const obj1 = { a: { b: 2 } };
const obj2 = { ...obj1 };
obj2.a.b = 3;
console.log(obj1.a.b); // 3（内側のオブジェクトは同じ参照）
```

### typeとinterface
使い分けは、基本的にtypeで良さそうp89

```ts
type User = { name: string; age: number };
// interface User { name: string; age: number; } でもOK
```

### インデックスシグネチャ
任意のプロパティ名を受け取れるようにできる  
ただし型安全を壊す可能性があるので注意

```ts
type AnyObject = { [key: string]: number };
const obj: AnyObject = { a: 1, b: 2, c: 3 };
```
