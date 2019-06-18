//
//  ChainOfResponsibility.swift
//  DesignPatternPro
//
//  Created by RandomJ on 2018/8/18.
//  Copyright © 2018年 RandomJ. All rights reserved.
//

import UIKit

/*
 责任链模式：
 - 对象引用了同一类型的另一个对象，形成一条链。链中的每个对象实现了相同的方法，处理对链中第一个对象发起的同一个请求。如果一个对象不知道如何处理请求，它就把请求传给下一个响应器（Successor）
 
 定义：
 - 是多个对象都有机会处理请求，从而避免请求的发送者和接收者之间发生耦合。此模式将这些对象连成一条链，并沿着这条链传递请求，直到有一个对象处理它为止。
 
 什么时候使用责任链模式：
 - 有多个对象可以处理请求，而处理程序只有在运行时才能确定
 - 向一组对象发出请求，而不想显式指定处理请求的特定处理程序
 
 注：多层对象有同个方法，按照责任链传递。每种防御机制只能应付一种特定的攻击。一个攻击处理程序链决定了人物可以防御何种攻击。任何攻击处理程序都在任何时间被添加和删除，而不会影响人物的其他行为。
 - 通过下面的例子可以看出，在增加攻击方式和 AttackHandler 的时候不用涉及别的类的改动。其实就是定义接口或者抽象，方便增加子类来增加行为。在查找的具体行为的时候按照 nextHandler 的形式来查找。
 */

// MARK: - Abstract & Concrete Attack Type

class Attack {
    
}

class SwordAttack: Attack {
    
}

class MagicFireAttack: Attack {
    
}

class LightningAttack: Attack {
    
}

// MARK: - Abstract Responsibility

class AttackHandler {
    var nextAttackHandler: AttackHandler?
    
    // super class handle default behavior
    func handleAttack(_ attack: Attack) {
        nextAttackHandler?.handleAttack(attack)
    }
}

// MARK: - Concrete Responsibility

class MetalArmor: AttackHandler {
    override func handleAttack(_ attack: Attack) {
        if attack is SwordAttack {
            print("No damage from a sword attack")
        } else {
            super.handleAttack(attack)
        }
    }
}

class CrystalShield: AttackHandler {
    override func handleAttack(_ attack: Attack) {
        if attack is MagicFireAttack {
            print("No damage from a magic fire attack")
        } else {
            super.handleAttack(attack)
        }
    }
}

class Avatar: AttackHandler {
    override func handleAttack(_ attack: Attack) {
        print("Oh! I'm hit with \(attack)")
    }
}

// MARK: - Client

class ChainOfResponsibility: NSObject {
    func foo() {
        let avatar = Avatar()
     
        let metalArmoredAvatar = MetalArmor()
        metalArmoredAvatar.nextAttackHandler = avatar
        
        let superAvatar = CrystalShield()
        superAvatar.nextAttackHandler = metalArmoredAvatar
        
        // Attack
        let swordAttack = SwordAttack()
        superAvatar.handleAttack(swordAttack)
        
        let magicFireAttack = MagicFireAttack()
        superAvatar.handleAttack(magicFireAttack)
        
        let lightningAttack = LightningAttack()
        superAvatar.handleAttack(lightningAttack)
    }
}
