# dart 语法笔记

## dart package

对一个 dart 文件进行拆分

在原始文件里

```
// 声明当前文件为另一个 dart 文件的一部分
part 'src/header_extension.dart';
```：

在 part 文件里：

```
// 声明当前文件为另一个 dart 文件的一部分
part of dart_grammar;
```
