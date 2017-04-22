//
//  WaveViewController.swift
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

class WaveViewController: NSUIViewController, NSUIGestureRecognizerDelegate {
    
    let dargLabelView: DARGLabelView = DARGLabelView()
    var wave: Wave = Wave()
    var waveController: WaveController = WaveController()
    
}

extension WaveViewController {
    
    override public func loadView() {
        
    #if os(macOS)
        
        view = NSView(frame: NSRect(x: 0, y: 0, width: 600, height: 300))
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.cyan.withAlphaComponent(0.3).cgColor
        
    #elseif os(iOS)
        
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.cyan.withAlphaComponent(0.3)
        
    #endif
        
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        wave.setup(in: view)
        
    #if os(macOS)
        
        view.addSubview(dargLabelView,
                        positioned: .below,
                        relativeTo: wave.view)
        
    #elseif os(iOS)
        
        view.insertSubview(dargLabelView as UIView, at: 0)
        
    #endif
        
    }
    
}

extension WaveViewController {
    
#if os(macOS)
    
    override func viewWillLayout() {
        super.viewWillLayout()
        
        dargLabelView.updateConstraints()
        waveController.updateConstraints(for: wave)
        waveController.start(wave)
        
    }
    
#elseif os(iOS)
    
    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    
        dargLabelView.updateConstraints()
        waveController.updateConstraints(for: wave)
        waveController.start(wave)
        
    }
    
#endif
    
}

extension WaveViewController {
    
#if os(macOS)
    
    override func scrollWheel(with event: NSEvent) {
        
        waveController.swell(wave, with: event)
        waveController.start(wave)
        
    }
    
#elseif os(iOS)
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    
        waveController.swell(wave, with: event!)
    
    }
    
#endif
    
}
