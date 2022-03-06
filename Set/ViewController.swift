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

    @IBOutlet weak var grid: GridRectangle!

    private var currentNoButtons = 0
    @IBOutlet weak var Deal3Cards: UIButton!
    var setCards: [SetCard] = []
    @IBOutlet private weak var scoreLabel: UILabel!

    @IBAction private func NewGameButton(_ sender: UIButton) {
        game=Set()
        currentNoButtons = 0
        let emptyString = ""
        let attributes:[NSAttributedString.Key:Any]=[:]
        let emptyNSString = NSAttributedString(string:emptyString,attributes: attributes)
        for index in setCards.indices{
        }
        setCards = []
        grid.resetButtons()
        initializeCards()
        Deal3Cards.isEnabled = true



    }
    
    @IBAction private func Deal3Cards(_ sender: UIButton) {
        var aux_buttons = [SetCard]()
        for _ in 1...3{
            let setCard = SetCard()
            setCard.createCard(game.deck.draw())
                setCard.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectCard(_:))))
            setCards.append(setCard)
            aux_buttons.append(setCard)

                }
        grid.addButtons(aux_buttons)


        
    }
//    private var selectedCards: [UIButton]{
//
//    }
    @objc func selectCard(_ recognizer: UITapGestureRecognizer ){
        switch recognizer.state{
        case .ended:

            if let chosenButton = recognizer.view as? SetCard
            {
                chosenButton.layer.borderWidth = 3.0
                chosenButton.layer.borderColor = UIColor.blue.cgColor
            }
                default:
                    break
        }
    }
    private func initializeCards(){

        for i in 1...12 {
            let setCard = SetCard()
            setCard.createCard(game.deck.draw())
                setCard.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectCard(_:))))
            setCards.append(setCard)

            print(setCards.count)
        }
        print(setCards.count)
        var grid2 = Grid(layout: Grid.Layout.dimensions(rowCount: setCards.count, columnCount: 3),frame: grid.bounds)
        for i in 0..<setCards.count{
            let aux_button = setCards[i]
            aux_button.frame = grid2[i]!
            //grid.addSubview(setCards[i])
        }
        grid.addButtons(setCards)


        //grid.addButtons(buttons: cardButtons)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCards()
        //            cardButtons[index].setTitle("\(game.deck.cards[index].content)", for: UIControl.State.normal)
    }
    // Do any additional setup after loading the view.


}







