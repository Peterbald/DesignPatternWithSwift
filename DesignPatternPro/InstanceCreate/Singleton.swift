//
//  Singleton.swift
//  DesignPatternPro
//
//  Created by RandomJ on 2018/8/15.
//  Copyright © 2018年 RandomJ. All rights reserved.
//

import UIKit

/*
 单例模式：保证一个类仅有一个实例，并提供一个访问它的全局访问点
 
 什么时候使用：
 - 类只能有一个实例，而且必须从一个为人熟知的访问点对其进行访问，比如工厂方法
 - 这个唯一的实例只能通过子类化进行拓展，而且拓展的对象不会破坏 client 代码
 */

class Singleton: NSObject {
    static let shared: Singleton = Singleton()
}
