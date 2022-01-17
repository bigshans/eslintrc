## TypeScript 相关

- 重载函数**必须**写在一起。

- 如果类的只读属性若是一个字面量，则**必须**使用只读属性而不是 `getter` 。
  
  ```typescript
  // bad
  class Foo1 {
    public get bar() {
      return 1;
    }
  }
  // good
  class Foo2 {
    public readonly bar = 1;
  }
  ```
* 类型断言**必须**使用 `as Type`，**禁止**使用 `<Type>`，**禁止**对对象字面量进行类型断言（断言成 `any` 是允许的）。
  
  ```typescript
  // bad 
  let bar1: string | number;
  const foo1 = <string>bar1; // wrong
  
  const baz1 = {
    bar: 1,
  } as object; // wrong
  // good
  let bar2: string | number;
  const foo2 = bar2 as string;
  
  const baz2 = {
    bar: 1,
  } as any;
  ```
- 优先使用 `interface` 而不是 `type` 。

- **必须**设置类的成员的可访问性。
  
  ```typescript
  // bad
  class Foo2 {
    static foo = 'foo';
    static getFoo() {
      return Foo2.foo;
    }
    constructor() {}
    bar = 'bar';
    getBar() {}
    get baz() {
      return 'baz';
    }
    set baz(value) {
      console.log(value);
    }
  }
  // good
  class Foo2 {
    private static foo = 'foo';
    public static getFoo() {
      return Foo2.foo;
    }
    public constructor() {}
    protected bar = 'bar';
    public getBar() {}
    public get baz() {
      return 'baz';
    }
    public set baz(value) {
      console.log(value);
    }
  }
  ```

- **禁止**重复导入模块。

- **禁止**定义空的接口。

- **禁止**给一个初始化时直接赋值为 `number`, `string` 的变量显式的声明类型。
  
  ```typescript
  // bad
  function foo() {
    this.a = 0;
  }
  // good
  class Foo {
    a: number;
    constructor() {
      this.a = 0;
    }
  }
  ```

- **禁止**使用无意义的 `void` 类型。

- **禁止**使用超出 `js` 精度范围的数字。

- **禁止**使用 `namespace` 来定义命名空间。

- **禁止**非空断言后面跟着双问号。

- **禁止**将 `this` 赋值给其他变量，除非是解构赋值。

- **禁止**没用的类型限制。

- **禁止**无用的表达式。

- **禁止**出现没必要的 `constructor` 。

- 使用 `for` 循环遍历数组时，如果索引仅用于获取成员，则**必须**使用 `for of` 循环替代 `for` 循环。

- 使用函数类型别名替代包含函数调用声明的接口。
  
  ```typescript
  // bad
  interface Foo1 {
    (): string;
  }
  // good
  type Foo2 = () => string;
  ```

- **禁止**使用 `module` 来定义命名空间。
  
  ```typescript
  // bad
  module Foo1 {}
  // good
  namespace Foo2 {}
  ```

- 使用 `optional chaining` 替代 `&&` 。
  
  ```typescript
  // bad
  let foo1: any;
  console.log(foo1 && foo1.a && foo1.a.b && foo1.a.b.c);
  // good
  let foo2: any;
  console.log(foo2?.a?.b?.c);
  ```

- **禁止**使用三斜杠导入文件。
  
  > 三斜杠是已废弃的语法，但在类型声明文件中还是可以使用的。
  
  ```typescript
  // bad
  /// <reference path="./Animal">
  // good
  import Animal from './Animal';
  ```

- `interface` 和 `type` 定义时**必须**声明成员的类型。

- 函数重载时，若能通过联合类型将两个函数的类型声明合为一个，则使用联合类型而不是两个函数声明。
  
  ```typescript
  // bad
  function foo1(x: number): void;
  function foo1(x: string): void;
  function foo1(x: any): any {
    return x;
  }
  // good
  function foo2(x: number | string): void;
  function foo2(x: any): any {
    return x;
  }
  ```

