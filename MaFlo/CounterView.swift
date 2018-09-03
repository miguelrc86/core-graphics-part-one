//
//  CounterView.swift
//  MaFlo
//
//  Created by Miguel D Rojas Cortés on 9/2/18.
//  Copyright © 2018 MRC. All rights reserved.
//

import UIKit

@IBDesignable class CounterView: UIView {
    
    private struct Constants {
        static let numberOfGlasses = 8
        static let outlineWidth: CGFloat = 5.0
        static let arcWidth: CGFloat = 76
        
        static var halfOfOutlineWidth: CGFloat {
            return outlineWidth / 2
        }
    }
    
    @IBInspectable var counter: Int = 5 {
        didSet {
            if counter <= Constants.numberOfGlasses {
                setNeedsDisplay()
            }
        }
    }
    
    @IBInspectable var outlineColor: UIColor = .blue
    @IBInspectable var counterColor: UIColor = .orange
    
    override func draw(_ rect: CGRect) {
        // Draw Arc
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let maxBounds: CGFloat = max(bounds.width, bounds.height)
        let radius = maxBounds / 2 - Constants.arcWidth / 2
        let startAngle: CGFloat = 3 * .pi / 4
        let endAngle: CGFloat = .pi / 4
        let path = UIBezierPath(arcCenter: center,
                                radius: radius,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        
        path.lineWidth = Constants.arcWidth
        counterColor.setStroke()
        path.stroke()
        
        //Outlines Arc
        let angleDelta: CGFloat = 2 * .pi - startAngle + endAngle
        let arcLengthPerGlass = angleDelta / CGFloat(Constants.numberOfGlasses)
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
        
        //Outer Arc
        let outlinePath = UIBezierPath(arcCenter: center,
                                       radius: bounds.width / 2 - Constants.halfOfOutlineWidth,
                                       startAngle: startAngle,
                                       endAngle: outlineEndAngle,
                                       clockwise: true)
        
        //Inner Arc
        outlinePath.addArc(withCenter: center,
                           radius: bounds.width / 2 - Constants.arcWidth + Constants.halfOfOutlineWidth,
                           startAngle: outlineEndAngle,
                           endAngle: startAngle,
                           clockwise: false)
        
        outlinePath.close()
        outlineColor.setStroke()
        outlinePath.lineWidth = Constants.outlineWidth
        outlinePath.stroke()
    }
    
}
