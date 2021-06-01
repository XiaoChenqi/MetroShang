#项目基本使用介绍
##项目module介绍
###basiclib (libary)
1. 其他第三方框架依赖（网络，图片选择，二维码扫描，刷新等）
2. 第三方库二次封装 （网络:JsonCallBack 来解析网络数据为对象）
3. 自定义view

###basicres (libary)
1. 自定义view
2. 定义全部公共资源，比如图片，style，color，dimen等

###arch (libary)
1. 此项目的基础配置和本项目有关的业务（BaseActivity，BaseFragment）
2. 与本项目有关的自定义view（EditDialogBuilder实现登录页面修改ip地址的弹窗）
3. 对basiclib中的相对于本项目业务的进行二次封装

###componentdervice (libary)
1. 组件化中各个组件需要通过此libary获取其他组件的某些功能

###app (app 组件化组件)
1. 主项目工程（欢迎页，登录等）

###demandcomponent(单独测试时为app 联合功能为libary 组件化组件)
1. 实现需求相关功能

###module图片简介
![module图片简介](https://raw.githubusercontent.com/xh2015/testgit/master/WX20180524-104033%402x.png)

##项目依赖关系介绍

1. 最底层为basiclib以及basicres，
2. 其中**arch依赖于basiclib和basicres**
3. componentservice依赖于arch
4. app和其他组件依赖于componentservice


