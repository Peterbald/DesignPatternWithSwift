//
//  Decorator.swift
//  DesignPatternPro
//
//  Created by RandomJ on 2018/8/15.
//  Copyright © 2018年 RandomJ. All rights reserved.
//

import UIKit
import CoreGraphics
import Foundation

/*
 装饰模式：动态的给一个对象添加一些额外的职责。就拓展功能来说，装饰模式相比生成子类更加灵活
 
 什么时候使用：
 - 想要在不影响其他对象的情况下，以动态、透明的方式给单个对象添加职责
 - 想要拓展一个类的行为，却做不到。类定义可能被隐藏，无法进行子类化，或者，对类的每个行为的拓展，为支持各种功能的组合，将产生大量的子类。
 - 对类的职责拓展是可选的
 
 装饰模式和策略模式的区别：
 - 装饰模式是从外部变更，每个节点间互相不知道变更
 - 策略模式是从内部变更，每个节点知道一组预定义的变更方式
 
 实现方式：
 - 子类：子类的实现方式更加结构化
 - 分类：分类的实现方式更加简单和轻量
 
 用分类实现的问题：
 - 是编译器确定的，不是动态的
 - 没有封装被拓展类的实例
 
 注：
 - 不改变任何现有接口和行为
 */

class Decorator: NSObject {

}

// MARK: - SubClass

@objc
public protocol ImageComponentInterface: NSObjectProtocol {
    @objc optional func draw1(at point: CGPoint)
}

extension UIImage: ImageComponentInterface {
    //
}

// MARK: - Abstract Class

class ImageFilter: NSObject, ImageComponentInterface {
    var imageComponent: ImageComponentInterface
    
    func apply() {
        // imp by subclass
    }
    
    init(imageComponent: ImageComponentInterface) {
        self.imageComponent = imageComponent
    }
    
    override func forwardingTarget(for aSelector: Selector!) -> Any? {
        if aSelector.description.hasPrefix("draw") {
            apply()
        }
        return imageComponent
    }
}

class ImageTransformFilter: ImageFilter {
    
    var transform: CGAffineTransform
    
    init(imageComponent: ImageComponentInterface, transform: CGAffineTransform) {
        self.transform = transform
        super.init(imageComponent: imageComponent)
    }
    
    override func apply() {
        // subclass concrete imp
        let context = UIGraphicsGetCurrentContext()
        context?.concatenate(transform)
    }
}

class ImageShadowFilter: ImageFilter {
    override func apply() {
        let context = UIGraphicsGetCurrentContext()
        let offset = CGSize(width: -25, height: 15)
        context?.setShadow(offset: offset, blur: 20)
    }
}

class DecoratorViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = UIImage(named: "")
    }
}

// MARK: - Extension

/// transform
extension UIImage {
    func transformFilter() {
        
    }
}

/// shadow
extension UIImage {
    func shadowFilter() {
        
    }
}
