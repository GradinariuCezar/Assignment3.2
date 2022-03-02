//
//  ViewController.swift
//  Set
//
//  Created by Cezar Nicolae Gradinariu on 23.02.2022.
//

import UIKit

class ViewController: UIViewController {
    var score = 0
    private lazy var game=Set(){
        didSet{
            scoreLabel.text = "Score: 0"
        }
    }

    @IBOutlet weak var Deal3Cards: UIButton!
    private var settedCards = [Int:Card]() //cele 12/mai multe carti care sunt afisate
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var scoreLabel: UILabel!

    @IBAction private func NewGameButton(_ sender: UIButton) {
        game=Set()
        let emptyString = ""
        let attributes:[NSAttributedString.Key:Any]=[:]
        let emptyNSString = NSAttributedString(string:emptyString,attributes: attributes)
        for index in cardButtons.indices{
            cardButtons[index].setAttributedTitle(emptyNSString, for: UIControl.State.normal)
            cardButtons[index].layer.borderWidth = 0
        }
        settedCards.removeAll()
        initializeCards()
        Deal3Cards.isEnabled = true



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
        if game.deck.cards.isEmpty{
            sender.isEnabled = false
        }
    }
    @IBAction private func touchCard(_ sender: UIButton) {
        //aici nu mai exista mvc :( trebuie facut ca la concentration

        // le trec ca selected sau nu si le schimb borderul

        // if folosit ca sa schimbam marginea dupa ce am 3 selectate
        if game.noCardsSelected == 0{
            for index in cardButtons.indices{
                cardButtons[index].layer.borderWidth = 0
            }
        }

        if let cardNumber = cardButtons.index(of:sender){
            if settedCards.keys.contains(cardNumber){
                if !settedCards[cardNumber]!.isSelected {
                    settedCards[cardNumber]?.isSelected = true
                    sender.layer.borderWidth = 3.0
                    sender.layer.borderColor = UIColor.blue.cgColor
                    game.appendSetCard(card: settedCards[cardNumber]!)
                }
                else{
                    settedCards[cardNumber]?.isSelected = false
                    game.removeFromSettedCards(card: settedCards[cardNumber]!)
                    sender.layer.borderWidth=0
                }
            }

        }

        if game.noCardsSelected == 3{
            print(settedCards)
            let isSet = game.compareCards()
            if isSet{
                for index in settedCards.keys{
                    //le fac verzi
                    cardButtons[index].layer.borderColor = UIColor.green.cgColor


                }
                //pun o pauzica sa vedem verdele
                _ = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
                    //configurez noile valori

                    timer.invalidate()
                    if self.game.deck.cards.isEmpty{
                        for index in self.settedCards.keys{
                            if self.settedCards[index]!.isSelected{
                                if self.game.deck.cards.isEmpty{
                                    self.cardButtons[index].isHidden = true
                                }

                            }
                        }
                    }
                    else{
                        for index in self.settedCards.keys{
                            if self.settedCards[index]!.isSelected {
                                if let card = self.game.deck.draw(){
                                    self.settedCards[index] = card
                                    self.cardButtons[index].setAttributedTitle(card.content, for: UIControl.State.normal)
                                    self.cardButtons[index].layer.borderWidth=0
                                }
                            }
                        }
                    }
                    print("Timer fired!")
                }
                score += 3
            }
            else
            {
                for index in settedCards.keys{
                    cardButtons[index].layer.borderColor = UIColor.red.cgColor

                }
                score -= 5
            }


            game.cards = []
            game.noCardsSelected = 0
        }
        scoreLabel.text = "Score: \(score)"
    }






    private func initializeCards(){
        for index in 0...23 {
            cardButtons[index].titleLabel?.font = .systemFont(ofSize: 12)
        }
        for _ in 1...12 {
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







