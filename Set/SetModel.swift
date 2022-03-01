//
//  SetModel.swift
//  Set
//
//  Created by Cezar Nicolae Gradinariu on 23.02.2022.
//

import Foundation


class Set{
    var cards = [Card]()
    var noCardsSelected = 0
    private(set) var deck:DeckCards


    func chooseCard(){
        
    }
    func compareCards()->Bool{
        return (cards[0].noObjects.rawValue + cards[1].noObjects.rawValue + cards[2].noObjects.rawValue) % 3 == 0



            && (cards[0].shape.rawValue  + cards[1].shape.rawValue  + cards[2].shape.rawValue ) % 3 == 0

            && (cards[0].fill.rawValue  + cards[1].fill.rawValue  + cards[2].fill.rawValue ) % 3 == 0


            && (cards[0].color.rawValue  + cards[1].color.rawValue  + cards[2].color.rawValue ) % 3 == 0
    }
    func checkCards(card:Card){
        print("am ajuns")
        cards.append(card)
        noCardsSelected += 1
        for i in cards.indices{
            print("\(cards[i].shape.rawValue) + \(cards[i].noObjects.rawValue) + \(cards[i].fill.rawValue) +\(cards[i].color.rawValue) \n")
        }



    }
    init(){

        self.deck = DeckCards()

    }
}
