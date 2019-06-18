//
//  Observer.swift
//  DesignPatternPro
//
//  Created by RandomJ on 2018/8/16.
//  Copyright © 2018年 RandomJ. All rights reserved.
//

import UIKit

/*
 观察者模式：定义对象间的一种一对多的依赖关系，当一个对象的状态发生变化时，所有依赖于他的对象都得到通知并被自动更新。
 
 优点：
 - 可以使用多个 Observer 实现 Subject 中具体实现，消除不同对象间耦合的一种方式
 
 什么时候使用观察者：
 - 一个对象必须通知其他对象，而它又不知道其他对象是什么
 - 对一个对象的改变的同时，也要改变其他对象，同时不知道有多少其他对象待改变
 - 有两种抽象类型相互依赖，将他们封装在各自的对象中，就可以单独对他们进行改变和复用
 
 注：Cocoa 框架里面使用通知和 KVO 改写了观察者模式
 - Notification 一对多的发布-订阅模型，松耦合
 - KVO 键值观察
 */

class Observer: NSObject {

}