- **禁止**使用 `eval` 。

- **禁止**在类之外的地方使用 `this` 。

## Eslint 相关

- **禁止**使用 `eval` 。

- `setter` **必须**有对应的 `getter`，`getter` 可以没有对应的 `setter` 。
  
  ```javascript
  // bad
  const foo = {
    set bar(value) {
      this.barValue = 'bar ' + value;
    },
  };
  // good
  const foo = {
    set bar(value) {
      this.barValue = 'bar ' + value;
    },
    get bar() {
      return this.barValue;
    },
  };
  const bar = {
    get foo() {
      return this.fooValue;
    },
  };
  ```

- 数组的方法除了 `forEach` 之外，回调函数**必须**有返回值。
  
  ```javascript
  // bad
  const foo = [1, 2, 3].map((num) => {
    console.log(num * num);
  });
  // good
  const foo = [1, 2, 3].map((num) => {
    return num * num;
  });
  ```

- **禁止**函数的循环复杂度超过 `20` 。
  
  ```javascript
  // bad
  function foo() {
    if (i === 1) console.log(i);
    if (i === 2) console.log(i);
    if (i === 3) console.log(i);
    if (i === 4) console.log(i);
    if (i === 5) console.log(i);
    if (i === 6) console.log(i);
    if (i === 7) console.log(i);
    if (i === 8) console.log(i);
    if (i === 9) console.log(i);
    if (i === 10) console.log(i);
    if (i === 11) console.log(i);
    if (i === 12) console.log(i);
    if (i === 13) console.log(i);
    if (i === 14) console.log(i);
    if (i === 15) console.log(i);
    if (i === 16) console.log(i);
    if (i === 17) console.log(i);
    if (i === 18) console.log(i);
    if (i === 19) console.log(i);
    if (i === 20) console.log(i);
  }
  // good
  function foo() {
    if (i === 1) console.log(i);
    if (i === 2) console.log(i);
    if (i === 3) console.log(i);
    if (i === 4) console.log(i);
    if (i === 5) console.log(i);
    if (i === 6) console.log(i);
    if (i === 7) console.log(i);
    if (i === 8) console.log(i);
    if (i === 9) console.log(i);
    if (i === 10) console.log(i);
    bar(i);
  }
  function bar(i) {
    if (i === 11) console.log(i);
    if (i === 12) console.log(i);
    if (i === 13) console.log(i);
    if (i === 14) console.log(i);
    if (i === 15) console.log(i);
    if (i === 16) console.log(i);
    if (i === 17) console.log(i);
    if (i === 18) console.log(i);
    if (i === 19) console.log(i);
    if (i === 20) console.log(i);
  }
  ```

- `constructor` 中**必须**有 `super` 。
  
  ```javascript
  // bad
  class Foo extends Bar {
    constructor() {}
  }
  // good
  class Foo extends Bar {
    constructor() {
      super();
    }
  }
  ```

- `switch` 语句中的 `default` **必须**在最后。
  
  ```javascript
  // bad
  switch (foo) {
    default:
      bar();
      break;
    case 1:
      baz();
      break;
  }
  // good
  switch (foo) {
    case 1:
      baz();
      break;
    default:
      bar();
      break;
  }
  ```

- **必须**使用 `===` 或 `!==`，**禁止**使用 `==` 或 `!=` 。

- **禁止**方向错误的 `for` 循环。
  
  ```javascript
  // bad
  for (let i = 0; i < 10; i--) {
    // do something
  }
  // good
  for (let i = 0; i < 10; i++) {
    // do something
  }
  ```

- 函数赋值给变量的时候，函数名**必须**与变量名一致。

- `getter` **必须**有返回值，并且**禁止**返回空。

- 代码块嵌套的深度**禁止**超过 `5` 层。

- 回调函数嵌套**禁止**超过 `3` 层，多了请用 `async await` 替代。

