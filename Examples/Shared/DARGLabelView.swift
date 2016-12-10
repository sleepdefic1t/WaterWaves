//
//  DARGLabelView.swift
//  
//
//  Created by [sleepdefic1t](https://github.com/sleepdefic1t) on 12/7/16.
//  Copyright © 2016 [☠️👽🤖👻](https://github.com/deadAlienRobotGhost). All rights reserved.
//


#if os(iOS)
    import UIKit
#elseif os(macOS)
    import Cocoa
#endif


import SDGWaterWaves


public class DARGLabelView: NSUIView {
    
    
    var dargLabel: CATextLayer {
        
        let label = CATextLayer()
        label.string = "Dead \n Alien \n Robot \n Ghost"
        label.foregroundColor = NSUIColor.black.cgColor
        label.alignmentMode = "right"
        
        #if os(iOS)
            
            label.fontSize = 50
            label.frame.size = CGSize(width: 145, height: 240)
            
        #elseif os(macOS)
            
            label.fontSize = 30
            label.frame.size = CGSize(width: 100, height: 150)
            
        #endif
        
        return label
        
    }
    
    
}


extension DARGLabelView {
    
    
    #if os(macOS)
    
    override public func viewWillMove(toSuperview newSuperview: NSView?) {
        
        wantsLayer = true
        layer?.backgroundColor = NSColor.clear.cgColor
        layer?.addSublayer(dargLabel)
        updateConstraints()
        
    }
    
    #elseif os(iOS)
    
    override public func willMove(toSuperview newSuperview: UIView?) {
    
    backgroundColor = .clear
    isUserInteractionEnabled = false
    layer.addSublayer(dargLabel)
    
    updateConstraints()
    }
    
    #endif
    
    
}

extension DARGLabelView {
    
    
    override public func updateConstraints() {
        super.updateConstraints()
        
        
        frame.size = dargLabel.frame.size
        
        #if os(iOS)
            
            let screen: CGRect = UIScreen.main.bounds
            bounds = screen
            frame.origin.x = screen.maxX - 150
            frame.origin.y = screen.maxY - 250
            
        #elseif os(macOS)
            
            guard let superFrame: CGRect = superview?.frame else { return }
            frame.origin.x = superFrame.maxX - frame.width-5
            frame.origin.y = superFrame.minY
            
        #endif
        
        
    }
    
    
}
