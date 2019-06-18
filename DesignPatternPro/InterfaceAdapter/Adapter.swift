//
//  Adapter.swift
//  DesignPatternPro
//
//  Created by RandomJ on 2018/7/27.
//  Copyright © 2018年 RandomJ. All rights reserved.
//

import UIKit

/*
 // 总结：和装饰模式一样，是包装模式的一种。适配器会增加新的接口，和不透明的装饰模式一样
 // 场景：主要用于兼容新老接口
 */

// 目标接口
protocol Target {
    func methodA()
}

// 源接口
class Adaptee {
    func methodB() {
        print("Adaptee methodB")
    }
}

// 适配器
class Adapter: Target {
    let adaptee: Adaptee
    
    init(adaptee: Adaptee) {
        self.adaptee = adaptee
    }

    // 实现目标方法，在目标方法中兼容原来的接口
    func methodA() {
        // do some transform
        adaptee.methodB()
    }
}
