//
//  DeckCards.swift
//  Set
//
//  Created by Cezar Nicolae Gradinariu on 24.02.2022.
//

import Foundation



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
            return cards.remove(at: cards.count.arc4random)
        }
        else{
            return nil
        }
    }

}
