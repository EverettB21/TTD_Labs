//
//  SOLIDSYSTEM.swift
//  Lab-TDD2
//
//  Created by Everett Brothers on 2/1/24.
//

import Foundation

//Single responsibility principle

protocol Shoe {
    func saveSize(_ size: Int)
}

class BigfootsShoe: Shoe {
    func saveSize(_ size: Int) {
        //save shoe size
    }
}

//Open/Closed principle
protocol Game {
    func runGame()
}

class Rainbow6Siege: Game {
    func runGame() {
        // run game
    }
}

class Minecraft: Game {
    func runGame() {
        // run game
    }
}

class PlayGame {
    let game: Game
    
    init(game: Game) {
        self.game = game
    }
    
    func playGame() {
        game.runGame()
    }
}

//Liskov Substitution Principle
class SuperGame: PlayGame {
    var device: String
    
    init(device: String, game: Game) {
        self.device = device
        super.init(game: game)
    }
}

//Interface Segregation
protocol FourLegs {
    func runOnFours()
}

protocol TwoLegs {
    func runOnTwos()
}

class Human: TwoLegs {
    func runOnTwos() {
        print("running on two legs")
    }
}

class Bear: FourLegs {
    func runOnFours() {
        print("running on all fours")
    }
}

class Monkey: Human, FourLegs {
    func runOnFours() {
        print("using hands to help run")
    }
}

//Dependency Inversion
protocol DataStore {
    func save(_ data: String)
    func fetch() -> String
}

class Database: DataStore {
    func save(_ data: String) {
        print("Saving data to database: \(data)")
    }
    func fetch() -> String {
        return "Fetched data from database"
    }
}

class FileSystem: DataStore {
    func save(_ data: String) {
        print("Saving data to file system: \(data)")
    }
    func fetch() -> String {
        return "Fetched data from file system"
    }
}

class Logger {
    private let dataStore: DataStore
    init(dataStore: DataStore) {
        self.dataStore = dataStore
    }

    func log(_ data: String) {
        dataStore.save(data)
        print("Data logged: \(data)")
    }
}

