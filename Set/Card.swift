//
//  Card.swift
//  Set
//
//  Created by Cezar Nicolae Gradinariu on 23.02.2022.
//

import Foundation
import UIKit
struct Card{
    var isSelected = false
    var content:NSAttributedString
    var wasSeen = false
    var identifier: Int
    var shape: Shape
    var fill: Fill
    var color: Color
    var noObjects: NoObjects
    private static var identifierFactory = 0
    private static func getUniqueIdentifier() -> Int{
        identifierFactory+=1
        return identifierFactory
    }
    init(color:Color,fill:Fill,shape:Shape,noObjects:NoObjects){
        var stringObject=""
        for _ in 0...noObjects.getNoObjects(){
            stringObject+=shape.getShape()
        }
       // let font = systemFont(ofSize: CGFloat(6), weight: UIFont.Weight.light)
       // let font = UIFont.preferredFont(forTextStyle: )
        var attributes:[NSAttributedString.Key:Any]=[
            .strokeWidth: fill.getFill(),
            .foregroundColor: color.getColor().withAlphaComponent(fill.getAlpha()),
            .strokeColor: color.getColor()

        ]


        if fill == .full{
            attributes[NSAttributedString.Key(".backgroundColor")] = color.getColor()
        }
        self.shape = shape
        self.noObjects = noObjects
        self.fill = fill
        self.color = color
        let attributedString=NSAttributedString(string: stringObject,attributes: attributes)
        self.content = attributedString
        self.identifier = Card.getUniqueIdentifier()
    }

    enum Color:Int,CaseIterable{
        case blue=0
        case red=1
        case green=2

        func getColor()->UIColor{
            switch self{
            case  .blue:
                return UIColor.blue
            case .red:
                return UIColor.red
            case .green:
                return UIColor.green
            }
        }
    }
    enum Fill:Int,CaseIterable{
    case half = 0
    case thin = 1
    case full = 2
        func getAlpha()->Double{
            switch self{
            case .half:
                return 0.15
            case .thin:
                return 0
            case .full:
                return 1
            }
        }
        func getFill()->Int{
            switch self{
            case  .half:
            return 0
            case .thin:
                return 2
            case .full:
                return -12
            }
        }

    }
    enum Shape: Int,CaseIterable{
        case triangle=0
        case circle=1
        case rectangle=2

        func getShape()->String{
            switch self{
            case  .triangle:
            return "▲"
            case .circle:
                return "●"

            case .rectangle:
                return "■"
            }
        }
    }

    enum NoObjects:Int,CaseIterable{
        case one=0
        case two=1
        case three=2

        func getNoObjects()->Int{
            switch self{
            case  .one:
            return 0
            case .two:
                return 1

            case .three:
                return 2
            }
        }
    }
}
