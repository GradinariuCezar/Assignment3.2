//
//  Card.swift
//  Set
//
//  Created by Cezar Nicolae Gradinariu on 23.02.2022.
//

import Foundation
import UIKit
struct Card{
    var isMatched = false
    var content:NSAttributedString
    var wasSeen = false
    var identifier: Int
    private static var identifierFactory = 0
    private static func getUniqueIdentifier() -> Int{
        identifierFactory+=1
        return identifierFactory
    }
    init(color:Color,fill:Fill,shape:Shape,noObjects:NoObjects){
        var stringObject=""
        for _ in 1...noObjects.getNoObjects(){
            stringObject+=shape.getShape()
        }
       // let font = systemFont(ofSize: CGFloat(6), weight: UIFont.Weight.light)
       // let font = UIFont.preferredFont(forTextStyle: )
        let attributes:[NSAttributedString.Key:Any]=[
            .strokeWidth: fill.getFill(),
            .strokeColor: color.getColor()


        ]
        let attributedString=NSAttributedString(string: stringObject,attributes: attributes)
        self.content = attributedString
        self.identifier = Card.getUniqueIdentifier()
    }

    enum Color:String,CaseIterable{
        case blue="blue"
        case purple="purple"
        case green="green"

        func getColor()->UIColor{
            switch self{
            case  .blue:
            return UIColor.blue
            case .purple:
                return UIColor.purple
            case .green:
                return UIColor.green
            }
        }
    }
    enum Fill:Double,CaseIterable{
    case half = 10
    case thin = 2
    case full = -35

        func getFill()->Double{
            return self.rawValue
        }
    }
    enum Shape:String,CaseIterable{
        case triangle="▲"
        case circle="●"
        case rectangle="■"

        func getShape()->String{
            return self.rawValue
        }
    }

    enum NoObjects:Int,CaseIterable{
    case one=1
        case two=2
        case three=3

        func getNoObjects()->Int{
            return self.rawValue
        }
    }

}
