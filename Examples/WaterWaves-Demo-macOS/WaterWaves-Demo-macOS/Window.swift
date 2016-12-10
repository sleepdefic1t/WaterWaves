//
//  Window.swift
//  WaterWaves-Demo-macOS
//
//  Created by [sleepdefic1t](https://github.com/sleepdefic1t) on 12/7/16.
//  Copyright © 2016 [☠️👽🤖👻](https://github.com/deadAlienRobotGhost). All rights reserved.
//

import Cocoa

class Window: NSWindow {
    
    
    override var canBecomeMain: Bool { return true }
    
    
    convenience init() {
        self.init(contentRect: NSRect.init(x: 850, y: 600, width: 600, height: 300),
                  styleMask: NSFullSizeContentViewWindowMask.union(NSWindowStyleMask(rawValue: UInt(1))),
                  backing: .buffered,
                  defer: false)
        
        
        backgroundColor = .white
        hasShadow = false
        isOpaque = false
        isMovableByWindowBackground = true
        titlebarAppearsTransparent = true
        titleVisibility = .hidden
        animationBehavior = .documentWindow
        makeMain()
        makeKey()
        orderFrontRegardless()
        
        
    }
    
    
}
