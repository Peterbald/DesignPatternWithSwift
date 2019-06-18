//
//  Composite.swift
//  DesignPatternPro
//
//  Created by RandomJ on 2018/8/16.
//  Copyright © 2018年 RandomJ. All rights reserved.
//

import UIKit

/*
 组合模式：将对象组合成树形结构以表示“部分-整体”的层次结构，组合使得用户对单个对象和组合对象的使用具有一致性。
 
 什么时候使用组合模式：
 - 想获得对象抽象的树形表示（部分-整体的层次结构）
 - 想让客户端统一处理组合结构中的所有对象
 
 注：
 - 组合模式的主要意图是让树形结构中的每个节点具有相同的抽象接口。这样整个结构可作为一个统一的抽象结构使用，而不暴露其内部表示。
 - 组合结构的内部表示不应暴露给客户端，因此组合模式总是跟迭代器一起使用，以遍历组合对象中的每一个项目。
 */

// 树形结构对外暴露的接口，树中的每个点都是统一的
protocol Mark {
    var color: UIColor { get set }
    var size: CGSize { get set }
    var location: CGPoint { get set }
    var count: Int { get }
    var lastChild: Mark? { get }
    
    func addMark(_ mark: Mark)
    func removeMark(_ mark: Mark)
    func childAtIndex(_ index: Int) -> Mark?
}

class Vertex: Mark {
    var color: UIColor = UIColor.white
    var size: CGSize = CGSize.zero
    var location: CGPoint = CGPoint.zero
    var count: Int = 0
    var lastChild: Mark? = nil
    
    func addMark(_ mark: Mark) {
        //
    }
    
    func removeMark(_ mark: Mark) {
        //
    }
    
    func childAtIndex(_ index: Int) -> Mark? {
        return Vertex()
    }
}

class Dot: Vertex {
    
}

class Stroke: Mark {
    var color: UIColor = UIColor.white
    var size: CGSize = CGSize.zero
    var location: CGPoint {
        get {
            return children.first?.location ?? CGPoint.zero
        }
        
        set {
            print("setter")
        }
    }
    var count: Int {
        get {
            return children.count
        }
        
        set {
            
        }
    }
    var lastChild: Mark?
    var children: [Mark] = []
    
    func addMark(_ mark: Mark) {
        children.append(mark)
    }
    
    func removeMark(_ mark: Mark) {
        
    }
    
    func childAtIndex(_ index: Int) -> Mark? {
        if index < children.count {
            return children[index]
        }
        return nil
    }
}

class Composite: NSObject {
    func foo() {
        let newDot = Dot()
        let parentStroke = Stroke()
        parentStroke.addMark(newDot)
        
        let newVertex = Vertex()
        let newStroke = Stroke()
        newStroke.addMark(newVertex)
        
        parentStroke.addMark(newStroke)
    }
}
