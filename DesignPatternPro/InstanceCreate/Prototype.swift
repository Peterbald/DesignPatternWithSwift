//
//  Prototype.swift
//  DesignPatternPro
//
//  Created by RandomJ on 2018/8/16.
//  Copyright © 2018年 RandomJ. All rights reserved.
//

import UIKit

/*
 原型模式：使用原型实例指定创建对象的种类，并通过复制这原型创建新的对象
 
 什么时候使用：
 - 需要创建的对象应独立于其类型和创建方式
 - 要实例化的类是在运行时决定的
 - 不想要与产品层次相对应的工厂层次
 - 类不容易创建，比如每个组件把其他组件作为子节点的组合对象。复制已有的组合对象并对副本进行修改会更加容易
 - 不同实例间的差异是状态的若干组合，复制相应数量的原型比手工实例化更加方便
 
 注：本质上是通过 copy 或者 clone 这种方法来复制对象，简化对象的创建，OC 是实现 NSCopying 协议，Swift 要自己实现 ProtoType 协议
 */

protocol ProtoType {
    func clone() -> Self
}

class ConcreteProtoType: ProtoType {
    var age: Int?
    let name: String
    
    required init(name: String) {
        self.name = name
    }
    
    func clone() -> Self {
        return type(of: self).init(name: self.name)
    }
}

class ProtoTypeClient {
    func test() {
        let prototype = ConcreteProtoType(name: "james")
        let foo = prototype.clone()
        foo.age = 1
        let bar = prototype.clone()
        bar.age = 0
    }
}
