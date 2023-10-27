# flutter 笔记

单项目，多 package 的组织形式

1、module_xx 的 package 是业务模块，互相直接不能横向依赖；可以依赖 library_xx package
2、library_xx 的 package 是基础组件，library package 不能依赖 module package


## 1、flutter 创建包

flutter create --template=package some_package

在 package 里，添加 example

flutter create example --platforms=android,ios
