//
//  SetCard.swift
//  Set
//
//  Created by Cezar Nicolae Gradinariu on 04.03.2022.
//

import UIKit

class SetCard: UIView {
    var shape = Card.Shape.circle
    var noObjects = Card.NoObjects.one
    var fill = Card.Fill.full
    var color = Card.Color.blue
    var isSelected = false

    func createCard(_ card: Card?){
        if let card_aux = card{
        let label = UILabel()
        label.numberOfLines = 0
        label.attributedText = card_aux.content
        label.textAlignment = NSTextAlignment.center
        label.frame.size = CGSize.zero
        label.sizeToFit()
        self.shape = card_aux.shape
        self.noObjects = card_aux.noObjects
        self.color = card_aux.color
        self.isSelected = card_aux.isSelected
        addSubview(label)
        }
    }


    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setNeedsDisplay();
        setNeedsLayout()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
