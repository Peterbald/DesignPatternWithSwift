//
//  Flyweight.swift
//  DesignPatternPro
//
//  Created by RandomJ on 2018/8/19.
//  Copyright © 2018年 RandomJ. All rights reserved.
//

import UIKit

/*
 利用公共对象不仅能节省资源还能提高性能。本质上就是共享同一个对象。共享的对象只提供某些内在的信息，而不能用来识别对象。有两个关键的组件，可共享的享元对象和他们的池。某种中央对象维护这个池，并从它返回适当的实例，工厂模式是这个角色的理想候选。称之为管理器 Manager，主要目的是维护池中的这个享元对象，并且返回这个对象。某些对象的状态可以拿到外部，在别处管理，其余部分被共享。通过仔细的设计，内存的节省的可以非常客观。在 iOS 开发中，节省内存意味着性能提升。
 
 享元模式：Flyweight 轻量级
 - 运用共享技术有效的支持大量细粒度的对象
 
 什么时候使用享元模式:
 - 应用程序使用了很多对象
 - 在内部中保存对象会影响内存性能
 - 对象中的特有状态可以放到外部而轻量化
 - 移除了外在状态之后，可以用较少的共享对象替代原来的那组对象
 - 应用程序不依赖于对象的标识，因为共享对象不能提供唯一的标识
 
 注：
 - 共享了内部状态，外在状态通过外部配置更改。定义数据结构，保存享元对象的外部状态。
 */

enum FlowerType {
    case flum
    case peach
}

struct ExtrinsicState {
    var flowerView: FlowerView?
    var area: CGRect = CGRect.zero
}

class FlowerView: UIImageView {
    override func draw(_ rect: CGRect) {
        self.image?.draw(in: rect)
    }
}

class FlowerFactory {
    static var flowerPool: [FlowerType : FlowerView] = [:]
    
    static func flowerView(_ type: FlowerType) -> FlowerView {
        if let flowerView = flowerPool[type] {
            return flowerView
        }
    
        let view = FlowerView()
        flowerPool[type] = view
        return view
    }
}

class FlyweightView: UIView {
    var flowerList: [ExtrinsicState] = []
    
    override func draw(_ rect: CGRect) {
        for state in flowerList {
            state.flowerView?.draw(state.area)
        }
    }
}

class FlyweightClient: NSObject {
    var flyweightView: FlyweightView = FlyweightView()
    
    func foo() {
        var extrinsicStates: [ExtrinsicState] = []
        for _ in 0 ..< 500 {
            let flowerType = FlowerType.flum
            let flowerView = FlowerFactory.flowerView(flowerType)
            
            let state = ExtrinsicState.init(flowerView: flowerView, area: CGRect(x: 0, y: 0, width: 10, height: 10))
            extrinsicStates.append(state)
        }
        flyweightView.flowerList = extrinsicStates
    }
}
