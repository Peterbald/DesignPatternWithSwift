//
//  Memento.swift
//  DesignPatternPro
//
//  Created by RandomJ on 2018/8/20.
//  Copyright © 2018年 RandomJ. All rights reserved.
//

import UIKit

/*
 备忘录：
 - 在不破坏封装的前提下，捕获一个对象的内部状态，并在该对象之外保存这个状态。这样以后就可以将该对象恢复到原先保存的状态。
 
 角色：
 - 原发器 originator 保存内部状态，根据内部状态生成 Memento 对象
 - 备忘录 memento
 - 看管人 caretaker: 看管人保存 Mememto，保存到文件系统，一段时间后传回给 Originator
 
 什么时候使用备忘录：
 - 需要保存一个对象在某一个时刻的状态，这样就可以恢复到之前的状态
 - 用于获取状态的接口会暴露实现的细节，需要将其隐藏起来
 
 注:
 - 维持 Memento 对象的私有性 setState state init 方法应该定义为私有。
 */

// MARK: - Originator

class Scribble {
    var parentMark: Mark?
    var incretmentMark: Mark?
    
    // Mark
    
    // Methods for memontos
    
    func setMemento(memento: ScribbleMemento) {
        
    }
    
    func createMemento() -> ScribbleMemento {
        return ScribbleMemento(data: Data())
    }
}

// MARK: - Memento

class ScribbleMemento {
    var data: Data
    
    init(data: Data) {
        self.data = data
    }
}

var scribbleSnapshotKey: Void?
var markKey: Void?
extension ScribbleMemento {
    var hasCompleteSnapshot: Bool? {
        get {
            return objc_getAssociatedObject(self, &scribbleSnapshotKey) as? Bool
        }
        
        set {
            objc_setAssociatedObject(self, &scribbleSnapshotKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    var mark: Mark? {
        get {
            return objc_getAssociatedObject(self, &markKey) as? Mark
        }
        
        set {
            objc_setAssociatedObject(self, &markKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

// MARK: - Caretaker 管理角色

class ScribbleManager {
    
}

class Memento: NSObject {
    func getState() {
        
    }
    
    func setState(_ state: Int) {
        
    }
}
