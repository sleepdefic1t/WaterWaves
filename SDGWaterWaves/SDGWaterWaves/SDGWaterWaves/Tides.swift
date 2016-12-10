//
//  Tides.swift
//  SDGWaterWaves
//
//  Created by [sleepdefic1t](https://github.com/sleepdefic1t) on 12/7/16.
//  Copyright © 2016 [☠️👽🤖👻](https://github.com/deadAlienRobotGhost). All rights reserved.
//


#if os(iOS)
    import UIKit
#elseif os(macOS)
    import Cocoa
#endif


public struct Tides {
    
    
    public var layer: CAShapeLayer = CAShapeLayer()
    
    internal var front: CAShapeLayer = CAShapeLayer()
    internal var back: CAShapeLayer = CAShapeLayer()
    
    
    public init() {
        
        let waveColor = NSUIColor(red: 0.25,
                                  green: 0.55,
                                  blue: 0.75,
                                  alpha: 1.0)
        
        front.fillColor = waveColor.cgColor
        back.fillColor = waveColor.withAlphaComponent(0.8).cgColor
        
        layer.addSublayer(back)
        layer.addSublayer(front)
        
    }
    
    
}


extension Tides {
    
    
    public func update(for wave: Wave) {
        
        front.path = TidePath(for: .front, wave).mutablePath
        back.path = TidePath(for: .back, wave).mutablePath
        
    }
    
    
}