- 函数的参数**禁止**超过 `3` 个。
  
  ```javascript
  // bad
  function foo(a1, a2, a3, a4) {}
  // good
  function foo(a1, a2, a3) {}
  function bar({ a1, a2, a3, a4 }) {}
  ```

- `new` 后面的类名**必须**首字母大写。(即类名首字母必须大写)

- **禁止**使用 `Array` 构造函数时传入的参数超过一个。

- **禁止**将 `async` 函数做为 `new Promise` 的回调函数。

- **禁止**使用 `caller` 或 `callee` 。
  
  > 它们是已废弃的语法。

- `switch` 的 `case` 内有变量定义的时候，**必须**使用大括号将 `case` 内变成一个代码块。
  
  ```javascript
  // bad
  switch (foo) {
    case 1:
      const x = 1;
      break;
  }
  // good
  switch (foo) {
    case 1: {
      const x = 1;
      break;
    }
  }
  ```

- **禁止**对已定义的 `class` 重新赋值。
  
  ```javascript
  // bad
  class Foo {}
  Foo = {};
  // good
  class Foo {}
  ```

- **禁止**在测试表达式中使用赋值语句，除非这个赋值语句被括号包起来了。
  
  ```javascript
  // bad
  if (foo = 0) {
  }
  // good
  if (foo === 0) {
  }
  if (bar === (foo = 0)) {
  }
  ```

- **禁止**对使用 `const` 定义的常量重新赋值。

- **禁止**在构造函数中返回值。

- **禁止**将常量作为分支条件判断中的测试表达式，但允许作为循环条件判断中的测试表达式。
  
  ```javascript
  // bad
  if (true) {
  }
  const foo = 0 ? 'bar' : 'baz';
  // good
  for (; true; ) {
    if (foo === 0) {
      break;
    }
  }
  while (true) {
    if (foo === 0) {
      break;
    }
  }
  ```

- **禁止**使用 `debugger` 。

- **禁止**重复定义类的成员。

- **禁止** `if else` 的条件判断中出现重复的条件。

- **禁止**在对象字面量中出现重复的键名。
  
  ```javascript
  // bad
  const foo = {
    bar: 1,
    bar: 2,
  };
  // good
  const foo = {
    bar: 1,
    baz: 2,
  };
  ```

- **禁止**在 `switch` 语句中出现重复测试表达式的 `case` 。

- **禁止**重复导入模块。

- **禁止**出现空代码块，允许 `catch` 为空代码块。

- **禁止**在正则表达式中使用空的字符集 `[]` 。

- **禁止**解构赋值中出现空 `{}` 或 `[]` 。

- **禁止**使用 `foo == null`，**必须**使用 `foo === null` 。

- **禁止**将 `catch` 的第一个参数 `error` 重新赋值。

- **禁止**修改原生对象。

- **禁止**出现没必要的 `bind` 。

- **禁止**不必要的布尔类型转换。

- `switch` 的 `case` 内**必须**有 `break`, `return` 或 `throw`，空的 `case` 除外。

- **禁止**将一个函数声明重新赋值。

- **禁止**在 `setTimeout` 或 `setInterval` 中传入字符串。
  
  ```javascript
  // bad
  setTimeout('alert("Hello World");', 1000);
  // good
  setTimeout(() => {
    alert('Hello World');
  }, 1000);
  ```

- **禁止**对导入的模块进行赋值。

- **禁止**在 `if` 代码块内出现函数声明。

- **禁止**在 `RegExp` 构造函数中出现非法的正则表达式。

- **禁止**使用特殊空白符（比如全角空格），除非是出现在字符串、正则表达式或模版字符串中。

- **禁止**使用 `__iterator__`
  
  > `__iterator__` 是一个已废弃的属性，使用 `[Symbol.iterator]` 替代它。

