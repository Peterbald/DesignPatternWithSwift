//
//  Visitor.swift
//  DesignPatternPro
//
//  Created by RandomJ on 2018/8/16.
//  Copyright © 2018年 RandomJ. All rights reserved.
//

import UIKit

/*
 场景：为了拓展类的功能而往一个类里面塞了太多的方法，类会变得很复杂。更好的做法是创建外部的类来拓展它，而对原始的代码不做改动。
 
 访问者模式:
 - 表示一个作用于某对象结构中的各元素的操作。它让我们可以在不改变各元素的类的前提下定义作用于这些元素的新操作。
 
 什么时候使用访问者模式：
 - 一个复杂的对象结构包含很多其他对象，他们有不同的接口，但是想对这些对象实施一些依赖于其具体类型的操作
 - 定义复杂结构的类很少做修改，但经常需要向其添加新的操作
 - 需要一个数据结构中的对象进行很多不相关的操作，但是不想让这些操作“污染”这些对象的类。可以将相关的操作集中起来，定义在一个访问者类中，并在需要在访问者中定义的操作时使用它。
 
 组成部分：
 - 访问者
 - 它访问的元素
 
 注：
 - 组合结构的主要目的是，维护这种抽象，让客户端可对其操作，又无需暴露其内部的表示和复杂性。
 
 */

// MARK: - Visitor

protocol MarkVisitor {
    func visitMark(_ mark: Mark)
    func visitDot(_ dot: Dot)
    func visitVertex(_ vertex: Vertex)
    func visitStroke(_ stroke: Stroke)
}

class MarkRender: MarkVisitor {
    var context: CGContext
    
    init(_ context: CGContext) {
        self.context = context
    }
    
    func visitMark(_ mark: Mark) {
        
    }
    
    func visitDot(_ dot: Dot) {
        let x = dot.location.x
        let y = dot.location.y
        let size = dot.size

        // render func
    }
    
    func visitVertex(_ vertex: Vertex) {
        let x = vertex.location.x
        let y = vertex.location.y
        
        // render func
    }
    
    func visitStroke(_ stroke: Stroke) {
        
    }
}

// MARK: - Element Accept

extension Dot {
//    func acceptMarkVisitor(_ visitor: MarkVisitor) {
//        visitor.visitDot(self)
//    }
}

extension Vertex {
//    func acceptMarkVisitor(_ visitor: MarkVisitor) {
//        visitor.visitVertex(self)
//    }
}

class Visitor: NSObject {

}
