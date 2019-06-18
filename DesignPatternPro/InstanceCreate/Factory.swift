//
//  Factory.swift
//  DesignPatternPro
//
//  Created by RandomJ on 2018/7/28.
//  Copyright © 2018年 RandomJ. All rights reserved.
//

import UIKit

// 工厂方法：定义一个用于创建对象的接口，让子类决定实例化哪个类。
// 角色：
// 抽象产品类：定义产品的接口
// 抽象工厂类：抽象的创建类
// 实体工厂类：具体的创建类
// 注：生产者自身不必是抽象工厂，它可以是任何类，要点在于不是直接创建对象，而是使用类或者对象的工厂方法创建具体产品，并以抽象类型返回。

/*
 工厂方法的应用：
 优点：
 - 良好的封装性，可以直接通过 String, Enum，Class 等构造类，但是在 Swift 里面，这点不是很好。
 - 良好的拓展性，可以直接增加产品类，工厂类不用改就可以满足需求。
 - 屏蔽具体的产品类，只依赖类的接口不关注类的具体实现。
 
 - 工厂方法模式是典型的解耦框架。高层模块只需要知道产品的抽象类。其他的实现类不需要关心，符合迪米特法则，我不需要我不去关心，符合依赖倒置，只依赖于产品类的抽象。符合里氏替换原则，子类可以替换父类。
 
 工厂方法的使用场景：
 - 需要灵活的，可拓展的框架时，可以考虑采用工厂方法模式。例如，多个邮件协议的实现，POP3,IMAP,HTTP
 - 可以用在测试中，依赖的类可以使用工厂方法构造。
 */

// 人类的接口类
public protocol Human {
    func getColor()
    func talk()
}

// 各种人类具体的实现类
public class BlackHuman: Human {
    public func getColor() {
        print("this is black human getColor")
    }
    
    public func talk() {
        print("this is black human talk")
    }
}

public class YellowHuman: Human {
    public func getColor() {
        print("this is yellow man getColor")
    }
    
    public func talk() {
        print("this is yellow man talk")
    }
}

public class WhiteHuman: Human {
    public func getColor() {
        print("this is white mna getColor")
    }
    
    public func talk() {
        print("this is white man talk")
    }
}

public protocol AbstractHumanFactory {
    associatedtype HumanType
    // 传入对象可以自己定义是 String/Enum/ClassType 等
    func createHuman(_ humanType: HumanType.Type) -> HumanType
}

// 定义工厂的传参
public enum HumanColor {
    case white
    case black
    case yellow
}

// MARK: - 工厂方法模式

public class HumanFactory: AbstractHumanFactory {
    public typealias HumanType = Human
    
    public func createHuman(_ humanType: Human.Protocol) -> Human {
        return YellowHuman()
    }
}

// MARK: - 简单工厂模式
// 如果一个模块只需要一个工厂类，直接使用简单工厂模式就可以了，不需要构造具体的子类。
public class SimpleHumanFactory {
    public static func simpleCreateHuman(_ type: HumanColor) -> Human {
        switch type {
        case .white:
            return WhiteHuman()
        case .black:
            return BlackHuman()
        case .yellow:
            return YellowHuman()
        }
    }
}

// MARK: - 多个工厂类

// 符合单一职责原则，能够实现具体的类由具体的工厂来构造。一个工厂类对应一个实现类，好处是创建类的职责单一，结构简单，但是拓展性不好，如果要拓展一个类，就需要增加一个工厂类。在复杂的应用中一般采用多个工厂类，然后在增加一个协调类，避免调用者和子工厂类直接交流，对高层模块提供统一的入口。

public class WhiteHumanFactory: AbstractHumanFactory {
    public typealias HumanType = WhiteHuman
    public func createHuman(_ humanType: WhiteHuman.Type) -> WhiteHuman {
        return WhiteHuman()
    }
}

public class BlackHumanFactory: AbstractHumanFactory {
    public typealias HumanType = BlackHuman
    public func createHuman(_ humanType: BlackHuman.Type) -> BlackHuman {
        return BlackHuman()
    }
}

public class YellowHumanFactory: AbstractHumanFactory {
    public typealias HumanType = YellowHuman
    public func createHuman(_ humanType: YellowHuman.Type) -> YellowHuman {
        return YellowHuman()
    }
}

public class NvWa {
    public static func createHuman() {
        let humanFactory = HumanFactory();
        let yellowHuman = humanFactory.createHuman(Human.self)
        yellowHuman.getColor()
        yellowHuman.talk()
        
        // 简单工厂模式
        let whiteHuman = SimpleHumanFactory.simpleCreateHuman(.white)
        whiteHuman.getColor()
        whiteHuman.talk()
        
        // 多工厂类模式
        let blackHumanFactory = BlackHumanFactory()
        let blackHuman = blackHumanFactory.createHuman(BlackHuman.self)
        blackHuman.getColor()
        blackHuman.talk()
    }
}
