//
//  SetModel.swift
//  Set
//
//  Created by Cezar Nicolae Gradinariu on 23.02.2022.
//

import Foundation


class Set{
    private(set) var deck:DeckCards


    func visibleCards()->[Int]{
    var array = [Int]()
        var to24 = Array (0...23)
    for _ in 1...12{
        if let elemInArray = to24.randomElement(){
            array.append(elemInArray)
        if let index2 = to24.firstIndex(of: elemInArray){
            to24.remove(at: index2)
            }
        }
    }
        return array
    }
    init(){
//        for _ in 1...numberOfCards{
//            let card = Card()
//            cards += [card]
//        }
//        cards.shuffle()
        self.deck = DeckCards()

    }
}
