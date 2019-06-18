//
//  Builder.swift
//  DesignPatternPro
//
//  Created by RandomJ on 2018/8/5.
//  Copyright © 2018年 RandomJ. All rights reserved.
//

import UIKit

/*
 Client 客户
 
 Director 指导者

 Builder 构建者
 
 主要过程: 客户 告诉指导者需求 指导者 调用 构建者 做具体的构建
 
 使用场景：
 - 需要创建涉及各种部件的复杂对象，创建对象的算法应该独立于部件的装配方式
 - 构建过程需要不同的方式构建对象
 
 总结：
 - 主要用于分步骤构建产品，将构建和表示分离，使得同一个构建过程可以创建不同的表示
 */

// MARK: - Product

class GameCharacter {
    var protection: Float?
    var strength: Float?
}

// MARK: - Builder

class CharacterBuilder {
    var character: GameCharacter?
    
    func buildNewCharacter() -> CharacterBuilder? {
        character = GameCharacter()
        return self
    }
    
    func buildStrength(_ strength: Float) -> CharacterBuilder? {
        character?.strength = strength
        return self
    }
}

class StandardCharacterBuilder: CharacterBuilder {
    override func buildStrength(_ strength: Float) -> CharacterBuilder? {
        return super.buildStrength(strength)
    }
}

// MARK: - Director

class ChasingGameDirector {
    func createPlayer(_ builder: CharacterBuilder) -> GameCharacter? {
        _ = builder.buildNewCharacter()
        _ = builder.buildStrength(50)
        return builder.character
    }
    
    func createEmpty(_ builder: CharacterBuilder) -> GameCharacter? {
        _ = builder.buildNewCharacter()
        _ = builder.buildStrength(30)
        return builder.character
    }
}

// MARK: - Client

class Client {
    func test() {
        let characterBuilder = StandardCharacterBuilder()
        let gameDirector = ChasingGameDirector()
        
        let player = gameDirector.createPlayer(characterBuilder)
        let empty = gameDirector.createEmpty(characterBuilder)
        
        // do something with charater
        print("\(player.debugDescription) \(empty.debugDescription)")
    }
}
