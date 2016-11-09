//: Playground - noun: a place where people can play

import UIKit

class Fish {
    var name: String
    var weight: Int
    init(name: String, weight: Int){
        self.name = name
        self.weight = weight
    }
}

class HerbivorousFish: Fish{
    init(name: String){
        super.init(name: name, weight: Int(arc4random_uniform(UInt32(9))) + 1)
    }
}
class CarnivorousFish: Fish{
    init(name: String){
        super.init(name: name, weight: 10)
    }
}

class FishLife {
    
    private var aquarium = [HerbivorousFish](repeating: HerbivorousFish(name: "Star"), count: Int(arc4random_uniform(UInt32(41)) + 10))
    
   private  var carnivorous = [CarnivorousFish(name: "Pike"), CarnivorousFish(name: "Catfish")]
    
    func startFeeding(){
        while (self.aquarium.count > 0) {
            let randomCarnivorous = Int(arc4random_uniform(UInt32(2)))
            let randomHerbivorous = Int(arc4random_uniform(UInt32(self.aquarium.count)))
            self.carnivorous[randomCarnivorous].weight += self.aquarium[randomHerbivorous].weight
            self.aquarium.remove(at: self.aquarium.count-1)
        }
    }
    func displayResult(){
        var winer: CarnivorousFish
        var looser: CarnivorousFish
        if carnivorous[0].weight > carnivorous[1].weight {
            winer = carnivorous[0]
            looser = carnivorous[1]
        } else {
            winer = carnivorous[1]
            looser = carnivorous[0]
        }
        
        print("Winner: \(winer.name): \(winer.weight) kg")
        print("Looser: \(looser.name): \(looser.weight) kg")
        
    }

}

let herb = HerbivorousFish(name: "Star")
herb.weight
let carn = CarnivorousFish(name: "Pike")
carn.weight

let fishLife = FishLife()
fishLife.startFeeding()
fishLife.displayResult()

let fishLife2 = FishLife()
fishLife2.startFeeding()
fishLife2.displayResult()
