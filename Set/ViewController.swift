//
//  ViewController.swift
//  Set
//
//  Created by Cezar Nicolae Gradinariu on 23.02.2022.
//

import UIKit

class ViewController: UIViewController {
    private lazy var game=Set(){
        didSet{
            scoreLabel.text = "Score: 0"
        }
    }
    private var settedCards = [Int:Card]()
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var scoreLabel: UILabel!

    @IBAction private func NewGameButton(_ sender: UIButton) {
        game=Set()
        let emptyString = ""
        let attributes:[NSAttributedString.Key:Any]=[:]
        let emptyNSString = NSAttributedString(string:emptyString,attributes: attributes)
        for index in cardButtons.indices{
            cardButtons[index].setAttributedTitle(emptyNSString, for: UIControl.State.normal)
        }
        settedCards.removeAll()
        initializeCards()


    }
    
    @IBAction private func Deal3Cards(_ sender: UIButton) {
        var randomNum = cardButtons.count.arc4random
        for _ in 1...3{

            while settedCards.keys.contains(randomNum){
                randomNum=cardButtons.count.arc4random
            }

            if let card=game.deck.draw(){
                settedCards[randomNum] = card
                cardButtons[randomNum].setAttributedTitle(card.content, for: UIControl.State.normal)
        }
    }
        if settedCards.count == 24{
            sender.isEnabled = false
        }
    }
    @IBAction private func touchCard(_ sender: UIButton) {
        //aici nu mai exista mvc :( trebuie facut ca la concentration
        if let cardNumber = cardButtons.index(of:sender){
            if settedCards.keys.contains(cardNumber){
            if !settedCards[cardNumber]!.isSelected {
            settedCards[cardNumber]?.isSelected = true
        sender.layer.borderWidth = 3.0
        sender.layer.borderColor = UIColor.blue.cgColor
            }
            else{
                settedCards[cardNumber]?.isSelected = false
                sender.layer.borderWidth=0
            }
            }

        }

    }



    private func initializeCards(){
        for index in 0...23{
            cardButtons[index].titleLabel?.font = .systemFont(ofSize: 12)
        }
        for _ in 1...12{
            var randomNum = cardButtons.count.arc4random

            while settedCards.keys.contains(randomNum){
                randomNum=cardButtons.count.arc4random
            }

            if let card = game.deck.draw(){
                cardButtons[randomNum].setAttributedTitle(card.content, for: UIControl.State.normal)
                settedCards[randomNum]=card
            }

        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCards()
//            cardButtons[index].setTitle("\(game.deck.cards[index].content)", for: UIControl.State.normal)
        }
        // Do any additional setup after loading the view.


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

