//
//  WaveController.swift
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



public class WaveController {
    
    public init() {}
    
}


extension WaveController {
    
    
    public func start(_ wave: Wave) {
        
        guard wave.datum.amplitude.isZero else { return }
        self.roll(wave)
        
    }
    
    
    internal func update(_ wave: Wave) {
        
        wave.tides.update(for: wave)
        
    }
    
    
}


extension WaveController {
    
    
    public func updateConstraints(for wave: Wave) {
        
        wave.view.frame = wave.view.superview!.frame
        wave.view.bounds = wave.view.frame
        
        if wave.tides.layer.frame.width != wave.view.frame.width {
            
            let oldLevel = wave.tides.layer.position.y
            let oldHeight = wave.tides.layer.frame.height
            
            let newHeight = wave.view.frame.maxY
            let newLevel = round(oldLevel/oldHeight * newHeight)///oldLevel
            
            wave.tides.layer.frame.size = wave.view.frame.size
            
            move(wave: wave, to: newLevel, duration: 0)
            
        }
        
    }
    
    
}



extension WaveController {
    
    
    
    func roll(_ wave: Wave, _ step: CGFloat? = nil, _ limit: CGFloat? = nil) {
        
        guard let step = step,
            let limit = limit else { return self.roll(wave, 1, 120) }
        
        if step < limit {

            let dx = step <= limit/2 ?
                step :
                step.distance(to: limit)
            
            let scaled = dx / 100
            
            if wave.datum.phase < -200 { wave.datum.phase = 0 }
            
            wave.datum.phase += wave.datum.phaseShift
            
            scaled < wave.datum.amplitudeIdle ?
                (wave.datum.amplitude = wave.datum.amplitudeIdle) :
                (wave.datum.amplitude = min(1, scaled * wave.datum.amplitudeRate))
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(33),
                                          qos: .userInitiated,
                                          flags: .assignCurrentContext,
                                          execute: { _ in
                                            
                                            self.roll(wave, step.advanced(by: 1), limit-1)
                                            self.update(wave)
                                            
            })
            
        } else {
        
            wave.datum.amplitude = 0
            wave.datum.phase = 0
        
        }
        
    }
    
    
    public func swell(_ wave: Wave, with event: NSUIEvent) {
        
        #if os(iOS)
            
            guard let swipe = event.allTouches?.first else { return }
            
            let first: CGFloat = swipe.previousLocation(in: swipe.view).y
            let last: CGFloat = swipe.location(in: swipe.view).y
            let deltaY = first.distance(to: last)
            
        #elseif os(macOS)
            
            let deltaY = event.deltaY
            
        #endif
        
        let newLevel = round(wave.tides.layer.position.y.advanced(by: deltaY))
        
        guard newLevel > 20 && newLevel < wave.view.frame.height-20 else { return }
        
        move(wave: wave, to: newLevel)
        start(wave)
        
    }
    
    
    internal func move(wave: Wave, to newLevel: CGFloat, duration: Double? = 2.0) {
        
        CATransaction.begin()
        
        let spring = CASpringAnimation(keyPath: "position.y")
            spring.damping = 0.5
            spring.initialVelocity = -5
            spring.stiffness = 30
            spring.duration = spring.settlingDuration
            spring.fromValue = wave.tides.layer.position.y
            spring.toValue = wave.tides.layer.position.y + 5
        
        let move = CABasicAnimation(keyPath: "position.y")
            move.fillMode = kCAFillModeForwards
            move.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            move.toValue = newLevel
        
        let group = CAAnimationGroup()
            group.animations = [spring, move]
            group.isRemovedOnCompletion = false
            group.fillMode = kCAFillModeForwards
            group.duration = duration!
        
        wave.tides.layer.position.y = newLevel
        
        wave.tides.layer.add(group, forKey: nil)
        
        CATransaction.commit()
        
    }
    
    
}