- **禁止**使用 `label` 。
  
  ```javascript
  // bad
  loop:
      for (let i = 0; i < 5; i++) {
          if (i === 1) {
              continue loop;
          }
          console.log(i);
      }
  // 0 2 3 4
  
  // good
  for (let i = 0; i < 5; i++) {
    if (i === 1) {
      continue;
    }
    console.log(i);
  }
  // 0 2 3 4
  ```

- **禁止**使用没必要的 `{}` 作为代码块。
  
  ```javascript
  // bad
  {
    foo();
  }
  // good
  if (foo) {
    bar();
  }
  ```
* **禁止**正则表达式中使用肉眼无法区分的特殊字符。

* **禁止**使用 `\` 来换行字符串。

* **禁止**使用 `new Function` 。

* **禁止**直接 `new Object` 。

* **禁止**使用 `new` 来生成 `Symbol` 。

* **禁止**使用 `new` 来生成 `String`, `Number` 或 `Boolean` 。

* **禁止**将 `Math`, `JSON` 或 `Reflect` 直接作为函数调用。

* **禁止**对函数的参数重新赋值。

* **禁止**在 `Promise` 的回调函数中直接 `return` 。

* **禁止**使用 `__proto__` 。

* **禁止**在正则表达式中出现连续的空格。

* **禁止**在 `return` 语句里赋值。

* **禁止**将自己赋值给自己。

* **禁止**将自己与自己比较。

* **禁止**使用逗号操作符。

* **禁止** `setter` 有返回值。

* **禁止**在数组中出现连续的逗号。

* **禁止**在普通字符串中出现模版字符串里的变量形式。
  
  ```javascript
  // bad
  const foo = 'Hello ${bar}';
  // good
  const foo = 'Hello {bar}';
  ```
- **禁止**在 `super` 被调用之前使用 `this` 或 `super` 。

- **禁止** `throw` 字面量，**必须** `throw` 一个 `Error` 对象。

- **禁止**使用未定义的变量。

- **禁止**将 `undefined` 赋值给变量。

- 循环内**必须**对循环条件中的变量有修改。

- **禁止**在 `return`, `throw`, `break` 或 `continue` 之后还有代码。

- **禁止**在第一轮循环时就一定会退出循环的情况出现。

- **禁止**在 `finally` 中出现 `return`, `throw`, `break` 或 `continue` 。

- **禁止**在 `in` 或 `instanceof` 操作符的左侧变量前使用感叹号。

- **禁止**使用不安全的 `optional chaining` 。
  
  ```javascript
  // bad
  (obj?.foo)();
  
  (obj?.foo ?? obj?.bar)();
  // good
  obj?.foo();
  
  (obj?.foo ?? bar)();
  ```

- **禁止**无用的表达式。

- 已定义的变量**必须**使用。

- 变量**必须**先定义后使用。

- **禁止**正则表达式中出现无用的回溯引用。
  
  ```javascript
  // bad
  /^(?:(a)|\1b)$/; // reference to (a) into another alternative
  // good
  /^(?:(a)|(b)\2)$/; // reference to (b)
  ```

- **禁止**出现没必要的 `call` 或 `apply` 。

- **禁止**在 `catch` 中仅仅只是把错误 `throw` 出去。

- **禁止**出现没必要的计算键名。

- **禁止**出现没必要的 `constructor` 。

- **禁止**解构赋值时出现同样名字的的重命名，比如 `let { foo: foo } = bar;` 。

- **禁止**使用 `var` 。

- **禁止**使用 `void` 。

- **禁止**变量申明时用逗号一次申明多个。
  
  ```javascript
  // bad
  let foo, bar;
  const baz = 1,
    qux = 2;
  // good
  let foo;
  let bar;
  const baz = 1;
  const qux = 2;
  ```

- 回调函数**必须**使用箭头函数。

- **必须**使用 `...` 而不是 `Object.assign`，除非 `Object.assign` 的第一个参数是一个变量。

- `Promise` 的 `reject` 中**必须**传入 `Error` 对象，而不是字面量。

- 优先使用正则表达式字面量，而不是 `RegExp` 构造函数。

- `generator` 函数内**必须**有 `yield` 。

- 注释的斜线或 `*` 后**必须**有空格。

- **禁止**使用 `'strict';` 。

- 创建 `Symbol` 时**必须**传入参数。

- **必须**使用 `isNaN(foo)` 而不是 `foo === NaN` 。

- `typeof` 表达式比较的对象**必须**是 `'undefined'`, `'object'`, `'boolean'`, `'number'`, `'string'`, `'function'`, `'symbol'`, 或 `'bigint'` 。

- **必须**使用 `if (foo === 5)` 而不是 `if (5 === foo)` 。

- 变量、类、方法需要使用驼峰命名法，属性除外。

- `if` 、 `for` 、 `while` 等必须使用大括号。
  
  ```javascript
  // bad
  if (a > 5) console.log(a);
  // good
  if (a > 5) {
    console.log(a);
  }
  ```

## 代码风格

- 文件末尾留一行空行。

- 一行最多 120 个字符。

- 行尾需要又分号。

- 使用单引号。

- es5 对象需要尾随逗号。
  
  ```typescript
  const a = {
    a: 1,
  }; // allow
  const b = { b: 1 }; // allow
  const a = {
    a: 1
  }; // not allowed
  ```

- 大括号内首尾需要空格。

- 箭头函数只有一个时也需要括号。

- 类名、接口、变量名必须为驼峰式，属性不要求。

- 箭头函数的函数体只有 `return` 语句的时候，**必须**简写。

- 中缀运算符周围必须有空格。

- **禁止**多余的 `return` 语句。

- **禁止**行尾空格。

- **禁止**超过两行空行。

- **禁止**使用特殊空白符。

- **禁止**变量定义时赋值为 `undefined` 。
  
  ```typescript
  // allow
  let k: number;
  k = 5;
  k += 5;
  // not allow
  let k: number | undefined = undefined;
  ```

- 括号内首尾**禁止**有空格。

- **禁止**使用单行控制语句。
  
  ```typescript
  // not allowed
  if (a !== 5) { console.log(a) }
  // allowed
  if (a !== 5) {
    console.log(a);
  }
  ```

- `{` **禁止**换行。

- `}` 应与 `else` 保持在同一行， `else if` 不拆行。
  
  ```typescript
  // not allowed
  if (a > 5) {
    console.log(a);
  }
  else if (a === 5) {
    console.log(5);
  }
  else {
    console.log('too small');
  }
  // allowed
  if (a > 5) {
    console.log(a);
  } else if (a === 5) {
    console.log(5);
  } else {
    console.log('too small');
  }
  ```

- 在注释前要有空白。
  
  ```typescript
  // not allow
  //This a comment
  // allow
  // This is a comment
  ```

formater 使用 prettier ，更多请遵循 prettier 默认规则。

## 工具

- lint 工具： eslint 。

- formater 工具： prettier 。

目前的配置使用了 eslint 插件融合了 tslint 、 prettier 配置。除了 tslint 因为已经被废弃，所以全部配置融合到 eslint 中， prettier 使用 `.prettierrc` 配置，其中使用 vscode 时，修改 `.prettierrc` 时需要重启。

本配置基于腾讯 alloy 团队的 eslint 配置，并对部分配置进行了修改。格式化部分，完全禁用了 eslint 的格式化功能，借助 prettier 插件进行校验， prettier 进行格式化。

## 安装

在项目中添加库。

``` shell
yarn add -D @typescript-eslint/eslint-plugin @typescript-eslint/parser eslint-config-alloy eslint-config-prettier eslint-plugin-prettier prettier typescript eslint@8.6.0
```

目前 eslint 最新版本与 typescript-eslint 存在不兼容，建议 downgrade 使用。依赖安装完成后，将 `.eslintrc.js` 和 `.prettierrc` 复制到项目目录下即可。

也可以使用 install.sh 脚本安装。

``` shell
bash ./install.sh <project-path>
```

