//
//  ViewController.swift
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

class ViewController: NSUIViewController {
    
    var waveViewController: WaveViewController!
    
}

extension ViewController {
    
    override func loadView() {
        
        #if os(macOS)
            
            view = NSView(frame: NSRect(x: 0, y: 0, width: 600, height: 300))
            view.wantsLayer = true
            view.layer?.backgroundColor = NSColor.clear.cgColor
            
        #elseif os(iOS)
            
            view = UIView(frame: UIScreen.main.bounds)
            view.autoresizingMask = UIViewAutoresizing.flexibleWidth.union(.flexibleHeight)
            view.translatesAutoresizingMaskIntoConstraints = true
            
        #endif
        
    }
    
    override func viewDidLoad() {
        
        waveViewController = WaveViewController()
        
    #if os(iOS)
        
        addChildViewController(waveViewController)
        
    #endif
        
        view.addSubview(waveViewController.view)
        
    }
    
    #if os(iOS)
    
    override func viewWillLayoutSubviews() {
        
        view.subviews.forEach({ subview in
        
            subview.autoresizingMask = view.autoresizingMask
            subview.translatesAutoresizingMaskIntoConstraints = false
        
        })
    
    }
    
    #endif
    
}
