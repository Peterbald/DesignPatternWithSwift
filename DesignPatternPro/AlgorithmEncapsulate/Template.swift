//
//  Template.swift
//  DesignPatternPro
//
//  Created by RandomJ on 2018/8/21.
//  Copyright © 2018年 RandomJ. All rights reserved.
//

import UIKit

/*
 在抽象类的一个方法中定义算法，在这个方法中调用的基本操作应由子类重载予以实现。这个方法称为“模板”，因为方法定义的算法缺少一些特有的操作。抽象类与具体子类之间的关系-抽象类定义模板，子类重载基本操作以提供独特操作供模板调用。
 
 模板方法：定义一个操作中算法的骨架，而将一些操作延迟到子类中。模板方法使子类可以重定义算法的某些特定步骤而不改变算法的结构。
 
 组成：
 - AbstractClass 抽象类，定义方法模板
 - ConcreteClass 具体实体类，子类重载
 
 什么时候使用模板方法
 - 需要一次性实现算法的不变部分，并将可变的行为留给子类来实现
 - 子类的公共行为应该被提取出来放到公共类中，以避免代码重复。现有代码的差别应该被分离为新的操作。然后用一个调用这些新操作的模板方法来替换这些不同的代码
 - 需要控制子类的拓展。可以定义一个在特定点调用“钩子 Hook”操作的模板方法。子类可以通过对钩子操作的实现在这些点拓展功能
 
 模板方法会调用5种类型的操作：
 - 对具体类或客户端类的具体操作
 - 对抽象类的具体操作
 - 抽象操作
 - 工厂方法
 - 钩子操作（可选的抽象操作）
 
 注：
 - 模板方法和委托模式（也叫适配器模式）常见于 Cocoa Touch 框架。用于用户程序可以复用或拓展框架类，而且框架类在设计时不会知道什么样的类会使用它们。
 - 模板方法是代码复用的基本技术
 - drawRect setNeedDisplay setNeedsDisplayInRect 等方法都是模板方法的钩子 hook
 - 因为它是抽出公共行为放入框架类中的手段
 
 总结：就是将公有方法抽出到抽象类，是代码复用的基本技术
 */

class AnySandwich {
    func make() {
        prepareBread()
        putBreadOnPlate()
        addMeat()
        addCondiments()
        serve()
    }
    
    func putBreadOnPlate() {
        // do not need override, because all sandwich need put on the plate
    }
    
    func serve() {
        // do not need override, because all sandwich need serve
    }
    
    // MARK: - Need subclass override
    
    func addMeat() {
        assertionFailure("Must be override by subclass")
        // override by subclass
    }
    
    func addCondiments() {
        assertionFailure("Must be override by subclass")
        // override by subclass
    }
    
    func prepareBread() {
        assertionFailure("Must be override by subclass")
        // override by subclass
    }
}

class RebinSandwich: AnySandwich {
    override func addMeat() {
        addCoreBeef()
    }
    
    override func addCondiments() {
        addSauerkaut()
        addThousandIslandDressing()
        addSwissCheese()
    }
    
    override func prepareBread() {
        cutRyeBread()
    }
    
    // MARK: - RebinSandwich special methods
    
    func cutRyeBread() {
        
    }
    
    func addCoreBeef() {
        
    }
    
    func addSauerkaut() {
        
    }
    
    func addThousandIslandDressing() {
        
    }
    
    func addSwissCheese() {
        
    }
}

class Hamburger: AnySandwich {
    override func prepareBread() {
        getBurgerBun()
    }
    
    override func addMeat() {
        addBeafPatty()
    }
    
    override func addCondiments() {
        addKetchup()
        addMustard()
        addCheese()
        addPickles()
    }
    
    // MARK: - Hamburger special methods
    
    func getBurgerBun() {
        
    }
    
    func addKetchup() {
        
    }
    
    func addMustard() {
        
    }
    
    func addBeafPatty() {
        
    }
    
    func addCheese() {
        
    }
    
    func addPickles() {
        
    }
}

class Template: NSObject {

}

















