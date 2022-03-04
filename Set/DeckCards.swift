//
//  DeckCards.swift
//  Set
//
//  Created by Cezar Nicolae Gradinariu on 24.02.2022.
//

import Foundation


@IBDesignable
class DeckCards{
    private(set) var cards = [Card]()

    init(){
        for culoare in Card.Color.allCases
        {
            for fill in Card.Fill.allCases{
                for shape in Card.Shape.allCases{
                    for noObjects in Card.NoObjects.allCases{
                        let card=Card(color: culoare, fill: fill, shape: shape, noObjects: noObjects)
                        cards+=[card]
                    }
                }
            }
        }
        cards.shuffle()
    }
    func draw()->Card?{
        if cards.count > 0{
            return cards.remove(at: 0)
        }
        else{
            return nil
        }
    }

}

extension Int{
    var arc4random:Int{
        if self>0{
            return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))}
            else {
                return 0
            }
        }
    }



