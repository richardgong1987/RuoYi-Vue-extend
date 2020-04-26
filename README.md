## 平台简介

RuoYi-Vue-extend为[RouYi-Vue](https://gitee.com/y_project/RuoYi-Vue)的扩展版

参考后台模板[vue-element-admin](https://github.com/PanJiaChen/vue-element-admin)

## 扩展版新增的功能
* 新增google authenticator验证并配置开关
* 引入lombok插件,简化javabean代码
* 新增验证码开关
* 新增角色有上下级树形模式
* 增加15天密码过期机制(除管理员外,如果不更新密码,就会禁止登陆)
* 增加CAS单用户登录（一个账号只能一个客户端登录）开关

## 修改的功能

* 代码生成功能加入lombok. 删除掉getter,getter, toString的实现,并,格式化代码

## bug修复:
 

## 本项目特点说明:
* 1.关于集群

本项目使用spring-spring-security-jwt进行认证受权, 所以对集群有天生的支持.

* 2.关于微服务

本项目可以无缝切换到微服务模式
  
### 注意事项:
* 开启的功能权限倒金字塔受权模式时界面的变化

1.在添加界面,不显示功能菜单选择.菜单功能选择要在修改时才出现,这是为了实现菜单继承

2.在修改界面,不能修改上级角色

 
* 默认谷歌密钥
```shell script
SWYKZ6EJWR3Y5XVHX5HZEHJJEEK7HIQZ
```
如何没用过谷歌密钥的同学,去查找一下相关的资料学习一下


## 内置功能

1.  用户管理：用户是系统操作者，该功能主要完成系统用户配置。
2.  部门管理：配置系统组织机构（公司、部门、小组），树结构展现支持数据权限。
3.  岗位管理：配置系统用户所属担任职务。
4.  菜单管理：配置系统菜单，操作权限，按钮权限标识等。
5.  角色管理：角色菜单权限分配、设置角色按机构进行数据范围权限划分。
6.  字典管理：对系统中经常使用的一些较为固定的数据进行维护。
7.  参数管理：对系统动态配置常用参数。
8.  通知公告：系统通知公告信息发布维护。
9.  操作日志：系统正常操作日志记录和查询；系统异常信息日志记录和查询。
10. 登录日志：系统登录日志记录查询包含登录异常。
11. 在线用户：当前系统中活跃用户状态监控。
12. 定时任务：在线（添加、修改、删除)任务调度包含执行结果日志。
13. 代码生成：前后端代码的生成（java、html、xml、sql）支持CRUD下载 。
14. 系统接口：根据业务代码自动生成相关的api接口文档。
15. 服务监控：监视当前系统CPU、内存、磁盘、堆栈等相关信息。
16. 在线构建器：拖动表单元素生成相应的HTML代码。
17. 连接池监视：监视当前系统数据库连接池状态，可进行分析SQL找出系统性能瓶颈。
## 在线体验
> admin/admin123  

演示地址：http://vue.ruoyi.vip  

文档地址：http://doc.ruoyi.vip

## 演示图

<table>
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/cd1f90be5f2684f4560c9519c0f2a232ee8.jpg"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/1cbcf0e6f257c7d3a063c0e3f2ff989e4b3.jpg"/></td>
    </tr>
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/707825ad3f29de74a8d6d02fbd73ad631ea.jpg"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/46be40cc6f01aa300eed53a19b5012bf484.jpg"/></td>
    </tr>
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/4284796d4cea240d181b8f2201813dda710.jpg"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/3ecfac87a049f7fe36abbcaafb2c40d36cf.jpg"/></td>
    </tr>
	<tr>
        <td><img src="https://oscimg.oschina.net/oscnet/71c2d48905221a09a728df4aff4160b8607.jpg"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/c14c1ee9a64a6a9c2c22f67d43198767dbe.jpg"/></td>
    </tr>	 
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/5e8c387724954459291aafd5eb52b456f53.jpg"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/644e78da53c2e92a95dfda4f76e6d117c4b.jpg"/></td>
    </tr>
	<tr>
        <td><img src="https://oscimg.oschina.net/oscnet/fdea1d8bb8625c27bf964176a2c8ebc6945.jpg"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/509d2708cfd762b6e6339364cac1cc1970c.jpg"/></td>
    </tr>
	<tr>
        <td><img src="https://oscimg.oschina.net/oscnet/up-f1fd681cc9d295db74e85ad6d2fe4389454.png"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/up-c195234bbcd30be6927f037a6755e6ab69c.png"/></td>
    </tr>
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/b6115bc8c31de52951982e509930b20684a.jpg"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/up-6d73c2140ce694e3de4c05035fdc1868d4c.png"/></td>
    </tr>
</table>

[idea插件推荐](ideaplugin-recommand.md)


本项目技术交流可以联系


```html
QQ: 909253305
微信: live1520
```
