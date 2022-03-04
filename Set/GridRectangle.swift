//
//  GridRectangle.swift
//  Assignment3
//
//  Created by Cezar Nicolae Gradinariu on 02.03.2022.
//

import UIKit

class GridRectangle: UIView {


    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    var buttons: [UIButton]=[]
    func addButtons(buttons: [UIButton]){
        self.buttons.append(contentsOf: buttons)
        for i in buttons.indices{
        addSubview(buttons[i])
        }
    }

    lazy var grid = Grid(layout: Grid.Layout.aspectRatio(CGFloat(1)),frame: bounds)

    override func layoutSubviews() {// cand se schimba bounds?
        super.layoutSubviews()
        grid.layout = .dimensions(rowCount: buttons.count/3, columnCount: 3)
        print("buttons count: \(buttons.count)")
        for i in 0..<buttons.count{
            let aux_button = buttons[i]
            aux_button.frame = grid[i]!

        }
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setNeedsDisplay();
        setNeedsLayout()
    }

}
