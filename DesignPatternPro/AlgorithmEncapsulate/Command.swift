//
//  Command.swift
//  DesignPatternPro
//
//  Created by RandomJ on 2018/8/20.
//  Copyright © 2018年 RandomJ. All rights reserved.
//

import UIKit

/*
 概论：把指令封装在各种命令对象中，命令对象可以被传递并且在指定时刻被不同的客户端复用。叫做命令模式。
 
 作用：
 - 使请求发送者和请求接收者消除彼此之间的耦合，让对象的调用更加灵活
 
 什么是命令模式：
 - 将请求封装为一个对象，从而可用不同的请求对客户进行参数化，对请求进行排队或者记录请求日志，以及可支持撤销操作。
 - 也称为动作模式或者事务模式 Transition & Action
 
 组成部分：
 - Client          客户类
 - Recevier        接收者
 - Invoker         调用者
 - Command         抽象命令类
 - ConcreteCommand 实体命令类
 
 什么时候使用：
 - 想要应用程序支持撤销和恢复
 - 想要在不同时刻对请求进行指定，排队和执行
 - 想记录修改日志，这样在系统故障时，这些修改可以后来重做一遍
 - 想让系统支持事务，事务封装了对数据的一系列修改，事务可以建模为命令对象
 - 想用对象参数化一个动作来执行操作，并用不同命令对象来代替回调函数
 
 CocoaTouch 下面的应用:
 - NSInvocation
 - NSUndoManager
 - Target-Action
 
 优点：
 - 降低系统的耦合度
 - 新的命令可以很容易的加到系统中
 - 可以方便的实现 Undo 和 Redo
 - 可以比较容易地设计一个命令队列和宏命令
 
 缺点：
 - 使用命令模式可能会导致某些系统有过多的具体命令类。因为针对每一个命令都需要设计一个具体命令类，因此某些系统可能需要大量具体命令类，这将影响命令模式的使用。
 
 注：
 - 请求一方发出请求，要求执行一个操作；接收的一方收到请求，并执行操作
 - 命令模式允许请求的一方和接收的一方独立开来，使得请求的一方不必知道接收请求的一方的接口，更不必知道请求是怎么被接收，以及操作是否被执行、何时被执行，以及是怎么被执行的。
 - 命令模式使请求本身成为一个对象，这个对象和其他对象一样可以被存储和传递。
 - 命令模式的关键在于引入了抽象命令接口，且发送者针对抽象命令接口编程，只有实现了抽象命令接口的具体命令才能与接收者相关联。
 */

// MARK: - Receiver

class Receiver {
    func action() {
        print("action")
    }
}

// MARK: - Invoker

class Invoker {
    var command: Command
    
    init(command: Command) {
        self.command = command
    }
    
    func call() {
        command.execute()
    }
}

// MARK: - Command Interface

protocol Command {
    func execute()
}

class ConcreteCommand: Command {
    var receiver: Receiver
    
    init(receiver: Receiver) {
        self.receiver = receiver
    }
    
    func execute() {
        receiver.action()
    }
}

// MARK: - Client

class CommandClient: NSObject {
    func foo() {
        let receiver = Receiver()
        let command = ConcreteCommand(receiver: receiver)
        let invoker = Invoker(command: command)
        invoker.call()
    }
}

