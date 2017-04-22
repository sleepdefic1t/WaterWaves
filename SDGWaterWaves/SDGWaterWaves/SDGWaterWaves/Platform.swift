//
//  Platform.swift
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

#if os(macOS)
    
    import Cocoa
    
    public typealias NSUIColor = NSColor
    public typealias NSUIGestureRecognizerDelegate = NSGestureRecognizerDelegate
    public typealias NSUIEvent = NSEvent

    public typealias NSUIView = NSView
    public typealias NSUIViewController = NSViewController

    public typealias NSUITouch = NSTouch

#elseif os(iOS)
    
    import UIKit
    
    public typealias NSUIColor = UIColor
    public typealias NSUIGestureRecognizerDelegate = UIGestureRecognizerDelegate
    public typealias NSUIEvent = UIEvent

    public typealias NSUIView = UIView
    public typealias NSUIViewController = UIViewController
    
    public typealias NSUITouch = UITouch
    
#endif
