//
//  Wave.swift
//  SDGWaterWaves
//
//  Created by [sleepdefic1t](https://github.com/sleepdefic1t) on 12/7/16.
//  Copyright © 2016 [☠️👽🤖👻](https://github.com/deadAlienRobotGhost). All rights reserved.
//


public class Wave {
    
    
    public var datum: Datum = Datum()
    public var tides: Tides = Tides()
    public var view: NSUIView = NSUIView()
    
    
    public init() {}
    
    
    public func setup(in view: NSUIView) {
        
        self.view.frame = view.frame
        tides.layer.frame.size = view.frame.size
        
        #if os(iOS)
            
            self.tides.layer.anchorPoint.y = view.bounds.minY
            
            self.view.backgroundColor = .clear
            self.view.isUserInteractionEnabled = false
            self.view.layer.addSublayer(tides.layer)
            
        #elseif os(macOS)
            
            self.tides.layer.isGeometryFlipped = true
            self.tides.back.isGeometryFlipped = false
            self.tides.front.isGeometryFlipped = false
            self.tides.layer.anchorPoint.y = 1
            
            self.view.wantsLayer = true
            self.view.layer?.backgroundColor = NSUIColor.clear.cgColor
            self.view.layer?.addSublayer(tides.layer)
            
        #endif
        
        view.addSubview(self.view)
        
    }
    
    
}
