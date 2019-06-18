//
//  Strategy.swift
//  DesignPatternPro
//
//  Created by RandomJ on 2018/8/8.
//  Copyright © 2018年 RandomJ. All rights reserved.
//

import UIKit

/*
 策略模式：
 - 定义一系列算法，把它们一个个封装起来，并且使它们可相互替换，本模式使得算法可独立于使用它的客户 Client 而变化
 - 把相关算法分离为不同的类，成为策略
 
 何时使用策略模式:
 - 一个类在其操作中使用多个条件语句来定义许多行为，我们可以把相关的条件分支移到他们自己的策略类中
 - 需要算法的各种变体
 - 需要避免把复杂的，与算法相关的数据结构暴露给 Client
 
 注：
 - 如果代码中有很多条件语句，就可能意味着你需要把他们重构成各种策略对象
 
 总结：
 - 策略模式和装饰模式的区别
     * 策略模式改变了对象的内容
     * 装饰模式从外部拓展对象的行为
 */

// MARK: - Result & Error Data Struct

enum ValidatorError: Error {
    case `default`
    case invalidType
    case noneNumberic
}

enum Result {
    case success
    case failure(Error)
}

// MARK: - Strategy Class & SubClass

class InputValidator {
    func validateInput(_ textField: UITextField) -> Result {
        return .failure(ValidatorError.default)
    }
}

extension InputValidator {
    func numberOfMatch(_ pattern: String, text: String) throws -> Int {
        let regex = try NSRegularExpression(pattern: pattern, options: .anchorsMatchLines)
        return regex.numberOfMatches(in: text, options: .anchored, range: NSMakeRange(0, text.count))
    }
}

class NumericInputValidator: InputValidator {
    override func validateInput(_ textField: UITextField) -> Result {
        do {
            let matchCounts = try numberOfMatch("^[0-9]*$", text: textField.text ?? "")
            if matchCounts == 0 {
                return Result.failure(ValidatorError.noneNumberic)
            } else {
                return Result.success
            }
        } catch {
            return Result.failure(error)
        }
    }
}

class AlphaInputValidator: InputValidator {
    override func validateInput(_ textField: UITextField) -> Result {
        do {
            let matchCounts = try numberOfMatch("^[a-zA-Z]*$", text: textField.text ?? "")
            if matchCounts == 0 {
                return Result.failure(ValidatorError.noneNumberic)
            } else {
                return Result.success
            }
        } catch {
            return Result.failure(error)
        }
    }
}

// MARK: - Client

class CustomTextField: UITextField {
    // 持有的是策略模式的抽象类，具体构造的时候决定子类方法的调用
    var inputValidator: InputValidator?
    
    func validate() -> Bool {
        guard let inputValidator = inputValidator else {
            print("inputValidator is nil")
            return false
        }
        let result = inputValidator.validateInput(self)
        switch result {
        case .success:
            return true
        case .failure(let error):
            print("Failure Error \(error)")
            return false
        }
    }
}
