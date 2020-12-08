# pingswoole
```
  _____ _                   _____                    _      
 |  __ (_)                 / ____|                  | |     
 | |__) | _ __   __ _  ___| (_____      _____   ___ | | ___ 
 |  ___/ | '_ \ / _` |/ _ \\___ \ \ /\ / / _ \ / _ \| |/ _ \
 | |   | | | | | (_| | (_) |___) \ V  V / (_) | (_) | |  __/
 |_|   |_|_| |_|\__, |\___/_____/ \_/\_/ \___/ \___/|_|\___|
                 __/ |                                      
                |___/                                       
```
pingswoole是一个基于swoole实现的轻量级高性能的常驻内存型的协程级应用服务框架，
高度支持httpApi，websocket，udp服务器，以及基于tcp实现可扩展的rpc服务，
同时支持composer包方式安装部署项目。基于实用，swoolefy抽象Event事件处理类，
实现与底层的回调的解耦，支持协程调度，同步|异步调用，全局事件注册，心跳检查，异步任务，多进程(池)，连接池等，
内置view、log、session、mysql、redis、mongodb等常用组件等。     

目前swoolefy4.2+版本完全支持swoole4.4.+的协程，最高支持最新版的swoole4.4.+，推荐使用swoole4.4.8+.

> 基于swoole框架对api接口开发中造的一些常用的轮子，记录一下，不断完善中！
> @author pingo(pingstrong@163.com)

## 主要特性

* 验证用think-validate组件来构建验证层
* 使用自定义路由做api的版本管理
* 写一个轮子实现JWT的token授权验证
* 写了http请求同步请求工具类
* 按照协程HTTPClient组件写了http异步请求的例子
* 按照文档构建mysql协程连接池
* 使用mysqli组件写好数据模型层
* 按照文档构建redis协程连接池
* 按照文档统一封装异步task任务处理层


## 安装

环境要求
~~~
php         >= 7.3
swoole      >= 4.5.0
Redis
Kafka
Mysql|Mariadb
EleasticSearch
~~~

~~~
#依赖安装
 
 composer install && composer dump-autoload

## 服务启动
~~~
php bin/pingswoole server:start -d
~~~
## 目录结构说明
~~~
Test                   项目部署目录
├─App                     应用目录
│  ├─HttpController       控制器目录(需要自己创建)
│  │  ├─Test              Test模块
│  │  │  ├─V1             版本
│  ├─Logic                逻辑层，复杂的数据库操作写到这一层
│  ├─Model                数据库模型层
│  ├─Service              服务层，复杂的业务处理写到这一层
│  ├─Task                 异步Task任务处理层
|  ├─Crontab              定时任务计划
|  ├─Process              自定义进程
|  ├─Lang                 多语言
|  ├─Command              自定义命令行
│  ├─Utility              工具层
│  │  ├─Pool              协程连接池（mysql和redis）
│  ├─Validate             验证层
├─runtime                 运行时文件夹
| |log tmp                临时文件目录（启动后创建）
├─vendor                  第三方类库目录
├─composer.json           Composer架构
├─composer.lock           Composer锁定
~~~
##功能介绍

## 框架定位

专注打造稳定高性能纯异步基于HTTP的微服务框架，作为nginx+php-fpm的替代技术栈实现架构的微服务化;而Tcp/WebSocket Server将作为插件的形势支持，或者作为其他独立的开源项目。

对于微小型团队或者业务系统我们建议还是采用传统的nginx+php-fpm技术栈，对于成本和性能来说没有瓶颈，也就完全没有必要引入全新的技术栈。

对于中小型团队或者业务系统，处在服务治理或者服务化演进的重要阶段，性能和扩展是解决方案首先维护。

外包项目的瓶颈：业务复杂、需求变化百态、开发周期短、开发费用低、性能安全要求高。

## 项目原则

* 稳定
* 高性能
* 简单
* 安全

## License

非开源产品，请联系作者。