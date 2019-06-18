//
//  Delegate.swift
//  DesignPatternPro
//
//  Created by RandomJ on 2018/8/18.
//  Copyright © 2018年 RandomJ. All rights reserved.
//

import UIKit

/*
 代理模式：为其他对象提供一种代理以控制对这个对象的访问
 
 代理种类：
 - 远程代理
 - 虚拟代理
 - 保护代理
 - 智能引用代理
 
 什么时候使用代理模式：
 - 需要一个远程代理，为不同地址空间或网络对象提供本地代表
 - 需要一个虚拟代理，来根据要求创建重型的对象。
 - 需要一个保护代理，来根据不同访问权限控制对原对象的访问
 - 需要一个智能引用代理，通过对实体对象的引用进行计数来管理内存。也能用于锁定实体对象，让其他对象不能修改它
 
 注：通过虚拟代理向客户端提供某些轻量的信息
 */

class Delegate: NSObject {

}
