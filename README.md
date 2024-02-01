# flutter_utils

## 一、目录结构

lib 下的主入口，只是空实现，通过导入不通 package 下的不通 app，运行不同的 demo

### package 目录说明

package 目录下，每个 package 都是一个单独的 demo app

### plugins 目录说明

plugins 目录下：
1、module_xx 的 package 是业务模块，互相直接不能横向依赖；可以依赖 library_xx package
2、library_xx 的 package 是基础组件，library package 不能依赖 module package


## 二、flutter 常用命令

flutter create --template=package some_package

在 package 里，添加 example

flutter create example --platforms=android,ios

flutter 脚手架

常用代码合集


todo:
- 多语言切换的实现（拆包时，如何切换）
- 主题色
- 路由
- 图片资源，主题换肤
- 

