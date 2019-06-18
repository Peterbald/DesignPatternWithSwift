//
//  Bridge.swift
//  DesignPatternPro
//
//  Created by RandomJ on 2018/8/5.
//  Copyright © 2018年 RandomJ. All rights reserved.
//

import UIKit

/*
 桥接模式的目的是把抽象层次结构从其实现中分离出来，使其能够独立变更。抽象层定义了供客户端使用的上层的抽象接口。实现层次结构定义了供抽象层次使用的底层接口。实现类的引用被封装于抽象层的实例中时，桥接就形成了。
 在软件系统中，某些类型由于自身的逻辑，它具有两个或多个维度的变化，那么如何应对这种“多维度的变化”？如何利用面向对象的技术来使得该类型能够轻松的沿着多个方向进行变化，而又不引入额外的复杂度？这就要使用Bridge模式。
 
 桥接模式：将抽象部分与它的实现部分分离，使他们都能独立的变化。
 
 什么时候使用桥接模式？
 - 不想在抽象与其实现之间形成固定的绑定关系，这样就可以在运行时切换实现
 - 抽象及其实现都应可以通过子类化独立进行拓展
 - 对抽象的实现的修改不影响 Client 代码（也就是具体的业务代码）
 - 如果每个实现需要额外的子类以细化抽象，则说明有必要把他们分成两个部分
 - 想在带有不同抽象接口的多个对象之间共享一个实现
 
 注：抽象类中依赖了实现类的引用，依赖的时候最好依赖实现层的抽象类。抽象层次从实现中分离出来，可以独立改变，下面的例子中将交互单独抽象出接口。
 
 总结：
 - 如何从实现中把抽象分离出来而又让他们联系在一起，使用桥接模式。
 */

enum CommandType {
    case up
    case down
    case left
    case right
    case select
    case start
    case actionA
    case actionB
}

// MARK: - Implementor

// MARK: - Abstract IMP

class ConsoleEmulator {
    func loadInstruction(_ command: CommandType) {
        // load command
    }
    
    func executeInstructions() {
        // execute all patch instructions
    }
}

// MARK: - Concrete IMP

class GameBoyEmulator: ConsoleEmulator {
    override func loadInstruction(_ command: CommandType) {
        // GameBoy IMP
    }
    
    override func executeInstructions() {
        // GameBoy IMP
    }
}

class GameGearEmulator: ConsoleEmulator {
    override func loadInstruction(_ command: CommandType) {
        // GameGear IMP
    }
    
    override func executeInstructions() {
        // GameGear IMP
    }
}

// MARK: - Abstraction

class ConsoleController {
    private var emulator: ConsoleEmulator?
    
    func setCommand(_ command: CommandType) {
        emulator?.loadInstruction(command)
        emulator?.executeInstructions()
    }
}

class TouchConsoleController: ConsoleController {
    func up() {
        super.setCommand(.up)
    }
    
    func down() {
        super.setCommand(.down)
    }
    
    func right() {
        super.setCommand(.right)
    }
    
    func left() {
        super.setCommand(.left)
    }
    
    func select() {
        super.setCommand(.select)
    }
    
    func start() {
        super.setCommand(.start)
    }
    
    func actionA() {
        super.setCommand(.actionA)
    }
    
    func actionB() {
        super.setCommand(.actionB)
    }
}
