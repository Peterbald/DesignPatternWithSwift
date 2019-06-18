//
//  Mediator.swift
//  DesignPatternPro
//
//  Created by RandomJ on 2018/8/8.
//  Copyright © 2018年 RandomJ. All rights reserved.
//

import UIKit

/*
 中介者模式：
 用一个对象来封装一系列对象的交互方式。中介者使各个对象不需要显式地互相引用，从而使其耦合松散，而且可以独立的改变他们之间的交互。
 用于定义一个集中的场所，对象间的交互可以在一个中介者对象中处理。
 
 何时使用:
 - 对象间交互虽然定义明确，然而非常复杂，导致一组对象彼此相互依赖而且难以理解
 - 因为对象引用了很多其他对象，并与其通讯，导致很难复用
 - 想要定制一个分布在多个类中的逻辑或行为，但是又不想生成太多子类
 
 注：
 - 中介者模式以中介者内部的复杂性代替交互的复杂性。因为中介者封装与合并了 colleague 同事的各种协作的逻辑，自身可能变得比他们任何一个都复杂。这会让中介者本身成为无所不知的庞然大物，并且难以维护。
 - 这个时候应该采取策略模式给 Mediator 减负
 
 总结：
 - 应用程序的行为分散于不同对象并且对象互相依存的情况，中介者模式非常有用。但是应该避免让中介者模式过于庞大而且难于维护。如果已经这样了，可以考虑使用另一种设计将他分解。
 */

// MARK: - Action Tag

enum ButtonTag {
    case done
    case openPalletView
    case thumbnailView
}

// MARK: - Business Controller(Collegue Object)

class CanvasViewController: UIViewController {
    
}

class ActiveViewController: UIViewController {
    
}

// MARK: - Mediator

class CoordinatingController {
    // Depend on the collegue object
    private(set) var canvasViewController: CanvasViewController?
    private(set) var activeViewController: ActiveViewController?
    
    let shared: CoordinatingController = CoordinatingController()
    
    // provide a interface to view manager
    public func requestViewChangeByObject(_ object: Any) {
        // present or push viewController in this scope
    }
}
