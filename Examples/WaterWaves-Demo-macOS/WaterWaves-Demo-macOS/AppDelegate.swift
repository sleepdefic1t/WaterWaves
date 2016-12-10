//
//  AppDelegate.swift
//  WaterWaves-Demo-macOS
//
//  Created by [sleepdefic1t](https://github.com/sleepdefic1t) on 12/7/16.
//  Copyright © 2016 [☠️👽🤖👻](https://github.com/deadAlienRobotGhost). All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    
    
    var window: NSWindow = Window()
    var windowController: NSWindowController = NSWindowController()
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        windowController.window = window
        window.contentViewController = ViewController()
        window.contentView = window.contentViewController?.view
        
    }
    
    
}
