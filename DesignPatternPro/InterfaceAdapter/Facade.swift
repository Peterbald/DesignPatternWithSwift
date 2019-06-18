//
//  Facade.swift
//  DesignPatternPro
//
//  Created by RandomJ on 2018/8/5.
//  Copyright © 2018年 RandomJ. All rights reserved.
//

import UIKit

/*
 外观模式：
 - 为子系统中一组不同接口提供统一接口的一种方式
 - 外观定义了上层接口，通过降低复杂度和隐藏子系统间的通信及依存关系，让子系统更易于使用
 
 什么时候使用外观模式：
 - 子系统正逐渐变得复杂，应用模式过程中演化出许多类。可以使用外观为这些子系统类提供一个较简单的接口
 - 可以使用外观对子系统进行分层。每个子系统级别有一个外观作为入口点。让他们通过其外观进行通信。可以简化他们的依赖关系。
 
 具体示例：
 - 为子系统的一组接口提供简化的接口
 
 总结：
 - 用更简单的接口或用不同的接口去适配各种接口。本质上外观是在上层包装了下接口，屏蔽子系统的具体实现。很多时候我们用 Manager 或者 Client 来封装就是外观模式的体现。
 */

// MARK: - SubSystem

class Car {
    func releaseBreaks() {
        print("release breaks")
    }
    
    func changeGears() {
        print("change gears")
    }
    
    func pressAccelerator() {
        print("press accelerator")
    }
    
    func releaseAccelerator() {
        print("release accelerator")
    }
}

class TaxiMeter {
    func start() {
        print("start")
    }
    
    func stop() {
        print("stop")
    }
}

// MARK: - Facade Object

class CabDriver {
    func driveToLocation(_ point: CGPoint) {
        // SubSystem Opration
        let taxiMeter = TaxiMeter()
        taxiMeter.start()
        
        let car = Car()
        car.releaseBreaks()
        car.releaseAccelerator()
        
        taxiMeter.stop()
    }
}
