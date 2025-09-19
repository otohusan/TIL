# プロを目指す TypeScript

## 1

### typeScript コンパイラの役割

- 型チェック
- トランスパイル（JavaScript に変換する、型をなくし、新しい構文を古い構文にしている）

## 2

### 数値リテラル

- プログラムの中にある`1`みたいなものは数値リテラルという
- 2 進数数値リテラルがあったり、1e5 みたいに書けば指数を表したものもある

### 文字列から数値への変換

- `Number("文字列")` のほかに `+文字列` でも変換できる

### == と ===

- `==` は暗黙の型変換を行ってから比較する
- 使い道としては、 `x == null` と書けば `x === null || x === undefined` の省略になるらしい

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

### type と interface

使い分けは、基本的に type で良さそう p89

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

## 部分型関係

以下の 2 つの条件を満たすと、S が T の部分型とみなせる

1. T が持つプロパティは全て S にも存在する
2. S におけるプロパティが T のプロパティの部分型であるか同じ型

具体的には以下のようなものは Human は Animal の部分型と言える

```ts
type Animal = {
  age: number;
};

type Human = {
  age: number;
  name: string;
};
```

## 型引数

以下のように型引数を持った型（ジェネリック型）を宣言できる

```ts
type User<T> = {
  name: string;
  child: T;
};

// 使用する場合は以下のように<>に型を渡す

user: User<number> = {
  name: "hoge",
  child: 15,
};
```

## 4

### 関数の戻り値の型を書くメリット

- プログラムの抽象化(エディタの進化で影響少なくなってきてる)
- 関数内で適切な型を返しているか分かる

### ジェネリック関数

引数として型を受け取れる関数

```ts
function GenericFunc<T>(el: T): T[] {
  // なんかの処理
  return result;
}
```

型引数は省略できて、明示しなかったら型推論が行われる。これによって使う側から見ると、好きな値で呼び出せば、良い感じの型の返り値を返してくれる関数として機能する。

### var はブロックスコープに属さない

## 6

## リテラル型の widening

let で定義すると、リテラル型がプリミティブ型に変換される

```ts
let x = "hello"; // string（"hello"型ではなくなる）
const y = "hello"; // "hello"（リテラル型）
```

オブジェクトリテラルの中は widening される

```ts
const obj = { value: "foo" }; // obj.value の型は string
```

明示的に型を書いたリテラル型は、let でも widening されない

```ts
let obj2: "foo" = "foo"; // これは "foo" 型になる
```

## lookup 型

- 既に定義されている型情報を再利用したい時に使用する
- 特にこのオブジェクトのこの値を引数に取りたい、と明示したい時に有効

```ts
type User = {
  id: number;
  name: string;
};

function greet(name: User["name"]) {
  console.log(`こんにちは、${name}さん`);
}
```

## keyof 型

オブジェクト型からそのオブジェクトのプロパティ名の型を得る

```ts
type User = {
  id: number;
  name: string;
  age: number;
};

// User型のプロパティ名だけを型として取得
type UserKeys = keyof User; // "id" | "name" | "age"

// 問題なし
const key: UserKeys = "id";

// エラーになる
const hoge: UserKeys = "hoge";
```
