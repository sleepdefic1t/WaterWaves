//
//  TidePath.swift
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


public struct TidePath {
    
    
    public var mutablePath: CGMutablePath!
    
    
    public init(for type: WaveType, _ wave: Wave) {
        
        let path = CGMutablePath()
        
        let frame = wave.tides.layer.frame
        let width = frame.width
        let mid = width / 2.0
        let drawingWidth = width +  wave.datum.density
        
        let phaseDX = (type == .front) ?
            wave.datum.phase :
            -wave.datum.phase
        
        let maxAmplitude = (type == .front) ?
            frame.height/4 :
            frame.height/4 + 5
        
        let progress: CGFloat = 1.0 - CGFloat(wave.datum.density) / CGFloat(wave.datum.density)
        let normedAmplitude = (1.5 * progress - 0.5) *  wave.datum.amplitude
        
        var x: CGFloat = 0.0
        
        while x < drawingWidth {
            
            // Use a parable to scale the sinus wave, that has its peak in the middle of the view.
            let scaling = -pow(1 / mid * (x - mid), 2) + 1
            
            let cycle: CGFloat = CGFloat(2 * M_PI) * (x / width) *  wave.datum.frequency + phaseDX
            
            let y = scaling * maxAmplitude * normedAmplitude * CGFloat(sinf(Float(cycle)))
            
            let contextPointXY = CGPoint(x: x, y: y+20)
            
            x == 0 ?
                path.move(to: contextPointXY) :
                path.addLine(to: contextPointXY)
            
            x +=  wave.datum.density
            
        }
        
        path.addLine(to: CGPoint(x:  wave.tides.layer.frame.width, y:  wave.tides.layer.frame.maxY+20))
        path.addLine(to: CGPoint(x: 0, y:  wave.tides.layer.frame.maxY+20))
        path.addLine(to: CGPoint(x: 0, y:  wave.datum.peak + 20))
        
        
        self.mutablePath = path
        
    }
    
    
}
