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
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!

    @IBAction func NewGameButton(_ sender: UIButton) {
        game=Set()
        let emptyString = ""
        let attributes:[NSAttributedString.Key:Any]=[:]
        let emptyNSString = NSAttributedString(string:emptyString,attributes: attributes)
        for index in cardButtons.indices{
            cardButtons[index].setAttributedTitle(emptyNSString, for: UIControl.State.normal)
        }
        initializeCards()


    }
    
    @IBAction func Deal3Cards(_ sender: UIButton) {
        for index in cardButtons.indices{
            if cardButtons[card.button]
        }
    }
    @IBAction func touchCard(_ sender: UIButton) {

    }



    func initializeCards(){
        let array = game.visibleCards()
        for index in array{
            if let card = game.deck.draw(){
            cardButtons[index].setAttributedTitle(card.content, for: UIControl.State.normal)
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

